 FROM python:3
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /code
 WORKDIR /code

 COPY apt_requirements.txt /code/
 RUN apt-get -y update
 RUN cat apt_requirements.txt | xargs apt -y --no-install-recommends install \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt autoremove \
	&& apt autoclean

 ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
 ENV C_INCLUDE_PATH=/usr/include/gdal


 COPY requirements.txt /code/
 RUN pip install -r requirements.txt
 
 ENTRYPOINT /code/docker-entrypoint.sh
