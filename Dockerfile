# syntax=docker/dockerfile:1

FROM python:3.10.8

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
RUN pip install flask
RUN pip install pycaret-nightly
ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]