Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H5v9-0000Nk-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 15:42:59 +0100
Received: from [216.84.103.11] (helo=coolexchange.coollogic.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H5v8-0000Nd-00
	for mtd@infradead.org; Tue, 25 Jul 2000 15:42:58 +0100
Message-ID: <397DA945.60FED4FA@coollogic.com>
Date: Tue, 25 Jul 2000 14:50:45 +0000
From: Ian Thompson <ithompson@coollogic.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: 64M DOC2000
References: <397DA681.1DBEC4DA@coollogic.com> <2943.964535514@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The part is recognised by the mtd driver with 2.4.0.
I can partition it with fdisk /dev/nftl and create 
ext2 disks. 
However, when I try to copy data to it I start getting input/output
errors after I've got a certain amount of data (yet to be determined)
on it.

Ian T.

David Woodhouse wrote:
> 
> ithompson@coollogic.com said:
> > I've just tried a 64M Doc2000 with kernel 2.2.16 and the IGEL driver,
> > and it is not recognised. I have no problems with 16M and 32M parts.
> > Can someone on the list confirm that this is the case?
> 
> No clue. Try it with the free driver and see what happens.
> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
