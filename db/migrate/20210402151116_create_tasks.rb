class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string     :name,        null: false, default: ''
      t.text       :description, null: false, default: ''
      t.integer    :status,      null: false, default: 1
      t.date       :deadline,    null: false
      t.references :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
