.PHONY: isucondition

isucondition:
	docker run -it --rm -v $(PWD):/isucondition golang:1.17.0-buster bash -c 'cd /isucondition && go mod vendor && GOOS=linux GOARCH=amd64 go build -o isucondition main.go'

