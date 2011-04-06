class CreateAwards < ActiveRecord::Migration
  def self.up
    create_table :awards do |t|
      t.integer :ribbon_id
      t.integer :cadet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :awards
  end
end
