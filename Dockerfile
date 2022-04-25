FROM polinux/mkdocs:1.2.3
WORKDIR /app
COPY . .
RUN mkdocs build
EXPOSE 8000