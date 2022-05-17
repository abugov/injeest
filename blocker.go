package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

// prevent the container from exiting
func main() {
	done := make(chan struct{})

	go func() {
		fmt.Println("Blocking forever...")
		c := make(chan os.Signal, 1)
		signal.Notify(c, os.Interrupt, syscall.SIGTERM)

		<-c
		close(done)
	}()

	<-done
	fmt.Println("Exited.")
}
