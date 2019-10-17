require 'bundler'
Bundler.require

class Game<Board
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
attr_accessor :current_player, :status, :Board, :array_player, :player1, :player2

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player

    # 1- création des joueurs
        puts "Joueur X, qu'elle est ton nom?"
        print ">"
        name = gets.chomp
        while(name == "") do #cette boucle me permet d'obliger le joueur a mettre une réponse
          puts "Dis moi ton nom ?"
          print ">"
          name = gets.chomp
        end
        @player1 = Player.new(name,'X')
        puts "#{@player1.name}, tu seras les #{@player1.value} !"

        puts "Joueur O, qu'elle est ton nom?"
        print ">"
        name = gets.chomp
        while(name == "") do
          puts "Dis moi ton nom ?"
          print ">"
          name = gets.chomp
        end
        @player2 = Player.new(name,'O')
        puts "#{@player2.name}, tu seras les #{@player2.value} !"

        @array_player = []
        @array_player << @player1
        @array_player << @player2

    # 2- Création du board
        @board = Board.new

    # 3- Status on going

    # 4- current_player
    @current_player = current_player
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    play_turn
    victory?
  end

  def new_round
    
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end

end
