Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eIyU-0004jq-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 18:27:26 +0100
Received: from t-online.de (patcha.ada.t-online.de [172.30.2.101])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with ESMTP id <0H0Q00GSYR4T4Y@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 12 Aug 2002 19:26:53 +0200 (MEST)
Date: Mon, 12 Aug 2002 19:26:53 +0200
From: tglx@linutronix.de
Subject: Aw: Re: Hardware ECC in NAND flash driver
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <34a9835a72.35a7234a98@t-online.de>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: de
Content-transfer-encoding: 7BIT
Content-disposition: inline
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

Steven Hein <ssh@sgi.com> wrote:
> This all looks great!
:):):) 

> Sounds good.
:):):) 

> > The funtion, which does correct_data calculations for the specfic
> > hardware ecc should be implemented as a general function in 
> nand_ecc.c> to make it usable for similar hardware drivers and to 
> avoid duplicated
> > code in these drivers.
> 
> Dumb question--is ECC calculation "generic" enough to be 
> applicable from
> one hardware ECC generator to the next, even if they do the same 
> numberof ECC bytes for the same block size?  Is it very likely 
> that the
> algorithm
> is actually going to be the same between platforms?
I think so, because  Samsung and others will bring up similar chips, 
which 
incorporate the same ECC generator, but with maybe different registers 
or
opcodes. But the algorithm will be the same for interdevice compability. 
So
IMHO it's correct to put it in the generic nand_ecc code.
 
> THANKS for adding this!!  I'll try it today/tomorrow.
I'm curious, how many bugs you will detect. :)
 
> Another question--how do you typically handle adding new HW drivers
> to the NAND flash code?  I know that in my case, the HW implementation
> uses access to specific S3C2410 processor registers, and those
> register definitions live in include/asm-arm/arch-s3c2410 directory
> in the Linux kernel tree.  I would expect that these arch-specific
> files would not live in the MTD tree.  Let me know--I'd like to get
> this HW driver incorporated into the standard tree as soon as I
> get it working!

That's easy, you include <asm/hardware.h> and you should be done. When 
your
driver is ready, let me know. I will take care for incorporation.
 
Thomas
