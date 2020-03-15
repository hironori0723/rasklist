class AddStatusToRasks < ActiveRecord::Migration[5.2]
  def change
    add_column :rasks, :status, :string
  end
end
