Kublai - BTCChina API Wrapper
======

What
==========
Kublai is a lightweight API Wrapper for BTCChina written in Ruby.

The API is a lot more basic than MtGox's. Even so not all API methods are implemented currently in Kublai. However, you can add in more like this:

JSON Request
	{"method":"requestWithdrawal","params":["BTC",0.1],"id":1}

	def request_withdrawal(amount)
	  amount = amount.to_f.round(8)
	  post_data = {}
	  post_data['tonce']  = (Time.now.to_f * 1000000).to_i.to_s
	  post_data['method']='requestWithdrawal'
	  post_data['params']=['BTC', amount]
	  request(post_data)
	end

Why
==========
Python, Java, PHP and C++ all have documented wrappers on the BTCChina site. Ruby is not well supported at this time this is an effort to chage that.

http://btcchina.org/api-trade-documentation-en

How
==========

	 require_relative 'Kublai/kublai'
	 access_key = "20c0bc14-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
	 secret_key = "66d218e5-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
	 kublai = Kublai.new(access_key, secret_key )
	 kublai.get_account_info

When
==========
This has not been tested thoughly so if you have any problems submit an issue.

Still a work in progress. Pull requests are appreciated. 

Working as of 2013-12-01 with btcchina.com Trade API v1.1

Who
==========
Lewis Clayton mail@l.ew.is

Licence
==========

MIT License

