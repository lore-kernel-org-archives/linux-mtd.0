Received: from web52703.mail.yahoo.com ([206.190.39.154])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CK1nE-0006e2-JY
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 17:45:22 -0400
Message-ID: <20041019214518.26339.qmail@web52703.mail.yahoo.com>
Date: Tue, 19 Oct 2004 14:45:18 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: tglx@linutronix.de, simon@baydel.com
In-Reply-To: <1098186608.12223.857.camel@thomas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, 2004-10-19 at 13:22, Simon Haynes wrote:
> > I have experienced a problem in which a JFF2 filesystem on NAND
> > became full. 
> > This is a root file system and constant writes to a logfile
> > filled the filesystem. On investigation it was found that the
> > NAND device now had hundreds of bad blocks.
> > 
> > I started to investigate this and found that JFFS2 was announcing
> > 
> > Newly-erased block contained word 0x1985e002 at offset 0x020f7e00
> > 
> > Messages which result in my mtd/jffs2 code marking the block bad.
> > What I find strange is that a subsequent scan list the new block
> > at a different 16k offset when the device erasesize is 16k, in
> > this case 0x020f0000.
> > Is that because my device is 128Mb and JFFS2 is using this
> > 'virtual erase size' of 32k ?
> 
> Yes. The bad block code scans/marks physical blocks and JFFS2
> operates
> on virtual ones, if the device size is big enough.
> 
> > I have observed this now on several different NAND devices and it
> > seems to be more prominent while performing small writes.
> >
> > I am currently trying to work out if the erase is not completing,
> > or this is the wrong block or something else. 
> 
> Hmm, are you using Ready/Busy Pin or the timeout ?
> 
> tglx
> 

Hi guys.  This topic has given me a little bit of concern.  Could you
try to answer a few questions for me?

1. Do you know what usually causes the "Newly-erased block contained
word   "... error?
Is it caused by a interrupted (or otherwise failed) erase?  Would
power-fail cause this?

2. Would this cause good blocks to be incorrectly [and permanently]
marked as bad?


I think I may have seen something similar on my system.  I'm
considering writing a test to see if this is a problem for me, but
I'd like to learn more about this also.

Thanks,
Mike
