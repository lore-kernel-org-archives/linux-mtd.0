Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eN44-00059Q-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 22:49:28 +0100
Message-ID: <3D582D5B.A18054F@sgi.com>
Date: Mon, 12 Aug 2002 16:49:15 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: tglx@linutronix.de
CC: linux-mtd@lists.infradead.org
Subject: Re: Aw: Re: Hardware ECC in NAND flash driver
References: <34a9835a72.35a7234a98@t-online.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

tglx@linutronix.de wrote:
> >
> > Dumb question--is ECC calculation "generic" enough to be
> > applicable from
> > one hardware ECC generator to the next, even if they do the same
> > numberof ECC bytes for the same block size?  Is it very likely
> > that the
> > algorithm
> > is actually going to be the same between platforms?
> I think so, because  Samsung and others will bring up similar chips,
> which
> incorporate the same ECC generator, but with maybe different registers
> or
> opcodes. But the algorithm will be the same for interdevice compability.
> So
> IMHO it's correct to put it in the generic nand_ecc code.
> 

Sounds fine with me!

Any preference on how the correct_data function should be named
(the one I should add to nand_ecc.c)?  Let me know what you'd prefer
and I'll use that name from the start.

> > THANKS for adding this!!  I'll try it today/tomorrow.
> I'm curious, how many bugs you will detect. :)
> 

The final tally is.......ZERO!!  I tried it and it worked great.
Thanks again!


> > Another question--how do you typically handle adding new HW drivers
> > to the NAND flash code?  I know that in my case, the HW implementation
> > uses access to specific S3C2410 processor registers, and those
> > register definitions live in include/asm-arm/arch-s3c2410 directory
> > in the Linux kernel tree.  I would expect that these arch-specific
> > files would not live in the MTD tree.  Let me know--I'd like to get
> > this HW driver incorporated into the standard tree as soon as I
> > get it working!
> 
> That's easy, you include <asm/hardware.h> and you should be done. When
> your
> driver is ready, let me know. I will take care for incorporation.
> 
I'll let you know when I have it done  (I'm working with a Samsung
employee on the 2410 port; when we get it cleaned up I'll
send it to you).


Steve



-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
