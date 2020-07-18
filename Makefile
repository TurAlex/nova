.SILENT:

dc = docker-compose -p nova

web = nova_web
php = nova_php
db = nova_db
#db_testing = nova_db_testing
#cache = nova_cache
#node = nova_node

build:
	cp -n .env.example .env
#	sudo mkdir -p node_modules
	sudo mkdir -p vendor
	sudo chmod 777 -R vendor/
#	sudo chmod 777 -R node_modules/
	sudo chmod 777 -R docker/storage
	$(dc) up --build --force-recreate -d
	sudo chmod 777 -R vendor/
#	sudo chmod 777 -R node_modules/
	sudo chmod 777 -R docker/storage
	echo "http://192.168.230.1"

start:
	$(dc) start

stop:
	$(dc) stop

down:
	$(dc) down

logs:
	$(dc) logs

logs_f:
	$(dc) logs -f

ps:
	$(dc) ps

php_bash:
	$(dc) exec $(php) bash

web_bash:
	$(dc) exec $(web) bash

db_bash:
	$(dc) exec $(db) bash

db_testing_bash:
	$(dc) exec $(db_testing) bash

node_bash:
	$(dc) exec $(node) bash

restart:
	$(dc) restart

clear_web_log:
	> docker/storage/logs/web.errors.log && > docker/storage/logs/web.access.log
