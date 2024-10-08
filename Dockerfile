# Use the official Go image as the base image
FROM golang

# Set the current working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the working directory
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code to the working directory
COPY . .

# Build the Go app
RUN go build -o weather-app

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./weather-app"]
