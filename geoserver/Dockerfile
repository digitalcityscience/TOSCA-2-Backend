# Pull base system
FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV GEOSERVER_HOME=/usr/share/geoserver
ENV GEOSERVER_DATA_DIR=/usr/share/geoserver/data_dir

# Install utilities
RUN apt-get update
RUN apt-get install -y curl unzip openjdk-11-jre-headless
RUN apt-get clean
# Set up installation_files directory
RUN mkdir /usr/share/installation_files

# Copy installation files into Docker image
COPY installation_files /usr/share/installation_files

# Install GeoServer
WORKDIR /usr/share/geoserver
RUN unzip -q /usr/share/installation_files/geoserver.zip && \
    rm /usr/share/installation_files/geoserver.zip

# Unzip all files in /usr/share/installation_files
RUN for file in /usr/share/installation_files/extentions/*.zip; do \
    unzip -qo  "$file" -d /usr/share/geoserver/webapps/geoserver/WEB-INF/lib ; \
    done


# Enable CORS
# Be careful about this settings. If you change the version, it might be different
RUN sed -i '137d;158d;189d;194d' /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml

# Set up workspaces
RUN rm -r \
  $GEOSERVER_DATA_DIR/data/* \
  $GEOSERVER_DATA_DIR/layergroups/* \
  $GEOSERVER_DATA_DIR/styles/* \
  $GEOSERVER_DATA_DIR/workspaces/*

CMD /usr/share/geoserver/bin/startup.sh