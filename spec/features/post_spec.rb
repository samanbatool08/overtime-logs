require 'rails_helper'

describe 'navigate' do
  before do 
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe 'index' do 
    before do 
      visit posts_path
    end
    it 'can be reached successfully' do 
      expect(page.status_code).to eq(200)
    end 

    it 'has a title of posts' do 
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do  
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Some rationale|Some more content/) 
    end
  end

  describe 'creation' do 
    before do 
      visit new_post_path 
    end 
    it 'has a new form that can be reached' do 
      expect(page.status_code).to eq(200)
    end 

    it 'can be created from new form page' do 
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some Rationale"
      click_on "Save"
      expect(page).to have_content("Some Rationale")
    end

    it 'will have a user associated with it' do 
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association") 
    end
  end

  describe 'new' do 
    it 'has a link to create post from the homepage' do 
      visit root_path 

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do 
    before do 
      @post = FactoryGirl.create(:post)
    end 

    it 'can be reached by clicking on index page' do 
      visit posts_path 

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
  
  
    it 'can be edited' do 
      visit edit_post_path(@post.id)

      fill_in 'post[date]', with: Date.today 
      fill_in 'post[rationale]', with: "Edited Content"

      click_on 'Save'
      expect(page).to have_content("Edited Content")
    end
  end

  describe 'delete' do 
    it 'can be deleted from the index page' do 
      post = FactoryGirl.create(:post)
      visit posts_path 

      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq(200)

    end
  end
end
