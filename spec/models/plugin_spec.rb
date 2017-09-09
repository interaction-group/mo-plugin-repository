require 'rails_helper'

RSpec.describe Plugin, type: :model do
  it "is a correct plugin" do
    plugin = FactoryGirl.create(:plugin, :github)
    expect(plugin).to be_valid
  end

  it "is downcased, trimmed and squished" do
    plugin = FactoryGirl.create(:plugin, :name => "  aS  ", :short_name => "  a-Ad-V3  ", :repository_url => "  sss ", :home_page => " rr   ")
    expect(plugin).to be_valid
    expect(plugin.name).to eq "aS"
    expect(plugin.short_name).to eq "a-ad-v3"
    expect(plugin.repository_url).to eq "sss"
    expect(plugin.home_page).to eq "rr"
  end

  
  it "has an empty repository url" do
    plugin = FactoryGirl.build(:plugin, :blank_repo_url)
    expect(plugin).to_not be_valid
  end

  it "gives the correct releases url (Github)" do
    plugin = FactoryGirl.create(:plugin, :github)
    repo_url = plugin.repository_data
    expect(repo_url[:repo_type]).to eq 'github'
    expect(repo_url[:user_name]).to eq 'FeloVilches'
    expect(repo_url[:repo_name]).to eq 'mo-plugin-repository'
  end

  it "gives the correct releases url (Bitbucket)" do
    plugin = FactoryGirl.create(:plugin, :bitbucket)
    repo_url = plugin.repository_data
    expect(repo_url[:repo_type]).to eq 'bitbucket'
    expect(repo_url[:user_name]).to eq 'caseywdunn'
    expect(repo_url[:repo_name]).to eq 'cnidaria2014'
  end

  it "gives the correct releases url (Github) even if no HTTPS was included" do
    plugin = FactoryGirl.create(:plugin, :repository_url => "github.com/FeloVilches/mo-plugin-repository")
    repo_url = plugin.repository_data
    expect(repo_url[:repo_type]).to eq 'github'
    expect(repo_url[:user_name]).to eq 'FeloVilches'
    expect(repo_url[:repo_name]).to eq 'mo-plugin-repository'
  end

  it "gives the correct releases url (Bitbucket) even if no HTTPS was included" do
    plugin = FactoryGirl.create(:plugin, :repository_url => "bitbucket.org/username/reponame/")
    repo_url = plugin.repository_data
    expect(repo_url[:repo_type]).to eq 'bitbucket'
    expect(repo_url[:user_name]).to eq 'username'
    expect(repo_url[:repo_name]).to eq 'reponame'
  end


end
