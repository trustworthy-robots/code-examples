class Post < ActiveRecord::Base
  has_one :attachment

  scope :published,   -> { where is_published: true }
  scope :unpublished, -> { where is_published: false }
  scope :unpublished_first, -> { order(:is_published) }
  scope :latest_first, -> { order('updated_at DESC') }

  validates_presence_of :title, :short_description, :html_body

  paginates_per 10

  def to_param
    "#{id}-#{title.to_s.parameterize}"
  end
end
