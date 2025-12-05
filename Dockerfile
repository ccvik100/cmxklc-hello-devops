# BUILD FÁZIS
FROM node:20-alpine as build
WORKDIR /app

# Függőségek telepítése
COPY package.json package-lock.json ./
RUN npm install

# Kód másolása
COPY . .

# Build parancs (kényszerítjük a ./dist kimenetet)
RUN ./node_modules/.bin/ng build --configuration production --output-path ./dist

# RUN FÁZIS
FROM nginx:stable-alpine as runtime

# Port beállítása
EXPOSE 80 

# a fájlok közvetlenül a dist/browser alatt vannak.
COPY --from=build /app/dist/browser /usr/share/nginx/html

# A konténer automatikusan elindítja az Nginx-et
CMD ["nginx", "-g", "daemon off;"]