class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references  :reporter,  references: :users
      t.references  :assignee,  references: :users
      t.string      :summary,   null: false
      t.string      :status,    null: false

      t.timestamps
    end
  end
end
