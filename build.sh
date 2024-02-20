#!/bin/bash
GOOS=linux GOARCH=amd64 go build -o bin/co_server-amd64-linux
GOOS=linux GOARCH=386 go build -o bin/co_server-386-linux
GOOS=linux GOARCH=arm go build -o bin/co_server-arm-linux
GOOS=linux GOARCH=arm64 go build -o bin/co_server-arm64-linux
GOOS=linux GOARCH=mips go build -o bin/co_server-mips-linux
GOOS=linux GOARCH=mips64 go build -o bin/co_server-mips64-linux

GOOS=darwin GOARCH=amd64 go build -o bin/co_server-amd64-darwin
GOOS=darwin GOARCH=arm64 go build -o bin/co_server-arm64-darwin

GOOS=android GOARCH=amd64 go build -o bin/co_server-amd64-android
GOOS=android GOARCH=386 go build -o bin/co_server-386-android
GOOS=android GOARCH=arm64 go build -o bin/co_server-arm64-android

for filename in bin/*; do
    [ -e "$filename" ] || continue
    zip "$filename.zip" "$filename"
    rm "$filename" 
done


