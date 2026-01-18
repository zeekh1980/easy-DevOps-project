# -------- Stage 1: Build --------
FROM python:3.9 AS builder

WORKDIR /app
COPY app.py .

# (If you had dependencies, they would be installed here)
RUN python -m compileall app.py

# -------- Stage 2: Runtime --------
FROM python:3.9-slim

WORKDIR /app

# Copy only required files from builder
COPY --from=builder /app /app

CMD ["python", "app.py"]
