Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JxZq-0002AU-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 13:24:50 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JxZo-0002AN-00
	for mtd@infradead.org; Wed, 02 Aug 2000 13:24:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <11108.965218269@cygnus.co.uk> 
References: <11108.965218269@cygnus.co.uk>  <Pine.LNX.3.96.1000802130539.27452A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Markus Thiesmeyer <mthi@gmx.de>, mtd@infradead.org, jffs-dev@axis.com,
  bmatthews@redhat.com
Subject: Re: Is JFFS a full featured filesystem? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 Aug 2000 13:24:46 +0100
Message-ID: <12414.965219086@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  alex@cendio.se said:
> > All this, and the fact that the missing needed mutex around the
> > writing to the log makes the jffs filesystem quite seriously borked.

> This compiles. Wonder if it works...

Hmmm. I didn't really expect it to work without deadlocking - I expected
there to be some path from jffs_write_node() through jffs_fmalloc() to
jffs_garbage_collect() and hence jffs_rewrite_data() - which would attempt
to obtain the lock for a second time.

In fact, it seems that it does work, because there's no attempt made to
trigger immediate GC if jffs_write_node() finds that there's not enough
space. Am I on crack or is this really the case?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
