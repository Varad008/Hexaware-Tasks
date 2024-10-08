package com.hexaware.ShopSmart.entity;

import com.hexaware.ShopSmart.dao.Payment;
import com.hexaware.ShopSmart.exceptions.InsufficientPaymentException;

public class CreditCardPayment extends Payment{
	private String cardNumber;
	
	public CreditCardPayment(String payerName, double amount, String cardNumber) {
		super(payerName, amount);
		this.cardNumber = cardNumber;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	@Override
	public void processPayment() throws InsufficientPaymentException {
		if(amount <= 0) {
			throw new InsufficientPaymentException("Insufficient amount for credit card payment.");
		}
		System.out.println("The credit card payment is being processed for "+getPayerName());
		
	}
	
	

}
