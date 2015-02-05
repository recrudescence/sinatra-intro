# the env variable DATABASE_URL should be formatted as such:
#  => postgres://{user}:{password}@{host}/path

configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

	ActiveRecord::Base.establish_connection(
		:adapter	=> db.scheme == 'postgres' ? 'postgresql' : db.scheme,
		:host		=> db.host,
		:username	=> db.user,
		:password	=> db.password,
		:database	=> db.path[1..-1],
		:encoding	=> 'utf8'
	)
end
