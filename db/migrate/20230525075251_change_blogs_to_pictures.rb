class ChangeBlogsToPictures < ActiveRecord::Migration[6.1]
  def change
    rename_table :blogs, :pictures
  end
end
