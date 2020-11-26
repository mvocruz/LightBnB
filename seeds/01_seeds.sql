INSERT INTO users (name, email, password) 
VALUES ('Bozo Clown', 'theclown@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('John Kennedy', 'thepresident@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Elizabeth Windsor', 'thequeen@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (owner_id, title, description,thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)      
VALUES (1, 'beatiful house', 'great house located at suburbs', '/images/img1', '/cover_images/img2', 120, 1, 2, 3, 'Canada', 'anyway ave.', 'Vancouver', 'BC', 'Q2M 4D7'),
(2, 'great apartment', 'great apartment located at downtown', '/images/img3', '/cover_images/img4', 100, 2, 2, 2, 'Canada', 'there ave.', 'Vancouver', 'BC', 'P3M 9F1'),
(3, 'awesome loft', 'awesome loft located at the heart of town', '/images/img5', '/cover_images/img6', 90, 0, 1, 1, 'Canada', 'almostthere st.', 'Vancouver', 'BC', 'P6W 1J5');


INSERT INTO reservations (start_date, end_date, guest_id, property_id) 
VALUES ('2018-09-11', '2018-09-26', 1, 1),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 3, 3);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) 
VALUES (1, 1, 1, 5, 'Great experience'),
(2, 2, 2, 1, 'Bad experience'),
(3, 3, 3, 3, 'So,so experience');

