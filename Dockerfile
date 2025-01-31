FROM selenium/standalone-chrome:latest

# Install required dependencies (if necessary)
USER root
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Create a Python virtual environment
RUN python3 -m venv /usr/src/scrapper/venv

# Install Selenium and other Python libraries inside the virtual environment
RUN /usr/src/scrapper/venv/bin/pip install selenium pandas requests openpyxl

# Copy the scraper script into the container
COPY scrapper/ /usr/src/scrapper/

# Switch back to non-root user
USER seluser

# Set the environment variable for the virtual environment
ENV PATH="/usr/src/scrapper/venv/bin:$PATH"

# Expose the default ports for Selenium Grid
EXPOSE 4444


# Run the scraper script when the container starts
# CMD ["source", "/usr/src/scrapper/venv/bin/activate", "&&", "python3", "/usr/src/scrapper/app/main.py"]
