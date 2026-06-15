FROM node:24-alpine

WORKDIR /app

ENV OPENCODE_TELEGRAM_HOME=/app
ENV NODE_ENV=production

RUN npm install -g @grinev/opencode-telegram-bot@latest && \
    adduser -D -h /app bot && \
    chown bot:bot /app

USER bot

CMD ["opencode-telegram", "start"]
