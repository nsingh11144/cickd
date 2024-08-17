# Use the official Node.js image as a base
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port (adjust if necessary)
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
