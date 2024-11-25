FROM node:16-alpine AS build
WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx AS release
COPY --from=build /usr/app/build /usr/share/nginx/html