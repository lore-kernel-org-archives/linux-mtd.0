Received: from sccrmhc12.comcast.net ([204.127.202.56])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARHKi-0006Oa-3d
	for <linux-mtd@lists.infradead.org>; Tue, 02 Dec 2003 20:41:20 +0000
From: Rick Bronson <rick@efn.org>
To: manningc2@actrix.gen.nz
In-reply-to: <20031123192443.CA92B15942@desire.actrix.co.nz> (message from
	Charles Manning on Mon, 24 Nov 2003 08:31:08 +1300)
References: <E1ANwSn-0000bd-00@c-67-164-61-95.client.comcast.net>
	<20031123192443.CA92B15942@desire.actrix.co.nz>
Message-Id: <E1ARHGG-00018H-00@c-67-164-61-95.client.comcast.net>
Sender: Rick Bronson <rick@comcast.net>
Date: Tue, 02 Dec 2003 12:36:44 -0800
cc: linux-mtd@lists.infradead.org
Subject: Re: nand_write_ecc() broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Monday 24 November 2003 04:47, Rick Bronson wrote:
> > Hi,
> >
> >   The routine nand_write_ecc() doesn't seem to account for bad blocks.
> > If I write an image over a known bad block, nand_erase() correctly
> > identifies and skips over the bad block (via nand_block_bad()) but
> > nand_write_ecc() seems to ignore the bad blocks.
> >
> >   Anyone experienced the same problem?
> >
> > I'm using 11/16/03 cvs version of mtd on an ARM, linux-2.4.19, and
> > here's my config:
> >
> > CONFIG_JFFS2_FS=y
> > CONFIG_JFFS2_FS_DEBUG=0
> > CONFIG_JFFS2_FS_NAND=y
> >
> >  Here's my hardware specific NAND stuff:
> >
> > 	my_nand->eccmode = NAND_ECC_SOFT;  /* enable ECC */
> > 	my_nand->chip_delay = 20;
> >
> 
> Writing to known bad blocks is not necessarily a problem, depending on how 
> the block became bad (eg. bad block marking). Bad block managemnet is not 
> really an mtd responsibility, but that of the file system/block device driver.
> 
> -- CHarles


Dear Charles,

  Thanks much for the response.

  I presume that the bad block in question was marked by the manufacturer.

  If bad block managemnet is not really an mtd responsibility then why
does nand_erase() inside mtd/nand/nand.c call
this->block_bad(mtd, page) which checks for bad blocks?

  Do you know where in the jffs2 filesystem code it checks for bad
blocks?

  Really appreciate the help.

  Rick Bronson
