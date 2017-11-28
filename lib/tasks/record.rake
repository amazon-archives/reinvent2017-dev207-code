namespace :record do
  desc "Migrate the table configuration"
  task :migrate => :environment do
    if Rails.env.production?
      cfg = Aws::Record::TableConfig.define do |t|
        t.model_class Item
        t.read_capacity_units 5
        t.write_capacity_units 5
      end
    else
      cfg = Aws::Record::TableConfig.define do |t|
        t.model_class Item
        t.read_capacity_units 1
        t.write_capacity_units 1
      end
    end
    if cfg.compatible?
      puts "Remote table is compatible, nothing to migrate!"
    else
      puts "Performing migration."
      cfg.migrate!
    end
  end
end
