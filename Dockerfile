FROM node:24-alpine

WORKDIR /app

RUN npm install -g @grinev/opencode-telegram-bot@latest

CMD ["npx", "@grinev/opencode-telegram-bot@latest", "start"]
