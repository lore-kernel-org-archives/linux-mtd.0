Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H1X4-0007jq-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 11:01:50 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H1X1-0007jk-00
	for mtd@infradead.org; Tue, 25 Jul 2000 11:01:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0007251137360.17368-100000@vvv.axis.se> 
References: <Pine.LNX.4.21.0007251137360.17368-100000@vvv.axis.se> 
To: Finn Hakansson <finn@axis.com>
Cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
  "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 11:01:40 +0100
Message-ID: <3583.964519300@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


finn@axis.com said:
>  I cannot understand that. How much time are we talking about? How
> large is the flash? How long does an erase take? One garbage collect
> cannot consume more time than (sectors on flash * number of sectors)
> time I think. 

After making a few copies of /usr and /lib, then deleting them, I saw it
take an hour and a half with a 16Mb flash which was about half-full.

Now I've implemented buffer writes on chips which support it, that should be
down to ten minutes. I'm sure the verbose logging over the serial port
doesn't help :)

But it's still done in process context, and writes of new nodes have to 
wait while it's happening. Shifting that into its own kernel thread would 
be nice, and would also allow us to merge writes. 

I'm far more concerned by the thing getting corrupted when I abruptly 
remove power - I'm about to see if I can reproduce it with the patches you 
committed just before I left - do you have any ideas from the log I posted 
on the 17th of July?



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
