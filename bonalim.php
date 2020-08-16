<?php
  // Connexion à la base de données
  try {
    $bdd = new PDO('mysql:host=localhost;dbname=bonalim;charset=utf8', 'root', '');
  } catch (Exception $e)
  {
    die('Connexion à la base de données impossible. Erreur : ' . $e->getMessage());
  }

  /* Génération de repas froid type "salade"
    $nombreRepas : Le nombre de repas "salade" que l'on souhaite générer
    $nombreAlimentsBase : Le nombre d'aliments que l'on souhaite avoir comme base pour chaque salade générée
    $nombreAlimentsAccompagnement : Le nombre d'aliments que l'on souhaite avoir comme accompagnement pour chaque salade générée
    $nombreAlimentsAssaisonnement : Le nombre d'aliments que l'on souhaite avoir comme assaisonnement pour chaque salade générée
    $nombreSauces : Le nombre de sauces que l'on souhaite avoir dans chaque salade générée
  */
  function generateSalads($nombreRepas, $nombreAlimentsBase, $nombreAlimentsAccompagnement, $nombreAlimentsAssaisonnement, $nombreSauces)
  {
    global $bdd;

    // Liste des repas
    $repas = [];

    // Génération des repas
    for ($i = 1; $i <= $nombreRepas; $i++) {
      // Nettoyage des variables
      $alimentsBase = null;
      $alimentsAccompagnement = null;
      $alimentsAssaisonnement = null;
      $sauces = null;

      // Description du repas (Base, Accompagnement, Assaisonnement, Sauce)
      $repasString = "<strong>Repas " . $i . " :</strong><br />";

      // Récupération de la base
      $requeteAlimentsBase = 'SELECT aliments.nom FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietesaliments ON proprietealiment.propriete = proprietesaliments.id WHERE proprietesaliments.id = 1 ORDER BY RAND() LIMIT ' . $nombreAlimentsBase;
      $alimentsBase = $bdd->query($requeteAlimentsBase);

      // Récupération de l'accompagnement
      $requeteAlimentsAccompagnement = 'SELECT aliments.nom FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietesaliments ON proprietealiment.propriete = proprietesaliments.id WHERE proprietesaliments.id = 2 ORDER BY RAND() LIMIT ' . $nombreAlimentsAccompagnement;
      $alimentsAccompagnement = $bdd->query($requeteAlimentsAccompagnement);

      // Récupération de l'assaisonnement
      $requeteAlimentsAssaisonnement = 'SELECT aliments.nom FROM aliments INNER JOIN proprietealiment ON aliments.id = proprietealiment.aliment INNER JOIN proprietesaliments ON proprietealiment.propriete = proprietesaliments.id WHERE proprietesaliments.id = 3 ORDER BY RAND() LIMIT ' . $nombreAlimentsAssaisonnement;
      $alimentsAssaisonnement = $bdd->query($requeteAlimentsAssaisonnement);

      // Récupération des sauces
      $requeteSauces = 'SELECT sauces.nom FROM sauces INNER JOIN proprietesauce ON sauces.id = proprietesauce.sauce INNER JOIN proprietesaliments ON proprietesauce.propriete = proprietesaliments.id WHERE proprietesaliments.id = 4 ORDER BY RAND() LIMIT ' . $nombreSauces;
      $sauces = $bdd->query($requeteSauces);

      // Enregistrement de la composition du repas --> Base
      $repasString = $repasString . "Base :<br /><ul>";
      while ($alimentBase = $alimentsBase->fetch())
      {
        $repasString = $repasString . "<li>" . $alimentBase['nom'] . "</li>";
      }

      // Enregistrement de la composition du repas --> Accompagnement
      if ($nombreAlimentsAssaisonnement === 1) {
        $repasString = $repasString . "</ul>Accompagnement :<br /><ul>";
      } else {
        $repasString = $repasString . "</ul>Accompagnements :<br /><ul>";
      }
      while ($alimentAccompagnement = $alimentsAccompagnement->fetch())
      {
        $repasString = $repasString . "<li>" . $alimentAccompagnement['nom'] . "</li>";
      }

      // Enregistrement de la composition du repas --> Assaisonnement
      if ($nombreAlimentsAssaisonnement === 1) {
        $repasString = $repasString . "</ul>Assaisonnement :<br /><ul>";
      } else {
        $repasString = $repasString . "</ul>Assaisonnements :<br /><ul>";
      }

      while ($alimentAssaisonnement = $alimentsAssaisonnement->fetch())
      {
        $repasString = $repasString . "<li>" . $alimentAssaisonnement['nom'] . "</li>";
      }

      // Enregistrement de la composition du repas --> Sauce
      if ($nombreSauces === 1) {
        $repasString = $repasString . "</ul>Sauce :<br /><ul>";
      } else {
        $repasString = $repasString . "</ul>Sauces :<br /><ul>";
      }

      while ($sauce = $sauces->fetch())
      {
        $repasString = $repasString . "<li>" . $sauce['nom'] . "</li>";
      }
      $repasString = $repasString . "</ul><br />";

      array_push($repas, $repasString);
    }
    return $repas;
  }

  // Génération de 7 repas "salade", avec 1 aliment en base, 2 aliments en accompagnement, 3 aliments en assaisonnement et 1 sauce
  $repasSemaine = generateSalads(7, 1, 2, 3, 1);
  foreach ($repasSemaine as $repas) {
    echo $repas;
  }
?>
