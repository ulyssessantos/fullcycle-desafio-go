FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o fullcyclerocks main.go

###

FROM scratch

WORKDIR /app

COPY --from=builder /app ./
CMD [ "./fullcyclerocks" ]

