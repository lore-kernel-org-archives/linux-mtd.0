Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGX0J-0006Xh-D6
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 20:47:37 +0000
Date: Thu, 1 Jun 2017 22:47:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 andrew@lunn.ch, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170601224712.6a81a458@bbrezillon>
In-Reply-To: <20170601184340.GA102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
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

Le Thu, 1 Jun 2017 11:43:40 -0700,
Brian Norris <computersforpeace@gmail.com> a =C3=A9crit :

> On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote:
> > Hi Chris,
> >=20
> > On Wed, 17 May 2017 17:39:07 +1200
> > Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> >  =20
> > > Setting the of_node for the mtd device allows the generic mtd code to
> > > setup the partitions. Additionally we must specify a non-zero erasesi=
ze
> > > for the partitions to be writeable.
> > >=20
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > ---
> > >  drivers/mtd/devices/mchp23k256.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/m=
chp23k256.c
> > > index 2542f5b8b63f..02c6b9dcbd3e 100644
> > > --- a/drivers/mtd/devices/mchp23k256.c
> > > +++ b/drivers/mtd/devices/mchp23k256.c
> > > @@ -143,6 +143,7 @@ static int mchp23k256_probe(struct spi_device *sp=
i)
> > > =20
> > >  	data =3D dev_get_platdata(&spi->dev);
> > > =20
> > > +	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
> > >  	flash->mtd.dev.parent	=3D &spi->dev;
> > >  	flash->mtd.type		=3D MTD_RAM;
> > >  	flash->mtd.flags	=3D MTD_CAP_RAM;
> > > @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_device *s=
pi)
> > >  	flash->mtd._read	=3D mchp23k256_read;
> > >  	flash->mtd._write	=3D mchp23k256_write;
> > > =20
> > > +	flash->mtd.erasesize =3D PAGE_SIZE;
> > > +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> > > +		flash->mtd.erasesize >>=3D 1;
> > > + =20
> >=20
> > Can we fix allocate_partition() to properly handle the
> > master->erasesize =3D=3D 0 case instead of doing that? =20
>=20
> Is everything actually ready for the eraseblock size to be 0? That would
> seem surprising to many applications, I would think. Can you, for
> instance, even use UBI on such a device?

Well, I think it's already broken. AFAICT this driver does not
implement ->_erase(), and mtd_erase() does not check if MTD_NO_ERASE is
set before calling mtd->_erase(), neither UBI does before calling
mtd_erase().

Between a NULL pointer exception and a div-by-zero exception, I can't
decide what is better :-).

IMO, we'd better add a check in UBI to refuse to attach a device with
MTD_NO_ERASE or mtd->erasesize =3D=3D 0, and fix other places that don't
check erasesize value instead of putting a fake erasesize and using a
dummy ->_erase() implementation for those devices that simply can't be
erased.

We should also probably complain with -ENOTSUPP when someone calls
mtd_erase() on a device with MTD_NO_ERASE and add more checks in the
add_mtd_device() to detect drivers that don't have MTD_NO_ERASE set
and do not implement ->_erase() or leave ->erasesize to 0.=20

>=20
> BTW, I feel like this check is a little more natural to do with
> 'mtd->flags & MTD_NO_ERASE', rather than checking the (apparently
> meaningless) erasesize.

Fair enough.
