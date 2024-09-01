FROM golang:1.22.5-alpine

WORKDIR /planner

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /planner/cmd/planner

RUN go build -o /planner/bin/planner .

EXPOSE 8080
ENTRYPOINT [ "/planner/bin/planner" ]