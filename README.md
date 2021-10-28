# EDM4611-020-Esquisse-6-Mouvement-et-styles-d-animation

![rendu](https://user-images.githubusercontent.com/48024730/139300059-d42bd1e1-4f95-4570-8b50-48876200f414.png)


Cette esquisse a pour but de générer aléatoirement une fresque colorée constituée de plusieurs petites fenêtres qui contiennent chacune une petite animation jouant en boucle. Les animations de cette esquisse ont été créées à l’aide de la librairie **Ani** de **Processing**.

--

La fresque est formée par la création d’une grille d’objets "**Animation**". La taille de la grille est décidée de manière aléatoire entre 2x2 et 10x10 lors de son ouverture. Afin de donner une animation unique pour chacune des fenêtres de la fresque, une liste de variables **Int** est créée afin de garder en banque l’ID du style de l’animation. Les éléments de cette liste sont ensuite passés comme paramètre des objets Animations afin qu’une condition de type if puisse afficher le style choisi. Tous les objets "**Animation**" se font également attribuer un **easing** choisi aléatoirement dans un tableau comportant toutes les options de la librairie **Ani**, une vitesse de lecture entre 0.5 et 2 secondes ainsi qu’une modification de scale de 1 ou de -1 sur l’axe des X et des Y afin de varier l’orientation.

Chacun des styles d’animation est encapsulé dans son propre objet appelé à l’intérieur de l’objet "**Animation**". Tous les objets de type "**Style**" ont une structure interne relativement similaire. Les objets de type "**Style**" sont créés à l’intérieur d’un **PGraphics** afin d’empêcher que les fenêtres débordent les unes sur les autres. La taille du **PGraphics** est calculée par rapport à la taille de la fenêtre. Pour la couleur, une **teinte** est choisie de manière aléatoire entre 0 et 360, une séquence de niveaux de **saturation** contenant des chiffres répartis équitablement entre 0 et 90 et une **luminosité** de 100 sont attribués aux différents éléments graphiques. Chaque élément graphique est animé selon une animation **Ani** qui influence une variable selon la vitesse et le type de **easing** choisi au préalable. Chaque animation **Ani** contient un **callback** appelant une **fonction** qui fait démarrer l’animation suivante. Lorsque la dernière animation est complétée, son **callback** appel une fonction qui réinitialise toutes les animations et redémarre la 1re animation, créant ainsi une boucle.

--

Il est également possible de sauvegarder une séquence d’images de l’animation affichée. Cela peut être fait en appuyant sur la touche **ENTRER** du clavier. Toutes les images affichées pendant que la touche est enfoncée seront enregistrées dans un dossier **frames** situé à l’intérieur du dossier data du projet.

<br>

**Inspiration:**<br>
https://www.pinterest.ca/pin/305118943503504847/
