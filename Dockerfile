# Use the official Python image from the Docker Hub
FROM python:3.10.9-slim

# Set the working directory in the container
WORKDIR /app

# Create a virtual environment and activate it
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV

# Set the virtual environment path for all subsequent commands
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Upgrade pip and install dependencies in the virtual environment
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY ./ . 

# Expose the port the app runs on
EXPOSE 5050

# Run the application
CMD ["python", "main.py"]
