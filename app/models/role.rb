class Role < ActiveRecord::Base
  has_and_belongs_to_many :permissions, dependent: :destroy, join_table: :roles_permissions
end
