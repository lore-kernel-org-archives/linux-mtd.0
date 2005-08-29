Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E9ocE-0002Xo-Ej
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2005 19:44:19 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j7TIi1EF003764
	for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2005 14:44:01 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7TIi18q200588
	for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2005 14:44:01 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j7TIhpwN028663
	for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2005 14:43:51 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050829100722.GB17088@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 29 Aug 2005 13:42:52 -0500
Message-Id: <1125340972.30800.7.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-08-29 at 12:07 +0200, Jörn Engel wrote:
> On Fri, 26 August 2005 15:12:29 -0500, Josh Boyer wrote:
> > On Fri, 2005-08-26 at 12:25 +0200, Jörn Engel wrote:
> > > Trivial patch.  Anyone complaining about this is free to write a
> > > better one.  Can I commit?
> > 
> > So now with this 1:1 mapping, a user is limited to using a 64 MiB chip
> > if the physical block size is 32 KiB?  I know there are NAND chips out
> > there that use such a block size and are larger than 64MiB.  Do we
> > really want to stop supporting all of these devices?  
> 
> No.
> 
> What we have right now is an ugly hack that causes random
> incompatibilities.  And it happens to be that both summary and erase
> count increase the chances of an incompatibility, so this hack
> effectively blocks both patches from inclusion.

Sure, not disagreeing with that.

> 
> What we need is a decent design that works without incompatibilities.
> And the design should define what's on the medium, _independently_ of
> whatever goes on in memory.  Changing the format on the medium because
> some struct now has an extra field is not an option.  Changing the
> format because the medium moved from a 32bit to a 64bit machine is not
> an option.

Yep.

> 
> Problem is that code for the decent design doesn't exist yet.  I
> personally prefer this patch to the current broken implementation, as
> it increases the pressure to write the correct code.  If such code
> doesn't show up in the near future, I'd be inclined to commit my
> patch.

Be realistic, this is JFFS2 not ext3 :).  If we break support for larger
devices, people aren't going to complain about it for months.  That
means this patch will sit here for months too.

I'd rather we switch to using vmalloc instead for now.  It's not an end
solution, but at least it doesn't prevent larger devices from being
used.

josh
