Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BKbp-0006Kx-00
	for mtd-list@infradead.org; Sun, 09 Jul 2000 18:11:13 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13BKbn-0006Kr-00
	for mtd@infradead.org; Sun, 09 Jul 2000 18:11:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3965E670.79F93BEB@matrox.com> 
References: <3965E670.79F93BEB@matrox.com>  <Pine.LNX.3.96.1000706153526.15928A-100000@biffen.cendio.se> 
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
Cc: Alexander Larsson <alex@cendio.se>, Bjorn Wesen <bjorn.wesen@axis.com>,
  jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 09 Jul 2000 18:11:03 +0100
Message-ID: <10755.963162663@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


scote1@Matrox.COM said:
> I don't think JFFS is ready to be included in the kernel.  It hasn't
> been tested a lot (the 2.2 and 2.4 ports) and I'm sure we'll find many
> bugs (the invalidate_inode_pages bug is a good example of a huge bug
> that we almost missed).  Just today, I untarred the source code of a
> program on a JFFS partition, tried to compile it and got a read error
> from jffs_readpage().  

It wasn't really my intention to send it in - it was in the tarball I sent 
to Linus out of habit because I've been doing it every time I've released 
one for some time - I'm amazed that he actually took it.

But now it's in, it does seem to have attracted some attention, and with it 
at least one bug fix so far - which can only really be a good thing. 

It's marked with CONfIG_EXPERIMENTAL, and as soon as I submit the Documentation
patch which I've always promised "after the code gets merged" it'll be even 
more clearly documented as such.

I'm of the opinion that it might as well stay there now that it's in -
although it's really up to Axis to decide as it's their baby.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
