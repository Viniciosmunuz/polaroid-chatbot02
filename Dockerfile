FROM node:22-bookworm

# Instalar dependências do sistema para Puppeteer
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libfreetype6 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgobject-2.0-0 \
    libgtk-3-0 \
    libgtk-4-1 \
    libharfbuzz0b \
    libice6 \
    libicu72 \
    libjpeg62-turbo \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    libpixman-1-0 \
    libpng16-16 \
    libsm6 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxinerama1 \
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libxrandr2 \
    libxrender1 \
    libxshmfence1 \
    libxtst6 \
    wget \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar package files
COPY package*.json ./

# Instalar dependências Node
RUN npm ci --omit=dev

# Copiar código da aplicação
COPY . .

# Comando de inicialização
CMD ["node", "chatbot.js"]
