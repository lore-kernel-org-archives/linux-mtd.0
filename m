Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13A9sO-0005xu-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 12:31:28 +0100
Message-ID: <396460AB.9BEC2657@crossnet.co.jp>
Date: Thu, 06 Jul 2000 19:34:19 +0900
From: Masami Komiya <mkomiya@crossnet.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: Fujitsu MBM29LV160
References: <Pine.LNX.4.21.0007050937500.1226-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I will try to make cfi_cmdset_0002. After making it,
I want to use FTL and JFFS for our system.
These filesystems can be used on AMD's flash chips?

Our system has two interleaved flash in 32 bit mode.
So I want to implement only 32bit read & write
routines instead of 16 bit if it is allowed.
FTL or JFFS require 16bit read & write routines ?

Best Regards.

Masami Komiya


David Woodhouse wrote:
> 
> On Wed, 5 Jul 2000, Masami Komiya wrote:
> 
> >
> > It is CFI-compliant. May be, the command set is the different from
> > Intel's.
> >
> > The messages from kernel are:
> >
> > NORA: Found a coupled pair of CFI devices at location 0 in 16 bit mode
> > Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
> 
> Excellent.
> 
> > Number of Erase Block Regions: 4
> >   Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
> >   Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
> >   Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
> >   Erase Region #3: BlockSize 0x10000 bytes, 31 blocks
> 
> > Should I make cfi_cmdset_0002? Is there the another resources ?
> 
> Yes, you need to make cfi_cmdset_0002 for that particular
> configuration (2x16bit). It should be quite simple t copy cfi_cmdset_0001
> and modify it accordingly - not only changing the command set used
> but also changing it to drive two interleaved chips at once. You'll need
> the AMD data sheets for those chips.
> 
> For now, I'd suggest that you combine all the smaller erase blocks at the
> beginning of the device, and pretend that the erase size is always 0x10000
> (actually 0x20000 because you have two chips interleaved).  Then when you
> receive an erase request at location zero, erase all the smaller blocks at
> once.
> 
> We'll work out how to handle that properly, but not quite yet. Probably
> the cfi_probe routine needs to be able to return more than one MTD device.
> 
> --
> dwmw2


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
