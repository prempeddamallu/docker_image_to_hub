# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY app.py .

# Command to run the application
CMD ["python", "app.py"]
