module Gossip
  class AckResponder
    def initialize
      @pending = []
    end

    def schedule_ack(member_id)
      @pending << member_id
    end

    def prepare_output
      result = @pending.map { |member_id| [member_id, 'ack'] }
      @pending.clear
      result
    end
  end
end