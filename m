Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ABpY-0006Me-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 14:36:40 +0100
Date: Thu, 6 Jul 2000 15:36:33 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: Bjorn Wesen <bjorn.wesen@axis.com>,
        =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>,
        jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000 
In-Reply-To: <488.962889192@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000706153526.15928A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Thu, 6 Jul 2000, David Woodhouse wrote:

> 
> bjorn.wesen@axis.com said:
> >  We'll probably leave the 2.0 as it is, and when we switch to 2.4
> > we'll either use mtd or just keep going with our own little flash.c
> > (which works fine :)
> 
> It looks like 2.4 will have the MTD code in it already - Linus included 
> Tuesday's snapshot in 2.4.0-test3-pre4.

Ouch, it's got jffs too. The invalidate_inode_pages(inode) patch should
really be applied to it. I haven't had time to test it, but it's almost
certainly correct, and it is broken without it.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
