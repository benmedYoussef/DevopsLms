# A HTTP Interface for [pdf2htmlEx](https://github.com/coolwanglu/pdf2htmlEX)

This a basic HTTP service that converts PDF files to HTML using the library
[pdf2htmlEx](https://github.com/coolwanglu/pdf2htmlEX).

The HTTP service is implemented in Go. The client must provide a PDF file in a
POST request and the service will return the tranformed file in HTML.

##Run Docker-compose 

``` sh
    cd docker-pdf2html
    docker-compose up -d 
```

**Example using Curl for consuming the service**
``` sh
    curl -F "pdf=@/home/ybenmohamed/input.pdf" http://localhost:8080/ > output.html
```

