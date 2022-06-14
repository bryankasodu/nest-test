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

# Start the server using the production build
CMD [ "node", "dist/main.js" ]

# FROM node:18-alpine As development

# WORKDIR /usr/src/app

# COPY --chown=node:node package*.json ./

# RUN npm ci

# COPY --chown=node:node . .

# USER node

# ###################
# # BUILD FOR PRODUCTION
# ###################

# FROM node:18-alpine As build

# WORKDIR /usr/src/app

# COPY --chown=node:node package*.json ./

# COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules

# COPY --chown=node:node . .

# RUN npm run build

# ENV NODE_ENV production

# RUN npm ci --only=production && npm cache clean --force

# USER node

# ###################
# # PRODUCTION
# ###################

# FROM node:18-alpine As production

# COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
# COPY --chown=node:node --from=build /usr/src/app/dist ./dist

# CMD [ "node", "dist/main.js" ]
