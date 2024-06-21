FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
		python3-dev default-libmysqlclient-dev build-essential pkg-config \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app/was
COPY ./app/requirements.txt ./

RUN pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# EXPOSE 10004
# CMD ["python", "manage.py", "runserver", "0.0.0.0:10004"]
