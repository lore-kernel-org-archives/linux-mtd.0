Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JyxC-0002UG-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 14:53:02 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Jyx7-0002UA-00
	for mtd@infradead.org; Wed, 02 Aug 2000 14:53:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000802154249.31703A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000802154249.31703A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
  bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Aug 2000 14:52:45 +0100
Message-ID: <22134.965224365@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> What about the log-ordering constraints? That kinda voids any write
> caching at all.

Not really. It's not that difficult, you just need a warped mind. (Mine 
isn't currently warped _enough_, but I'm learning fast :)

> It could possibly be solved using a kernel thread that
> does all the flash writing (in a serialized fashion), 

yesyesyes

> but the caching problems get a lot harder then.

Not _so_ hard that it isn't worth doing, IMHO.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
