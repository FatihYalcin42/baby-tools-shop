# Baby Tools Shop

Baby Tools Shop is a small Django e-commerce demo application for baby
products. The project includes product listing and detail pages, category
filtering, user registration and login, and a Django admin area for managing
categories and products.

## Table of Contents

- [Description](#description)
- [Prerequisites](#prerequisites)
- [Quickstart / Installation Instructions](#quickstart--installation-instructions)
- [Usage](#usage)
- [Configuration](#configuration)
- [Repository Structure](#repository-structure)
- [Screenshots](#screenshots)
- [License](#license)

## Description

The repository contains the Django application code in `babyshop_app/`, Docker
configuration for running the project in a container, and example screenshots in
`project_images/`. The application uses SQLite and stores uploaded product
images in the Django media directory.

## Prerequisites

- Python 3.9
- pip
- Docker, if you want to run the containerized version

## Quickstart / Installation Instructions

### Run locally without Docker

```bash
cd <DJANGO_APP_DIRECTORY>
python3 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r <REQUIREMENTS_FILE>
python manage.py migrate
python manage.py runserver <LOCAL_HOST>:<APP_PORT>
```

Open the application:

```text
http://<LOCAL_HOST>:<APP_PORT>/
```

Create an admin user:

```bash
python manage.py createsuperuser
```

Open the admin area:

```text
http://<LOCAL_HOST>:<APP_PORT>/admin/
```

### Run with Docker

Build the image:

```bash
docker build -t <IMAGE_NAME> .
```

Run the container:

```bash
docker run --rm -p <HOST_PORT>:<CONTAINER_PORT> <IMAGE_NAME>
```

The container entrypoint applies database migrations, collects static files and
starts the application with `gunicorn` as the WSGI server.

Open the application:

```text
http://<LOCAL_HOST>:<HOST_PORT>/
```

For a server deployment, expose the configured application port and open the
application with the server IP:

```text
http://<SERVER_IP>:<HOST_PORT>/
```

## Usage

The home page lists all available products and categories. Products can be
filtered by category, and each product card links to a product detail page.

A fresh installation does not include preloaded products. Create products and
categories in the Django admin area before using the shop with real data.

To add products:

1. Create a superuser.
2. Start the application.
3. Open `/admin/`.
4. Create categories.
5. Create products and assign them to categories.

Uploaded product images are stored in:

```text
babyshop_app/media/
```

The media directory is ignored by Git because uploaded files are runtime data.
If persistent uploaded images are required in Docker, run the container with a
volume:

```bash
docker run --rm -p <HOST_PORT>:<CONTAINER_PORT> -v <MEDIA_VOLUME_NAME>:/app/media <IMAGE_NAME>
```

## Configuration

The application can be configured with environment variables.

| Variable | Default | Description |
| --- | --- | --- |
| `PORT` | `<CONTAINER_PORT>` | Port used by the WSGI server inside the container |
| `DJANGO_SECRET_KEY` | `<DJANGO_SECRET_KEY>` | Secret key used by Django |
| `DJANGO_DEBUG` | `<DJANGO_DEBUG>` | Enables or disables Django debug mode |
| `DJANGO_ALLOWED_HOSTS` | `<ALLOWED_HOSTS>` | Comma-separated list of allowed hosts |

Example:

```bash
docker run --rm \
  -p <HOST_PORT>:<CONTAINER_PORT> \
  -e DJANGO_SECRET_KEY="<DJANGO_SECRET_KEY>" \
  -e DJANGO_DEBUG="<DJANGO_DEBUG>" \
  -e DJANGO_ALLOWED_HOSTS="<ALLOWED_HOSTS>" \
  <IMAGE_NAME>
```

## Repository Structure

```text
.
├── .dockerignore
├── .gitignore
├── Dockerfile
├── LICENSE
├── README.md
├── docker-entrypoint.sh
├── requirements.txt
├── babyshop_app/
└── project_images/
```

Important top-level files and directories:

- `.dockerignore`: Excludes local-only and documentation-only files from the
  Docker build context.
- `.gitignore`: Excludes generated files, local databases, media uploads,
  virtual environments and caches from Git.
- `Dockerfile`: Defines the container image, exposed port and application start
  command.
- `LICENSE`: Contains the repository license.
- `README.md`: Contains the project documentation, setup instructions and usage
  notes.
- `docker-entrypoint.sh`: Runs the container startup steps and starts the WSGI
  server.
- `requirements.txt`: Lists the Python dependencies.
- `babyshop_app/`: Contains the Django project, apps, templates and management
  entry point.
- `project_images/`: Contains example screenshots used in the documentation.

## Screenshots

The screenshots below show the application with example product data. A fresh
Docker deployment starts with an empty SQLite database; products and categories
can be added through the Django admin area. Static files for the Django admin
are collected during container startup and served from inside the container.

Home page with login:

![Home page with login](project_images/capture_20220323080815407.jpg)

Home page with filter:

![Home page with filter](project_images/capture_20220323080840305.jpg)

Product detail page:

![Product detail page](project_images/capture_20220323080934541.jpg)

Home page without login:

![Home page without login](project_images/capture_20220323080953570.jpg)

Register page:

![Register page](project_images/capture_20220323081016022.jpg)

Login page:

![Login page](project_images/capture_20220323081044867.jpg)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE)
file for details.
