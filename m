Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Fb2Y-000513-00
	for mtd-list@infradead.org; Tue, 01 Feb 2000 11:00:10 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Fb2W-00050x-00
	for mtd@infradead.org; Tue, 01 Feb 2000 11:00:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3895150F.FF7593@psychosis.com> 
References: <3895150F.FF7593@psychosis.com>  <s8945d85.023@fs-rafte-01.rafte.com> 
To: dcinege@psychosis.com
Cc: Steve Bondy <srb@rafte.com>, linux-router@linuxrouter.org,
    mtd@infradead.org
Subject: Re: [LRP] DiskOnChip Kernel Panic 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Feb 2000 11:00:07 +0000
Message-Id: <E12Fb2V-0007gn-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dcinege@psychosis.com said:
>  I have a version of the 2.2.14 LRP kernel with DOC support that I had
> to make for a client. I won't distribute it because M-Systems will not
> release source for the driver, because of a ridiculous reason.

Just to confirm/clarify:

I have stable read-only support for the DiskOnChip 2000, with GPL source, in
the current MTD code.

I also have write support, which I've been bashing on and can't find any
serious problems. There have been some bugs reported, but I haven't been able
to reproduce them. 

If you format the device with my own nftl_format program, it seems to be
reliable. However, I want it to get more widespread testing before I release it
properly and claim it's stable - and I have some performance issues to sort out
too. I know what needs to be done, but I'm extremely busy on other stuff at the
moment.

> When they release source, I'll start including full DoC support in the
> LRP kernel and the base system.

I don't know why they don't just release their source - but I have complete
documentation on the device and the NFTL format, and that's good enough for me.
All I need now is the time to get the code completed. And I expect that to
happen within 4-5 weeks, barring unforeseen developments at this end.

For reference, here's an approximation of my MTD / DiskOnChip-related TODO list.

	- 1. Get Linus to take the MTD code into 2.3.42^H3
		"drivers that dont affect infrastructure are never too late"

	- 2. Add readonly DiskOnChip support to Grub. We can already load
		Grub from a DiskOnChip, but under Grub can then load the
		kernel off the DiskOnChip, that's a bit pointless.

	- 3. Improve performance of the NFTL code. Fix SMP issues while
		I'm at it.

	- 4. Fix handling of media errors and power loss in NFTL.
		I suspect this is the cause of most of the existing 'bugs'

	- 5. Add DiskOnChip Millennium support.

	- 6. Redo the FTL code, starting again from David Hinds'
		ftl_cs.c

	- 7. Add an MTD driver for PCMCIA memory cards.

Of these, #5 is the only one that can't easily be done without access to the
documentation. Even #3 and #4 should be obvious enough - the code makes the
NFTL format plain enough to get it right.

Likewise #2 - readonly NFTL support is fairly trivial to do.

#1 is in progress, but the more testing the code gets the better my chances
are. Please test it and report your results to mtd@infradead.org

#6 and #7 are something anyone can do. I don't even have any NOR flash
hardware to test it with.

As I said, I'm going to be very busy with other things until the end of the 
month - but there's nothing to stop anyone else helping out.

Contact me if you're serious about helping out - I can let you have an 
account on the CVS server, and possibly even access to the NFTL specs.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
