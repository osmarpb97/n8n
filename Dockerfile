FROM n8nio/n8n:latest

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER
ARG NODE_FUNCTION_ALLOW_EXTERNAL

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD
ENV NODE_FUNCTION_ALLOW_EXTERNAL=$NODE_FUNCTION_ALLOW_EXTERNAL

ARG ENCRYPTION_KEY

ENV N8N_ENCRYPTION_KEY=$ENCRYPTION_KEY

# Install npm packages
RUN cd /usr/local/lib/node_modules/n8n
RUN npm install crawlee@3.5.2
RUN npm install got-scraping@3.2.15

CMD ["n8n start"]
