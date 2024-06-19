# Use the official Node.js 16 image for production
FROM node:16 as build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the application code
COPY . .

# Build the frontend app
RUN npm run build

# Use NGINX to serve the built frontend
FROM nginx:alpine

# Copy build files from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Default command to start NGINX, no need to explicitly run it
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
