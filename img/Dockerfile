FROM ubuntu:latest

LABEL maintainer="Jesse Lisser <jesselisser@gmail.com>"

# Copy Starbound executables
COPY starbound_1.4.4_linux /starbound

# Install git and slim down image
RUN apt-get -y update && apt-get -y install git && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# Copy entrypoint (=wrapper shell script)
COPY entrypoint.sh /entrypoint.sh

# Add execution rights to entrypoint
RUN chmod +x /starbound/linux/starbound_server

# Expose 21025
EXPOSE 21025

# Define entry point
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]