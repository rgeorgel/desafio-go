FROM golang:alpine AS builder
WORKDIR /
COPY . .
RUN go build -o /go/bin/main


FROM scratch
COPY --from=builder /go/bin/main /main
ENTRYPOINT ["/main"]
