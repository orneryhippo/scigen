# Use a base image with prerequisites for perlbrew
FROM ubuntu:20.04

# Install system dependencies for perlbrew
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    wget

# Install perlbrew
RUN curl -L https://install.perlbrew.pl | bash

# Add perlbrew to PATH
ENV PATH=$HOME/perl5/perlbrew/bin:$PATH

# Install a specific Perl version with perlbrew (adjust as needed)
RUN perlbrew install perl-5.32
RUN perlbrew switch perl-5.32

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Perl application files into the container
COPY . .

# Install dependencies using cpanm (now using perlbrew's Perl)
RUN cpanm --installdeps .

# Expose the port on which the Perl website will run (adjust as needed)
EXPOSE 8080

# Command to start the Perl website (adjust as needed)
CMD ["perl", "scigen.pl"]  
