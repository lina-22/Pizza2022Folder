
create view v_ingredpizza as
select numPizza, nomIngredient
from composer
inner join ingredients
on composer.numIngredient= ingredients.numIngredient