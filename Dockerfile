# Use the official Selenium base image
FROM selenium/standalone-chrome:latest

# Install required dependencies (if necessary)
USER root
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Selenium and any additional Python libraries
RUN pip3 install selenium pandas requests openpyxl

# Copy the scraper script into the container
COPY app/ /usr/src/app/


# Download and install ChromeDriver (optional, since the selenium image already includes it)
# RUN wget -q https://chromedriver.storage.googleapis.com/113.0.5672.63/chromedriver_linux64.zip
# RUN unzip chromedriver_linux64.zip -d /usr/local/bin/

# Switch back to non-root user
USER seluser

# Expose the default ports for Selenium Grid
EXPOSE 4444

# Start the selenium server (this is handled by the base image already)
# CMD ["selenium-standalone", "start"]
