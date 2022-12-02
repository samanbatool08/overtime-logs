require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: false),
    password: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: true),
    last_name: Field::String.with_options(searchable: true),
    posts: Field::HasMany.with_options(searchable: false),
    remember_created_at: Field::DateTime.with_options(searchable: false),
    reset_password_sent_at: Field::DateTime.with_options(searchable: false),
    reset_password_token: Field::String.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze


  COLLECTION_ATTRIBUTES = %i[
    id
    email
    first_name
    type
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


  COLLECTION_FILTERS = {
  }.freeze

end
