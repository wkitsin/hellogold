require 'spec_helper'
require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  context "validations" do
    describe "validates presence of amount" do
      it { is_expected.to validate_presence_of(:amount) }
      end
    end
end
