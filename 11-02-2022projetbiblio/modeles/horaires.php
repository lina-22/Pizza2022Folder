<?php
$fichier=$_REQUEST['fichier'];
echo $fichier;
//$fichier="horaires.html";
   $fichier="../textes/".$fichier;
   //$texte=file_get_contents("../textes/horaires.html");
   echo $fichier;
   $texte=file_get_contents($fichier);
 //echo $texte;
   ?>