FROM golang:1.22.2

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY main.go ./

RUN go build -v -o /usr/local/bin/app

EXPOSE 3000

CMD ["/usr/local/bin/app"]