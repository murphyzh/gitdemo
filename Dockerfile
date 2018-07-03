FROM golang:1.9.5 as builder

RUN apt-get update && apt-get install -y \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/upx/upx/releases/download/v3.94/upx-3.94-amd64_linux.tar.xz /usr/local
RUN xz -d -c /usr/local/upx-3.94-amd64_linux.tar.xz | \
    tar -xOf - upx-3.94-amd64_linux/upx > /bin/upx && \
    chmod a+x /bin/upx
# install dep
RUN go get github.com/golang/dep/cmd/dep

WORKDIR /go/srdsmdmmsdfmdfc/openV7
ADD Gopkg.toml Gopkg.toml
ADD Gopkg.lock Gopkg.lock
RUN dep edsfdfnsure --vendor-only


ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ./main.go
RUN strip --strip-unneeded main
RUN upx main

# use a minimal alpine image
FROM alpine:3.7
RUN apk add --no-cache ca-certificates
WORKDIR /root
COPY --from=builder /go/src/openV7 .

# run 
CMD ["./main"]



AAaAandjsandjsdns

l;dsladmsdsdsa
dasdksdasdlsalkd
fd
asdsd


ZZZZ
