package main

import (
	"fmt"
	"net"
	"net/http"
	"os"
)

func main() {
	serverPort, exists := os.LookupEnv("GETIP_PORT")

	if !exists {
		fmt.Println("Enviroment variable GETIP_PORT is not set. Using 3000.")
		serverPort = "3000"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		ip, port, err := net.SplitHostPort(req.RemoteAddr)

		if err != nil {
			fmt.Fprintf(w, "Invalid form %q (IP:port)", req.RemoteAddr)
		}

		userIP := net.ParseIP(ip)

		if userIP == nil {
			fmt.Fprintf(w, "Invalid form %q (IP:port)", req.RemoteAddr)
			return
		}

		forward := req.Header.Get("X-Forwarded-For")

		fmt.Fprintf(w, "<p>IP: %s</p>", ip)
		fmt.Fprintf(w, "<p>Port: %s</p>", port)
		fmt.Fprintf(w, "<p>Forwarded for: %s</p>", forward)
	})

	fmt.Println("Server is running...")

	http.ListenAndServe(":"+serverPort, nil)
}
