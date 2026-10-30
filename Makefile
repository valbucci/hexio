.PHONY: venv
venv:
	@test -d .venv || python -m venv .venv

.PHONY: install
install: venv
	.venv/bin/pip install --upgrade pip
	# Install dev dependencies
	.venv/bin/pip install pytest bump build twine

.PHONY: test
test:
	.venv/bin/python -m pytest


.PHONY: bump bump-patch bump-minor bump-major
PROJ_VERSION := $(shell grep -m1 -oP 'version\s*=\s*"\K[^"]+' pyproject.toml)
bump: NEW_VERSION = $(shell .venv/bin/python -m bump --patch)
bump-patch: NEW_VERSION = $(shell .venv/bin/python -m bump --patch)
bump-minor: NEW_VERSION = $(shell .venv/bin/python -m bump --reset --minor)
bump-major: NEW_VERSION = $(shell .venv/bin/python -m bump --reset --major)

bump bump-patch bump-minor bump-major:
	@new_version=$(NEW_VERSION); \
	echo "Updating from ${PROJ_VERSION} to $$new_version ..."; \
	git add pyproject.toml; \
	git commit -m "chore: bump version from ${PROJ_VERSION} to $$new_version"

