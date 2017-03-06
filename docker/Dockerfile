# Dockerfile can be found at https://github.com/travelping/ergw-docker-base
FROM ergw/ergw-docker-base

WORKDIR /
COPY _build/prod+native/rel/ /opt/
COPY docker/docker-entrypoint.sh /
COPY config/ergw-capwap-node.config /etc/ergw-capwap-node/
# Create folder for statefiles
RUN mkdir -p /var/lib/ergw/ && touch /var/lib/ergw/ergw.state

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/ergw-capwap-node/bin/ergw-capwap-node", "foreground"]
