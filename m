Received: from gate.epygi.de ([212.126.211.241])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX1sH-0006qu-H2
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 13:28:19 -0500
Received: from sally.epygi.de (imap [10.20.0.18])
	by gate.epygi.de (8.12.9/8.12.9) with ESMTP id iAOISEDV008749
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2004 19:28:14 +0100 (MET)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 24 Nov 2004 19:28:14 +0100
Message-ID: <NGENJJFPMHGLPILEKKAMAEAGCFAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <NGENJJFPMHGLPILEKKAMMEAFCFAA.Stephan.Linke@epygi.de>
Subject: RE: using multile partitions on one NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Stephan Linke [mailto:Stephan.Linke@epygi.de]
> Sent: Mittwoch, 24. November 2004 19:13
> To: tglx@linutronix.de
> Subject: RE: using multile partitions on one NAND chip
> 
> 
> Hi Thomas,
> 
> already noticed the spinlocks; thanks anyway.
> 
> On erase the chip is locked in nand_get_chip() and stays locked until 
> the ERASE2
> command has been send to the chip to wait for the ready status the chip gets
> unlcoked since the nand_wait() also tries to lock the chip. 
> Additinaly nand_wait() unlocks the chip befor calling yield().
> If another task tries nand_get_chip() at this verry moment the erase will be
> interrupted by sending an RESET command. Looks like this is by 
> intention since the erase of the blockis restarted after the 
> nand_wait() returns.
> (I'm not shure if a 3rd task could start an ERASE command - after the 
> 2nd task has interrupted the 1st on - before the first nand_wait() 
> returns. This could mislead the first task.)
> 
> My real problem is this one:
> Our NAND-chips use to keep the buisy line active "for ever" when the 
> RESET command is issued at the wrong point of time. A chip in that 
> condition requires a power-on reset to reactivate the chip. Which 
> makes it a verry critical condition to us. :)
> At the moment I am fixing this problem by causing our local copy of 
> nand_command() (in maps/) to wait for the ready bit of the NAND-chip 
> (except for the STATUS commands).
> 
> To be more specific: If the RESET is issued when the ERASE is almost 
> finished a deadlock of the chips state is verry likely.
> 
> As far as I know the RESET should not do any harm to the chip by 
> definition. But unfortunately it does. :-(
> 
> Stephan
> 
> 
> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org
> > [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Thomas
> > Gleixner
> > Sent: Mittwoch, 24. November 2004 17:29
> > To: Stephan Linke
> > Cc: Linux-Mtd
> > Subject: Re: using multile partitions on one NAND chip
> > 
> > 
> > On Wed, 2004-11-24 at 15:40 +0100, Stephan Linke wrote:
> > > Hi,
> > 
> > Please fix your mail client, to 80 characters per line.
> > Read http://david.woodhou.se/email.html
> > 
> > > anyone tried using multiple partitions on a NAND flash?
> > 
> > Ever looked into the various drivers in drivers/mtd/nand ?
> > 
> > > I can't find the protection mechanism that protects lets
> > > say an erase on one block against a read command on the
> > > other block.
> > 
> > nand_get_chip() contains the protection.
> > 
> > > efficient protection for this. It looks like nand_chip->chip_lock 
> > > should do this job but it only protects
> > 
> > chip_lock is only for SMP and the lock/unlock macros contain the
> > preemption control if CONFIG_PREEMPT=y. The lock itself is a NOOP on UP
> > systems
> > 
> > tglx
> > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
