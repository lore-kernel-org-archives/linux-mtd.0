Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vooW-00050m-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 21:39:56 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vooU-00050g-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 21:39:54 +0000
Message-ID: <384ED079.B3762EBD@danielind.com>
Date: Wed, 08 Dec 1999 15:41:13 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: [Fwd: power down]]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> vmalik@danielind.com said:
> >  <desperate plea> Come on guys (and gals). Am I championing a lost
> > cause here? Have we given up on power down reliability of nonvolatile
> > data in embedded systems under Linux?
> 
> Power down reliability of such data is an absolute must.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
THANK YOU, THANK YOU, THANK YOU!!!!

> I expect embedded
> systems using NFTL and ext3 to be absolutely reliable even if the plug is
> pulled half-way through a write.
> 
> This means we end up with two separate journalling / logging mechanisms - one
> at the block device level (ext3) and one at the flash media level (NFTL). As I
> said - ideally, we ditch that in the end and have a journalling/log-structured
> filesystem directly on the flash media.
> 
> > Is anyone interested in this!? Lurkers please respond. How many people
> > read this list anyway? </desperate plea>
> 
> infradead /var/lib/majordomo/lists $ wc -l mtd
>      64 mtd

Thanks. I guess that means that 64 people receive this list.

> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
