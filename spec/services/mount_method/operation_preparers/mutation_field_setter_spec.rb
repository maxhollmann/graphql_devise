require 'spec_helper'

RSpec.describe GraphqlDevise::MountMethod::OperationPreparers::MutationFieldSetter do
  describe '#call' do
    subject(:prepared_operation) { described_class.new(field_type).call(operation) }

    let(:operation)  { double(:operation) }
    let(:field_type) { double(:type) }

    it 'sets a field for the mutation' do
      expect(operation).to receive(:field).with(:authenticatable, field_type, null: false)

      prepared_operation
    end
  end
end
