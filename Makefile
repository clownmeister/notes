NODE = docker exec -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -it -w /var/www/ notes-node bash -c

-include .env

default:
	@make env docker-build install start

env:
	@echo "\n\e[92mChecking for existing env file\e[0m"
	@{ \
	if [ ! -f ./.env ]; then \
		echo "\e[91mEnv not found!\e[0m Creating...";\
		cp .env.dist .env;\
		chmod 755 ./.env;\
		echo "\e[92mEnv file created.\e[0m\n";\
	else \
		echo "Env file \e[92mOK\e[0m.\n";\
	fi \
	}

docker-build d-build d:
	@docker-compose build
	make up

apple-up:
	@if [ "$(APP_IP)" = "" ]; then\
        echo "make env first";exit 1;\
    fi
	echo "Biding IP $(APP_IP) for Apple"
	sudo ifconfig lo0 alias $(APP_IP)

up:
	@docker-compose up -d --force-recreate --remove-orphans

bash node sh:
	@docker exec -it notes-node bash

install:
	@make -s echoSuccess text="Install"
	@$(NODE) "yarn install"

start:
	@make -s echoInfo text="Start"
	@$(NODE) "yarn start"

lint:
	@make -s echoInfo text="ESLint"
	$(NODE) "yarn lint"

fix:
	@make -s echoInfo text="FIX"
	$(NODE) "yarn fix"

#Cross OS Echo formats
#https://www.codeproject.com/Articles/5329247/How-to-change-text-color-in-a-Linux-terminal

echoSuccess:
	@$(NODE)  "printf \"\033[102m\033[97m\033[1m                                    $(text)                                      \033[0m\n\""

echoInfo:
	@$(NODE)  "printf \"\033[44m\033[97m\033[1m                                    $(text)                                      \033[0m\n\""

echoWarning:
	@$(NODE)  "printf \"\033[103m\033[97m\033[1m                                    $(text)                                      \033[0m\n\""

echoDanger:
	@$(NODE)  "printf \"\033[41m\033[97m\033[1m                                    $(text)                                      \033[0m\n\""
