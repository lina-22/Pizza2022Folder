//Au démarrage de la page
// récupération de la chaine xml pour une table ou une vue spécifiée
xmlpizzas="";

numPIzza=0;

numTarif=0;



xmlpizzas=getXmlBase("v_pizzas","0","0");

//remplissage de la liste
afficheListe("listepizzas",xmlpizzas,"v_pizzas","numPizza","nomPizza");

// on récupère le n° de la pizza( clé primaire)
numPizza= $("#listepizzas").val();



// affichage d'une liste déroulante pour les tailles de pizzas

// recup chaine xml pour les  tailles
xmltailles=getXmlBase("tailles","0","0");

// création de la liste des tailles
afficheListe("listetailles",xmltailles,"tailles","numTaille","nomTaille");

// on récup les infos de la table couter filtrée sur le tarif de la pizza
numTarif=getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"numTarif");
// alert(numTarif);
//on récup le n° de la taille dans la liste des tailles
numTaille=$("#listetailles").val();

// on récup les couts des pizzas en filtrant sur le code tarif
xmlcout=getXmlBase("couter","numTaille",numTaille)
alert(xmlcout);
// récupération( recherche) de l'index de l'image
indexImage= getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"indexImage");


// détermination du chemin d'accès à l'image
urlimage="images/"+indexImage+".jpg";

// afffichage de l'image correspondant à la pizza sélectionnée
$("#imgpizza").attr('src',urlimage);

// affichage des infos de la pizza sélectionnée
chaineinfos=afficheInfos(xmlpizzas,numPizza);
$("#divinfos").html(chaineinfos);

//récupération de la chaine xml pour une table ou une vue spécifiée
// on filtre les ingredients sur le nuùéro de la pizza sélectionnée
xmlingred=getXmlBase(" v_ingredpizza","numPizza",numPizza);
chaine=afficheIngredients(xmlingred);

$("#divingred").html(chaine);

//   procédures évènementielles -----------------
// changement de sélection dans la liste des pizzas

$("#listepizzas").change
(
       function()
       {
        
        initialisation(xmlpizzas);
       }
);

// click sur les boutons radio ( genres)
$("#0,#1,#2,#3").click
(
        function()
        {
            clef="0";
            valeur="0";
            // on récupère l'id du genre
            var indexGenre= $(this).attr('id');
            
            // on dérermine la clé et la valeur de filtrage sur le genre
            if(indexGenre!="0")
            {
                clef="numGenre";
                valeur=indexGenre;
            }
             // on réinitialise la chaine xml pour les pizzas
            xmlpizzas=getXmlBase("v_pizzas",clef,valeur);

            // on vide la liste des pizzas
            $("#listepizzas").html("");

            afficheListe("listepizzas",xmlpizzas,"v_pizzas","numPizza","nomPizza");

            initialisation(xmlpizzas);


        }
);




//----------------------------------------------------
// fonctions/procédures

// appel du processus lors d'un changement de la liste
function initialisation(xmlpizzas)
{

    numPizza= $("#listepizzas").val();
    indexImage= getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"indexImage");

    
    // détermination du chemin d'accès à l'image
    urlimage="images/"+indexImage+".jpg";
    
    // afffichage de l'image correspondant à la pizza sélectionnée
    $("#imgpizza").attr('src',urlimage);
    
    // affichage des infos de la pizza sélectionnée
    chaineinfos=afficheInfos(xmlpizzas,numPizza);
    $("#divinfos").html(chaineinfos);
    
    //récupération de la chaine xml pour une table ou une vue spécifiée
    // on filtre les ingredients sur le nuùéro de la pizza sélectionnée
    xmlingred=getXmlBase(" v_ingredpizza","numPizza",numPizza);
    chaine=afficheIngredients(xmlingred);
    $("#divingred").html(chaine);
    
   
}


function afficheInfos(xmlpizzas,numPizza)
{
     // on récupère la valeur de la valeur "vegetarienne"
     var veget=getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"vegetarienne");
     var nouvelle =getElement(xmlpizzas,"v_pizzas","numPizza",numPizza,"new");
     
     // test et modification du contenu des variables
     if(veget=="0")
         {
            veget="Non";
         }
         else
         {
             veget="Oui"
         }

         if(nouvelle=="0")
         {
            nouvelle="Non";
         }
         else
         {
             nouvelle="Oui"
         }
         
         // construction de la chaine de caractères
         var chaine = "";
         chaine+="Végétarienne : "+veget;
         chaine+="<br />";

         chaine+="Nouveau : "+nouvelle;
         chaine+="<br />";
 
         return chaine;     
}

// fonction qui retourne une chaine après qu'on ait parsé  la chaine xml
function afficheIngredients(xmlingred)
{
    // parcours des éléments de la chaine xml
    chaine="";
    $(xmlingred).find("v_ingredpizza").each
    (
        function()
        {
            var nom = $(this).find("nomIngredient").text();
            chaine+=nom;
            chaine+="<br />";

        }
    );
    
    return chaine;
}





