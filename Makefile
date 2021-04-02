.PHONY: install-user-systemd
install-user-systemd:
	./scripts/install-systemd-user.sh

.PHONY: install-locally
install-locally:
	./scripts/install-local.sh ${INSTALL_PATH}
