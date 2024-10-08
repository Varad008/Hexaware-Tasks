package com.hexaware.ShopSmart.Main;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.hexaware.ShopSmart.dao.Payment;
import com.hexaware.ShopSmart.entity.CashPayment;
import com.hexaware.ShopSmart.entity.CreditCardPayment;
import com.hexaware.ShopSmart.entity.Item;
import com.hexaware.ShopSmart.entity.Order;
import com.hexaware.ShopSmart.entity.Review;
import com.hexaware.ShopSmart.entity.ShoppingCart;
import com.hexaware.ShopSmart.exceptions.InsufficientPaymentException;
import com.hexaware.ShopSmart.exceptions.InvalidPriceException;
import com.hexaware.ShopSmart.util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;


public class Main {
    public static void main(String[] args) throws InvalidPriceException {
        Scanner scanner = new Scanner(System.in);

        try (Connection conn = DBUtil.getConnection()) {
            // Shopping cart to hold user's selected items
            ShoppingCart cart = new ShoppingCart(conn);

            // Adding items to the shopping cart with user input
            System.out.println("Enter the number of items to add to the cart: ");
            int numItems = Integer.parseInt(scanner.nextLine());

            for (int i = 0; i < numItems; i++) {
                System.out.println("Enter item name: ");
                String itemName = scanner.nextLine();

                System.out.println("Enter item price: ");
                double price = Double.parseDouble(scanner.nextLine());

                System.out.println("Enter item category: ");
                String category = scanner.nextLine();

                // Add the item to the cart and insert into DB
                try {
                    Item item = new Item(itemName, price, category);
                    cart.addItem(item); // Adds to shopping cart and inserts into DB
                } catch (IllegalArgumentException e) {
                    System.out.println("Error: " + e.getMessage());
                }
            }

            // Listing cart items
            System.out.println("Items in your cart:");
            cart.listCartItems();

            // User decides to place an order
            List<Item> orderItems = new ArrayList<>(cart.getCartItems()); // Copy items from the cart
            System.out.println("Enter order ID: ");
            String orderID = scanner.nextLine();

            Order order = new Order(orderID, orderItems, conn);
            order.saveOrderToDB();  // Saves the order and related items to the DB
            System.out.println("Order created: " + order);

            // Payment processing
            System.out.println("Choose payment method: 1 for Credit Card, 2 for Cash");
            int paymentMethod = Integer.parseInt(scanner.nextLine());
            Payment payment = null;

            System.out.println("Enter payer's name: ");
            String payerName = scanner.nextLine();

            if (paymentMethod == 1) {
                System.out.println("Enter credit card number: ");
                String cardNumber = scanner.nextLine();
                payment = new CreditCardPayment(payerName, order.getTotalPrice(), cardNumber);
            } else if (paymentMethod == 2) {
                System.out.println("Enter cash received: ");
                double cashReceived = Double.parseDouble(scanner.nextLine());
                payment = new CashPayment(payerName, order.getTotalPrice(), cashReceived);
            }

            // Process the payment
            try {
                payment.processPayment();
            } catch (InsufficientPaymentException e) {
                System.out.println("Payment error: " + e.getMessage());
            }

            // Review submission
            System.out.println("Would you like to leave a review? (yes/no)");
            String reviewChoice = scanner.nextLine();
            
            if (reviewChoice.equalsIgnoreCase("yes")) {
                System.out.println("Enter rating (1-5): ");
                int rating = Integer.parseInt(scanner.nextLine());

                System.out.println("Enter review comment: ");
                String comment = scanner.nextLine();

                Review review = new Review(rating, comment);
                System.out.println("Thank you for your review: " + review);
            }

            // Clear the cart
            cart.clearCart();
            System.out.println("Your cart is now empty.");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        scanner.close();
    }
}
