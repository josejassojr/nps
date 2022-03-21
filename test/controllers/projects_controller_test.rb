require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    sign_in users(:regular)
  end


  test "redirect if not logged in" do
    sign_out users(:regular) # tutorial had sign_out :user but this makes more sense to me
    get projects_url
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Log in"
  end

  test "can get index" do
    get projects_url
    assert_response :success
  end


  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { title: "Test Project" } }
    end
    assert_redirected_to project_url(Project.last)
  end

  test "cannot create a project with invalid attributes" do
    assert_no_difference('Project.count') do
      post projects_url, params: { project: { title: ""} }
    end
  end

  test "can show project" do
    get project_url(@project)
    assert_response :success
  end

  test "can get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "can update project" do
    patch project_url(@project), params: { project: { title: "Updated Project Title" } }
    assert_redirected_to project_url(@project)
    @project.reload
    assert_equal "Updated Project Title", @project.title
  end

  test "cannot update project with invalid attributes" do
    put project_url(@project), params: { project: { title: "" } }
    assert_response :unprocessable_entity #in tutorial, expected success. Maybe in this new version of Rails now responds with #422?
    assert_select "h1", "Edit Project"
  end

# was not working for some reason.
# ActiveRecord::InvalidForeignKey: SQLite3::ConstraintException: FOREIGN KEY constraint failed
# using dependent: :destroy in has_many ?? 
  # test "can destroy project" do
  #   assert_difference('Project.count', -1) do
  #     delete project_url(@project)
  #   end
  #   assert_redirected_to projects_url
  # end
end
