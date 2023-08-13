class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content, comment: 'Review content which is fetched from GMB'
      t.integer :rating, comment: 'Number of rating stars out of 5 given on GMB'
      t.text :reply_content, comment: 'Reply content expected to generate by chat gpt'
      t.belongs_to :business, index: true, foreign_key: true

      t.timestamps
    end
  end
end
