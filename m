Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A81RZ-0004nP-Ue
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 18:52:50 +0100
Date: Fri, 10 Oct 2003 19:50:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031010175040.GA27506@wohnheim.fh-wedel.de>
References: <Pine.GSO.4.56.0310100453520.19931@ikarus.sil.at>
	<1065764780.30987.333.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1065764780.30987.333.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
Subject: Re: kmalloc jffs2_do_mount_fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 October 2003 06:46:21 +0100, David Woodhouse wrote:
> 
> Partly because I'm unconvinced that we want to actually _use_ such a
> small erasesize. It means you split far more page writes into two nodes
> to avoid crossing block boundaries, and hence waste space.
> 
> I suspect the main reason Thomas objected to my original 'min 64KiB' was
> because of the 5-erase-block threshold. Since I've just wound that
> threshold _up_ on NAND because and it's also based in part on nr_blocks
> now, we could perhaps rethink the minimum erasesize. I didn't manage to
> tie him down on #mtd yesterday though.

But this is wrong (TM).  You missed at least one variable in your
equation.  Five erase blocks is quite enough for NAND, as long as you
don't have more blocks total than on a similar NOR device.  The
problems start when you have too many blocks - you need more free
blocks.

This means that you need what I tried to start with one - dynamic 1)
numbers of erase blocks and possibly dynamic block sizes as well.
Anything else may be a decent assumption for one device or another,
but not for all.

1) dynamic for compile time - it should stay static for any given
device.

Jörn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike
