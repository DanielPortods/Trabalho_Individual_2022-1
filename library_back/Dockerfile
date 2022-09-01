FROM python:3.10-bullseye

ENV PYTHONUNBUFFERED 1

COPY library_back /library_back

WORKDIR /library_back

RUN python3 -m venv env

RUN . env/bin/activate