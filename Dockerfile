# Use the official Node.js image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the React app
RUN npm run build

# Set the environment to production
ENV NODE_ENV=production

# Expose the port your app will run on
EXPOSE 3000

# Command to start the app
CMD ["npx", "serve", "-s", "build"]

