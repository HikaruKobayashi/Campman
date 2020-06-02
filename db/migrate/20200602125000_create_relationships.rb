class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      # Relationshipsは中間テーブルの為、外部キーとして設定する。
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }

      t.timestamps

      # Relationshipsテーブルのカラム。
      t.index [:user_id, :follow_id], unique: true
    end
  end
end
