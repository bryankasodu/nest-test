# FROM node:14-alpine AS builder

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install glob rimraf

# RUN npm install --only=development

# COPY . .

# RUN npm run build

# FROM node:12.19.0-alpine3.9 as production

# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install --only=production

# COPY . .

# COPY --from=development /usr/src/app/dist ./dist

# CMD ["node", "dist/main"]


# Working
# Base image
FROM node:14-alpine AS builder

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install 

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

EXPOSE 8080

# Start the server using the production build
CMD [ "node", "dist/main.js" ]