# Base Python image
FROM python:3.9

# Set the working directory in the container
WORKDIR /data

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y python3-distutils

# Copy requirements file first to leverage Docker's cache
COPY requirements.txt /data/

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy application code into the container
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose the port Django runs on
EXPOSE 8000

# Command to start the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



