require_relative '../lib/context_service'

describe ContextService do
  module MyController
    class Create
    end
  end

  class DummyController
    include ContextService

    def params
      { controller: 'my_controller', action: 'create' }
    end
  end

  it 'sets context_service to MyController::Create' do
    expect(DummyController.new.send(:context_service)).to eq(MyController::Create)
  end
end
