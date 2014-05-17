require 'spec_helper'

describe '記事に"イイネ！"をする' do
  before do
    @user = create(:user)
    @idea = create(:idea, user: @user)
  end

  context '未ログイン状態でトップページにアクセスしたとき' do
    before { visit root_path }

    it '"イイネ!"ボタンが表示されていないこと' do
      expect(page).to have_no_css "#like_idea_#{@idea.id}"
    end
  end

  context 'ログイン状態でトップページにアクセスしたとき' do
    before do
      login
      visit root_path
    end

    it '"イイネ!"ボタンが表示されていること' do
      expect(page).to have_css "#like_idea_#{@idea.id}"
    end

    context 'かつ、"イイネ！"ボタンをクリックしたとき', js: true do
      before { click_link 'イイネ!' }

      it '"イイネ済み"と表示されること' do
        expect(page).to have_content "イイネ済み"
      end

      it '"イイネ!: 1"と表示されること' do
        expect(page).to have_content "イイネ!: 1"
      end

      context 'かつ、トップページに再度アクセスしたとき' do
        before { visit root_path }
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
