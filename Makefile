# .PHONY: install-dev
# install-dev:
# 	@echo "Installing dev dependencies..."
# 	@pip install -r requirements.dev.txt
# 	@echo "Done!"

# .PHONY: install
# install: install-dev
# 	@echo "Installing prod dependencies..."
# 	@pip install -r requirements.txt
# 	@echo "Done!"
# 	@echo "Installing git-lfs"
# 	@git lfs install
# 	@git lfs pull

.PHONY: develop
develop: up init-db
	@echo "Done!"

.PHONY: down
down:
	@echo "stopping development server..."
	@set -e
	@docker-compose down
	@echo "Done!"


.PHONY: up
up:
	@echo "Running development server..."
	@set -e
	@docker-compose up -d
	@sleep 5
	@echo "Done!"

.PHONY: init-db
init-db:
	@echo "Initializing database..."
	@docker-compose run --rm backend alembic upgrade head
	@docker-compose run --rm backend python3 app/initial_data.py
	@echo "Done!"

# .PHONY: format
# format:
# 	@python -m isort .
# 	@python -m black .
# 	@python -m ruff check . --fix

# .PHONY: test
# test: format
# 	@export CONFIG_FILE=".env.dev" && python -m pytest