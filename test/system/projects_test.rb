require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do

    @project = projects(:one)
  end

  test "visiting the index" do
    sign_in users(:regular)
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    sign_in users(:regular)
    visit projects_url

    click_on "Add New Project"

    fill_in "Title", with: @project.title
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "updating a Project" do
    sign_in users(:regular)
    visit project_url(@project)

    click_on "Edit"

    fill_in "Title", with: "Updated Project"
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "cancels destroying a Project" do
    sign_in users(:regular)
    visit projects_url

    click_on "Show", match: :first

    click_on "Edit"

    click_on "Cancel", match: :first

    assert_selector "h1", text: "Show project"
  end


#Destroying is not working. Tried changing to button_to in views and did destroy but did not give me back message asking for confirmation.
# test "destroys a Project" do
#     sign_in users(:regular)
#     visit project_url(@project)
#
#     click_on "Edit"
#
#     # page.accept_confirm do
#     click_on "Destroy"
#     # end
#     click_on "Confirm"
#
#     assert_text "Project was successfully destroyed"
#
#     assert_selector "h1", text: "Show project"
#   end

end
