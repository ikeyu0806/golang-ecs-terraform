FROM golang:latest

RUN mkdir -p -m 775 /workspace/golang_backend

WORKDIR /workspace/golang_backend

ADD ./ /workspace/golang_backend

RUN ["go", "build"]
CMD ["go", "run", "./main.go"]
