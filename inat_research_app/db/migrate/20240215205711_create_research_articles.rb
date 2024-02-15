class CreateResearchArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :research_articles do |t|
      t.string :doi
      t.string :pmid
      t.string :europe_pmc_url
      t.boolean :about_brazil
      t.boolean :from_brazilians
      t.boolean :uses_inaturalist_prominently
      t.text :title
      t.text :authorString
      t.text :authorList
      t.text :journalInfo
      t.integer :pubYear
      t.string :pageInfo
      t.text :abstractText
      t.text :affiliation

      t.timestamps
    end
  end
end
