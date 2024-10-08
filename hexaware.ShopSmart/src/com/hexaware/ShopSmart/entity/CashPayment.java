package com.hexaware.ShopSmart.entity;

import com.hexaware.ShopSmart.dao.Payment;
import com.hexaware.ShopSmart.exceptions.InsufficientPaymentException;

public class CashPayment extends Payment{
	private double cashRecieved;
	
	public CashPayment(String payerName, double amount,double cashRecieved) {
		super(payerName, amount);
		this.cashRecieved = cashRecieved;
	}

	public double getCashRecieved() {
		return cashRecieved;
	}

	public void setCashRecieved(double cashRecieved) {
		this.cashRecieved = cashRecieved;
	}

	@Override
	public void processPayment() throws InsufficientPaymentException {
		if(cashRecieved < amount) {
			throw new InsufficientPaymentException("The cash recieved is insufficient!");
		}
		System.out.println("The cash payment is being processed for "+getPayerName());
		
	}
	
	

}
