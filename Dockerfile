FROM geodata/gdal

USER root

RUN apt-get update && apt-get install -y \
  wget \
  unzip

WORKDIR /root/

RUN echo 'database:5432:osmboundaries:osmboundaries:osmboundaries' > /root/.pgpass
RUN chmod 0600 /root/.pgpass

ADD ./data /data/osmboundaries

COPY ./wait-for-it/wait-for-it.sh /root/wait-for-it.sh
COPY ./import_shapefiles.sh /root/import_shapefiles.sh

CMD sh ./import_shapefiles.sh
