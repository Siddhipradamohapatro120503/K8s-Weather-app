# Use the official Golang image as the base image
FROM golang:1.20

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the container
COPY go.mod go.sum ./

# Download all dependencies. This can help identify issues early.
RUN go mod download

# Copy the rest of the application code to the container
COPY . .

# Run go mod tidy to ensure all necessary modules are included
RUN go mod tidy

RUN go build -o weather-app

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./weather-app"]
