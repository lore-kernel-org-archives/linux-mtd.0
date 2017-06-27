Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPw1z-0000Z6-PX
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 19:20:14 +0000
Date: Tue, 27 Jun 2017 21:19:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Robert
 Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 1/2] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20170627211938.05abf5ac@bbrezillon>
In-Reply-To: <20170627184614.GC55942@google.com>
References: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
 <20170627184614.GC55942@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 27 Jun 2017 11:46:14 -0700,
Brian Norris <computersforpeace@gmail.com> a =C3=A9crit :

> On Sun, Jun 25, 2017 at 06:01:12PM +0200, Boris Brezillon wrote:
> > The MTD layer provides several wrappers around mtd->_xxx() hooks. Call
> > these wrappers instead of directly dereferencing the associated ->_xxx()
> > pointer.
> >=20
> > This change has been motivated by another rework letting the core
> > handle the case where ->_read/write_oob() are implemented but not =20
> > ->_read/write(). In this case, we want mtd_read/write() to fall back to
> > ->_read/write_oob() when ->_read/write() are NULL. The problem is, =20
> > mtdpart is directly calling the ->_xxx() instead of using the wrappers,
> > thus leading to a NULL pointer exception.
> >=20
> > Even though we only need to do the change for part_read/write(), going
> > through those wrappers for all kind of part -> master operation
> > propagation is a good thing, because other wrappers might become
> > smarter over time, and the duplicated check overhead (parameters will
> > be checked at the partition and master level instead of only at the
> > partition level) should be negligible.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > Changes since v1:
> > - new patch needed to fix a NULL pointer dereference BUG =20
>=20
> I think I like this patch on the whole. A few notes below.

Ok, cool. I was afraid someone would complain about the induced
overhead.

>=20
> > ---
> >  drivers/mtd/mtdpart.c | 71 ++++++++++++++++++++++---------------------=
--------
> >  1 file changed, 31 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > index ea5e5307f667..11486ec6cab0 100644
> > --- a/drivers/mtd/mtdpart.c
> > +++ b/drivers/mtd/mtdpart.c
> > @@ -68,8 +68,7 @@ static int part_read(struct mtd_info *mtd, loff_t fro=
m, size_t len,
> >  	int res;
> > =20
> >  	stats =3D part->master->ecc_stats;
> > -	res =3D part->master->_read(part->master, from + part->offset, len,
> > -				  retlen, buf);
> > +	res =3D mtd_read(part->master, from + part->offset, len, retlen, buf);
> >  	if (unlikely(mtd_is_eccerr(res)))
> >  		mtd->ecc_stats.failed +=3D
> >  			part->master->ecc_stats.failed - stats.failed; =20
>=20
> The parent-to-child ECC stat handling is different here than it is
> below, in part_read_oob().
>=20
> ...
>=20
> > @@ -132,7 +130,7 @@ static int part_read_oob(struct mtd_info *mtd, loff=
_t from,
> >  			return -EINVAL;
> >  	}
> > =20
> > -	res =3D part->master->_read_oob(part->master, from + part->offset, op=
s);
> > +	res =3D mtd_read_oob(part->master, from + part->offset, ops);
> >  	if (unlikely(res)) {
> >  		if (mtd_is_bitflip(res))
> >  			mtd->ecc_stats.corrected++; =20
>=20
> Notice how we only count a single increment here.
>=20
> That seems wrong, doesn't it?

Indeed, it does, but this patch does not change the current
behavior ;-).

> But then, do we guarantee that
> ->_read_oob() implementations follow the same stat recording guarantees =
=20
> that ->_read() implementations do (or should)? Might double check that
> before trying to fiddle here any more than you are.

Well, if you want my opinion, all this ecc_stats dance on MTD parts is
already fragile, because, AFAICT, nothing guarantees that someone else
is not reading another partition of the same device while we are
extracting the stats, which means that those numbers might already be
inconsistent when we do the calculation to extract the number of
bitflips and failures related to the partition. So, I'm not sure we
really care about these numbers.

If we want things to be perfectly reliable, we should return the stats
attached to a specific read request and then atomically update the
global stats (see the discussion I had we Sacha a while ago [1]).

Anyway, I'm fine making the logic consistent between part_read() and
part_read_oob() if you like, but that should be done in a separate
patch IMO.

>=20
> I'm not sure if that affects your next patch at all. It's not a
> criticism of this patch either, but I just noticed it when reviewing.

Nope, because part_read() will still be used for the standard read path,
and the core will only fall back to ->_read_oob() when doing the read
on the master device.

>=20
> [...]
>=20
> I was also wondering whether this patch couldn't go a step further, and
> remove conditions like this:
>=20
> 	if (parent->_panic_write)
> 		slave->mtd._panic_write =3D part_panic_write;=20
>=20
> Since part_panic_write() should call mtd_panic_write() on the parent
> (master), which would do its own -EOPNOTSUPP check. But then I suppose
> that might invert the order of the checks, causing (for example) -EINVAL
> for out-of-bounds panic write instead of -EOPNOTSUPP. So maybe that's
> better left alone.

I considered doing that but was too lazy to check if all helpers were
properly checking the pointer value before dereferencing it :).

>=20
> Brian

[1]https://patchwork.ozlabs.org/patch/614493/
