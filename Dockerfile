FROM creationix/lit
RUN lit make creationix/hexes /usr/bin/hexes /usr/bin/luvi
EXPOSE 8080
CMD ["hexes"]
