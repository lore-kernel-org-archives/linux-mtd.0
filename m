Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 126bfx-00065W-00
	for mtd-list@infradead.org; Fri, 07 Jan 2000 15:51:41 +0000
Received: from out5.prserv.net ([165.87.194.243] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 126bft-00065J-00
	for mtd@infradead.org; Fri, 07 Jan 2000 15:51:37 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Fri, 7 Jan 2000 17:55:38 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: Hardware RO & delays [DOC2000] 
References: <E126NIB-0005it-00@infradead.org> 
In-reply-to: <E126VUj-0006ne-00@devel2.axiom.internal>
Message-Id: <E126bft-00065J-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


> >  1.  Is there a way to tell the flash (DoC2000) to mark a certain part
> >  of it as read only?  I know I can mount a certain partition as read
> > only, but can I protect it at a lower level?

> Not per partition, but per NFTL. Yes - if you modify nftl.c to register the 
> blockdevice as readonly, then refuse to process any writes to that device, 
> you'll be fine.

What's the difference between per partition and per NFTL?  Do you 
mean that there should be /dev/nftla1 and /dev/nftlb1, as opposed 
to /dev/nftla1 and /dev/nftla2?

Is there a way to tell the flash chip itself not to touch certain areas?

> > 2.  Does the driver block the system?  I'm experience delays in

> Yes, it does all its flash access, even waiting for erases to finish, with 
> interrupts disabled.

Do you know if this is true for M-Systems' driver as well?

Are the interrupts disabled during read operations as well?  Could it 
be that the driver disables the interrupts even if the flash is not 
mounted?

How long does it take it to finish?


---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd. <http://www.lucidvon.com>
Twin Towers 2,     Suite 406,     P.O.Box 159
35 Jabotinsky street, Ramat-Gan 52511, ISRAEL
Tel:+972 3 6137214         Fax:+972 3 6137215


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
