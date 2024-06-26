FROM ubuntu:24.04

ENV RYE_HOME /opt/rye
ENV PATH ${RYE_HOME}/shims:${PATH}

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sSf https://rye.astral.sh/get | RYE_NO_AUTO_INSTALL=1 RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true