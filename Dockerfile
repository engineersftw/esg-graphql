# Application builder container
# ~~~~~~
FROM        bitwalker/alpine-elixir-phoenix:1.7.3 AS builder
LABEL       description="Engineers SG GraphQL web service Docker builder image"

# Copy all the necessary files for build and packaging (exclude tests)
WORKDIR     /build
COPY        /config ./config/
COPY        /lib ./lib/
COPY        /priv ./priv/
COPY        /rel ./rel/
COPY        mix.exs mix.lock VERSION.txt ./

# Install dependencies, build distributable package, then cleanup build
# artifacts to keep layer size to a minimum
RUN         mix local.hex --force && \
            mix local.rebar --force && \
            mix install && \
            MIX_ENV=prod mix package && \
            mkdir dist && \
            cp -r _build/prod/rel/esg_graphql dist/ && \
            rm -rf _build && \
            rm -rf deps


# Application runtime container
# ~~~~~~
FROM        bitwalker/alpine-elixir-phoenix:1.7.3
LABEL       description="Engineers SG GraphQL web service"

# Copy release package, ready-to-run
WORKDIR     /app
COPY        --from=builder /build/dist/esg_graphql/ ./
RUN         chmod +x bin/esg_graphql

EXPOSE      4000
ENTRYPOINT  ["bin/esg_graphql"]
CMD         ["foreground"]
