Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgp4R-0008OM-M6
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 13:49:21 -0500
Date: Tue, 21 Dec 2004 19:49:18 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Christopher Hoover <ch@murgatroid.com>
Message-ID: <20041221184918.GC10974@wohnheim.fh-wedel.de>
References: <20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221184215.2BC64A00096@mail.murgatroid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221184215.2BC64A00096@mail.murgatroid.com>
Cc: 'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 21 December 2004 10:42:07 -0800, Christopher Hoover wrote:
> >From Jörn Engel -
> > I see absolutely no reason for complicated erase reagions.  On the
> > user side, everyone but mtdchar effectively ignores it anyway.
> 
> I don't grok this.   What about flash with variable-sized blocks?  (I have a
> board with such flash and code that uses eraseregions.)

Sure, from AMD or some other compatible manufacturer.  The
variable-sized blocks were nice until there were better solutions to
the problem, like jffs2.  Jffs2 exists, so they are largely useless.

Last time I looked, there were five users of mtd devices:
1. jffs
2. jffs2
3. yaffs
4. mtdblock
5. mtdchar

1 and 2 don't use the smaller blocks.  3 doesn't work with NOR-flash
anyway.  4 doesn't use the smaller blocks.  5 does, but is horribly
ugly and noone cares enough to clean it up.  You do the math.

1, 2 and 4 effectively use the smaller blocks as if they were a single
larger block.  So the space is not wasted, but that's about it.

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
