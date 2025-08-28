
# Database Normalization Report for Airbnb Clone Project

## Introduction

This document outlines the normalization process and confirms that the database schema for the Airbnb Clone project adheres to the principles of Third Normal Form (3NF). The goal of normalization is to reduce data redundancy, prevent data anomalies (insertion, update, and deletion anomalies), and ensure data integrity.

Our database design was structured from the outset to be compliant with these principles.

---

## First Normal Form (1NF)

**Rule:** No repeating groups, all attributes atomic, each row uniquely identifiable.

**Application:**
All tables in our schema satisfy 1NF.
User: All attributes are atomic (e.g., no multi-valued columns like multiple emails).

Property: Attributes are atomic, price is scalar, no repeating fields.

Booking: Each booking has scalar values (dates, status).

Payment: Payment info is atomic (method, amount, timestamp).

Review: Rating constrained as integer, comment scalar.

Message: Sender/recipient stored as UUIDs

---

## Second Normal Form (2NF)

**Rule:** A table is in 2NF if it is in 1NF and all of its non-key attributes are fully functionally dependent on the entire primary key. This rule is primarily concerned with tables that have a composite primary key (a key made of two or more columns).

**Application:**
All tables in our schema satisfy 2NF.
- The primary key for every table (`User`, `Property`, `Booking`, etc.) is a single column (e.g., `user_id`).
- Since there are no composite primary keys, there cannot be any partial dependencies. Therefore, the schema inherently meets the 2NF requirement.

---

## Third Normal Form (3NF)

**Rule:** A table is in 3NF if it is in 2NF and has no transitive dependencies. Already in 2NF, and no transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Application:**
All tables in our schema satisfy 3NF.
- In each table, all non-key attributes depend directly and only on the primary key, not on any other non-key attribute.
- For example, in the `Property` table, attributes like `name`, `description`, and `price_per_night` are all direct characteristics of a `property_id`. The `location` does not depend on the `name`; they both depend on the `property_id`.
- By separating entities like `User`, `Property`, and `Booking` into their own tables, we have eliminated potential transitive dependencies. For instance, we don't store host details (like `host_email`) in the `Property` table; instead, we use a foreign key `host_id` that links to the `User` table.
