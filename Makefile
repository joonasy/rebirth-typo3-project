# =======================================
# Local commands
# =======================================

start:
	npm install
	@if [ ! -f .env ]; then\
		cp .env.example .env;\
    fi
	npm run --silent start

start-clone:
	npm install
	@if [ ! -f .env ]; then\
		cp .env.example .env;\
    fi
	npm run --silent start
	npm run --silent db:pull
	npm run --silent assets:pull
	npm run --silent db:replace

bootstrap:
	rm -rf README.md
	rm -rf CHANGELOG.md
	mv PROJECT.MD README.md
	@if [ ! -d .git ]; then\
		git init && git add . && git commit -m "Init";\
    fi

up:
	docker-compose up -d

stop:
	docker-compose stop

update:
	npm run --silent start

rebuild:
	docker-compose stop
	docker-compose rm -f web
	docker-compose rm -f db
	docker-compose up -d

web-bash:
	docker-compose exec web bash

db-bash:
	docker-compose exec db bash

assets-pull:
	npm run --silent assets:pull

db-backup:
	npm run --silent db:backup

db-pull:
	npm run --silent db:backup
	npm run --silent db:pull

db-replace:
	npm run --silent db:backup
	npm run --silent db:replace

db-replace-clone:
	npm run --silent db:backup
	npm run --silent db:pull
	npm run --silent db:replace


# =======================================
# Remote commands
# =======================================

production-start:
	npm run --silent production:start

production-db-replace:
	npm run --silent production:db:replace

production-update:
	npm run --silent production:update

production-assets-push:
	npm run --silent production:assets:push
