-- =================================================================
-- Airbnb Clone Database Schema
-- =================================================================
-- This script creates the tables, constraints, and indexes
-- for the Airbnb Clone project.
-- =================================================================

-- =========================
-- Customers Table
-- =========================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Rooms Table
-- =========================
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status ENUM('available','occupied','maintenance') DEFAULT 'available'
);

-- =========================
-- Bookings Table
-- =========================
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending','confirmed','cancelled','completed') DEFAULT 'pending',
    
    CONSTRAINT fk_booking_customer 
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_booking_room 
        FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
        ON DELETE CASCADE
);

-- =========================
-- Payments Table
-- =========================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('cash','credit_card','debit_card','transfer') NOT NULL,
    
    CONSTRAINT fk_payment_booking 
        FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
        ON DELETE CASCADE
);

-- =========================
-- Indexes for performance
-- =========================
CREATE INDEX idx_customer_email ON Customers(email);
CREATE INDEX idx_booking_customer ON Bookings(customer_id);
CREATE INDEX idx_booking_room ON Bookings(room_id);
CREATE INDEX idx_payment_booking ON Payments(booking_id);
