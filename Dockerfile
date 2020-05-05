FROM node:13.14.0

#We would copy all files inside the directory
COPY . .

#Install the files to run
RUN npm install

# expose a port of the container
EXPOSE 8080

#Command we want to run
CMD npm start