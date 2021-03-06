module GraphqlDevise
  module MountMethod
    module OperationPreparers
      class CustomOperationPreparer
        def initialize(selected_keys:, custom_operations:, mapping_name:)
          @selected_keys     = selected_keys
          @custom_operations = custom_operations
          @mapping_name      = mapping_name
        end

        def call
          @custom_operations.slice(*@selected_keys).each_with_object({}) do |(action, operation), result|
            mapped_action = "#{@mapping_name}_#{action}"

            result[mapped_action.to_sym] = [
              OperationPreparers::GqlNameSetter.new(mapped_action),
              OperationPreparers::ResourceNameSetter.new(@mapping_name)
            ].reduce(operation) { |prepared_operation, preparer| preparer.call(prepared_operation) }
          end
        end
      end
    end
  end
end
