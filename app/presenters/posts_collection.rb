class PostsCollection
  PAGE_LIMIT = 10

  attr_reader :current

  def initialize(relation, current)
    @current = current
    @relation = relation
  end

  def next_post
    @relation.where("id > ?", @current.id).first(1).presence
  end

  def previous_post
    @relation.where("id < ?", @current.id).last(1).presence
  end

  def page_scope(page)
    @relation.page(page).per(PAGE_LIMIT)
  end
end