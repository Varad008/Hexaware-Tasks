package com.hexaware.ShopSmart.entity;

import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.List;

public class ShoppingCart {
    private List<Item> cartItems = new ArrayList<>();
    private Connection conn;

    public ShoppingCart(Connection conn) {
        this.conn = conn;
    }

    public void addItem(Item item) {
        getCartItems().add(item);
        try {
            item.saveItemToDB(conn); // Save the item to the DB when added to the cart
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeItem(Item item) {
        getCartItems().remove(item);
        // Add logic to remove item from DB if necessary
    }

    public void listCartItems() {
        for (Item item : getCartItems()) {
            System.out.println(item);
        }
    }

    public void clearCart() {
        getCartItems().clear();
        // Add logic to clear cart from DB if necessary
    }

	public List<Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<Item> cartItems) {
		this.cartItems = cartItems;
	}
}

