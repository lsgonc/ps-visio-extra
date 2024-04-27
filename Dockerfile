FROM golang:1.22.2 

WORKDIR /app

#copia go.mod e go.sum para o conteiner
COPY go.mod go.sum ./

#baixa e verifica o download dos modulos
RUN go mod download && go mod verify

#copia o main.go para o conteiner
COPY main.go ./

#builda a imagem
RUN go build -v -o /usr/local/bin/app

EXPOSE 3000

#roda o app
CMD ["/usr/local/bin/app"]