FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy everything into /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
