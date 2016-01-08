all:
	docker build -t multiarch/goxc .
	docker run -it --rm multiarch/goxc
