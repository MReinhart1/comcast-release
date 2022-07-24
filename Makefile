build:
	docker build . -t movie-search

run_image:
	docker run -p 3000:3000 -d movie-search

stop_image:
	docker kill movie-search
