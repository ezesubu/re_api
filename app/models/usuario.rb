class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :default_values
  
  def default_values
    self.nombre ||= ""
    self.username ||= ""
    self.username ||= ""   
    binding.pry 
    self.password.remove();
  end
   


end
