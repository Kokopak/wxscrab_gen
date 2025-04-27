FROM alpine:3.15

RUN apk --update add musl-dev gcc python3 python3-dev scons swig py3-bottle py3-gunicorn py3-pip
COPY . /app
RUN	ln -sf /usr/bin/python3 /usr/bin/python ;\
    cd /app/gen ;\
	scons ;\
	swig -python dic.i ;\
    pip3 install .
EXPOSE 1964
ENTRYPOINT /bin/sh -c "cd /app/server ; python3 server.py"
