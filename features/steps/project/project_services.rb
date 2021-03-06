class ProjectServices < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedProject
  include SharedPaths

  When 'I visit project "Shop" services page' do
    visit project_services_path(@project)
  end

  Then 'I should see list of available services' do
    page.should have_content 'Services'
    page.should have_content 'Campfire'
    page.should have_content 'Hipchat'
    page.should have_content 'GitLab CI'
    page.should have_content 'Assembla'
  end

  And 'I click gitlab-ci service link' do
    click_link 'GitLab CI'
  end

  And 'I fill gitlab-ci settings' do
    check 'Active'
    fill_in 'Project url', with: 'http://ci.gitlab.org/projects/3'
    fill_in 'Token', with: 'verySecret'
    click_button 'Save'
  end

  Then 'I should see service settings saved' do
    find_field('Project url').value.should == 'http://ci.gitlab.org/projects/3'
  end

  And 'I click hipchat service link' do
    click_link 'Hipchat'
  end

  And 'I fill hipchat settings' do
    check 'Active'
    fill_in 'Room', with: 'gitlab'
    fill_in 'Token', with: 'verySecret'
    click_button 'Save'
  end

  Then 'I should see hipchat service settings saved' do
    find_field('Room').value.should == 'gitlab'
  end


  And 'I click pivotaltracker service link' do
    click_link 'PivotalTracker'
  end

  And 'I fill pivotaltracker settings' do
    check 'Active'
    fill_in 'Token', with: 'verySecret'
    click_button 'Save'
  end

  Then 'I should see pivotaltracker service settings saved' do
    find_field('Token').value.should == 'verySecret'
  end

  And 'I click Flowdock service link' do
    click_link 'Flowdock'
  end

  And 'I fill Flowdock settings' do
    check 'Active'
    fill_in 'Token', with: 'verySecret'
    click_button 'Save'
  end

  Then 'I should see Flowdock service settings saved' do
    find_field('Token').value.should == 'verySecret'
  end

  And 'I click Assembla service link' do
    click_link 'Assembla'
  end

  And 'I fill Assembla settings' do
    check 'Active'
    fill_in 'Token', with: 'verySecret'
    click_button 'Save'
  end

  Then 'I should see Assembla service settings saved' do
    find_field('Token').value.should == 'verySecret'
  end
end
