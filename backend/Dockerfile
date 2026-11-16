FROM python:3.12-slim-trixie AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-cache

FROM python:3.12-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY src src
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*
CMD ["uv", "run", "fastapi", "run", "--port", "49558", "src"]

