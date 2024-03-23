require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # 無効なユーザーを登録しようとした際に、登録されずUser.countが登録前と後で変化していないことを
  # 確認するテスト
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  # 有効なユーザーを登録しようとした際に、登録されてUser.countに登録前と後で1だけ差分があることを
  # 確認するテスト
  test 'valid signup information' do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Example User',
                                         email: 'user@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
