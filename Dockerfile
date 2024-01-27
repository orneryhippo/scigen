# Use a base image with Perl pre-installed
FROM perl:5.32

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Perl application files into the container
COPY . .

# Install any dependencies required by the Perl application
# You may need to adjust this based on the specific dependencies of your Perl website
RUN cpanm --installdeps .

# Expose the port on which the Perl website will run (adjust as needed)
EXPOSE 8080

# Command to start the Perl website (adjust as needed)
CMD ["perl", "app.pl"]
