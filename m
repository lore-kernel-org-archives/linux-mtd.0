Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJvLP-0004QN-2a
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 10:52:13 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: tglx@linutronix.de
Date: Tue, 19 Oct 2004 15:39:36 +0100
References: <E0180EAB7181@baydel.com> <1098186608.12223.857.camel@thomas>
In-Reply-To: <1098186608.12223.857.camel@thomas>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <E0CCB8742B31@baydel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

I am using the ready pin.

On Tuesday 19 Oct 2004 12:50 pm, Thomas Gleixner wrote:
> On Tue, 2004-10-19 at 13:22, Simon Haynes wrote:
> > I have experienced a problem in which a JFF2 filesystem on NAND became
> > full. This is a root file system and constant writes to a logfile filled
> > the filesystem. On investigation it was found that the NAND device now
> > had hundreds of bad blocks.
> >
> > I started to investigate this and found that JFFS2 was announcing
> >
> > Newly-erased block contained word 0x1985e002 at offset 0x020f7e00
> >
> > Messages which result in my mtd/jffs2 code marking the block bad. What I
> > find strange is that a subsequent scan list the new block at a different
> > 16k offset when the device erasesize is 16k, in this case 0x020f0000. Is
> > that because my device is 128Mb and JFFS2 is using this 'virtual erase
> > size' of 32k ?
>
> Yes. The bad block code scans/marks physical blocks and JFFS2 operates
> on virtual ones, if the device size is big enough.
>
> > I have observed this now on several different NAND devices and it seems
> > to be more prominent while performing small writes.
> >
> > I am currently trying to work out if the erase is not completing, or this
> > is the wrong block or something else.
>
> Hmm, are you using Ready/Busy Pin or the timeout ?
>
> tglx
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
