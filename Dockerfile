# BUILD FÁZIS
FROM node:20-alpine as build
WORKDIR /app

# Függőségek telepítése
COPY package.json package-lock.json ./
RUN npm install

# Kód másolása
COPY . .
# build parancs
RUN ng build --configuration production --output-path ./dist 

# RUN FÁZIS
# Nginx image-et használunk a statikus fájlok kiszolgálására
FROM nginx:stable-alpine as runtime

# Port beállítása
EXPOSE 80 

# Másold át a buildelt fájlokat az Nginx kiszolgáló mappájába
COPY --from=build /app/dist/hello-devops/browser /usr/share/nginx/html

# A konténer automatikusan elindítja az Nginx-et
CMD ["nginx", "-g", "daemon off;"]