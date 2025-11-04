FROM ubuntu:20.04

# Install required packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    unzip \
    openjdk-11-jdk \
    git \
    && rm -rf /var/lib/apt/lists/*

# Download and install Connect IQ SDK
RUN wget -q https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-lin-4.2.1-2023-07-26-9c3f5d7b5.zip -O /tmp/connectiq-sdk.zip && \
    unzip -q /tmp/connectiq-sdk.zip -d /opt/ && \
    rm /tmp/connectiq-sdk.zip && \
    ln -s /opt/connectiq-sdk-lin-4.2.1-2023-07-26-9c3f5d7b5 /opt/connectiq-sdk

# Add SDK tools to PATH
ENV PATH="/opt/connectiq-sdk/bin:${PATH}"

WORKDIR /source
