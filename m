Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j34y-0000cm-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 18:52:56 +0100
Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j34x-0000cg-00
	for mtd@infradead.org; Fri, 30 Mar 2001 18:52:55 +0100
Date: Fri, 30 Mar 2001 12:52:46 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: =?iso-8859-1?Q?K=E1ri_Dav=ED=F0sson?= <kd@flaga.is>
cc: <mtd@infradead.org>
Subject: RE: partitions and erase regions
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E3108B012@kolkrabbi.flaga.is>
Message-ID: <Pine.LNX.4.33.0103301246200.8580-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 30 Mar 2001, Kári Davíðsson wrote:

> Since there was no protest I just went ahead and commited the "virtual"
> erase region
> patch to mtdpart.

Sorry, I apparently missed your original post.

> > Hi,
> >
> > I am implementing a "virtual" erase regions for partitions.
> > It looks to me that should be enough to create them in
> > add_mtd_partition().
> >
> > This would make it easyer to manage partitions that cross erase region
> > boundaries.

Why do you want to have partitions that cross erase region in the first
place?

The primary goal of partitions is to easily _preserve_ some parts of the
flash while allowing free access to others.  If a writable, ence eraseable,
partition can start/end up in the middle of an erase region, you will
potentially trash part of a contigous partition that was ment to be
read-only.  Even if you preserve the erased content of the contigous
partition to write it back afterwards, you still have the risk of a power
failure at the right time that would rander your read-only partition
corrupted.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
