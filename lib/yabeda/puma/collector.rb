# frozen_string_literal: true

require 'json'

module Yabeda
  module Puma
    class Collector
      def collect_metrics
        metrics = initialized_metrics

        stats = JSON.parse(::Puma.stats)

        if stats['workers']
          # TODO
        else
          collect_worker_metrics(metrics, stats)
        end

        apply_metrics!(metrics)
      end

      def collect_worker_metrics(metrics, worker_stats)
        metrics[:request_backlog_total] += worker_stats['backlog']
        metrics[:running_threads_total] += worker_stats['running']
        metrics[:thread_pool_capacity_total] += worker_stats['pool_capacity']
        metrics[:max_threads_total] += worker_stats['max_threads']
      end

      def apply_metrics!(metrics)
        metrics.each do |name, value|
          Yabeda.puma.public_send(name).set({}, value)
        end
      end

      def initialized_metrics
        {
          running_threads_total: 0,
          request_backlog_total: 0,
          thread_pool_capacity_total: 0,
          max_threads_total: 0
        }
      end
    end
  end
end
