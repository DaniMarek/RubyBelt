class AddAdminToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :admin, index: true
  end
end
