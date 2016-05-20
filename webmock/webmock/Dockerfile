FROM python:2.7-alpine

ENV PORT=8000

ADD ./app.py /app.py
ADD ./entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

CMD ["/entrypoint.sh"]

