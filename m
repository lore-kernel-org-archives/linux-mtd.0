Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDn6s-0002Rt-Jd
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 17:19:34 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: David Daney <ddaney@avtrex.com>
Date: Wed, 14 Apr 2004 18:15:18 +0200
References: <407CC018.3030505@avtrex.com>
	<200404141648.12848.tglx@linutronix.de> <407D550E.8090306@avtrex.com>
In-Reply-To: <407D550E.8090306@avtrex.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404141815.18987.tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd, mtdblock and nand ecc.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 April 2004 17:13, David Daney wrote:
> Let me start by saying that I am not trying to cause problems, but just
> to understand the best options...

I was not saying, that you are causing problems :)

> Thomas Gleixner wrote:
> >On Wednesday 14 April 2004 16:11, David Daney wrote:
> >>>NAND aware filesystem drivers provide their own oobsel structure and use
> >>>the xxx_ecc functions.
> >>
> >>I am using the cramfs on a NAND partition as my root file system.
> >>cramfs is not NAND aware, and I cannot be running userspace programs
> >>before mounting as it is the root file system.
> >
> >I know, but why must you use cramfs ? Why dont you use jffs2 or yaffs as
> > your root fs. Mount it r/o, so you have no hassle at all.
>
> With my NAND drivers, booting the linux kernel and mounting a minimal
> root file system on a 16MB flash takes 1:08 for yaffs and 1:25 for
> jffs2.  Using cramfs it boots in under 0:10.

He ? 1 minute ? Where is the time spent ?
Thats totaly out of the usual time. My boot time with JFFS2 is well below 30s 
on an ARM7. I have no YAFFS root fs handy, but it is much faster.

The solution is checking where the time is lost and fixing it.

> That is why I am thinking about using a non NAND aware file system for
> things that can be read-only.

But this does not answer my question how you want to deal with bad blocks ?

> >
> >mtdblock is a block device driver and only provides an interface. It must
> > not be aware of anything.
>
> That is not quite correct.  mtdblock is well aware of the mtd backend.
> It does this:
>     ret = MTD_WRITE (mtd, pos, len, &retlen, buf);

Yes, thats a wrapper nothing else. The wrapper is not aware of anything else 
than the MTD API itself. It does not care of FLASH types. And it will not 
care of FLASH types. There are a bunch of new FLASH types in the pipeline. 
Each of them has seperate problems. They have to be handled in the driver, 
nowhere else.

> All I am suggesting is to have it do MTD_WRITE_ECC when possible.

The nand driver provides a mechanism for using ecc without calling the _ecc 
functions already.
Provide a valid oobsel structure in your hardware driver. Place it into 
mtd->oobinfo. Then the nand driver uses this when reading from the chip
even when it is called by the non ecc functions. 
Thats the way we provide ecc to userspace too. As the user must be able to 
select an ecc / oob scheme for the partiton he wants to access.
see utils/nandwrite.c

I'm reworking the driver at the moment. It will have a builtin default ecc 
scheme then.

> >Using NAND unaware filesystems on NAND is nothing we want to support.
> >ECC is only one part of NAND support. What about bad blocks? NAND chips
> > can have bad blocks, even when they are new. Only block 0 is guaranteed
> > to be not bad at delivery time. How want you deal with a board, where a
> > bad block is in the partition which is reserved for your cramfs ?
> >
> >We have two reliable working NAND aware filesystems around. I don't see
> > any reason to provide support for predictable trouble.
>
> You already support it.  /dev/mtd and /dev/mtdblock work off-the-shelf
> with NAND devices and allow arbitrary programs/filesystems to overwrite
> bad blocks if they choose.

No, bad blocks are protected in the nand driver itself. Try to erase a bad 
block.

We _cannot_ hold anybody off to use it with any driver, userspace app which is 
able to access /dev/mtdxxxx. Then we would lock out the NAND aware fs too :)

You can also write nonsense to your harddisk. There is no real limitation. 

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
