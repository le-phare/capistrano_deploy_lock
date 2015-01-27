before "deploy:starting",    "deploy:check_lock"
before "deploy:starting",    "deploy:refresh_lock"
before "deploy:starting",    "deploy:create_lock"
after  "deploy:finishing",   "deploy:unlock"
after  "deploy:rollback",    "deploy:unlock"

# Default lock expiry of 10 minutes (in case deploy crashes or is interrupted)
_cset :default_lock_expiry, (10 * 60)
_cset(:deploy_lockfile) { "#{shared_path}/capistrano.lock.yml" }

# Show lock message as bright red
log_formatter(:match => /was locked/, :color => :red, :style => :bright, :priority => 20)
