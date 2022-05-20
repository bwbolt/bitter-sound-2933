require 'rails_helper'

RSpec.describe 'projects#show' do
  it 'Displays the project name, material, and challenge theme' do
    recycled_material_challenge = Challenge.create(theme: 'Recycled Material', project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: 'News Chic', material: 'Newspaper')
    visit "/projects/#{news_chic[:id]}"
    expect(page).to have_content(news_chic.name)
    expect(page).to have_content(news_chic.material)
    expect(page).to have_content(recycled_material_challenge.theme)
  end
end
