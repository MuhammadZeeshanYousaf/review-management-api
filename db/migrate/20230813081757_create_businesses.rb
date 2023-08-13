class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name, comment: 'Default name fetches from Google My Business, then editable'
      t.string :account_id, comment: 'used as accountId of Google My Business'
      t.string :location_id, comment: 'used as locationId of Google My Business'
      t.belongs_to :user, foreign_key: true # index: { unique: true} => leaving this bcz in future user could have multiple businesses

      t.timestamps
    end
  end
end
