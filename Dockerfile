# Build Step
FROM node:18 AS build
# Create app directory
WORKDIR /app

# Install everything including devDependencies
COPY package*.json /app
COPY tsconfig.json /app
RUN ls -la /app
RUN npm install

COPY src /app/src
RUN npm run build
RUN rm -rf ./node_modules

# Production Step
FROM node:18
WORKDIR /app

# Sets NODE_ENV to production.  This prevents installing devDependencies in the npm install step
ENV NODE_ENV production

#USER node

COPY package*.json /app

COPY --from=build /app/dist /app/dist

RUN /bin/ls -la /app/dist

# With NODE_ENV set to production, npm install will not install devDependencies
RUN npm install


EXPOSE 8080

# Run command to start server (Javascript)
# CMD [ "node", "server.js" ]

# If using TypeScript, run this command instead
# dist/index.js is the file built by the TypeScript compiler (tsc) from index.ts
CMD [ "node", "/app/dist/server.js"]