Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AGfk-0005sl-VA
	for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2003 23:00:29 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE200995QGAKV@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 29 Apr 2003 00:00:10 +0200 (MEST)
Date: Tue, 29 Apr 2003 00:59:34 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030428211333.100A015505@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, Thayne Harbaugh <tharbaugh@lnxi.com>,
 =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304290059.34784.tglx@linutronix.de>
MIME-version: 1.0
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
 <1051542140.1171.500.camel@tubarao>
 <20030428211333.100A015505@desire.actrix.co.nz>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 28 April 2003 23:14, Charles Manning wrote:
> I have seen some wierd stuff before... comments further below:
> > The whole thing just makes me sick.  It's ugly putting in such a hack.
> > One little voice in my head keeps telling me that there's an error in
> > software and I just have to find and fix the bug.  Another little voice
> > in my head keeps telling me that broken hardware is more common than
> > most people want to believe.
>
> Yes, there are/ have been cases where the chips do not latch their commands
> correctly. This can be made worse by marginal chip select timing etc.

That's nothing, what should be fixed by generic software drivers. Either the 
chips are buggy or the signal timings are wrong or even both. If we would 
take care of all broken hardware, we would experiencing magic kernel source 
size explosion within no time. 

> * Reading the status too soon after issuing the command: some parts need a
> brief wait after latching the command before the busy flag is valid.
> Without the wait, the busy state might be misinterpreted. 500ns would be
> ample.

If this is an issue, I'm willing to add this to nand.c in form of a hardware 
driver supplied delay, which is 0 by default.

> * Ensuring the correct number of address cycles: I have observed cases
> where a chip seems to work when the wrong number of address cycles was
> issued, but gave erratic results.

The address cycles in the generic nand.c command function are correct. I don't 
know, if anybody uses a hardware driver supplied command function.

> * Issue a reset command before any read/write/erase command. This is a
> small overhead and ensures that the command register is always in a
> consistent state.

If that helps, I'm willing to add this too, conditional, defaulting to zero. I 
remember a big thread complainig about this overhead, before it was removed.
I did this carefully and there is no "maybe a write is interrupted by another 
thread issue". Only erases can be interrupted, but they are restarted later. 
And on interruption of erase the reset comand is issued.

Can anybody add a check, whether the erase is interrupted immidiately before 
the write error occures ? If that's the case, then we have to check the 
datasheet of the offending chip and maybe block erase interruption 
conditionally, defaulting to not, as it works here and is proven to do so 
elsewhere.

> Also check the basics like power and signal integrity. Overshooting/ringing
> clocks could very easily be latching spurious data and corrupting the
> commands.

I have seen this on some hardware, where address lines were used for CLE and 
ALE, which is possible with compliance to all timing constraints. But it's 
really not easy to match this under all circumstances (interrupts, dma, cache 
refill ....).

> > I haven't been very aggressive about adding the retry code because right
> > now I'm interested in more data points: Am I the only one that sees the
> > problem of a flash chip that occasionally drops commands or are others
> > seeing this same problem?  Is this problem more common but people don't
> > see it because the flash filesystems think that a location is bad and
> > mark it as unusable?
>
> I'd suggest exploring the above first.

I have running NAND-FLASH with YAFFS and JFFS2 partitions for more than a year 
in a mostly permanent copy/remove/move cycle. I had no spurious commands or 
anything like that. I never got blocks marked bad randomly. I have different 
sized SmartMedia Cards from various vendors and production dates in use, so 
it is not a random good part luck.

I know about a bunch of implementations, where NAND has been proven reliable 
in extensive tests. 

I'm really _NOT_ willing to buy, that adding of some obscure retry mechanism 
will solve all this problems for ever. They may dissapear for now and come 
back in a different EMC or application environement.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
