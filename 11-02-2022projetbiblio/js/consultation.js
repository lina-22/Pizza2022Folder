xmlcateg="";
xmledit="";
xmllivres="",
initialisation(xmlcateg,xmledit);
afficheLivres(xmllivres);



$("#listecateg").change(
    function(){
        idcateg=$("#listecateg").val();
        xmllivres=getXmlBase("v_livredit","idcateg",idcateg);
        alert(xmllivres);
        afficheLivres(xmllivres);
    }
)

// fonctions et procédures
function initialisation(xmlcateg,xmledit)
{
    xmlcateg=getXmlBase("categorie","0","0");
    xmledit=getXmlBase("editeur","0","0");

// remplissage de la liste
afficheListe("listecateg",xmlcateg,"categorie","id","nomcateg");
afficheListe("listedit",xmledit,"editeur","code","nomedit");

xmllivres=getXmlBase("v_livredit","0","0");

afficheLivres(xmllivres);

}
// procédures évènmentielles

// changement dans la liste listecateg


// procédure pour afficher les livres
function afficheLivres(xmllivres)
{
    
   // on parse la chaine xml des livres
   chaine="";
   $(xmllivres).find("v_livredit").each
   (

    function()
    {

        var titre=$(this).find('titre').text();
        var nomedit=$(this).find('nomedit').text();
        var annee =$(this).find('annee').text();
        var cote=$(this).find('cote').text();
        var etat=$(this).find('etat').text();
        var photo=$(this).find('photo').text();
        var commentaire=$(this).find('commentaire').text();

        chaine+="<div class='mt-4 text-center border border-primary'>";
       
        chaine+="<div class='text-center'><h3>"+titre+"</h3></div>";
        chaine+="<div class='text-center'><h4>"+nomedit+" "+annee+"</h3></div>";
        urlimage="images/"+photo+".jpg";
        image="<img src="+urlimage+" class='img-fluid' />";

        chaine+="<div>"+image+"</div>";
        chaine+="<div class='p-2 text-justify'><h6>"+commentaire+"</h6></div>";
        if(etat=="0")
        {
            etat="<div class='text-success'>Disponible</div>";
        }
        else
        {
            etat="<div class='text-danger'>Indisponible</div>";
        }
        
        chaine+=etat;


        chaine+="</div>";
    }
  );
   $("#divlivres").html(chaine);
}