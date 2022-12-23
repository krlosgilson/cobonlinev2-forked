# Reload environment variables
source /home/admin/cobonline.env

#Stop the Server
kill -INT $(cat tmp/pids/server.pid)

#Pull changes from repository
git pull

#Bundle
bundle check || bundle install

#Apply migrations
rails db:migrate

#Assets tasks
rails assets:clobber
rails assets:precompile

#Start the Server
rails s -b 0.0.0.0 -d
