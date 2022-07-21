require 'rails_helper'

RSpec.describe "Articles", type: :system do
  describe 'Article投稿' do
    let(:article) { create(:article) }
    it 'Articleの作成が出来ること' do

      # 確認対象の画面に移動
      visit '/articles/new'

      # 編集リンクの存在確認
      expect(current_path).to eq('')
    end
  end
end
