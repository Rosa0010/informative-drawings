# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y build-essential && \
    apt-get clean


# Install required system libraries
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# Upgrade pip and install required Python packages
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install git+https://github.com/openai/CLIP.git

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
# ENV NAME World

# ENV name='fair-sketch'
# ENV results_dir='/results'
# ENV dataroot = '/data'


# Run app.py when the container launches
CMD ["python", "test.py"]
#CMD ["python", "test.py", "--param1", "${name}", "--param2", "${results_dir}", "--param4", "${dataroot}"]
#'/share/landseer/img_align_celeba'