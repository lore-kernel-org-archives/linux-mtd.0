Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19A3Tn-0003q4-8q
	for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2003 08:55:15 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE100GF6NBJGQ@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 28 Apr 2003 09:54:56 +0200 (MEST)
Date: Mon, 28 Apr 2003 10:54:22 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3EA7C8DE.8333.56C7F7@localhost>
To: simon@baydel.com, linux-mtd@lists.infradead.org
Message-id: <200304281054.22160.tglx@linutronix.de>
MIME-version: 1.0
References: <3EA7C8DE.8333.56C7F7@localhost>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: NAND and JFFS2 crash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 April 2003 12:22, simon@baydel.com wrote:
> Last week I downloaded a new CVS tree. I create my SMC data by
> booting the system off a hard disk running Linux. I first use dd to
> copy the hard disk boot partition to the SMC. I noticed all these
> messages basically saying writing NAND witout ECC was a bad
> idea. In my NAND specific driver I set up the mtd_info structure for
> soft ecc. However there appears to be a new field useecc which
> only appears to be used by jffs2. I did not know what I was
> expected to do here so I modified my driver to set this and the
> associated bit positions. Beacuse I use partitions I had to modify
> mtdpart to copy this information to the mtd_info structure which is
> set up on a partition basis. Now I could boot from the hard disk and
>  copy my boot disk to the SMC with no problem. I then erased and
> created a new JFFS2 filesystem, on another partition, and copied
> all the files for the root filesystem.

As I mentioned before and as documented in the nand docs, either use 
bootloader or use nandwrite.c to write a fs-image with ecc. There is no need 
to hack around.

> I then booted from the smc and although I got a few
> Empty flash at 0x00469ffcb ends at 0x0046a000
> messages all seemed ok. The root file system was mounted and I
> got the login prompt. However when I started to log in I got a crash.
> kernel BUG at gc.c:140!

I have a binary image now to check this. Will post info, if I have solved the 
problem.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
