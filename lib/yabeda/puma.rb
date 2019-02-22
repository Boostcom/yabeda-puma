# frozen_string_literal: true

require 'yabeda/puma/version'
require 'yabeda'

module Yabeda
  module Puma
    class Error < StandardError; end

    class << self
      def install!
        configure_yabeda!
      end

      private

      def configure_yabeda! # rubocop:disable Metrics/MethodLength
        Yabeda.configure do
          group :puma do
            gauge :running_threads_total, comment: 'Number of puma threads currently running.'
            gauge :request_backlog_total, comment: 'Number of requests waiting to be processed by a puma thread.'
            gauge :thread_pool_capacity_total, comment: 'Number of puma threads available at current scale.'
            gauge :max_threads_total, comment: 'Number of puma threads at available at max scale.'
          end

          collect do
            Puma::Collector.new.collect_metrics
          end
        end
      end
    end
  end
end

Yabeda::Puma.install!
