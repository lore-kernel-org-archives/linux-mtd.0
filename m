Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Jzgn-0002j8-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 15:40:09 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Jzgm-0002j2-00
	for mtd@infradead.org; Wed, 02 Aug 2000 15:40:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000802154249.31703A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000802154249.31703A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
  bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Aug 2000 15:20:04 +0100
Message-ID: <24735.965226004@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  Exactly how did you plan to work out the dirty ranges? Compare with
> on-flash contents? 

Apparently it's easy when using generic_file_write, because prepare_write 
will give you the exact range. 

When doing writable mmap() we have to do something cleverer - basically yes,
comparing with the on-flash contents. We can either do that by going and
reading the flash nodes again on writepage(), or we can keep a copy of the 
clean page in RAM before it's dirtied. 

To start with, I'm inclined just to accept the hit of the 4Kb writes, and 
let the GC combine nodes later as necessary. Comparing with old contents 
can come later. This is only going to be a problem with writable mmap(), 
which isn't supported at the moment _anyway_. The normal write() case is 
fairly simple to optimise.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
