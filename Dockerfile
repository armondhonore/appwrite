FROM mirror.gcr.io/library/node:22-alpine AS builder
WORKDIR /app
COPY . .
RUN npm ci --omit=dev

FROM mirror.gcr.io/library/node:22-alpine
WORKDIR /app
COPY --from=builder /app ./
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "src/index.js"]
