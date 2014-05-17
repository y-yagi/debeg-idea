require 'spec_helper'

describe 'コメントに"イイネ！"をする' do
  before do
    @user = create(:user)
    @idea = create(:idea, user: @user)
    @comment = create(:comment, user: @user, idea: @idea)
  end

  context '未ログイン状態でアイデア詳細ページにアクセスしたとき' do
    before { visit idea_path(@idea) }

    it '"イイネ!"ボタンが表示されていないこと' do
      expect(page).to have_no_css "#like_comment_#{@idea.id}"
    end
  end

  context 'ログイン状態でアイディア詳細ページにアクセスしたとき' do
    before do
      login
      visit idea_path(@idea)
    end

    it '"イイネ!"ボタンが表示されていること' do
      expect(page).to have_css "#like_comment_#{@comment.id}"
    end

    context 'かつ、"イイネ！"ボタンをクリックしたとき', js: true do
      before { click_link 'イイネ!' }

      it '"イイネ済み"と表示されること' do
        expect(page).to have_content "イイネ済み"
      end

      it '"イイネ!: 1"と表示されること' do
        expect(page).to have_content "イイネ!: 1"
      end

      context 'かつ、アイディア詳細ページに再度アクセスしたとき' do
        before { visit idea_path(@idea) }
        it '"イイネ済み"と表示されること' do
          expect(page).to have_content "イイネ済み"
        end

        it '"イイネ!: 1"と表示されること' do
          expect(page).to have_content "イイネ!: 1"
        end
      end
    end
  end
end
