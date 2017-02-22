FROM creationix/lit:alpine
ADD . /app
EXPOSE 8080
RUN lit install
CMD luvi /app
