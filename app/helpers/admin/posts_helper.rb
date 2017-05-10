module Admin::PostsHelper
  def dynamic_publish_link(post)
    if post.is_published?
      link_to 'Unpublish', admin_post_path(post, post: { is_published: false }), method: :patch, class: 'pull-right'
    else
      link_to 'Publish', admin_post_path(post, post: { is_published: true }), method: :patch, class: 'pull-right text-success'
    end
  end
end
