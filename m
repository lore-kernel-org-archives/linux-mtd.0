Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGiVR-0006G5-E3
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 09:04:31 +0000
Date: Fri, 2 Jun 2017 11:04:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 andrew@lunn.ch, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170602110406.49eda282@bbrezillon>
In-Reply-To: <20170601220156.GD102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
 <20170601224712.6a81a458@bbrezillon>
 <20170601220156.GD102137@google.com>
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

On Thu, 1 Jun 2017 15:01:56 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Jun 01, 2017 at 10:47:12PM +0200, Boris Brezillon wrote:
> > Le Thu, 1 Jun 2017 11:43:40 -0700,
> > Brian Norris <computersforpeace@gmail.com> a =C3=A9crit : =20
> > > On Wed, May 17, 2017 at 05:29:11PM +0200, Boris Brezillon wrote: =20
> > > > On Wed, 17 May 2017 17:39:07 +1200
> > > > Chris Packham <chris.packham@alliedtelesis.co.nz> wrote: =20
> > > > > @@ -151,6 +152,10 @@ static int mchp23k256_probe(struct spi_devic=
e *spi)
> > > > >  	flash->mtd._read	=3D mchp23k256_read;
> > > > >  	flash->mtd._write	=3D mchp23k256_write;
> > > > > =20
> > > > > +	flash->mtd.erasesize =3D PAGE_SIZE;
> > > > > +	while (flash->mtd.size & (flash->mtd.erasesize - 1))
> > > > > +		flash->mtd.erasesize >>=3D 1;
> > > > > +   =20
> > > >=20
> > > > Can we fix allocate_partition() to properly handle the
> > > > master->erasesize =3D=3D 0 case instead of doing that?   =20
> > >=20
> > > Is everything actually ready for the eraseblock size to be 0? That wo=
uld
> > > seem surprising to many applications, I would think. Can you, for
> > > instance, even use UBI on such a device? =20
> >=20
> > Well, I think it's already broken. AFAICT this driver does not
> > implement ->_erase(), and mtd_erase() does not check if MTD_NO_ERASE is
> > set before calling mtd->_erase(), neither UBI does before calling
> > mtd_erase(). =20
>=20
> Sure.
>=20
> > Between a NULL pointer exception and a div-by-zero exception, I can't
> > decide what is better :-). =20
>=20
> Well, there are other potential problems than that. What if someone was
> iterating over the device size, by increments of erasesize? Infinite
> loop! Or what about anything that might have assumed
> 'writesize < erasesize'?

Absolutely, div-by-zero is not the only problem we can face.

>=20
> I'm mostly thinking out loud, because I'm not sure there's a really good
> way to handle this, other than stop making those assumptions.
>=20
> (A *possible* solution would be to have MTD enforce a fake erasesize for
> NO_ERASE flash, instead of making drivers do it, like Chris was trying.
> But I'm not sure that's a good one.)

Actually, by doing that we keep encouraging people to not do the right
thing :-).

>=20
> > IMO, we'd better add a check in UBI to refuse to attach a device with
> > MTD_NO_ERASE or mtd->erasesize =3D=3D 0, and fix other places that don't
> > check erasesize value instead of putting a fake erasesize and using a
> > dummy ->_erase() implementation for those devices that simply can't be
> > erased. =20
>=20
> That's probably a good idea.

I'll try to post patches soon, but they definitely won't fix all
problems. For example, we just can't catch the infinite loop issue you
are mentioning above.

>=20
> > We should also probably complain with -ENOTSUPP when someone calls
> > mtd_erase() on a device with MTD_NO_ERASE and add more checks in the
> > add_mtd_device() to detect drivers that don't have MTD_NO_ERASE set
> > and do not implement ->_erase() or leave ->erasesize to 0.  =20
>=20
> Yep.
>=20
> > > BTW, I feel like this check is a little more natural to do with
> > > 'mtd->flags & MTD_NO_ERASE', rather than checking the (apparently
> > > meaningless) erasesize. =20
> >=20
> > Fair enough. =20
>=20
> OK, well I'll take another look at v4, but that might be my only
> criticism then.
>=20
> Overall though, a "NO_ERASE" MTD makes me wonder why it's an MTD in the
> first place. I guess we're kinda the wild west of things that don't fit
> into the block subsystem...

Yes, that's exactly what the MTD subsystem is: a place where you can
put drivers for memory devices that are not block devices :-). Don't
know if it's a good thing or not, but it definitely makes MTD users
life harder.

BTW, MTD_NO_ERASE is not the only problem we have with UBI or JFFS2.
Are we guaranteed that an erase operation fills an eraseblock with
ones? Don't we have mem technologies that are filling them with zeros?
Note that mtdram is artificially setting the mem-region to 0xff in its
dummy erase operation, so maybe it's a implicit rule that ->_erase() is
supposed to fill eraseblocks with 0xff.
