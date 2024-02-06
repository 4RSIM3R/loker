-- CREATE TABLE books

CREATE TABLE books (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    price DECIMAL(10, 2) UNSIGNED,
    category ENUM('MANGA', 'NOVEL', 'MAGAZINE'),
    CHECK (price > 0)
);

-- CREATE TABLE customer

CREATE TABLE customers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    card_number VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50)
);

-- CREATE TABLE rental 

CREATE TABLE rentals (
    id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    date_rent DATE NOT NULL,
    date_return DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    CHECK (date_return > date_rent OR date_return IS NULL)
);

-- Menampilkan buku yang di rental (belum di kembalikan)

SELECT 
    books.id,
    books.title,
    books.author,
    books.price,
    books.category,
    rentals.date_rent
FROM 
    books
JOIN 
    rentals ON books.id = rentals.book_id
WHERE 
    rentals.date_return IS NULL;

-- Menampilkan buku yang belum di rental
SELECT 
    books.id,
    books.title,
    books.author,
    books.price,
    books.category
FROM 
    books
LEFT JOIN 
    rentals ON books.id = rentals.book_id
WHERE 
    rentals.book_id IS NULL;

-- filter harga buku antara 2000 - 6000
SELECT 
    id,
    title,
    author,
    price,
    category
FROM 
    books
WHERE 
    price > 2000 AND price < 6000;

-- customer yang pinjam lebih dari 10
SELECT 
    c.name AS nama_customer,
    b.title AS judul_buku,
    COUNT(r.book_id) AS jumlah_buku_dipinjam
FROM 
    customers c
JOIN 
    rentals r ON c.id = r.customer_id
JOIN 
    books b ON r.book_id = b.id
GROUP BY 
    c.id, b.id
HAVING 
    COUNT(r.book_id) > 10;

