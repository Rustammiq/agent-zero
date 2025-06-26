FROM python:3.11-slim

# Dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpoppler-cpp-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Create working dir
WORKDIR /app

# Copy app
COPY . /app

# Install Python packages
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Start Agent Zero
CMD ["python", "main.py"]
