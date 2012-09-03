Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8TCP-0007c9-5S
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 09:44:05 +0000
Message-ID: <1346665441.3429.14.camel@coredoba.hi.pengutronix.de>
Subject: Re: UBI on SPI NOR flash
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: dedekind1@gmail.com
Date: Mon, 03 Sep 2012 11:44:01 +0200
In-Reply-To: <1346664222.3061.21.camel@sauron.fi.intel.com>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
 <1345811483.2848.310.camel@sauron.fi.intel.com>
 <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
 <1346664222.3061.21.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, 2012-09-03 at 12:23 +0300, Artem Bityutskiy wrote:
> On Mon, 2012-08-27 at 18:15 +0200, Jan L=C3=BCbbe wrote:
> > It works if I disable DMA in drivers/spi/spi-omap2-mcspi.c (simply
> > comment out the DMA branch in omap2_mcspi_work). I can use UBI&UBIFS
> > without problems for far. When rebooting to a kernel with DMA enabled
> > I
> > can no longer attach the previously working volume. Moving back to the
> > PIO-Kernel, it works again.
> >=20
> > Where should this be fixed? Should UBI use kmalloc'ed memory?
>=20
> Yes, the best way to fix this is to teach UBI and UBIFS stop using
> vmalloc(). It is not straight-forward, but doable. As I said several
> times, I can assist by giving ideas and directions, but someone who
> needs this should probably allocate a couple of men-months for this
> project.

I can't commit to spending months on this, but I do have some time.
Do you think the vmalloc-using places could be fixed step by step or
must this be done over UBI&UBIFI in one go?
Is there a specific thread where the approach fixing this has been
discussed before? Could the CMA be used instead of vmalloc?

You mentioned flexible arrays before. It seems it is targeted at items
smaller than a page and needs to copy each item when placing it into the
array. I'm not sure how this would help UBI/UBIF.

We probably also need an explicit way to tell MTD if a buffer is DMA
capable or not. Then we could avoid deciding based on the buffer pointer
in the storage drivers.

> > Why does this work for NAND controllers using DMA? :)=20
>=20
> I am not sure, you should investigate. I think some drivers just check
> if this is vmalloced memory, and avoid DMA for that. Some (e.g.,
> onenand) use various hacks which appear to work.

I was able to get it to work using this kind of hack (check in SPI host
driver for buf >=3D high_memory and fall back to PIO). It's submitted to
the SPI list, but I'm not sure if it's acceptable for them.

Regards,
Jan
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
