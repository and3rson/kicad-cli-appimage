.PHONY: all
all:
	docker build -t pkg2appimage .
	docker run --rm -it \
		--cap-add SYS_ADMIN \
		--security-opt apparmor:unconfined \
		--privileged \
		--mount src=$$PWD,target=/appimage,type=bind \
		--cap-add SYS_ADMIN \
		--cap-add MKNOD \
		--device /dev/fuse:mrw \
		pkg2appimage \
		sh -c "\
			cd /appimage && \
			./pkg2appimage ./kicad.yml \
		"
