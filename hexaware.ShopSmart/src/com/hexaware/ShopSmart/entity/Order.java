package com.hexaware.ShopSmart.entity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Order {
	private String orderId;
	private List<Item> itemList;
	private double totalPrice;
	private Connection conn;
	
	public Order(String orderId, List<Item> itemList,Connection conn) {
		this.orderId = orderId;
		this.itemList = itemList;
		this.conn =conn;
		this.totalPrice = calculateTotalPrice();
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
		this.totalPrice = calculateTotalPrice(); // Update totalPrice when itemList changes
		
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	public double calculateTotalPrice() {
		return itemList.stream().mapToDouble(Item::getPrice).sum();
		
	}
	
	 @Override
	    public String toString() {
	        return "Order ID: " + orderId + ", Total Price: $" + totalPrice;
	    }
	
	 
	 public void saveOrderToDB() throws SQLException {
	        String orderQuery = "INSERT INTO orders (orderID, totalPrice) VALUES (?, ?)";
	        String orderItemsQuery = "INSERT INTO order_items (orderID, itemName) VALUES (?, ?)";

	        try (PreparedStatement orderStmt = conn.prepareStatement(orderQuery);
	             PreparedStatement orderItemsStmt = conn.prepareStatement(orderItemsQuery)) {

	            // Insert into Orders table
	            orderStmt.setString(1, this.orderId);
	            orderStmt.setDouble(2, this.totalPrice);
	            orderStmt.executeUpdate();

	            // Insert each item into OrderItems table
	            for (Item item : itemList) {
	                orderItemsStmt.setString(1, this.orderId);
	                orderItemsStmt.setString(2, item.getItemName());
	                orderItemsStmt.executeUpdate();
	            }
	        }
	    }
	

}
