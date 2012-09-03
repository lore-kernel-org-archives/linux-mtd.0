Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8TNv-0000JU-4s
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 09:55:59 +0000
Message-ID: <1346666450.3061.34.camel@sauron.fi.intel.com>
Subject: Re: UBI on SPI NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Date: Mon, 03 Sep 2012 13:00:50 +0300
In-Reply-To: <1346665441.3429.14.camel@coredoba.hi.pengutronix.de>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
 <1345811483.2848.310.camel@sauron.fi.intel.com>
 <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
 <1346664222.3061.21.camel@sauron.fi.intel.com>
 <1346665441.3429.14.camel@coredoba.hi.pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cUR/SOlSPeTb77w4Ri9x"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cUR/SOlSPeTb77w4Ri9x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 11:44 +0200, Jan L=C3=BCbbe wrote:
> Hi Artem,
>=20
> On Mon, 2012-09-03 at 12:23 +0300, Artem Bityutskiy wrote:
> > On Mon, 2012-08-27 at 18:15 +0200, Jan L=C3=BCbbe wrote:
> > > It works if I disable DMA in drivers/spi/spi-omap2-mcspi.c (simply
> > > comment out the DMA branch in omap2_mcspi_work). I can use UBI&UBIFS
> > > without problems for far. When rebooting to a kernel with DMA enabled
> > > I
> > > can no longer attach the previously working volume. Moving back to th=
e
> > > PIO-Kernel, it works again.
> > >=20
> > > Where should this be fixed? Should UBI use kmalloc'ed memory?
> >=20
> > Yes, the best way to fix this is to teach UBI and UBIFS stop using
> > vmalloc(). It is not straight-forward, but doable. As I said several
> > times, I can assist by giving ideas and directions, but someone who
> > needs this should probably allocate a couple of men-months for this
> > project.
>=20
> I can't commit to spending months on this, but I do have some time.
> Do you think the vmalloc-using places could be fixed step by step or
> must this be done over UBI&UBIFI in one go?
> Is there a specific thread where the approach fixing this has been
> discussed before? Could the CMA be used instead of vmalloc?

I believe it can be done step by step. You can start from UBI I guess.
Basically we use vmalloc everywhere when we need to read entire
eraseblock. The reason for this is that the eraseblock is large, so
kmalloc() would often fail.

So the idea is to allocate smaller buffers and then iterate. There are
places which are easier to handle, and some are more difficult to handle
(e.g., those where we index elements in the eraseblock array).

> You mentioned flexible arrays before. It seems it is targeted at items
> smaller than a page and needs to copy each item when placing it into the
> array. I'm not sure how this would help UBI/UBIF.

I think I meant something like flexible arrays. The idea was to create
an API which you can use as if you had a single vmalloc buffer. Indexing
operation then could be changed with a helper function.

> We probably also need an explicit way to tell MTD if a buffer is DMA
> capable or not. Then we could avoid deciding based on the buffer pointer
> in the storage drivers.

I think it is better to eliminate vmalloc from UBI/UBIFS.

> > > Why does this work for NAND controllers using DMA? :)=20
> >=20
> > I am not sure, you should investigate. I think some drivers just check
> > if this is vmalloced memory, and avoid DMA for that. Some (e.g.,
> > onenand) use various hacks which appear to work.
>=20
> I was able to get it to work using this kind of hack (check in SPI host
> driver for buf >=3D high_memory and fall back to PIO). It's submitted to
> the SPI list, but I'm not sure if it's acceptable for them.

I hope not :-) We need to fix things properly.

--=20
Best Regards,
Artem Bityutskiy

--=-cUR/SOlSPeTb77w4Ri9x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRH/SAAoJECmIfjd9wqK0KpYP/RL8ipRt0tBCO6UEZX6hn7eL
bsOP/rkWMiXz5JQ6DXrDbO4gvVwCiTDenWchcAgudqASFKLTBBVEGad/+2yAz9Of
1e6BwIXIWybN4UAX84kpVhWQMembtyaH+mp4RMsB4PCsBZQp228wAT64u8TQ/6Ia
wmB2fl1QJgb+x3m2bS7AZJgTcvnWoGwT6h3w8bMT6wH+P56KytqqP8PrQkSBqdmR
GRh1p1xzD6YzJbL/71q+YtyY4FSNagGyLW6JoGNXl16OA4ny9MNywAvma5i2B1DM
Aw/1jhJyJTiGrncqn5i7obv1aSAbQTXW9SJBCVmbF+m5Tk2/tqP1djMvZzhIEaZI
CgKA0G5qr21COSoJ+rcWp3m7KZjv+uSheYsMmf4Y/DVcWAsMy4HTKgMC2WWPpCEy
GnLethmczotM3fi2k2WJnlxB/aSDVycACqSp7IGe17nD4UcRCXDg/VE+3mtzEHL5
+QVqKD7hzTFSiv1Bv9py36YbBQM9tJam/Yy/L5csxeialpnNUBSIrNp/zvv0WfEd
BZh4kmNczMsO6PvHlrtdn7FbNXLDazZg6+vJuLPgSFfzs4zrvhIPI0JyWb5DPmrB
hZBkiZGBACa6t9fVVVOfEydXrCNINB8FQQdvcT9uxujedkYsK4LRl6soE1+xr7G8
OY49a2JkN7Pb91CuTabY
=68Vv
-----END PGP SIGNATURE-----

--=-cUR/SOlSPeTb77w4Ri9x--
