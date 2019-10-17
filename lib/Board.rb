require 'bundler'
Bundler.require

class Board
  attr_accessor :array_boardcase, :count_turn
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué


  def initialize
    #TO DO : #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @@array_boardcase = []

    a1 = BoardCase.new("a1")
    a2 = BoardCase.new("a2")
    a3 = BoardCase.new("a3")
    b1 = BoardCase.new("b1")
    b2 = BoardCase.new("b2")
    b3 = BoardCase.new("b3")
    c1 = BoardCase.new("c1")
    c2 = BoardCase.new("c2")
    c3 = BoardCase.new("c3")

    @@array_boardcase << a1.case_id
    @@array_boardcase << a2.case_id
    @@array_boardcase << a3.case_id
    @@array_boardcase << b1.case_id
    @@array_boardcase << b2.case_id
    @@array_boardcase << b3.case_id
    @@array_boardcase << c1.case_id
    @@array_boardcase << c2.case_id
    @@array_boardcase << c3.case_id

    return @@array_boardcase
    # les egalite ci-dessous me permettrons de lié le choix du joueur à la position du tableau et a faire ma condition si elle est remplis mettre un message derreur
  end

  def play_turn
    @morpion = [] # je créé un tableau qui va correspondres aux cases à remplir dans le tableau
    # la positions des case sera remplis avec morpion

        i = 0
    while i < 10
      @morpion[i] = " "
      i = i + 1
    end

      j = 0 #j est les coups joué, une variable qui nous servira à désigner notre joueur, si j est un chiffre pair ça fera jouer le player1 si j est un chiffre impair ça fera jouer le player2
  while j < 10 || victory? == false
    if j%2 == 0
      @current_player = player1.name
    else
      @current_player = player2.name
    end

    puts "    1   2   3".green
    puts "  +---+---+---+".green
    print "A | ".green
    print "#{@morpion[1]}".red
    print " | ".green
    print "#{@morpion[2]}".red
    print " | ".green
    print "#{@morpion[3]}".red
    puts " | ".green

    puts "  +---+---+---+".green
    print "B | ".green
    print "#{@morpion[4]}".red
    print " | ".green
    print "#{@morpion[5]}".red
    print " | ".green
    print "#{@morpion[6]}".red
    puts " | ".green

    puts "  +---+---+---+".green
    print "C | ".green
    print "#{@morpion[7]}".red
    print " | ".green
    print "#{@morpion[8]}".red
    print " | ".green
    print "#{@morpion[9]}".red
    puts " | ".green
    puts "  +---+---+---+".green


    puts ""
    if j == 9 || victory? == false
      puts "Match nul !"
      exit
    end
    puts "#{@current_player} où souhaites-tu jouer?"
    choice = gets.chomp.downcase #je force la réponse du joueur à etre en downcase pour correspondre a mon tableau @array_boardcase

    z=0 #pour plus de facilité de lecture ma case morpion[0] est un espace et je ne m'en sert pas donc je pars z de 1
    @@array_boardcase.each do |item|
        z = z + 1
      if choice != item #si le choix ne fait pas partie de mon tableau array_boardcase ça veut dire qu'il n'est pas dans le tableau morpion
      else
    		if @morpion[z] == " " #Si la position du morpion est une case vide alors je peux la remplir
            system('clear') #system clear me permet de clear mon terminal a chaque fois qu'un joueur joue
          if j%2 == 0 #si mon j est pair ou impair ça fera jouer mon joueur1 ou 2 comme déjà dit à la ligne 53
    				@morpion[z] = "X"
    			else
    				@morpion[z] = "O"
    			end
    			j = j + 1 #j'incrémente ma variable J uniquement si la case été disponible sinon le tour de mon joueur aurait passé et un joueur aurait jouer 2 fois d'affiler
    		else
          system('clear')
    			puts "/!| La case est déjà occupé comme tu peux le voir dans la représentation du morpion /!|".red
    		end
      end
    end
  end
end

#dans cette def je vais lister toutes les conditions de victoire
  def victory?
    if @morpion[1] == @morpion[2] && @morpion[1] == @morpion[3] && @morpion[1] != @morpion[0]
      if @morpion[1] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
      else
        puts "Fécilication #{player2.name}, tu as gagné"
      end
      return true
    elsif @morpion[4] == @morpion[5] && @morpion[4] == @morpion[6] && @morpion[4] != @morpion[0]
      if @morpion[4] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
      else
        puts "Fécilication #{player2.name}, tu as gagné"
      end
      return true
    elsif @morpion[7] == @morpion[8] && @morpion[7] == @morpion[9] && @morpion[7] != @morpion[0]
      if @morpion[7] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    elsif @morpion[1] == @morpion[5] && @morpion[1] == @morpion[9] && @morpion[1] != @morpion[0]
      if @morpion[1] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    elsif @morpion[3] == @morpion[5] && @morpion[3] == @morpion[7] && @morpion[3] != @morpion[0]
      if @morpion[3] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    elsif @morpion[1] == @morpion[4] && @morpion[1] == @morpion[7] && @morpion[1] != @morpion[0]
      if @morpion[1] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    elsif @morpion[2] == @morpion[5] && @morpion[2] == @morpion[8] && @morpion[2] != @morpion[0]
      if @morpion[2] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    elsif @morpion[3] == @morpion[6] && @morpion[3] == @morpion[9] && @morpion[3] != @morpion[0]
      if @morpion[3] == "X"
        puts "Fécilication #{player1.name}, tu as gagné"
        exit
      else
        puts "Fécilication #{player2.name}, tu as gagné"
        exit
      end
      return true
    end
  end
end
