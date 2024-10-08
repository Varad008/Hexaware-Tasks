package com.hexaware.ShopSmart.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hexaware.ShopSmart.exceptions.InvalidPriceException;

public class Item {
	private String itemName;
	private double price;
	private String category;
	
	public Item(String itemName, double price , String category) throws InvalidPriceException {
		this.itemName = itemName;
		this.price = price;
		this.category = category;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) throws InvalidPriceException {
		if(price <= 0 ) {
			throw new InvalidPriceException("Price of items can't be negative or 0.");
		}
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	  @Override
	public String toString() {
		  return "Item: " + itemName + ", Price: $" + price + ", Category: " + category;
	}
	
	  
	// Save item to the database
	    public void saveItemToDB(Connection conn) throws SQLException {
	        String query = "INSERT INTO items (itemName, price, category) VALUES (?, ?, ?)";
	        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	            pstmt.setString(1, this.itemName);
	            pstmt.setDouble(2, this.price);
	            pstmt.setString(3, this.category);
	            pstmt.executeUpdate();
	        }
	    }
	
	

}
