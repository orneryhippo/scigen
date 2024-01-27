# Use a base image with Perl pre-installed
FROM perl:5.8

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Perl application files into the container
COPY . .

# Install any dependencies required by the Perl application
# You may need to adjust this based on the specific dependencies of your Perl website
RUN cpan install Some::Module Another::Module

# Expose the port on which the Perl website will run (adjust as needed)
EXPOSE 80

# Command to start the Perl website (adjust as needed)
CMD ["perl", "app.pl"]
