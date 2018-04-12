require 'test_helper'

class TransactionTest < ActiveSupport::TestCase


  describe "validates presence of amount" do
      it { is_expected.to validate_presence_of(:amount) }
    end
end
