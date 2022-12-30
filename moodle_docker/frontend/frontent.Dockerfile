FROM --platform=$BUILDPLATFORM node:17.0.1-bullseye-slim as builder

RUN mkdir /frontend
WORKDIR /frontend

RUN npm install -g @angular/cli@14

COPY package.json package-lock.json ./

RUN npm ci

COPY . .
CMD ["ng", "serve", "--host", "0.0.0.0"]