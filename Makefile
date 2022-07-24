build:
	docker build . -t merlin-service

run_image:
	docker run -p 3000:3000 -d merlin-service

