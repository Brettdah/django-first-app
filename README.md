# Django first app

## Disclaimer

This project is a work in progress

It contains a container for development pupose :

- start it
- import your source to be reachable by vscode (i'm using the compose.yml with a volume instruction)
- go inside and start your django server
  - [python ]manage.py runserver [your_IP][:the_port_you_want_to_use]
- edit your source

You may use it or not

## Requirements

install django

## How to use

Better to use a venv for every app to keep things clean and tidy

> TODO a makefile to ready the environment

```bash
app=your_app_name
mkdir python3 -m venv ./virtual-envs; python3 -m venv ./virtual-envs/django_$app
source ./virtual-envs/django_$app/bin/activate
pip3 install django pylint
```

Installing pylint to produce a better quality code so you can check regularly how you are coding and correct yourself instead of :

- Make the app
- Use the linter
- Refacto to fix the lint errors
