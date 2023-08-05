FROM python:3.9-slim
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /code
RUN mkdir -p /logs
WORKDIR /code

COPY apt_requirement.txt /code/
RUN apt-get -y update
RUN cat apt_requirement.txt | xargs apt -y --no-install-recommends install 
	


COPY requirement.txt /code/

#required for gdal installation
RUN pip install --no-cache-dir setuptools==57.5.0
RUN pip install --no-cache-dir -r requirement.txt
RUN rm /code/requirement.txt /code/apt_requirement.txt

COPY . /code/

ENTRYPOINT bash /code/entrypoint.sh
