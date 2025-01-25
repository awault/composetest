# Directions for Docker Compose

To build and launch the app, type the following commands in bash:

`docker compose watch`

Or alternatively:

`docker compose up --watch`

To close the container, open a second terminal with the project directory and type the following commands in bash:

`docker compose down`

Or in the original terminal you can press:

`CTRL + C`

With Docker Compose, you can define all your services in a single compose.yaml or you can use multiple compose files to customize your environment.

The branch *singlecomposefile* provides a simple example of an environment with two containers, defined in a single compose.yaml

The branch *doublecomposefile* provides a similar example, but it splits the services into two .yaml files. (compose.yaml & infra.yaml)