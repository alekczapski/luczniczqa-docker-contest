FROM golang:alpine AS builder
WORKDIR $GOPATH/src/alekczapski/
COPY server.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/server
RUN apk add --no-cache upx
RUN upx --brute /go/server

FROM scratch
COPY --from=builder /go/server .
COPY index.html .
CMD ["./server"]
