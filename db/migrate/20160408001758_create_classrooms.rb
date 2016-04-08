class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :student_id
      t.integer :course_id
      t.datetime :entry_at

      t.timestamps null: false
    end
    add_index :classrooms, :student_id
    add_index :classrooms, :course_id
  end
end
