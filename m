Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDoNS-0003IZ-31
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 18:40:46 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: David Daney <ddaney@avtrex.com>
Date: Wed, 14 Apr 2004 19:36:32 +0200
References: <407CC018.3030505@avtrex.com>
	<200404141815.18987.tglx@linutronix.de> <407D6BB6.6090504@avtrex.com>
In-Reply-To: <407D6BB6.6090504@avtrex.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404141936.32655.tglx@linutronix.de>
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

On Wednesday 14 April 2004 18:49, David Daney wrote:
> >
> >He ? 1 minute ? Where is the time spent ?
> How should I know?

Profiling :)

> >Thats totaly out of the usual time. My boot time with JFFS2 is well below
> > 30s on an ARM7. I have no YAFFS root fs handy, but it is much faster.
> >
> >The solution is checking where the time is lost and fixing it.
>
> I have a custom nand driver (based on nand.c, but adapted to a non
> standard nand physical interface) that uses software ECC.  On a 300 MHz
> mips32 cpu.

Why did you modify nand.c ? 
Almost everything in nand.c can be overridden by the board driver. Therefor we 
call all the functions through chip->xxx().

> When ever jffs2 or yaffs are mounted, they both seem to read many
> pages.  Perhaps the ECC overhead of reading all that data.
> I suppose I could turn off ECC and see how fast it is...

Sure, that would give an estimation.

> >>That is why I am thinking about using a non NAND aware file system for
> >>things that can be read-only.
> >
> >But this does not answer my question how you want to deal with bad blocks
> > ?
>
> I want a file system very much like cramfs, but that can have holes in
> it so that it works on NAND.
> When mounted it would start scanning blocks starting from the beginning
> of the NAND partition until it found a valid superblock (or what ever
> you would call it).  Then it would be done because all of the indexes
> would be built to work around the bad blocks.  Since this filesystem
> would be read-only with a static structure, you would never have to read
> more than necessary.

OK, so you are going to write a fs driver, which is NAND aware and behaves 
similar to cramfs. 
Whatfor then the discussion about making mtdblock nand aware ?
If you write a nand aware fs then you just call the appropriate functions. 
This fs will be specific for nand or selectable for nand, so what ?
No need to touch anything in mtdblock.c

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
