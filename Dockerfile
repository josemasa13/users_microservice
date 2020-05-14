# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Build the project
RUN npm run build

# Set environment variables
ENV POSTGRES_USERNAME=administrator
ENV POSTGRES_PASSWORD=admin123
ENV POSTGRES_HOST=cdr.czhjnmvrd1fr.us-east-1.rds.amazonaws.com
ENV POSTGRES_DB=postgres
ENV AWS_BUCKET=udagram-972405523754-dev
ENV AWS_REGION=us-east-1
ENV AWS_PROFILE=default
ENV JWT_SECRET=hello
ENV URL=http://localhost:8100

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime

CMD ["node", "./www/server.js"]