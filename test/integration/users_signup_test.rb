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
end
