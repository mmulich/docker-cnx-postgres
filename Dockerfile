FROM postgres:9.4

MAINTAINER Michael Mulich <michael.mulich@gmail.com>

RUN apt-get update

# Install the 'plpython' extension language
RUN apt-get install -y postgresql-plpython-$PG_MAJOR

# Install the 'plxslt' extension language
RUN apt-get install -y libxml2-dev libxslt-dev postgresql-server-dev-$PG_MAJOR
RUN apt-get install -y build-essential pkg-config git
RUN git clone https://github.com/petere/plxslt.git && cd plxslt && make && make install && cd ..

# Install cnx-archive
RUN apt-get install -y python-dev python-pip
RUN pip install cnx-db

EXPOSE 5432

COPY initdb.sh /docker-entrypoint-initdb.d/init.sh
