# Creating the build step
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Creating the running server step
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html