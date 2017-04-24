# This is rake file where we fetch data form some MSSQL DB and insert in the Postgres DB.
# Currently, for the testing purpose we fetch data from some onther Postgres DB and insert it in Our local Postgres DB
require 'pg'

namespace :update_db_record do
  desc "Fetch the MSSQL Data and insert in local Postgres DB"
  task :update_field => :environment do
    begin
      # Set your DB name, username and password for access DB
      conn = PGconn.connect(:dbname => 'DATABASE NAME', :user => 'USERNAME', :password => 'PASSWORD',
          :host => 'localhost', :port => 5432)
      res = conn.exec('select tablename, tableowner from pg_tables')

      res.each do |row|
        if row['tableowner'] == 'rails'
          if Report.where(:sql => row['tablename']).blank?
            report = Report.create(:sql => row['tablename'])
            results = conn.exec('select * from ' + row['tablename'])
            results.each do |detail|
              report.report_details.create(:data => detail)
            end
          end
        end
      end
    rescue => e
      puts "Error on backup MSSQL DB #{e.message}::#{Time.now}"
    ensure
      conn.close if con
    end
  end
end