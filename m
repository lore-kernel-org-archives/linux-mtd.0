Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Sdb7-0000r4-00
	for mtd-list@infradead.org; Wed, 08 Mar 2000 10:21:45 +0000
Date: Wed, 8 Mar 2000 11:21:41 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtd comments 
In-Reply-To: <2182.952510532@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000308111850.14858A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 8 Mar 2000, David Woodhouse wrote:

> 
> alex@cendio.se said:
> >  .
> > This is mainly used as a bootsector type of thing. The idea seems to
> > be that if your boot-code is a lot less than 64k you don't waste so
> > much space. And you can also store configuration data in one of the
> > smaller sectors, and rewrite it without destroying the boot sector. 
> 
> Options include...
> 
> 1. Ignore the smaller erasesize - pretend it's 64Kb and force you to erase the 
> whole lot at once.
> 
> 2. Treat the parts with different erasesize as different logical devices as 
> far as the MTD layer is concerned.
> 
> 3. Change the MTD interface so it can handle variable sector sizes somehow.
> 
> As you seem to be implying that the parts with different sector sizes are used 
> for a different purpose than the majority of the flash device, I'm inclined 
> to favour #2 for now.

Yes, i agree. Sometimes #1 might be a good idea too, it really depends on
how the flash is used. But we basically ignore this issue and let the user
make sure that their MTD devices look like constant size sectors.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
