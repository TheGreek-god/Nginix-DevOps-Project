FROM node:18-alpine

WORKDIR /app

COPY package*.json .

# Install without running scripts (skips the prepare script)
RUN npm install --ignore-scripts

# Now copy all source files
COPY . .

# Then run the build explicitly
RUN npm run build

EXPOSE 3000

CMD ["node", "server.js"]