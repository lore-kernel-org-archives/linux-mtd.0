Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ABSv-0006J3-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 14:13:17 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ABSu-0006Ix-00
	for mtd@infradead.org; Thu, 06 Jul 2000 14:13:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000706132924.20701C-100000@fafner.axis.se> 
References: <Pine.LNX.3.96.1000706132924.20701C-100000@fafner.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>,
  jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 14:13:12 +0100
Message-ID: <488.962889192@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  We'll probably leave the 2.0 as it is, and when we switch to 2.4
> we'll either use mtd or just keep going with our own little flash.c
> (which works fine :)

It looks like 2.4 will have the MTD code in it already - Linus included 
Tuesday's snapshot in 2.4.0-test3-pre4.

/me digs into a trench and waits for the bug reports and support questions 
to roll in :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
