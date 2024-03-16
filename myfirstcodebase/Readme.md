# EQPlus Configuration API

The EQPlus Configuration API is a simple Go Fiber web server that converts a .properties file into JSON format and exposes it through a RESTful API. This API allows users to retrieve EQPlus configurations programmatically, facilitating integration with other systems or applications.


## Requirements

- Go 1.16 or higher installed on your system.
- Go Fiber library.
- A `.properties` file containing EQPlus configurations.

## Setup

1. **Install Go**: Make sure you have Go installed on your system. You can download it from the [official Go website](https://golang.org/dl/).

2. **Install Fiber**: You can install Fiber using the following command:
   ```bash
   go get -u github.com/gofiber/fiber/v2
   ```

# Usage

To use the EQPlus Configuration API, follow the steps below:

1. **Clone the Repository:**
   Clone the EQPlus Configuration API repository to your local machine:
   ```bash
   git clone https://github.com/your_username/eqplus-bff.git
   ```
2. Run the Server:
    Navigate to the project directory and build the project using the Go compiler. Then, run the executable to start the server:
    ```bash
    cd eqplus-bff
    go run .\cmd\main.go
    ```

# Testing the API

You can test the EQPlus Configuration API by sending a GET request to the `/eqplusConfiguration` endpoint. Below are examples of how to do this using different tools:

## Using CURL

You can use cURL to send a GET request from the command line:

```bash
curl http://localhost:8080/eqplusConfiguration
```

## Testing the API with Postman

You can use Postman to test the EQPlus Configuration API using the provided API collection.
API collection is available on collection folder.

Postman will send the request to the API endpoint, and you will see the EQPlus configuration JSON response in the body section of the response.
