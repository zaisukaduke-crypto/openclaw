FROM node:24-alpine
RUN npm install -g openclaw
EXPOSE $PORT
CMD openclaw gateway --port $PORT --allow-unconfigured