Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CorDc-0004Tm-Bl
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 17:44:02 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0CMhpBW003413
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 17:43:51 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0CMhjHZ229606
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 17:43:45 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0CMhi1Q029040
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 17:43:44 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0501121430471e55a8@mail.gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
Content-Type: text/plain
Message-Id: <1105569824.3896.44.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 12 Jan 2005 16:43:44 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 16:30, Jared Hulbert wrote:
> > > Clarification on NOR technology.  Remember that the ability to run
> > > code XIP is effectively a requirement for a NOR chip.  This means no
> > > read errors can leave the chip.  I don't see this changing in the
> > > foreseeable future.  Any read errors that do occur would probably be
> > > caused by a failed/incomplete program
> > >
> > > We probably do want to be able to easily retire, reprogram, and/or
> > > test those blocks/pages that get read errors.  That would have to be
> > > done in the filesystem and the chip driver needs to be able report a
> > > read error occured.
> > 
> > What would you conclude from this (in the context of disscussion)? That
> > CRC *must* be *always* checked in case of NOR?
> 
> Retiring blocks/pages was an idea for the more lossy flash NAND, AND
> etc.  If your media goes bad with NOR you probably can't boot anyway.

That's not true.  Eraseblocks can go bad during operation.  That doesn't
mean that the whole device returns bad data.

> 
> I'm thinking the opposite conclusion.  If I understand this correctly
> most CRC's on NOR are wasted effort.  I don't claim to quite
> understand JFFS2 architecture yet but it seems to me the data CRC's
> are not needed for NOR, perhaps some of the other CRC's are not needed
> as well.

CRCs are needed.  Or rather, some form of checksum is needed.  Bits flip
during operation on NOR as well.  I've seen it happen.  It's rare, but
as David put it in an IRC conversation "it's a sanity check on the
hardware".

There's sort of multiple threads on this topic, so maybe check some of
those.  We even got Joern to agree they're needed :).

josh
