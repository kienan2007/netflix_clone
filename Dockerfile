# 1. Specify the base image
FROM python:3.13-slim

# 2. Set the working directory inside the container
WORKDIR /usr/local/app

# 3. Copy only the dependency file first (to leverage build caching)
COPY requirements.txt ./

# 4. Install the application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the source code into the container
COPY . .

# 6. Define the command to run when the container starts
CMD ["python", "app.py"]
