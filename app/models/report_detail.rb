class ReportDetail < ApplicationRecord
  belongs_to :report

  serialize :data, Hash
end
