# Dockerfile
# This is a multi-stage build to create a lean and secure production image.

# --- Build Stage ---
# Use a full Python image to build our application's dependencies.
FROM python:3.9-slim as builder

WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# --- Production Stage ---
# Use a minimal base image for the final container.
FROM python:3.9-slim

WORKDIR /app

# Copy the installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copy the application code
COPY app.py .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]