.PHONY: down
down:
	docker container stop unclesven_whac-a-mole || true \
	&& docker container rm unclesven_whac-a-mole || true \
	&& docker image rm unclesven_whac-a-mole:24.04.04

.PHONY: end
end:
	docker stop unclesven_whac-a-mole

.PHONY: fun
fun:
	docker start unclesven_whac-a-mole

.PHONY: image-build
image-build:
	docker build -t unclesven_whac-a-mole:24.04.04 --no-cache .

.PHONY: image-load
image-load:
	docker load < dockerimage_whac-a-mole_24.04.04.tar.gz

.PHONY: image-save
image-save:
	docker save unclesven_whac-a-mole | gzip > dockerimage_whac-a-mole_24.04.04.tar.gz

.PHONY: up
up: image-build
	docker run \
		-d \
		-p 8000:80 \
		--name unclesven_whac-a-mole \
		unclesven_whac-a-mole:24.04.04
