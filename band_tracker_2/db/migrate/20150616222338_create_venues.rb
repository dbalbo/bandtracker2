class CreateVenues < ActiveRecord::Migration
  def change
    create_table(:venues) do |t|
      t.column(:description, :string)
      t.column(:address, :string)
    end
  end
end
