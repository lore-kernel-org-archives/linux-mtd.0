Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 125dzT-0004dH-00
	for mtd-list@infradead.org; Wed, 05 Jan 2000 00:07:51 +0000
Received: from ctam160.prophecy.com.au
	([203.21.127.160] helo=k9.prophecy.com.au ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 125dzP-0004dB-00
	for mtd@infradead.org; Wed, 05 Jan 2000 00:07:48 +0000
Received: from ctam.com.au (brendan@localhost [127.0.0.1])
	by k9.prophecy.com.au (8.8.7/8.8.7) with ESMTP id KAA03613
	for <mtd@infradead.org>; Wed, 5 Jan 2000 10:16:49 +1100
Message-ID: <38727F5D.73445B90@ctam.com.au>
Date: Wed, 05 Jan 2000 10:16:45 +1100
From: Brendan J Simon <Brendan.Simon@ctam.com.au>
Reply-To: Brendan.Simon@ctam.com.au
MIME-Version: 1.0
CC: linux-mtd <mtd@infradead.org>
Subject: Re: DiskOnChip for PowerPC embedded system.
References: <38719CC6.93FB5729@ctam.com.au> <E125Qft-0007VY-00@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> > 2) Can I use the firmware/ROM space to put own bootloader code ?  How
> > big is it ?
>
> 48K by default IIRC. You can use that as a first stage and load more though.

I just noticed something.  48KB of linear ROM space would require a minimum of
16 address lines.  As far as I can see, the DOC2000 only has 13 address lines
(ie. 8KB address space).  I'm a bit confused here.

How does the DOC distinguish between accesses to the linear ROM and accesses to
the NAND-Flash ?

Thanks,
Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
