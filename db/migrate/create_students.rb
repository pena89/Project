class CreateMovies < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string   "names"
    t.string   "cwid"
    t.datetime "signed_in"
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :students
  end
end
