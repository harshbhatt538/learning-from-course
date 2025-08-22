# 1. Build stage
FROM node:16-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2. Runtime stage
FROM node:16-alpine
WORKDIR /app

# copy package.json and install only prod dependencies
COPY package*.json ./
RUN npm install --only=production

# copy built files from builder stage
COPY --from=builder /app/dist ./dist

CMD ["node", "dist/index.js"]
