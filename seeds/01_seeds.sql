INSERT INTO users (name, email, password) 
VALUES ('Bozo Clown', 'theclown@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('John Kennedy', 'thepresident@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Elizabeth Windsor', 'thequeen@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (owner_id, title, description,thumbnail_url, cover_photo, cost_per_night, parking_spaces, number_of_bathrooms, numbert_of_bedrooms, country, province, city, street, post_code)      
VALUES (1, 'beatiful house', 'great house located at suburbs', '/images/img1', '/cover_images/img2', 120, 1, 2, 3, 'Canada', 'BC', 'Vancouver', 'anyway ave.', 'Q2M 4D7'),
(2, 'great apartment', 'great apartment located at downtown', '/images/img3', '/cover_images/img4', 100, 2, 2, 2, 'Canada', 'BC', 'Vancouver', 'there ave.', 'P3M 9F1'),
(3, 'awesome loft', 'awesome loft located at the heart of town', '/images/img5', '/cover_images/img6', 90, 0, 1, 1, 'Canada', 'BC', 'Vancouver', 'almostthere st.', 'P6W 1J5');


INSERT INTO reservations (guest_id, property_id, start_date, end_date) 
VALUES (1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(3, 3, '2021-10-01', '2021-10-14');

INSERT INTO property_reviews (reservation_id, guest_id, property_id, message, rating) 
VALUES (1, 1, 1,'Great experience', 5),
(2, 2, 2,'Bad experience', 1),
(3, 3, 3,'So,so experience', 3);

