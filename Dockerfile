# Utilisation d'une image de base contenant Node.js
FROM node:alpine
# Définir le répertoire de travail dans le conteneur
WORKDIR /app
# Copier les fichiers du projet dans le conteneur
COPY package.json package-lock.json ./
COPY . /app
# Installer les dépendances
RUN npm install
# Exposer le port 3000 utilisé par l'application React
EXPOSE 3000
# Commande pour démarrer l'application React
CMD ["npm", "start"]
