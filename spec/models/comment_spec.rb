require 'rails_helper'

RSpec.describe Comment, type: :model do
  it_behaves_like 'encryptable', [:content]
end
