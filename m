Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvdCV-0006I7-JO
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 10:10:53 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0VFAhZW001302
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:10:43 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0VFAhEF099270
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:10:43 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0VFAhnJ004650
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 10:10:43 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050131125613.GA6345@wohnheim.fh-wedel.de>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
	<1107013860.10670.5.camel@windu.rchland.ibm.com>
	<20050131125613.GA6345@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 31 Jan 2005 09:10:38 -0600
Message-Id: <1107184238.7567.17.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 13:56 +0100, Jörn Engel wrote:
> On Sat, 29 January 2005 09:51:00 -0600, Josh Boyer wrote:
> > 
> > Not necessarily.  I was actually thinking of having JFFS2 just "ignore"
> > such eraseblocks.  Essentially treating them as bad blocks perhaps.
> > 
> > However, such blocks could be scattered across the entire device rather
> > than contained within a certain address range on the chip.  Updating the
> > data would be a bit tricky, which is why I said a driver would need to
> > be created in order to deal with it.
> 
> Problem would be trivial to solve, if said blocks were not scattered
> across the device.  Do you have a good reason to need this?

If said blocks were not scattered across the device, then they could be
in a static partition and there would be nothing to discuss :).  We just
got done discussing this on IRC, so I'll try and summarize.

The main reason to not have static partitions is the concern of bad
blocks on NAND and the effects that can have on the available space for
updates, etc of binary data.  If a majority of a partition is bad
blocks, either from the factory or from eventual wear, then you don't
have much room for updating, etc.

Without a static mapping, one could "steal" free eraseblocks from JFFS2
to update or grow the binary data.  That would allow one to relocate the
binary data to different eraseblocks that might not be physically
contiguous.

There are problems with such an approach though.  Thomas pointed out the
AG-AND radiation problem, which is not trivial to solve.  Also, a hook
into JFFS[23] would be needed in order to ask it for eraseblocks if the
filesystem were mounted.

Artem asked about how this effects wear-leveling.  By allowing binary
data to be scattered throughout the device, it helps alleviate updates
to the same eraseblocks in a static partition.  One could even be
ambitious and make JFFS[23] move around such eraseblocks if they weren't
in use at the current time.  (Although that would present problems of
it's own.  I suppose you'd have to be quite ambitious to get that
working ;) ).

josh
