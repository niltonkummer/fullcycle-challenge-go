FROM golang:1.20.3-alpine AS builder

WORKDIR /app

COPY . /app/

RUN go build -o app

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

EXPOSE 80

CMD ["./app"]