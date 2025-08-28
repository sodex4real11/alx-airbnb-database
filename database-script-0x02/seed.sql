-- =================================================================
-- Airbnb Clone Database Seeding Script
-- =================================================================
-- This script populates the database with realistic sample data.
-- It should be run AFTER the schema.sql script has been executed.
-- We are using hardcoded UUIDs for consistency and to ensure
-- relationships between tables are correctly established.
-- =================================================================

-- To generate new UUIDs, you can use an online generator or
-- the uuid-ossp extension in PostgreSQL with the uuid_generate_v4() function.


-- Insert Users
INSERT INTO Users (user_id, name, email, phone, role) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '+2348012345678', 'host'),
(2, 'Michael Smith', 'michael.smith@example.com', '+2348098765432', 'guest'),
(3, 'Sarah Lee', 'sarah.lee@example.com', '+2348076543210', 'admin'),
(4, 'David Brown', 'david.brown@example.com', '+2348065432109', 'host');

-- Insert Properties
INSERT INTO Properties (property_id, host_id, title, description, address, city, country, price_per_night, property_type) VALUES
(101, 1, 'Cozy Apartment in Lagos', 'A beautiful 2-bedroom apartment near Victoria Island.', '12 Marine Road', 'Lagos', 'Nigeria', 25000, 'Apartment'),
(102, 1, 'Luxury Villa in Lekki', 'Spacious villa with pool and ocean view.', '45 Lekki Phase 1', 'Lagos', 'Nigeria', 85000, 'Villa'),
(103, 4, 'Modern Condo in Abuja', 'Stylish condo in the city center.', '78 Central District', 'Abuja', 'Nigeria', 40000, 'Condo');

-- Insert Bookings
INSERT INTO Bookings (booking_id, user_id, property_id, start_date, end_date, status) VALUES
(1001, 2, 101, '2025-09-01', '2025-09-05', 'confirmed'),
(1002, 3, 102, '2025-09-10', '2025-09-15', 'pending'),
(1003, 2, 103, '2025-10-01', '2025-10-07', 'cancelled');

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method, status) VALUES
(5001, 1001, 100000, '2025-08-20', 'Credit Card', 'completed'),
(5002, 1002, 425000, '2025-08-25', 'Bank Transfer', 'pending'),
(5003, 1003, 280000, '2025-09-15', 'Debit Card', 'refunded');

-- Insert Reviews
INSERT INTO Reviews (review_id, booking_id, user_id, rating, comment, review_date) VALUES
(9001, 1001, 2, 5, 'Amazing stay! The host was very helpful.', '2025-09-06'),
(9002, 1002, 3, 4, 'Great villa, but check-in was delayed.', '2025-09-16');
