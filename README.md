# RDD-VID-Maker
Code utilisé pour faire les slides de la remises des diplômes des masters de physique

## Nécessaire
Utilitaires nécessaire :
- ffmpeg
- pdftoppm
- hash256sum
- makefile

## Fonctionnement :
sanitize.sh : récupère les pdfs (serieux et fun) et les hashes pour obtenir un nouvel identifiant qui poura fonctionner avec makefile.
makefile : convertis les pdfs en pngs en fait des vidéos de 10s pour les serieux et 0.5s pour les funs puis concaténe les vidéos pour obtenir la vidéo finale


