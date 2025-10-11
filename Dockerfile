# 1️⃣ Base image
FROM node:20-alpine

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Copy dependency files
COPY package*.json ./

# 4️⃣ Install dependencies
RUN npm install

# 5️⃣ Copy the rest of the app
COPY . .

# 6️⃣ Build the Next.js app
RUN npm run build

# 7️⃣ Expose port 3000 and start app
EXPOSE 3000
CMD ["npm", "start"]
