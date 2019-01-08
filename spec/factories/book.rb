FactoryGirl.define do
  factory :book, class: Book do
    id '1'
    title 'たのしいRuby'
    content 'ここが内容です'
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/jpg'))
    created_at '2016-01-01T00:00:00Z'
    updated_at '2016-01-02T00:00:00Z'
  end
end
