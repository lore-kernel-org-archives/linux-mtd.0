Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1e3S-0006ub-MR
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 20:21:52 +0000
Date: Thu, 29 Mar 2018 22:21:38 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: update documentation of mtd_device_parse_register()
Message-ID: <20180329222138.3612c5f1@bbrezillon>
In-Reply-To: <11374740.7K3gF4UMb0@blindfold>
References: <20180327133647.15110-1-zajec5@gmail.com>
 <11374740.7K3gF4UMb0@blindfold>
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

On Tue, 27 Mar 2018 21:18:14 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am Dienstag, 27. M=C3=A4rz 2018, 15:36:47 CEST schrieb Rafa=C5=82 Mi=C5=
=82ecki:
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > In the commit 2c77c57d22adb ("mtd: move code adding master MTD out of
> > mtd_add_device_partitions()") behavior of mtd_device_parse_register()
> > has very slightly changed. It's a pretty non-significant order change
> > to match updated function behavior.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied.

Thanks,

Boris

> > ---
> >  drivers/mtd/mtdcore.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index f25d65ea7149..20d5262c5b5c 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -673,14 +673,13 @@ static void mtd_set_dev_defaults(struct mtd_info =
*mtd)
> >   * 'parse_mtd_partitions()') and MTD device and partitions registering=
. It
> >   * basically follows the most common pattern found in many MTD drivers:
> >   *
> > - * * It first tries to probe partitions on MTD device @mtd using parse=
rs
> > + * * If the MTD_PARTITIONED_MASTER option is set, then the device as a=
 whole is
> > + *   registered first.
> > + * * Then It tries to probe partitions on MTD device @mtd using parsers
> >   *   specified in @types (if @types is %NULL, then the default list of=
 parsers
> >   *   is used, see 'parse_mtd_partitions()' for more information). If n=
one are
> >   *   found this functions tries to fallback to information specified in
> >   *   @parts/@nr_parts.
> > - * * If any partitioning info was found, this function registers the f=
ound
> > - *   partitions. If the MTD_PARTITIONED_MASTER option is set, then the=
 device
> > - *   as a whole is registered first.
> >   * * If no partitions were found this function just registers the MTD =
device
> >   *   @mtd and exits.
> >   *
> >  =20
>=20
> Thanks for taking care of docs. :-)
>=20
> Reviewed-by: Richard Weinberger <richard@nod.at>
>=20
> Thanks,
> //richard
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
