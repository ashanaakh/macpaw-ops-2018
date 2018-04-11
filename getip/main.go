package main

import (
	// Standard library packages

	"fmt"
	"log"
	"net/http"

	"github.com/Tomasen/realip"
)

// func ipHandler(w http.ResponseWriter, req *http.Request) {
// http
// url := fmt.Sprintf(“%v %v %v”, r.Method, r.URL, r.Proto)
// fmt.Fprint(req)
// }

func main() {
	// r := mux.NewRouter()
	// r.HandleFunc("/", ipHandler)

	// http.Handle("/", r)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		clientIP := realip.FromRequest(r)
		// log.Println("GET / from", clientIP)
		// fmt.Fprintf(w, "%v", r.Header.Get("X-Real-Ip"))
		// fmt.Fprintf(w, "%v", r.Header.Get("X-Forwarded-For"))
		fmt.Fprintf(w, "%v", clientIP)
		fmt.Fprintf(w, "Hi")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
