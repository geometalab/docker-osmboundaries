FROM geodata/gdal

USER root

RUN apt-get update && apt-get install -y \
  wget \
  unzip

ENV POSTGRES_PORT 5432

WORKDIR /root/

ADD ./data /data/osmboundaries

COPY ./wait-for-it/wait-for-it.sh /root/wait-for-it.sh
COPY ./import_shapefiles.sh /root/import_shapefiles.sh

CMD ["/root/import_shapefiles.sh"]
