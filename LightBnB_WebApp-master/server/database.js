const properties = require('./json/properties.json');
const users = require('./json/users.json');
const pg = require('pg');
const Pool = pg.Pool;

// const { Client } = require('pg');

const config = {
  user: 'vagrant',
  host: 'localhost',
  database: 'lightbnb',
  password: '123',
};

const pool = new Pool(config);


pool.connect(() => {
  console.log('connected to the database');
});
/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {

  return pool.query(`SELECT * FROM users WHERE email = $1`, [email])
  .then((res) => {
    if (res.rows.length === 0) {
      return null
    }
    return res.rows[0];
  })
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`SELECT * FROM users WHERE id = $1`, [id])
  .then((res) => {
    if (res.rows.length === 0) {
      return null
    }
    return res.rows[0];
  })
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  
  const name = user.name;
  const password = user.password;
  const email = user.email;
  query = 'INSERT INTO users (name, password, email) VALUES ($1, $2, $3) RETURNING *;';

  return pool.query(query, [name, password, email])
  .then((res) => {
    return res.rows[0];
  })
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id) {
  // return getAllProperties(null, 2);
const query = `SELECT properties.*, reservations.*, avg(rating) as average_rating 
FROM reservations 
JOIN properties ON reservations.property_id = properties.id 
JOIN property_reviews ON properties.id = property_reviews.property_id 
WHERE reservations.guest_id = $1 
AND reservations.end_date < now()::date 
GROUP BY properties.id, reservations.id 
ORDER BY reservations.start_date 
LIMIT 10;`;

return pool.query(query, [guest_id])
.then((res) =>{ 
  return res.rows;
})
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) { 
  return pool.query(`SELECT * FROM properties
  LIMIT $1`, [limit])
  .then(res => res.rows)

}
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
