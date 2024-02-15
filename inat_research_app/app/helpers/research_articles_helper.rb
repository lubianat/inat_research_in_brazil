module ResearchArticlesHelper
  def boolean_to_text(value)
    case value
    when true
      'Yes'
    when false
      'No'
    else
      'Not Specified'
    end
  end
end
