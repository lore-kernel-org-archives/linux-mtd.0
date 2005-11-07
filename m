Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZCfO-0006RR-61
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 14:28:41 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Nov 2005 08:26:30 +1300
References: <200511071915.03263.tglx@linutronix.de>
In-Reply-To: <200511071915.03263.tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511080826.30601.manningc2@actrix.gen.nz>
Cc: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas

As an "mtd user outside of mtd" I have an opinion on the nand stuff.

On Tuesday 08 November 2005 07:15, Thomas Gleixner wrote:
> Hi folks,
>
> I've updated the mtd git repository hopefully in time for 2.6.15.
>
> http://www.kernel.org/git/?p=linux/kernel/git/tglx/mtd-2.6.git;a=summary
>
> 	tglx
>
> Following changes are not included into the update:
>
> - [JFFS2]  Erase Block Header(EBH)
> 	Needs proper testing and stabilizing first
>
> - [MTD] NAND: OOB changes
> 	Needs more thoughts. I'm particularly unhappy with the introduction of new
> functions and the still pending problem of the automatic
> placement/retrieval of oob data. The change should subsume and/or extend
> the oob_info
> functionality rather than introducing a parallel solution.

There are two parts to this, I think:
1) The client (ie fs) side: 
More and more I think that the client should just call read_ecc etc with null 
data params in the spirit of my semi-patch proposal. This is pretty straight 
forward and obvious as to what is intended. read_oob is ambiguous. I expect 
that with time all fs/clients will move all oob handling to AUTOPLACE because 
it is too messy having oob_sel hanging through the interface. ( I know I have 
small intestines, I want to have small intestines, but I don't want to see 
them). From an OS perspective (ie outside of mtd), getting a simple interface 
that is well defined and will be consistent over time is pretty important.

2) I think that oob_info-driven nand_base has got about as complex as it can - 
perhaps gone too far. You cannot handle all possible cases with nand_base 
anyway(eg. dma-based solutions). If you try, then do too many things with the 
same code you end up with so many ifs and branches that performance goes to 
hell, as well as very convoluted code where bugs can hide with ease. I agree 
therefore that using functions to replace functionality is a better idea. It 
is perhaps time for a bit of modularity too.


>
> - [MTD] NAND: nandsim
> 	There is still the big Kconfig clutter. For testing environments it _is_
> sufficient to provide all this information as module parameters. No need to
> bloat the config file

Agree. At present nandsim is quite a chore to configure and doing this through 
Kconfig is almost pointless.

As an example, I recently created a bogus 32MB 2k page device.  I did not want 
to go much bigger for various reasons. I thus had to create a bogus nand_id 
first and then set up the Kconfig Id bytes to match.

>
> - [MTD] ONENAND: Simulator
> 	Is depending on arch/??? probably ARM and uses some obscure __iomem*
> constructs.
>
> Can the authors please shed some light on the status of following drivers:
>
> - [MTD] maps mphysram.c
> 	It needs a bunch of coding style cleanups.
>
> - [MTD] devices ramtd.c
> 	Needs probably a go on the fixed size allocation already marked with
> 	/* FIXME */
>
> - [MTD] ssfdc.c
> 	AFAIK the driver is mostly functional. What's missing ?
> 	It needs a bunch of coding style cleanups.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
