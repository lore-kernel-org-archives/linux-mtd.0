Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL5rT-000686-Qp
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 16:50:25 -0400
Date: Mon, 11 Apr 2005 16:48:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1113251997.7500.5.camel@windu.rchland.ibm.com>
Message-ID: <Pine.LNX.4.61.0504111645360.28836@localhost.localdomain>
References: <Pine.LNX.4.61.0504111600540.28647@localhost.localdomain>
	<1113251997.7500.5.camel@windu.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: why can i select both PHYSMAP and MULTI_PHYSMAP?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 Apr 2005, Josh Boyer wrote:

> On Mon, 2005-04-11 at 16:04 -0400, Robert P. J. Day wrote:
> >   patched my 2.6.11.7 kernel tree with the latest mtd CVS to get the
> > mphysmap.c and i'm a bit confused.  in the
> >
> >   Mapping drivers for chip access -->
> >
> > menu, i can apparently select, simultaneously,
> >
> >   <*> CFI Flash device in physical memory map
> >   <*> multiple CFI Flash devices in physical memory map
> >
> > this seems contradictory, especially since i can deselect the first
> > while still select the second.  am i misreading what these mean?  or
> > is this some non-intuitive stuff to be backward-compatible?
>
> Joern (the author) is on vacation so I'll try to answer for him.
>
> I don't believe mphysmap precludes the use of physmap.  They are
> entirely separate drivers and should be able to be used as such.
> For example, you could map one chip with physmap, and 3 others with
> mphysmap.
>
> That isn't the typical intended usage though.  Normally you would
> use mphysmap to map all of the chips on a board.  If you only had
> one chip, you could still use mphysmap.  It's sort of
> backward-compatible that way I suppose.

i'd guessed as much -- it just seemed redundant to be able to use both
physmap and mphysmap at the same time, and possibly even refer to the
same chip in both places.

> If mphysmap proves to be useful and stable (it is fairly new), then
> maybe it can eventually replace physmap.  Until then, I suppose it's
> safest to leave both there.

the one thing i don't see (perhaps i'm overlooking it) is the ability
to concatenate chips in menuconfig.  perhaps that's getting overly
ambitious, but maybe it's not such a big step to throw in an option
for "Concatenate all chips in their numerical order?".

just thinking out loud.

rday
