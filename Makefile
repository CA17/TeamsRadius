docker:
	docker build . -t freeradius

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-s -w -extldflags "-static"' -o lfreemate freemate.go
	upx lfreemate

pubdev:
	docker build . -t freeradius -f Dockerfile
	docker tag freeradius alab.189csp.cn:5000/freeradius:dev
	docker push alab.189csp.cn:5000/freeradius:dev

fastpub:
	docker build . -t freeradius -f Dockerfile
	docker tag freeradius alab.189csp.cn:5000/freeradius:latest
	docker push alab.189csp.cn:5000/freeradius:latest