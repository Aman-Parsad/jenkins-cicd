# Use the official Python 3 image as the base
FROM python:3

# Set the working directory inside the container
WORKDIR /data

# Install system dependencies
RUN apt-get update && apt-get install -y python3-distutils && apt-get clean

# Copy application files to the container
COPY . .

# Install Django and other Python dependencies
RUN pip install --no-cache-dir django==3.2

# Expose the port Django runs on
EXPOSE 8000

# Command to start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
