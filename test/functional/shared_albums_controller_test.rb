require 'test_helper'

class SharedAlbumsControllerTest < ActionController::TestCase
  setup do
    @shared_album = shared_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_album" do
    assert_difference('SharedAlbum.count') do
      post :create, shared_album: { user_id: @shared_album.user_id }
    end

    assert_redirected_to shared_album_path(assigns(:shared_album))
  end

  test "should show shared_album" do
    get :show, id: @shared_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shared_album
    assert_response :success
  end

  test "should update shared_album" do
    put :update, id: @shared_album, shared_album: { user_id: @shared_album.user_id }
    assert_redirected_to shared_album_path(assigns(:shared_album))
  end

  test "should destroy shared_album" do
    assert_difference('SharedAlbum.count', -1) do
      delete :destroy, id: @shared_album
    end

    assert_redirected_to shared_albums_path
  end
end
