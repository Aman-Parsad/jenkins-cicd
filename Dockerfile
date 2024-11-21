# Use Python 3 as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /data

# Install system dependencies, including distutils
RUN apt-get update && apt-get install -y python3-distutils && apt-get clean

# Copy the application code into the container
COPY . .

# Install Django and other dependencies
RUN pip install --no-cache-dir django==3.2

# Expose the port Django uses
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

