Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12N6kA-00085b-00
	for mtd-list@infradead.org; Tue, 22 Feb 2000 04:16:14 +0000
Received: from edison.dialix.com.au ([203.12.2.8] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12N6k7-00085V-00
	for mtd@infradead.org; Tue, 22 Feb 2000 04:16:12 +0000
Message-ID: <38B1FFDE.B9F15101@ctam.com.au>
Date: Tue, 22 Feb 2000 14:17:51 +1100
From: Brendan J Simon <Brendan.Simon@ctam.com.au>
Reply-To: Brendan.Simon@ctam.com.au
MIME-Version: 1.0
To: Whai Lim <wlim@vrcomm.com>
CC: mtd@infradead.org
Subject: Re: PowerPC and DiskOnChip
References: <38B03CE9.4E893ED1@vrcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Whai Lim wrote:

> Hello:
>
> Mr. David Woodhouse suggested that I inquiry about if anyone in your
> group is doing DiskOnChip stuff with PowerPC.
>
> We have a new design using the Motorola MPC860 (PowerPC) processor and
> we also designed in with the DiskOnChip.  What we learned so far was
> that there is not a whole lot of info of how to do it with the PowerPC
> as far as "initial hardware test", "boot loader" and running "Linux".
>
> Our hardware config is as follow:
>
> 1. Motorola MPC860
> 2. boot flash (512K bytes)
> 3. static RAM (2M bytes)
> 4. 1 DIMM socket for PC100 type of SDRAM
> 5. 1 32 pin socket for DiskOnChip (DOC-Millennium or DOC-2000)
>
> We got good info from David as how to "peek and poke" the DiskOnChip for
> hardware interface test and he suggested that we check with you folks
> for some sort of loader for PowerPC. Any suggestions will be greatly
> appreciated.

I can't help you now, but we will going down the same track very shortly (a
month or so).
We will be using the 8260 but may prototype something with our 860 boards.

Let the list know if you come up with anything.

Regards,
Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
