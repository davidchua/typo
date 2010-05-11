class Admin::ModerateController < Admin::BaseController
  layout "administration"

  def index
    @articles = Article.pending_moderation
  end

end
