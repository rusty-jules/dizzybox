FROM alpine:edge

ENV NUSHELL_VERSION "0.102.0-r0"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache \
  bash \
  jq \
  sd \
  fd \
  ripgrep \
  just \
  "nushell=${NUSHELL_VERSION}"

RUN mkdir -p $HOME/.config/nushell \
  && wget https://raw.githubusercontent.com/nushell/nushell/${NUSHELL_VERSION%%-*}/crates/nu-utils/src/default_files/default_config.nu -O $HOME/.config/nushell/config.nu \
  && wget https://raw.githubusercontent.com/nushell/nushell/${NUSHELL_VERSION%%-*}/crates/nu-utils/src/default_files/default_env.nu -O $HOME/.config/nushell/env.nu \
  && echo >> $HOME/.config/nushell/config.nu && echo "\$env.config.show_banner = false" >> $HOME/.config/nushell/config.nu
