class CreateRolesPermissions < ActiveRecord::Migration
  def change
    create_table :roles_permissions do |t|
      t.references :role, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
