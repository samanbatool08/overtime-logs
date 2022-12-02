require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    posts: Field::HasMany,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze


  COLLECTION_ATTRIBUTES = %i[
    id
    email
    first_name
  ].freeze


  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    first_name
    last_name
    posts
    remember_created_at
    reset_password_sent_at
    reset_password_token
    type
    created_at
    updated_at
  ].freeze


  FORM_ATTRIBUTES = %i[
    email
    password
    first_name
    last_name
    posts
    type
  ].freeze


  COLLECTION_FILTERS = {}.freeze


end
