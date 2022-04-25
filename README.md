## Containerize the mkdocs

---

#### 1. Run `docker build` to create the docker image
> docker build -t mkdocs .

#### 2. Run `docker run` to run the docker image
> docker run -dp 8000:8000 mkdocs

#### 3. Access mkdocs website with below URL
> http://localhost:8000