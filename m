Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192Xfy-0005uO-0a
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 15:32:46 +0100
Date: Mon, 7 Apr 2003 16:32:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jim Zeus <jimzeus@vip.sina.com>
Message-ID: <20030407143233.GH22630@wohnheim.fh-wedel.de>
References: <20030404062136.7806.qmail@vip.sina.com>
	<1049449251.1980.90.camel@passion.cambridge.redhat.com>
	<004a01c2fcb4$8f61cf60$2a00a8c0@zhengjun>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004a01c2fcb4$8f61cf60$2a00a8c0@zhengjun>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: MTD mail list <linux-mtd@lists.infradead.org>
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [SPAM] FAT on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David didn't respond (yet), so you have to settle with my words of
lesser wisdom. :)

On Mon, 7 April 2003 11:19:53 +0800, Jim Zeus wrote:
> 
> > Windows won't recognise raw NAND flash anyway. You'll have to write
> > _some_ kind of driver for Windows.
> > 
> 
> Since the MTD block device(which include nand.c,mtdcore.c 
> and mtdblock.c) is a block device, why I can't build
> any filesystem on it? 

Oh, you can. But you won't have a-d, unless you use a working nftl.

> And, what's the difference between MTD block device and NFTL
> if they stay on the same layer? Even though I cant use NFTL
> because of some "silly patent problem" ,I still wanna know it,
> thanks.

Disclaimer: I've never even tried nftl or know of anyone that has.

Nftl (or any variant of that theme) should take care of b, d, possibly
c and - as a side effect - also of a.
Nftl has no knowledge about the file system on top of it. So you can
still get the possibility of inconsistent file systems, unless you use
some variant of ffs or a journaling file system.

Whether existing implementations actually do this under all
circumstances is highly questionable, given the userbase the code has.
Do you own tests.

> > > 1.How unstable would it be? Does it support: 
> > >      a.journaling (crash/power-off safe ,I mean)
> > 
> > No.
> > 
> > >      b.bad block management
> > 
> > No.
> > 
> > >      c.wear levelling
> > 
> > No.
> > 
> > >      d.error correction
> > 
> > No.
> > 
> > >      e.something else I dont know to make the FS reliable
> > 
> > No.
> 
> Then, maybe the lower layer (MTD or NFTL) support it? or all the
> stuff(a.b.c.d.e) are supported only by the file system 
> (JFFS2/YAFFS,I mean)?

Jffs2 does support it, yaffs should also (not sure, never used it).

> > But really you should have a file system directly on the flash, not a
> > translation layer pretending to be a block device.
> 
> Do you mean build a totally new FS on a _bare_ NAND flash or on a MTD? 
> You are so right, but I must build a FS which Windows can 
> recognize and I have no enough time to do this before the time
> limit.

Mtd is as good as a bare nand. In the traditional unix world of
character and block devices, flash is neither one nor the other. Thus,
mtd devices were created as a third kind. They usually give you enough
abstraction to ignore chip specifics, sometimes not even that.

A *very* thin layer.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
