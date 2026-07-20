# syntax=docker/dockerfile:1

# ---------- Stage 1: Build ----------
FROM node:22-alpine AS builder

WORKDIR /usr/src/app

RUN apk add --no-cache python3 make g++

RUN corepack enable

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile --ignore-scripts

COPY . .

RUN pnpm --dir app/library-ui build

# ---------- Stage 2: Runtime ----------
FROM node:22-alpine

WORKDIR /usr/src/app

RUN corepack enable

COPY package*json pnpm-*.yaml ./   

# RUN pnpm install --prod --frozen-lockfile --ignore-scripts
RUN pnpm install --frozen-lockfile --ignore-scripts

COPY srv ./srv
COPY db ./db
COPY db.sqlite ./

COPY --from=builder /usr/src/app/app/library-ui/dist ./app/library-ui/dist

# ENV NODE_ENV=production
ENV PORT=4004

EXPOSE 4004

RUN chown -R node:node /usr/src/app

USER node

CMD ["pnpm", "start"]