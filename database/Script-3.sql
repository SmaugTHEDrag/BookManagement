-- Tạo schema (nếu chưa có)
DROP database BookManagement;
CREATE DATABASE IF NOT EXISTS BookManagement;
USE BookManagement;

-- USERS
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('ADMIN', 'CUSTOMER') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- BOOKS
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bookTitle VARCHAR(255) NOT NULL,
    authorName VARCHAR(100) NOT NULL,
    imageURL VARCHAR(255),
    category VARCHAR(255) NOT NULL,
    bookDescription VARCHAR(255),
    bookPDFURL VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- FAVORITES (many-to-many: user <-> book)
CREATE TABLE favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    UNIQUE(user_id, book_id)
);

INSERT INTO users (username, password, email, role) VALUES
('admin01', 'adminpass123', 'admin@example.com', 'ADMIN'),
('johndoe', 'password123', 'john@example.com', 'CUSTOMER'),
('janedoe', 'mypassword', 'jane@example.com', 'CUSTOMER');

INSERT INTO users (username, password, email, role) VALUES
('thainguyen', '$2a$12$1K0UASu/wbmtIznD1UtaC.MRKn3/.v9DuPCrnhIp4A8GjdVgFT2ea', 'thainguyen123@example.com', 'ADMIN');

INSERT INTO books (
    bookTitle,
    authorName,
    imageURL,
    category,
    bookDescription,
    bookPDFURL
) VALUES
(
    'Weyward',
    'Emilia Hart',
    'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1684204420i/127280850.jpg', -- Bạn có thể thay đổi URL ảnh
    'Fiction',
    'A spellbinding novel about three women connected across centuries by witchcraft and survival.',
    'https://drive.google.com/file/d/1Zis8I_MLYV9BpEXotloQZmczmVeef-BM/view'     -- Bạn cũng có thể cập nhật URL PDF
),
(
    'The Housemaid\'s Secret',
    'Freida McFadden',
    'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1664729357i/62848145.jpg',
    'Thriller, Mystery, Suspense',
    'Millie Calloway returns in another mind-twisting psychological thriller.',
    'https://drive.google.com/file/d/1AZnCihZkoUuXU24nBg7ogIrwpdkDldFg/view'
),
(
	'Happy Place',
    'Emily Henry',
    'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1660145160i/61718053.jpg',
    'Romance, Contemporary, Fiction',
    'A former couple pretend to still be together during an annual vacation with friends in this heartfelt and humorous romance by Emily Henry.',
    'https://drive.google.com/file/d/1nGotI-tZhH6EE_wDQtZwWsJzwbpHe-Bp/view'
);

INSERT INTO favorites (user_id, book_id) VALUES
(2, 1),
(2, 2),
(3, 1),
(3, 3);

ALTER TABLE books
MODIFY COLUMN bookDescription TEXT;



