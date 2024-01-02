FROM n8nio/n8n:latest
USER root
# Install npm packages
RUN npm install -g crawlee@3.5.2
RUN npm install -g got-scraping@3.2.15
USER node
