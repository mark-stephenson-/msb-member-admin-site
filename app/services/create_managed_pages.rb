class CreateManagedPages
  def initialize(user)
    @user = user
  end

  def call
    administered_pages = only_admin(fb_pages)
    create(administered_pages)
  end

  private

  def fb_pages
    graph_api_client(@user).get_connections(@user.uid, "accounts")
  end

  def fb_page_logo(page_id)
    logo =  graph_api_client(@user)
            .get_connections(page_id, "picture?redirect=0")

    logo["data"]["url"]
  end

  def only_admin(pages)
    pages.select { |page| page["perms"].include?("ADMINISTER") }
  end

  def graph_api_client(user)
    @graph_api_client ||= Koala::Facebook::API.new(user.fb_token)
  end

  def create(pages)
    pages.each do |page|
      page_logo = fb_page_logo(page["id"])
      ManagedPage
        .where(user_id: @user.id, fb_page_id: page["id"])
        .first_or_create(
          user_id:                @user.id,
          title:                  page["name"],
          description:            page["name"],
          fb_page_id:             page["id"],
          fb_page_access_token:   page["access_token"],
          fb_page_logo_s:         page_logo
        )
    end
  end
end
