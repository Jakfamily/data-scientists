puts " 1. Combien y a-t-il de handle dans cette array ?"

puts "il y a exactement #{handle_twiter.length} handle twiter"

puts""

puts " 2. Quel est le handle le plus court de cette liste ?"

short_string = handle_twiter.select{|str| str.length <5}# on selectione les string <5 avec la methode select
puts "il y a #{short_string.length} chaines de moins de 5 caracteres qui est #{short_string.sort}" #on renvoie la valeur dansun nouveau tableau avec la methode sort 

puts ""

puts " 3. Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)"

long_string = handle_twiter.select{|str| str.length >= 5} # on selectione les string >= 5
puts "il y a #{long_string.length} chaines de plus de 5 caracteres"

puts ""

puts "4. Combien commencent par une majuscule (première lettre juste après le @) ?"

count = handle_twiter.select {|str| str =~ /@([A-Z])/}.count
puts "il y a #{count} handle twiter commencent par une majuscule après le @"

puts ""

puts "5. Trie la liste de handle par ordre alphabétique."

# La méthode `sort_by` est appelée sur le tableau `handle_twiter`, ce qui triera les éléments du tableau en fonction de la valeur renvoyée par le bloc passé à `sort_by`.

# Le bloc passé à `sort_by` utilise la méthode `split` sur chaque chaîne de caractères pour diviser la chaîne en un tableau de sous-chaînes séparées par "@". Ensuite, la méthode `last` est appelée sur ce tableau pour récupérer la dernière sous-chaîne, qui est supposée être le nom d'utilisateur Twitter. 

# La méthode `downcase` est appelée sur le nom d'utilisateur pour s'assurer que les noms d'utilisateurs qui diffèrent uniquement par la casse sont traités de la même manière.

# Enfin, `sort_by` retourne un nouveau tableau contenant les éléments triés par ordre croissant de la valeur renvoyée par le bloc. Ce tableau trié est affecté à la variable `sorted_string`.
sorted_string = handle_twiter.sort_by{|str| str.split("@").last.downcase}
puts sorted_string

puts ""

puts "6. Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)"

sorted_string = handle_twiter.sort_by{|str| str.length}
puts sorted_string

puts ""


puts "7. Quelle est la position dans l'array de la personne @epenser ?"
handle_twiter.include?("@epenser") # include? permet de chercher une string dans un arr 
index_in_array = handle_twiter.index("@epenser") # index permet d'afficher le numero d'index du mots rechercher 
puts " tu ma trouveé ! a l'index #{index_in_array} enjoy :-)"

puts ""

puts "8. Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)"

# On crée un nouveau hash avec des valeurs vides par défaut pour chaque clé
result = Hash.new { |h, k| h[k] = [] }

# Pour chaque élément du tableau handle_twiter
handle_twiter.each do |string|
  # On récupère la longueur de la chaîne de caractères
  length = string.length
  # On ajoute la chaîne à l'array correspondant à sa longueur dans le hash
  result[length] << string
end

# On trie le hash par ordre croissant de clés et on le réaffecte à la variable result
result = result.sort.to_h

# Pour chaque clé et array de strings du hash
result.each do |length, strings|
  # On affiche la longueur et les chaînes de caractères associées
  puts "#{length} caractère(s): #{strings.join(', ')}"
end

