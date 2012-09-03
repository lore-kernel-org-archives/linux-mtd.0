Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Tc0-0003Ol-8R
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 10:10:34 +0000
Message-ID: <1346667029.3429.21.camel@coredoba.hi.pengutronix.de>
Subject: Re: UBI on SPI NOR flash
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: dedekind1@gmail.com
Date: Mon, 03 Sep 2012 12:10:29 +0200
In-Reply-To: <1346666450.3061.34.camel@sauron.fi.intel.com>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
 <1345811483.2848.310.camel@sauron.fi.intel.com>
 <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
 <1346664222.3061.21.camel@sauron.fi.intel.com>
 <1346665441.3429.14.camel@coredoba.hi.pengutronix.de>
 <1346666450.3061.34.camel@sauron.fi.intel.com>
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

On Mon, 2012-09-03 at 13:00 +0300, Artem Bityutskiy wrote:
> On Mon, 2012-09-03 at 11:44 +0200, Jan L=C3=BCbbe wrote:
> > I can't commit to spending months on this, but I do have some time.
> > Do you think the vmalloc-using places could be fixed step by step or
> > must this be done over UBI&UBIFI in one go?
> > Is there a specific thread where the approach fixing this has been
> > discussed before? Could the CMA be used instead of vmalloc?
>=20
> I believe it can be done step by step. You can start from UBI I guess.
> Basically we use vmalloc everywhere when we need to read entire
> eraseblock. The reason for this is that the eraseblock is large, so
> kmalloc() would often fail.

Ok.

> So the idea is to allocate smaller buffers and then iterate. There are
> places which are easier to handle, and some are more difficult to handle
> (e.g., those where we index elements in the eraseblock array).
>=20
> > You mentioned flexible arrays before. It seems it is targeted at items
> > smaller than a page and needs to copy each item when placing it into th=
e
> > array. I'm not sure how this would help UBI/UBIF.
>=20
> I think I meant something like flexible arrays. The idea was to create
> an API which you can use as if you had a single vmalloc buffer. Indexing
> operation then could be changed with a helper function.

Would you then iterate inside of UBI using this API, making page-sized
calls to MTD? Or would MTD need to be extended to pass around these
"DMA-lists"?

Do we need multiple large buffers at the same time for one UBI device?
If not, we could get one EB-size buffer from CMA on probe/mount and
reuse it.

> > We probably also need an explicit way to tell MTD if a buffer is DMA
> > capable or not. Then we could avoid deciding based on the buffer pointe=
r
> > in the storage drivers.
>=20
> I think it is better to eliminate vmalloc from UBI/UBIFS.

So in the end, MTD drivers would expect to only receive DMA capable
buffers?

> > I was able to get it to work using this kind of hack (check in SPI host
> > driver for buf >=3D high_memory and fall back to PIO). It's submitted t=
o
> > the SPI list, but I'm not sure if it's acceptable for them.
>=20
> I hope not :-) We need to fix things properly.

It's the same approach as taken by some NAND drivers. :-)

Regards,
Jan
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
