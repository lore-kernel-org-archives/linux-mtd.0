Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDlku-0001f2-2O
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 15:52:48 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: David Daney <ddaney@avtrex.com>
Date: Wed, 14 Apr 2004 16:48:12 +0200
References: <407CC018.3030505@avtrex.com>
	<200404141443.56257.tglx@linutronix.de> <407D46AD.4000801@avtrex.com>
In-Reply-To: <407D46AD.4000801@avtrex.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404141648.12848.tglx@linutronix.de>
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

On Wednesday 14 April 2004 16:11, David Daney wrote:

> >NAND aware filesystem drivers provide their own oobsel structure and use
> > the xxx_ecc functions.
>
> I am using the cramfs on a NAND partition as my root file system.
> cramfs is not NAND aware, and I cannot be running userspace programs
> before mounting as it is the root file system.

I know, but why must you use cramfs ? Why dont you use jffs2 or yaffs as your 
root fs. Mount it r/o, so you have no hassle at all.

> I have not completely educated myself on the mtdblock driver.  Since the
> mtdblock driver can be used by non-mtd-aware filesystems, I am proposing
> making mtdblock NAND aware so that it uses the xxx_ecc functions iff ECC
> is available.  Perhaps there would be a kernel/module command line
> switch to help manage the behavior.
>
> Thoughts?

mtdblock is a block device driver and only provides an interface. It must not 
be aware of anything. 
Using NAND unaware filesystems on NAND is nothing we want to support.
ECC is only one part of NAND support. What about bad blocks? NAND chips can 
have bad blocks, even when they are new. Only block 0 is guaranteed to be not 
bad at delivery time. How want you deal with a board, where a bad block is in 
the partition which is reserved for your cramfs ?

We have two reliable working NAND aware filesystems around. I don't see any 
reason to provide support for predictable trouble. 

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
