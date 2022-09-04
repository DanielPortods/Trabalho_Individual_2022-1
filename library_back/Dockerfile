FROM python:3.10-bullseye

ENV PYTHONUNBUFFERED 1

WORKDIR /library_back/

COPY library_back/ . 

RUN python3 -m venv env

RUN . env/bin/activate

CMD ["sh", "wait.sh"]