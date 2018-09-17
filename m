Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1qFm-0002CD-VR
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 09:55:39 +0000
Date: Mon, 17 Sep 2018 11:55:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: partitions: fix of_node_get/put balance in parser
Message-ID: <20180917115520.7cceef50@xps13>
In-Reply-To: <20180910154219.30fddb7a@bbrezillon>
References: <20180907143554.13496-1-miquel.raynal@bootlin.com>
 <20180907163824.6cec1a43@xps13>
 <20180910145312.3b9ae4ad@bbrezillon>
 <20180910151423.2944aca6@xps13>
 <20180910152551.23ffa474@bbrezillon>
 <20180910153831.0f426ada@xps13>
 <20180910154219.30fddb7a@bbrezillon>
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
15:42:19 +0200:

> On Mon, 10 Sep 2018 15:38:31 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hi Boris,
> >=20
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
> > 15:25:51 +0200:
> >  =20
> > > On Mon, 10 Sep 2018 15:14:23 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >    =20
> > > > Hi Boris,
> > > >=20
> > > > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep =
2018
> > > > 14:53:12 +0200:
> > > >      =20
> > > > > Hi Miquel,
> > > > >=20
> > > > > On Fri, 7 Sep 2018 16:38:24 +0200
> > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > > >        =20
> > > > > > Hello,
> > > > > >=20
> > > > > > I forgot to add Rafal which I know worked a lot on the parsers.
> > > > > >=20
> > > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri,  7 Sep =
2018
> > > > > > 16:35:54 +0200:
> > > > > >          =20
> > > > > > > While at first mtd_part_of_parse() would just call
> > > > > > > of_get_chil_by_name(), it has been edited to first try to get=
 the OF
> > > > > > > node thanks to mtd_get_of_node() and fallback on
> > > > > > > of_get_child_by_name().
> > > > > > >=20
> > > > > > > A of_node_put() was a bit below in the code, to balance the
> > > > > > > of_get_child_by_name(). However, despite its name, mtd_get_of=
_node()
> > > > > > > does not take a reference on the OF node.         =20
> > > > >=20
> > > > > That's probably something we should patch at some point, but that
> > > > > implies patching all mtd_get_of_node() users at the same time, so=
 let's
> > > > > keep that for later.
> > > > >=20
> > > > > BTW, if mtd_get_of_node() was actually retaining a reference, you
> > > > > would miss an of_node_put() in the !mtd_is_partition(master) case=
.       =20
> > > >=20
> > > > I think there is a misunderstanding here: mtd_get_of_node() is not
> > > > retaining a reference, and I do not think it should! It is by desig=
n a
> > > > helper to shortcut from the MTD device to the related FW node. Maybe
> > > > calling it differently than "get" would be definitely less prone to
> > > > errors. Maybe mtd_to_of_node() would be better?     =20
> > >=20
> > > Yes, the name is misleading for sure. But consistency is good, and
> > > (almost?) all DT helpers that return a device_node retain a reference
> > > to this node before returning it, so I think it would be a good thing
> > > to do the same in the MTD framework.   =20
> >=20
> > Fine by me, I'll patch all the places where it's used, but you can
> > still take this patch as a fix for now.
> >  =20
> > >=20
> > > Also, I'm not a big fan of the mtd_to_of_node() for this kind of
> > > function. It seems to imply that the mtd device is inheriting from
> > > device_node, which is not really the case, it's just an association
> > > relationship.   =20
> >=20
> > Ok
> >  =20
> > >    =20
> > > >      =20
> > > > >        =20
> > > > > > > It is a simple helper hiding
> > > > > > > some pointer logic to retrieve the OF node related to an MTD
> > > > > > > device. People often used it this way:
> > > > > > >=20
> > > > > > >     of_node_put(mtd_get_of_node(<mtd>)).         =20
> > > > >=20
> > > > > I don't get your point. Are you saying other places in the code a=
re
> > > > > doing the wrong thing? Should we fix them too?       =20
> > > >=20
> > > > No, other places are doing the right thing.     =20
> > >=20
> > > Hm, okay. Then your example is not well chosen, because you seem to p=
ut
> > > the return of mtd_get_of_node(<mtd>), which contradicts what you
> > > explain in the previous sentence. I guess somewhere in the same path =
you
> > > have an of_node_get(mtd_get_of_node(<mtd>)) which retains the referen=
ce
> > > and explains why calling of_node_put(mtd_get_of_node(<mtd>)) is
> > > required.
> > >=20
> > > Maybe you can just drop this example.   =20
> >=20
> > Mhhh. Maybe I should s/of_node_put/of_node_get/ in the example? I
> > want to show why (currently) no of_node_put() is needed after a mtd_get=
_of_node().
> >=20
> > This examples shows what people do with this helper, ie. calling
> > of_node_get() on the returned OF node to actually retain a reference
> > of the retrieve object. =20
>=20
> Or you just say that mtd_get_of_node() does not retain a reference to
> the device_node object it returns and that should be enough ;-).

Fine by me, you can apply it and modify in place. If you want a new
version, just ask.

I will soon send a patch cleaning the mtd_of_get/put() so that it does
retain a reference (as most of_ helpers do), as discussed earlier.


Thanks,
Miqu=C3=A8l
