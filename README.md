# ŁuczniczQA docker contest
- https://www.facebook.com/LuczniczQA/

```console
[ac@centos7vm luczniczqa-docker-contest]$ time docker build -t luczniczqa-docker-contest:latest .
Sending build context to Docker daemon  166.4kB
Step 1/10 : FROM golang:alpine AS builder
alpine: Pulling from library/golang
cbdbe7a5bc2a: Pull complete
408f87550127: Pull complete
fe522b08c979: Pull complete
618fff1cf170: Pull complete
0d8b518583db: Pull complete
Digest: sha256:9b3ad7928626126b72b916609ad081cfb6c0149f6e60cef7fc1e9e15a0d1e973
Status: Downloaded newer image for golang:alpine
 ---> dda4232b2bd5
Step 2/10 : WORKDIR $GOPATH/src/alekczapski/
 ---> Running in 7938998afb84
Removing intermediate container 7938998afb84
 ---> 5f1e01a0f0dc
Step 3/10 : COPY server.go .
 ---> a8e1fe79d394
Step 4/10 : RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/server
 ---> Running in 549de49ac37c
Removing intermediate container 549de49ac37c
 ---> 9a19338e3ebc
Step 5/10 : RUN apk add --no-cache upx
 ---> Running in 71deacb251d6
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/community/x86_64/APKINDEX.tar.gz
(1/4) Installing libgcc (9.2.0-r4)
(2/4) Installing libstdc++ (9.2.0-r4)
(3/4) Installing ucl (1.03-r1)
(4/4) Installing upx (3.95-r2)
Executing busybox-1.31.1-r9.trigger
OK: 10 MiB in 19 packages
Removing intermediate container 71deacb251d6
 ---> 93182266263b
Step 6/10 : RUN upx --brute /go/server
 ---> Running in f867a04b6183
                       Ultimate Packer for eXecutables
                          Copyright (C) 1996 - 2018
UPX 3.95        Markus Oberhumer, Laszlo Molnar & John Reiser   Aug 26th 2018

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
   5472256 ->   1686308   30.82%   linux/amd64   server

Packed 1 file.
Removing intermediate container f867a04b6183
 ---> a57badb6b4aa
Step 7/10 : FROM scratch
 --->
Step 8/10 : COPY --from=builder /go/server .
 ---> 30ceb7d74ad2
Step 9/10 : COPY index.html .
 ---> 3589c60c0b39
Step 10/10 : CMD ["./server"]
 ---> Running in 101219ed505d
Removing intermediate container 101219ed505d
 ---> b1839f0a2bec
Successfully built b1839f0a2bec
Successfully tagged luczniczqa-docker-contest:latest

real    2m45.675s
user    0m0.091s
sys     0m0.118s
```

```console
[ac@centos7vm luczniczqa-docker-contest]$ docker images luczniczqa*
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
luczniczqa-docker-contest   latest              b1839f0a2bec        3 minutes ago       1.75MB
[ac@centos7vm luczniczqa-docker-contest]$
```

```console
[ac@centos7vm luczniczqa-docker-contest]$ docker run --rm -p 8080:8080 luczniczqa-docker-contest:latest
2020/05/01 06:08:15 Listening on :8080...
```

Tu byłem
