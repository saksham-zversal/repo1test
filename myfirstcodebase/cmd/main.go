package main

import (
	mservices "eqplus-bff/Services"
	configurations "eqplus-bff/config"
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Get("/eqplus-bff/eqplusConfiguration", func(c *fiber.Ctx) error {
		config, err := mservices.ReadPropertiesFile(configurations.Filename)
		if err != nil {
			return c.Status(fiber.StatusInternalServerError).SendString(err.Error())
		}
		return c.JSON(config) 
	})
	app.Listen(configurations.Port)
}

