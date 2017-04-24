class CreateReportDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :report_details do |t|
      t.integer :report_id
      t.text :data

      t.timestamps
    end
  end
end
