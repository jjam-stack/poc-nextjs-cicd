# Stage 1: Build the Next.js app
FROM node:18-alpine AS builder
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache python3 g++ make

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy rest of the app and build
COPY . .
RUN npm run build

# Stage 2: Serve static files with Nginx
FROM nginx:alpine
# Remove default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy exported static files from builder
COPY --from=builder /app/.next /usr/share/nginx/html
COPY --from=builder /app/public /usr/share/nginx/html

# Expose port
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
