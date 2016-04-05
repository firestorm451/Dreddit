class LinkVotesCountDefault < ActiveRecord::Migration
  def change
    change_column :links, :votes_count, :integer, default: 0
  end
end
