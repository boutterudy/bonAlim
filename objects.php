<?php
require_once('bdd.php');

/* Objet "Aliment"
 *
 * Proprités :
 * $id - identifiant de l'aliment
 * $nom - nom de l'aliment
 * $groupe - identifiant du groupe d'aliments
 * $couleur - identifiatn de la couleur dominante de l'aliment
 *
 * Fonctions :
 *
 */
class Aliment
{
  var $id;
  var $nom;
  var $groupe;
  var $couleur;

  function setId($id)
  {
    $this->id = $id;
  }

  function getId()
  {
    return $this->id;
  }

  function setNom($nom)
  {
    $this->nom = $nom;
  }

  function getNom()
  {
    return $this->nom;
  }

  function setGroupe($groupe)
  {
    $this->groupe = $groupe;
  }

  function getGroupe()
  {
    return $this->groupe;
  }

  function setCouleur($couleur)
  {
    $this->couleur = $couleur;
  }

  function getCouleur()
  {
    return $this->couleur;
  }

  function __construct($id, $nom, $groupe, $couleur)
  {
    $this->id = $id;
    $this->nom = $nom;
    $this->groupe = $groupe;
    $this->couleur = $couleur;
  }
}

/* Objet "Sauce"
 * Propriétés :
 * $id - identifiant de la sauce
 * $nom - nom de la sauce
 * $recetteUrl - url vers la recette de la sauce
 * $couleur - couleur dominante de la sauce
 */
class Sauce
{
  var $id;
  var $nom;
  var $recetteUrl;
  var $couleur;

  function setId($id)
  {
    $this->id = $id;
  }

  function getId() {
    return $this->id;
  }

  function setNom($nom) {
    $this->nom = $nom;
  }

  function getNom() {
    return $this->nom;
  }

  function setRecetteUrl($recetteUrl)
  {
    $this->recetteUrl = $recetteUrl;
  }

  function getRecetteUrl()
  {
    return $this->recetteUrl;
  }

  function setCouleur($nom) {
    $this->couleur = $couleur;
  }

  function getCouleur() {
    return $this->couleur;
  }

  function __construct($id, $nom, $recetteUrl, $couleur)
  {
    $this->id = $id;
    $this->nom = $nom;
    $this->recetteUrl = $recetteUrl;
    $this->couleur = $couleur;
  }
}


/* Objet "Salade"
 *
*/
class Salade {
  // Composition de la salade
   var $alimentsBase = [];
   var $alimentsAccompagnement = [];
   var $alimentsAssaisonnement = [];
   var $sauces = [];

   function __construct($nombreAlimentsBase, $nombreAlimentsAccompagnement, $nombreAlimentsAssaisonnement, $nombreSauces)
   {
     global $bdd;

     // Récupération de la base
     $requeteAlimentsBase = 'SELECT aliments.id, aliments.nom, aliments.groupe, aliments.couleur FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietes ON proprietealiment.propriete = proprietes.id WHERE proprietes.id = 1 ORDER BY RAND() LIMIT ' . $nombreAlimentsBase;
     $reponseAlimentsBase = $bdd->query($requeteAlimentsBase);

     // Récupération de l'accompagnement
     $requeteAlimentsAccompagnement = 'SELECT aliments.id, aliments.nom, aliments.groupe, aliments.couleur FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietes ON proprietealiment.propriete = proprietes.id WHERE proprietes.id = 2 ORDER BY RAND() LIMIT ' . $nombreAlimentsAccompagnement;
     $reponseAlimentsAccompagnement = $bdd->query($requeteAlimentsAccompagnement);

     // Récupération de l'assaisonnement
     $requeteAlimentsAssaisonnement = 'SELECT aliments.id, aliments.nom, aliments.groupe, aliments.couleur FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietes ON proprietealiment.propriete = proprietes.id WHERE proprietes.id = 3 ORDER BY RAND() LIMIT ' . $nombreAlimentsAssaisonnement;
     $reponseAlimentsAssaisonnement = $bdd->query($requeteAlimentsAssaisonnement);

     // Récupération des sauces
     $requeteSauces = 'SELECT sauces.id, sauces.nom, sauces.recetteUrl, sauces.couleur FROM sauces INNER JOIN proprietesauce ON sauces.id = proprietesauce.sauce INNER JOIN proprietes ON proprietesauce.propriete = proprietes.id WHERE proprietes.id = 4 ORDER BY RAND() LIMIT ' . $nombreSauces;
     $reponseSauces = $bdd->query($requeteSauces);

     // Enregistrement de la composition du repas --> Base
     while ($aliment = $reponseAlimentsBase->fetch())
     {
       $alimentObject = new Aliment($aliment['id'], $aliment['nom'], $aliment['groupe'], $aliment['couleur']);
       array_push($this->alimentsBase, $alimentObject);
     }

     // Enregistrement de la composition du repas --> Accompagnement
     while ($aliment = $reponseAlimentsAccompagnement->fetch())
     {
       $alimentObject = new Aliment($aliment['id'], $aliment['nom'], $aliment['groupe'], $aliment['couleur']);
       array_push($this->alimentsAccompagnement, $alimentObject);
     }

     // Enregistrement de la composition du repas --> Assaisonnement
     while ($aliment = $reponseAlimentsAssaisonnement->fetch())
     {
       $alimentObject = new Aliment($aliment['id'], $aliment['nom'], $aliment['groupe'], $aliment['couleur']);
       array_push($this->alimentsAssaisonnement, $alimentObject);
     }

     // Enregistrement de la composition du repas --> Sauce
     while ($sauce = $reponseSauces->fetch())
     {
       $sauceObject = new Sauce($sauce['id'], $sauce['nom'], $sauce['recetteUrl'], $sauce['couleur']);
       array_push($this->sauces, $sauceObject);
     }
   }

   function setAlimentsBase($aliments)
   {
     foreach ($aliments as $aliment) {
       array_push($this->alimentsBase, $aliment);
     }
   }

   function getAlimentsBase()
   {
     return $this->alimentsBase;
   }

   function setAlimentsAccompagnement($aliments)
   {
     foreach ($aliments as $aliment) {
       array_push($this->alimentsAccompagnement, $aliment);
     }
   }

   function getAlimentsAccompagnement()
   {
     return $this->alimentsAccompagnement;
   }

   function setAlimentsAssaisonnement($aliments)
   {
     foreach ($aliments as $aliment) {
       array_push($this->alimentsAssaisonnement, $aliment);
     }
   }

   function getAlimentsAssaisonnement()
   {
     return $this->alimentsAssaisonnement;
   }

   function setSauces($sauces)
   {
     foreach ($sauces as $sauce) {
       array_push($this->sauces, $sauce);
     }
   }

   function getSauces()
   {
     return $this->sauces;
   }
}
?>
