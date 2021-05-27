FROM node:14.15.1 as base
WORKDIR /usr/src/app
COPY . .

FROM base as development
RUN npm install --only=development
CMD ["npm", "run", "start"]

FROM base as production
ENV NODE_ENV=production
RUN npm install --only=production
RUN npm run build
CMD ["npm", "run", "start:prod"]