# User API
---

Anagrams-Shannon-Paige is an API that allows for the creation and lookup of users. Clients interact with the API over HTTP, and all data sent and received is expected to be in JSON format.
- Users have a first_name, last_name, email, social_security_number
- All fields are required
- Email must be of proper format
- Social Security Number must be 9 digits long
- All requests respond with only the following fields: first_name, last_name, email, and id

The API responds to the following endpoints:

- `GET /users`
  - Returns a list of all the users in the database.
- `GET /user/:id`
  - Returns the user in the database with the id provided.
- `POST /users`
  - Creates a user.

## Implementation details

#### Tools:
- Rails
- SQLite3
- MiniTest/Spec


## To Run Messenger
### Locally
- Clone the project
- Run bundle install to install the required gems
- Set up the database with `rake db:create db:migrate`
- Start the server with rails s
- Visit http://localhost:3000
- Use curl or postman to hit the endpoints with http://localhost:3000
