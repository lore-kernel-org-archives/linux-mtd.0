Received: from mail4.comsite.net ([205.238.176.238])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OT8cR-0005ZZ-9b
	for linux-mtd@lists.infradead.org; Mon, 28 Jun 2010 07:19:04 +0000
To: Kyle Moffett <kyle@moffetthome.net>
From: Milton Miller <miltonm@bga.com>
Subject: Re: of-flash: Unable to ioremap() both 128MB NOR flashes on 32-bit
	system with 2GB+ RAM
In-Reply-To: <AANLkTikMtZsg5ameUY9dnZoEqV-hfa7tkfGIO1hBtDq1@mail.gmail.com>
References: <AANLkTikMtZsg5ameUY9dnZoEqV-hfa7tkfGIO1hBtDq1@mail.gmail.com>
Date: Mon, 28 Jun 2010 02:18:59 -0500
Message-ID: <1277709539_13309@mail4.comsite.net>
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri Jun 25 around 14:01:51 EST 2010 Kyle Moffett wrote:
> Oops... put the old linuxppc list on the CC, sorry!
> 
> On Thu, Jun 24, 2010 at 23:45, Kyle Moffett <kyle at moffetthome.net> wrote:
> > Hello,
> >
> > I've got a new P2020 (32bit mpc85xx family) board I'm working on a
> > port for that includes 2 NOR flashes (128MB each) and a removable
> > SO-RDIMM of 2GB or 4GB.  Unfortunately when I configure both flashes
> > in the device-tree off my elbc, Linux is completely unable to access
> > the second one because it attempts to ioremap() the entire virtual
> > address space of both FLASH chips.
> >
> > Even with only one flash chip enabled, there's a bit of a noticeable
> > performance degradation because the mapping consumes almost all of my
> > available vmalloc space and forces bounce-buffering for all my
> > HIGHMEM.
> >
> > It looks like the "of-flash" driver currently requires that the whole
> > chip be mapped in the kernel at once.  I would much rather have a 50%
> > performance penalty on flash accesses (which are already very slow)
> > and regain most of the vmap space.
> >
> > So the question is, is there a way to convince the MTD layer to
> > iomap() only what it needs to access to do reads and writes?  If not,
> > what changes would need to be made to MTD and/or "of-flash" to create
> > such functionality?
> >
> > Cheers,
> > Kyle Moffett
> >

I believe the MTD layer would be happy, but it is beyond the scope of
the physmap_of driver.  A look at drivers/mtd/maps/pcmciamtd.c shows
the concept of paging in a section of flash, although it has the advantage
of hardware to move the window instead of calling ioremap or swapping
translations.  Another example is drivers/mtd/maps/pci.c, also with
hardware assist.

milton
