# Use the official Go image as the base image
FROM golang:1.21

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -v -o weather-app

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./weather-app"]
