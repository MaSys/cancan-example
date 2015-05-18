class User < ActiveRecord::Base
  has_and_belongs_to_many :roles, dependent: :destroy

  def admin?
    self.roles.each do |role|
      return true if role.name == 'Admin'
    end
    false
  end
end
