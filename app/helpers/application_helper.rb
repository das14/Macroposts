module ApplicationHelper

  def full_title(page_title = '')
    # Returns the full title of a webpage depending on which page is called.
    base_title = "Macroposts"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
