module ApplicationHelper
  def title
    content_for(:title).presence || default_title
  end
  
  def default_title
    'Redeye Monitor'
  end
end
