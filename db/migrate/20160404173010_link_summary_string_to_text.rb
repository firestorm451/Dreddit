class LinkSummaryStringToText < ActiveRecord::Migration
  def change
    change_column :links, :summary, :text
  end
end
