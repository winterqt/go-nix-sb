package main

import (
	"fmt"
	"net/http"
)

func main() {
	_, err := http.Get("https://example.com")
	if err != nil {
		fmt.Printf("%v\n", err)
		return
	}

	fmt.Printf("good")
}
