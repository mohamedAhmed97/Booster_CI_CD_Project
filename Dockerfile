FROM ubuntu
RUN apt-get update -qq
RUN apt-get install python3-pip  -qq
RUN pip3 --version
RUN mkdir -p app
RUN chmod 777 app
COPY . /app
WORKDIR /app
EXPOSE 8000
RUN pip3 install -r requirements.txt
RUN  python3 manage.py makemigrations
RUN  python3 manage.py migrate
CMD [ "python3","manage.py","runserver","0.0.0.0:8000" ]


