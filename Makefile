# IMAGE_TAG is the tag for image to build
IMAGE_TAG ?= giggsoff/try-local-profile
# IMAGE_VERSION is the version of image to build
IMAGE_VERSION ?= 0.1
# IMAGE_DIR is the directory with image Dockerfile to build
IMAGE_DIR=$(CURDIR)

push-multi-arch:
	@echo "Push image"
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag $(IMAGE_TAG):$(IMAGE_VERSION) $(IMAGE_DIR)