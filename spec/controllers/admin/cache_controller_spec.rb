require 'spec_helper'

describe Admin::CacheController do
  render_views
  let!(:blog) { create(:blog) }

  before(:each) do
    admin = create(:user_admin)
    request.session = { user: admin.id }
  end

  describe :show do
    before(:each) { get :show }
    it { expect(response).to be_success }
    it { expect(response).to render_template('show') }
  end

  describe :destory do
    before(:each) { post :destroy }
    it { expect(response).to redirect_to(admin_cache_path)}
  end
end
