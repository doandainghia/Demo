module ApplicationHelper
  def full_title(page_title = '')
    page_title.empty? ? "Ruby on Rails Tutorial Sample App" : "#{page_title} | #{base_title}"
  end
end
