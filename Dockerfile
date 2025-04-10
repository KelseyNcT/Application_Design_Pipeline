# Use a base image
FROM node:18  # or python:3.10 or openjdk depending on your tech

# Set working dir
WORKDIR /app

# Copy everything
COPY . .

# Install deps
RUN npm install   # or pip install -r requirements.txt or gradle/maven

# Expose port
EXPOSE 3000  # or whatever your app uses

# Run the app
CMD ["npm", "start"]  # or ["python", "app.py"], ["java", "-jar", "app.jar"]
