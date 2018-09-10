Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzM1e-00048v-RH
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 13:14:48 +0000
Date: Mon, 10 Sep 2018 15:14:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: partitions: fix of_node_get/put balance in parser
Message-ID: <20180910151423.2944aca6@xps13>
In-Reply-To: <20180910145312.3b9ae4ad@bbrezillon>
References: <20180907143554.13496-1-miquel.raynal@bootlin.com>
 <20180907163824.6cec1a43@xps13>
 <20180910145312.3b9ae4ad@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
14:53:12 +0200:

> Hi Miquel,
>=20
> On Fri, 7 Sep 2018 16:38:24 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hello,
> >=20
> > I forgot to add Rafal which I know worked a lot on the parsers.
> >=20
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri,  7 Sep 2018
> > 16:35:54 +0200:
> >  =20
> > > While at first mtd_part_of_parse() would just call
> > > of_get_chil_by_name(), it has been edited to first try to get the OF
> > > node thanks to mtd_get_of_node() and fallback on
> > > of_get_child_by_name().
> > >=20
> > > A of_node_put() was a bit below in the code, to balance the
> > > of_get_child_by_name(). However, despite its name, mtd_get_of_node()
> > > does not take a reference on the OF node. =20
>=20
> That's probably something we should patch at some point, but that
> implies patching all mtd_get_of_node() users at the same time, so let's
> keep that for later.
>=20
> BTW, if mtd_get_of_node() was actually retaining a reference, you
> would miss an of_node_put() in the !mtd_is_partition(master) case.

I think there is a misunderstanding here: mtd_get_of_node() is not
retaining a reference, and I do not think it should! It is by design a
helper to shortcut from the MTD device to the related FW node. Maybe
calling it differently than "get" would be definitely less prone to
errors. Maybe mtd_to_of_node() would be better?

>=20
> > > It is a simple helper hiding
> > > some pointer logic to retrieve the OF node related to an MTD
> > > device. People often used it this way:
> > >=20
> > >     of_node_put(mtd_get_of_node(<mtd>)). =20
>=20
> I don't get your point. Are you saying other places in the code are
> doing the wrong thing? Should we fix them too?

No, other places are doing the right thing. I think if the helper was
named "mtd_to_of_node()" that would be much clearer for everyone and
of_node_get(mtd_to_of_node(mtd)) would be the way to retain a reference
on the OF node.

I don't think creating a helper for that would be better because I
really prefer seeing the of_node_get() in the code, meaning an
of_node_put() will be needed at some point.

>=20
> > >=20
> > > The direct effect of such unbalanced reference counting is visible by
> > > rmmod'ing any module that would have added MTD partitions:
> > >=20
> > >     OF: ERROR: Bad of_node_put() on <of_path_to_partition>
> > >=20
> > > As it seems normal to get a reference on the OF node during the
> > > of_property_for_each_string() that follows, add a call to
> > > of_node_get() when relevant.
> > >=20
> > > Fixes: 76a832254ab0 ("mtd: partitions: use DT info for parsing partit=
ions with "compatible" prop")
> > > Cc: stable@vger.kernel.org =20
>=20
> You can drop the above line since this patch is fixing a bug introduced
> in 4.19-rc1.

Right!

>=20
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/mtdpart.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > > index 52e2cb35fc79..99c460facd5e 100644
> > > --- a/drivers/mtd/mtdpart.c
> > > +++ b/drivers/mtd/mtdpart.c
> > > @@ -873,8 +873,11 @@ static int mtd_part_of_parse(struct mtd_info *ma=
ster,
> > >  	int ret, err =3D 0;
> > > =20
> > >  	np =3D mtd_get_of_node(master);
> > > -	if (!mtd_is_partition(master))
> > > +	if (mtd_is_partition(master))
> > > +		of_node_get(np);
> > > +	else
> > >  		np =3D of_get_child_by_name(np, "partitions");
> > > +
> > >  	of_property_for_each_string(np, "compatible", prop, compat) {
> > >  		parser =3D mtd_part_get_compatible_parser(compat);
> > >  		if (!parser)   =20
>=20
> The patch itself looks correct, but I'd like some clarification about
> the commit message before applying it.
>=20
> Thanks,
>=20
> Boris
>=20

Thanks,
Miqu=C3=A8l
