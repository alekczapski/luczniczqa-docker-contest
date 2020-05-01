package main

import (
        "log"
        "net/http"
)

func main() {
        http.Handle("/", http.FileServer(http.Dir("./")))
        log.Println("Listening on :8080...")
        err := http.ListenAndServe(":8080", nil)
        if err != nil {
                log.Fatal(err)
        }
}
