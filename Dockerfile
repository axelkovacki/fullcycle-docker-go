FROM golang:alpine AS builder
WORKDIR $GOPATH/src/main
COPY . .
RUN go mod init
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello
FROM scratch
COPY --from=builder /go/bin/hello /go/bin/hello
ENTRYPOINT ["/go/bin/hello"]