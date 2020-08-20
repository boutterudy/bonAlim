<?php
require_once('objects.php');
require_once('default_page.html');
/*require_once('bonalim.php');

function showSalads($listeSalades) {
  foreach ($listeSalades as $salade)
  {
    echo $salade;
  }
}


// Génération de 7 repas "salade", avec 1 aliment en base, 2 aliments en accompagnement, 3 aliments en assaisonnement et 1 sauce
$repasSemaine = generateSalads(7, 1, 2, 3, 1);

// Affichage des 7 repas
showSalads($repasSemaine);
*/

//$salade = new Salade($nombreAlimentsBase, $nombreAlimentsAccompagnement, $nombreAlimentsAssaisonnement, $nombreSauces);
$salade = new Salade(1, 2, 3, 1);
$alimentsBase = $salade->getAlimentsBase();
$alimentsAccompagnement = $salade->getAlimentsAccompagnement();
$alimentsAssaisonnement = $salade->getAlimentsAssaisonnement();
$sauces = $salade->getSauces();
$i = 0;

// Affichage
echo '
  <div class="repas">
    <p class="subtitle">REPAS N°1</p>
    <p class="title">SALADE</p>
    <p class="composition">';

echo 'Base : ';
foreach ($alimentsBase as $aliment)
{
  echo $aliment->getNom() . ", ";
}

echo '</p><p class="composition">Accompagnement : ';
foreach ($alimentsAccompagnement as $aliment)
{
  echo $aliment->getNom() . ", ";
}

echo '</p><p class="composition">Assaisonnement : ';
foreach ($alimentsAssaisonnement as $aliment)
{
  echo $aliment->getNom() . ", ";
}

if (count($sauces) > 1)
{
  echo '</p><p class="composition">Sauces : ';
} else
{
  echo '</p><p class="composition">Sauce : ';
}
foreach ($sauces as $sauce)
{
  echo $sauce->getNom() . ", ";
}
echo "</p></div>";

require_once('default_footer.html');
?>
