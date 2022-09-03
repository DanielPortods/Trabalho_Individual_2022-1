FROM node:18-alpine

WORKDIR /library_front

ENV PATH /library_front/node_modules/.bin:$PATH

COPY library_front/* /.

RUN npm update -g --verbose

RUN npm install --verbose

EXPOSE 3000

CMD ["npm", "start"]