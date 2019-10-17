require 'bundler'
Bundler.require

class BoardCase
attr_accessor :value, :case_id
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

  def initialize(case_id,value_case="")
    @case_id = case_id
    @value_case = value_case
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
  end

end
