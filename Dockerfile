# FROM node:18-alpine
# # Installing libvips-dev for sharp Compatibility
# RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# WORKDIR /opt/
# COPY package.json package-lock.json ./
# RUN npm install -g node-gyp
# RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
# ENV PATH /opt/node_modules/.bin:$PATH

# WORKDIR /opt/app
# COPY . .
# RUN chown -R node:node /opt/app
# USER node
# RUN ["npm", "run", "build"]
# EXPOSE 1337
# CMD ["npm", "run", "develop"]

# Используйте официальный образ Node.js для сборки проекта
FROM node:14

# Установите рабочую директорию в контейнере
WORKDIR /usr/src/app

# Копируйте файлы package.json и package-lock.json
COPY package*.json ./

# Установите зависимости проекта
RUN npm install

# Копируйте остальные файлы проекта в контейнер
COPY . .

# Строим проект
RUN npm run build

# Откройте порт 1337 для подключения к приложению
EXPOSE 1337

# Запустите приложение
CMD [ "npm", "start" ]
