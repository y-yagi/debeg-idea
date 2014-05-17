class CreateLikeIdeas < ActiveRecord::Migration
  def change
    create_table :like_ideas do |t|
      t.references :user, index: true
      t.references :idea, index: true

      t.timestamps
    end
  end
end
