# Baby Tools Shop

## Table of Contents

- [Description](#description)
- [Quickstart](#quickstart)
- [Docker](#docker)
- [Usage](#usage)
- [Configuration](#configuration)
- [Repository Structure](#repository-structure)
- [Screenshots](#screenshots)

## Description

Baby Tools Shop is a small Django e-commerce demo application for baby products.
The application contains product categories, product detail pages, user
registration, user login and a Django admin area for managing products.

The main project code is located in `babyshop_app/`. The repository also contains
example screenshots in `project_images/` and Docker configuration for running the
application in a container.

## Quickstart

Requirements:

- Python 3.9
- pip
- Docker, if you want to run the containerized version

Start the app locally without Docker:

```bash
cd <DJANGO_APP_DIRECTORY>
python3 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r <REQUIREMENTS_FILE>
python manage.py migrate
python manage.py runserver <LOCAL_HOST>:<APP_PORT>
```

Open the app:

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

## Docker

Build the Docker image:

```bash
docker build -t <IMAGE_NAME> .
```

Run the container:

```bash
docker run --rm -p <HOST_PORT>:<CONTAINER_PORT> <IMAGE_NAME>
```

Open the app:

```text
http://<LOCAL_HOST>:<HOST_PORT>/
```

For a server deployment, expose the configured application port and open the app
with the server IP:

```text
http://<SERVER_IP>:<HOST_PORT>/
```

## Usage

The home page lists all available products and categories. Products can be
filtered by category. Product cards link to product detail pages.

A fresh installation does not include preloaded products. Create products and
categories in the Django admin area before using the shop with real data.

Products and categories are managed through the Django admin area. To add
products:

1. Create a superuser.
2. Start the application.
3. Open `/admin/`.
4. Create categories.
5. Create products and assign them to categories.

Uploaded product images are stored in the Django media directory:

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
| `PORT` | `<CONTAINER_PORT>` | Port used by the Django development server inside the container |
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
├── requirements.txt
├── babyshop_app/
│   ├── manage.py
│   ├── babyshop/
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── asgi.py
│   │   └── wsgi.py
│   ├── products/
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── migrations/
│   │   ├── models.py
│   │   ├── tests.py
│   │   ├── urls.py
│   │   └── views.py
│   ├── users/
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── forms.py
│   │   ├── migrations/
│   │   ├── models.py
│   │   ├── tests.py
│   │   ├── urls.py
│   │   └── views.py
│   └── templates/
│       ├── login.html
│       ├── product.html
│       ├── products.html
│       ├── register.html
│       └── partoftemp/
└── project_images/
```

Important files and directories:

- `.dockerignore`: Excludes local-only and documentation-only files from the Docker build context.
- `.gitignore`: Excludes generated files, local databases, media uploads, virtual environments and caches from Git.
- `Dockerfile`: Defines the container image, exposed port and application start command.
- `LICENSE`: Contains the repository license.
- `README.md`: Contains the project documentation, quickstart, usage instructions and repository overview.
- `requirements.txt`: Lists the Python dependencies.
- `babyshop_app/manage.py`: Django management entry point.
- `babyshop_app/babyshop/`: Django project configuration, URL routing, ASGI and WSGI entry points.
- `babyshop_app/babyshop/settings.py`: Django settings, database configuration, media configuration and environment variable configuration.
- `babyshop_app/products/`: Product and category app with models, admin registration, URL routing, views, migrations and tests module.
- `babyshop_app/users/`: User registration and login app with forms, URL routing, views, migrations and tests module.
- `babyshop_app/templates/`: HTML templates for product pages, authentication pages and shared template parts.
- `project_images/`: Example screenshots used for documentation.

## Screenshots

The screenshots below show the application with example product data. A fresh
Docker deployment starts with an empty SQLite database; products and categories
can be added through the Django admin area.

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
