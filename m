Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2wpC-0001rt-5a
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 16:05:22 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org, tglx@linutronix.de
Date: Thu, 11 Aug 2005 08:08:15 +1200
References: <42F8DCBD.2020407@sgi.com>
	<1123630395.21933.135.camel@tglx.tec.linutronix.de>
In-Reply-To: <1123630395.21933.135.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200508110808.15354.manningc2@actrix.gen.nz>
Cc: Steven Hein <ssh@sgi.com>
Subject: Re: Erasing NAND bad blocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 10 August 2005 11:33, Thomas Gleixner wrote:
> On Tue, 2005-08-09 at 11:41 -0500, Steven Hein wrote:
> > (Yes, I do know that erasing NAND flash blocks that are marked bad
> > is a VERY BAD IDEA.....I'm asking the question regarding a
> > specific HW/SW debug situation.......)
> >
> > In the course of bringing up new hardware with NAND flash attached
> > I have had occasions where a software bug will cause a NAND-based
> > filesystem (such as YAFFS) to mark *all* of the blocks in a filesystem
> > as bad.  In the past, I have hacked the nand_erase() function to
> > allow erasing of bad blocks, then wrote a custom app to scan the OOB
> > data, doing a MEM_ERASE for blocks that had been marked bad by the FS.
> > Just wondering.....has anyone else
> > run into this situation, and is there a more graceful way of doing
> > this (i.e. without hacking the MTD NAND driver)?
>

As this comes around often wrt YAFFS1, I think there are two things that can 
be done in YAFFS to help address the issue:
1) Make the bad block marker used in YAFFS1 something that is easy to 
recognise (eg. 'Y' ) instead of 0x00. That way it should be easy to recognise 
yaffs -vs- factory marked bad blocks.
2) Add a config in yaffs to not do any bad block marking during board bring 
up.

-- CHarles
