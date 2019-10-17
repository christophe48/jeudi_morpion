require 'bundler'
Bundler.require

class Player
  attr_reader :name, :value
  #attr_reader permettra just de lire le nom et la valeur du joueur mais de ne plus pouvoir la modifié en cour de jeu

# j'initialise mes deux instances
  def initialize(name,value)
    @name = name
    @value = value
  end
end
