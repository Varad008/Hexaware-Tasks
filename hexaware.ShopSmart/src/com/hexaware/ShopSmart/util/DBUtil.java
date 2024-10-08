package com.hexaware.ShopSmart.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/shopsmart"; // Replace with your DB URL and schema name
    private static final String USER = "root"; // Replace with your DB 
    private static final String PASSWORD = "Varadsql#001"; // Replace with your DB password

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

