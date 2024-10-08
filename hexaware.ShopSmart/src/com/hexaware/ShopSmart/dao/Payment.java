package com.hexaware.ShopSmart.dao;

import com.hexaware.ShopSmart.exceptions.InsufficientPaymentException;

public abstract class Payment {
	private String payerName;
	protected double amount;
	
	public Payment(String payerName, double amount) {
		this.payerName = payerName;
		this.amount = amount;
	}

	public String getPayerName() {
		return payerName;
	}

	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
	public abstract void processPayment() throws InsufficientPaymentException;

}
