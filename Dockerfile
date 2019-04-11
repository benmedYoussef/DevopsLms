FROM golang:alpine as builder

RUN apk update && \
    apk add --no-cache git
RUN mkdir /app 

ADD . /app/ 
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o frontend .

FROM bwits/pdf2htmlex-alpine
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wget -q http://localhost:8080/healthcheck -O /dev/null || exit -1" ]

WORKDIR /app/
COPY --from=builder /app/frontend /app/
USER 1000
CMD ["/app/frontend"]
