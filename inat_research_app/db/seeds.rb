require 'csv'

def parse_boolean(value)
  return true if value.to_s.downcase == 'true'
  return false if value.to_s.downcase == 'false'
  nil
end


csv_file_path = Rails.root.join('db', 'inaturalist_brazil_research.csv')
CSV.foreach(csv_file_path, headers: true) do |row|
  ResearchArticle.find_or_create_by!(doi: row['doi']) do |article|
    article.pmid = row['pmid']
    article.europe_pmc_url = row['europe_pmc_url']
    article.about_brazil = parse_boolean(row['about_brazil'])
    article.from_brazilians = parse_boolean(row['from_brazilians'])
    article.uses_inaturalist_prominently = parse_boolean(row['uses_inaturalist_prominently'])
    article.title = row['title']
    article.authorString = row['authorString']
    article.authorList = row['authorList']
    article.journalInfo = row['journalInfo']
    article.pubYear = row['pubYear'].to_i if row['pubYear'].present?
    article.pageInfo = row['pageInfo']
    article.abstractText = row['abstractText']
    article.affiliation = row['affiliation']
  end
end

