# Build Phase

FROM node:8.12.0 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
