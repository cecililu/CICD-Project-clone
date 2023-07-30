 FROM python:3
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /code
 WORKDIR /code

 COPY apt_requirement.txt /code/
 RUN apt-get -y update
 RUN cat apt_requirement.txt | xargs apt -y --no-install-recommends install \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt autoremove \
	&& apt autoclean

 ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
 ENV C_INCLUDE_PATH=/usr/include/gdal


 COPY requirement.txt /code/
 RUN pip install --upgrade pip
 RUN pip install -r requirement.txt
 
 ENTRYPOINT /code/docker-entrypoint.sh
