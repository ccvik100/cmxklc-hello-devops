# CmxklcHelloDevops

This project was generated using [Angular CLI](https://github.com/angular/angular-cli) version 20.1.1.

## Development server

To start a local development server, run:

```bash
ng serve
```

Once the server is running, open your browser and navigate to `http://localhost:4200/`. The application will automatically reload whenever you modify any of the source files.

## Code scaffolding

Angular CLI includes powerful code scaffolding tools. To generate a new component, run:

```bash
ng generate component component-name
```

For a complete list of available schematics (such as `components`, `directives`, or `pipes`), run:

```bash
ng generate --help
```

## Build

Az alkalmazás buildeléséhez az Angular CLI szükséges.

Telepítsd a függőségeket:

```bash
npm install
```

To build the project run:

```bash
ng build
```

## Konténerizálás (Docker)

### Image Build

Az image buildeléséhez futtasd a következő parancsot a Dockerfile-t tartalmazó mappában:

```bash
docker build -t hello-devops:v1 .
```

### Image Run

Az image futtatáshoz futtasd a következő parancsot a Dockerfile-t tartalmazó mappában:

```bash
docker run -d -p 8080:80 hello-devops:v1
```

## CI Pipeline és Registry

A CI pipeline a **GitHub Actions**-t használja. Minden `main` branch-re történő push automatikusan elindítja a workflow-t.

### Registry Információ

* **Registry:** Docker Hub
* **Image Név/URL:** `ccvik100/hello-devops`

### Image Lehúzása és Futtatása

Bárki, aki rendelkezik Dockerrel, elindíthatja a konténert a registryből a következő parancsokkal:

1. **Image lehúzása:**
```bash
docker pull ccvik100/hello-devops:latest