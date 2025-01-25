# syntax=docker/dockerfile:1
# The proceding line is a Dockerfile syntax version declaration. 

# Set the base image for the container to Python 3.10 built on Alpine Linux
FROM python:3.10-alpine

# Sets the working directory inside the container to /code
# All subsequent commands will be executed from this directory
WORKDIR /code

# Sets the environmental variable for flask, sets the entry point file for the application (app.py)
# This tells flask which file to run
ENV FLASK_APP=app.py

# This tells flask to make the application available outside the container
# Binds the application to networks all-available IP address (0.0.0.0)
ENV FLASK_RUN_HOST=0.0.0.0
# By default flask will bind to 127.0.0.1 which restricts access to the container

# Installs essential packages in the container with Alpines Package Manager (apk)
RUN apk add --no-cache gcc musl-dev linux-headers
# the --no-cache flag ensures the package manager does not store unnecessary cache files
# gcc is the GNU Compiler Collection (needed for compiling C extensions)
# musl-dev provides the musl libc (standard C library for alpine)
# linux-headers is needed to build certain packages (e.g. some dependencies for Python packages)

# Copies the requirements.txt file from the local machine into the containers /code/requirements.txt
COPY requirements.txt requirements.txt
# The requirements.txt files typically lists all python dependencies required

# Installs the Python packages listed in the requirements.txt file
RUN pip install -r requirements.txt

# Informs Docker the container will listen on Port 5000
EXPOSE 5000
# Flask runs on Port 5000 by default, so this tells Docker to map the containers internal port to the host

# Copies the entire contents of the current directory (where Dockerfile is) into the containers /code directory
COPY . .

# This defines the default command to run when the container starts
CMD ["flask", "run", "--debug"]
# The --debug flag enables debugging, which provides detailed error msg & auto reloading during development