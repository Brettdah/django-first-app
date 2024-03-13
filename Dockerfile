FROM python:3.12.2

EXPOSE 80

RUN python3 -m pip install django pylint && \
    mkdir -p /opt/apps


CMD [ "sleep", "infinity" ]
