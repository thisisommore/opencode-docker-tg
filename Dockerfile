FROM node:24-alpine

WORKDIR /app

ENV OPENCODE_TELEGRAM_HOME=/app
ENV NODE_ENV=production

RUN npm install -g @grinev/opencode-telegram-bot@latest && \
    adduser -D -h /app bot && \
    chown bot:bot /app && \
    chown -R bot:bot /usr/local/lib/node_modules/@grinev/opencode-telegram-bot

USER bot

COPY --chown=bot:bot entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["opencode-telegram", "start"]
