# build front-end
FROM node:lts-alpine

RUN npm install pnpm -g

WORKDIR /app

COPY ./package.json /app

COPY ./pnpm-lock.yaml /app

RUN pnpm install

COPY . /app

RUN pnpm run build

RUN cp /app/dist /app/public

EXPOSE 3002

CMD ["pnpm", "run", "prod"]
