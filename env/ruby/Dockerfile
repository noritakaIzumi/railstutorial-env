ARG RUBY_IMAGE
FROM ${RUBY_IMAGE}

USER root
WORKDIR /root

# Configure gem
# skip downloading documents
RUN echo "gem: --no-document" >> ~/.gemrc

# Install Rails and bundler
ARG RAILS_VERSION
ARG BUNDLER_VERSION
RUN gem install rails -v ${RAILS_VERSION} && \
    gem install bundler -v ${BUNDLER_VERSION}
# ignore default bundler
ENV PATH=/usr/local/bundle/gems/bundler-2.3.14/exe:$PATH

# Make directories writable
ARG USER_ID
ARG USER_GROUP
RUN groupadd -g "${USER_GROUP}" group1 && \
    useradd -u "${USER_ID}" -g "${USER_GROUP}" user1 && \
    chown -vR user1:group1 /usr/local/bundle

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
