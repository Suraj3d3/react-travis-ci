FROM node:18 as myreact
WORKDIR /var/app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx
EXPOSE 80
COPY --from=myreact /var/app/build /usr/share/nginx/html