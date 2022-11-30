FROM alpine:edge

ENV NUSHELL_VERSION "0.70.0-r0"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache \
  bash \
  jq \
  sd \
  fd \
  ripgrep \
  "nushell=${NUSHELL_VERSION}"

RUN mkdir -p $HOME/.config/nushell \
  && wget https://raw.githubusercontent.com/nushell/nushell/${NUSHELL_VERSION%%-*}/crates/nu-utils/src/sample_config/default_config.nu -O $HOME/.config/nushell/config.nu \
  && sd "show_banner: true" "show_banner: false" $HOME/.config/nushell/config.nu
