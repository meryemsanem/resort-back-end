namespace :db do
  desc 'Import data from JSON file'
  task import_data: :environment do
    file_path = Rails.root.join('./data.json')
    data = JSON.parse(File.read(file_path), symbolize_names: true)

    data.each do |record|
      Destination.create!(record)
    end

    puts 'Data imported successfully!'
  end
end
