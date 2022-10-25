class ChangeTypeField < ActiveRecord::Migration[7.0]
  def change
    change_table(:areas) do |t|
      t.rename :type, :type_area 
    end
  end
end
