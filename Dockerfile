FROM node:24-slim
RUN npm install -g openclaw
RUN mkdir -p /root/.openclaw && echo '{\
  "models": {\
    "providers": {\
      "zen": {\
        "baseUrl": "https://opencode.ai/zen/v1",\
        "apiKey": "${OPENCODE_API_KEY}",\
        "api": "openai-completions",\
        "models": [\
          {"id": "deepseek-v4-flash-free", "name": "DeepSeek V4 Flash Free", "contextWindow": 128000, "maxTokens": 32768}\
        ]\
      }\
    }\
  },\
  "agents": {\
    "defaults": {\
      "model": {\
        "primary": "zen/deepseek-v4-flash-free"\
      }\
    }\
  }\
}' > /root/.openclaw/openclaw.json
ENV PORT=8080
EXPOSE 8080
CMD sh -c "openclaw gateway --port $PORT --bind auto --token openclaw"