class ManagedPage < ActiveRecord::Base
  include Workflow
  workflow do
    state :new do
      event :initialize,        transitions_to: :bot_selection
    end
    state :bot_selection do
      event :assign_bot,        transitions_to: :payment_required
      event :cancel,            transitions_to: :new
    end
    state :payment_required do
      event :pay,               transitions_to: :training
      event :cancel,            transitions_to: :new
    end
    state :training do
      event :complete_training, transitions_to: :test
      event :activate,          transitions_to: :active
    end
    state :active do
      event :pause,             transitions_to: :training
    end
  end
end
