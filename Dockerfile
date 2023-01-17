FROM node:18-alpine as build

WORKDIR '/app'

COPY . .

RUN npm install && npm run build

COPY . .

FROM nginx:latest

COPY --from=build /app/build /usr/share/nginx/html
