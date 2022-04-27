## Containerize the mkdocs

#### 1. Run `docker build` to create the docker image
    docker build -t mkdocs .

#### 2. Run `docker run` to run the docker image
    docker run -dp 8000:8000 mkdocs

#### 3. Access mkdocs website with below URL
    http://localhost:8000

## Pipeline design

The pipeline is designed to build a docker image to deliver the product and deploy to a server that available to run docker image.

The stages including **Checkout source**, **Build**, **Test**, **Containerize**, **Security Scan**, and **Deploy image**.

#### Checkout source
> Checkout the source code from SCM

#### Build
> Build the project to proceed **Test** stage

#### Test
> Run the unit test to make sure the source code is worked as expected, fulfill and ensure the code quality

#### Containerize
> As the project will deliver the docker image, this stage will containerize the project as a docker image

#### Security Scan
> Scan the image security vulerbility with sysdig

#### Deploy image
> The image will be publish to DockerHub

## Credentials handling

There are crendtials in the pipeline for accessing, revealing credentials or sensitive information inside the pipeline is not suggested and it is insecure.

For a business level pipeline, it is sugeested to use `Credential Binding Plugin: withCredentials` method to bind the credentials to variables for Jenkins, it can prevent plain password or senstive information from the pipeline, and also logs. The credentials can be only be managed by Jenkins admin but not all users or developers.

## Credentials creation

The credentials should be created with numbers, lower case alphabet, upper case alphabet, and symbols.
