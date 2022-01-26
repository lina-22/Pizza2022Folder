//Au démarrage de la page
// récupération de la chaine xml pour une table ou une vue spécifiée
xmlpizzas=getXmlBase("v_pizzas","0","0");

//remplissage de la liste
afficheListe("listepizzas",xmlpizzas,"v_pizzas","numPizza","nomPizza");

// on récupère le n° de la pizza(clé primaire)
numPizza=$("#listepizzas").val();

// récupération (recherche) de l'index de l'image
// indexImage = getElement(xmlpizzas,"v_pizzas","numPizza", "indexImage", colnom,colvaleur,colrech);

indexImage= getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"indexImage");

// détermination du chemin d'accès à l'image
urlimage="images/"+indexImage+".jpg";

// affichage de l'image correspondant à la pizza sélectionnée
$("#imgpizza").attr('src', urlimage);


// fonctions/procédures
function afficheInfos(xmlpizzas,numPizza){
//  on récupère la valeur de la valeur "vegetarienne"
var veget = getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"vegetarienne");
var nouvelle = getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"new");
// test et modification du contenu de variable
 if(veget=="0")
 {
     veget ="Non";
 }
 else{
     veget ="Oui";
 }
 if(nouvelle=="0")
 {
     nouvelle ="Non";
 }
 else{
     veget ="Oui";
 }

//  construction de la chaine de caratères
var chaine ="";
chaine+="Végétarienne :"+veget;
chaine+= "<br/>";

chaine+="Nouveau : "+nouvelle

}





