describe 'POST create' do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
  .
  .

  before do
    post :create, params: {
      book: {
        .
        .
        image: image
      }
    }
  end
.
.
.
