FROM node:18-alpine

WORKDIR /app

COPY package*.json .

# Install all dependencies but don't run scripts
RUN npm install --ignore-scripts

# Copy all source files
COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]