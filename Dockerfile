FROM node:24-slim
RUN npm install -g openclaw
ENV PORT=8080
EXPOSE 8080
CMD sh -c "openclaw gateway --port $PORT --allow-unconfigured --bind auto --token openclaw"