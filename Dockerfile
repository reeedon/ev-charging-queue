
# Use a small Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install deps first for better caching
COPY package*.json ./
RUN npm ci --only=production || npm i --production

# Copy the rest of the app
COPY . .

# Environment
ENV NODE_ENV=production

# Render injects PORT; your server must read process.env.PORT
# EXPOSE is informational; we’ll pick a default
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
