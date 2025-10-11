# ---- Base ----
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./

# ---- Dependencies ----
FROM base AS deps
RUN npm install

# ---- Build ----
FROM deps AS build
COPY . .
RUN npx prisma generate
RUN npm run build

# ---- Run ----
FROM node:20-alpine AS runner
WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/prisma ./prisma

ENV NODE_ENV=production

CMD ["node", "dist/main.js"]
