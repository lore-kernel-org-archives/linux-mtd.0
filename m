Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9x6P-000082-It
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2018 18:19:15 +0000
Date: Sat, 21 Apr 2018 20:19:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Uniform way to pass a NAND ID table to the core
Message-ID: <20180421201900.6c6e4a33@xps13>
In-Reply-To: <20180327091737.7d09b189@bbrezillon>
References: <20180321131235.9822-1-miquel.raynal@bootlin.com>
 <20180327091737.7d09b189@bbrezillon>
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

On Tue, 27 Mar 2018 09:17:37 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Hi Miquel,
>=20
> On Wed, 21 Mar 2018 14:12:33 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Hello,
> >=20
> > As part of the work of migrating all the drivers to nand_scan(), and
> > because nand_scan() does not provide a way to pass any ID table, create
> > a field in NAND chip so a controller driver can expose its ID table to
> > the core through it and stop using the last parameter of
> > nand_scan_ident() for that. =20
>=20
> I'm not a big fan of adding yet another field to the nand_chip struct.
> Could we instead create a nand_scan_with_ids() function that takes an
> extra ID table in argument and then make nand_scan() a wrapper around
> this new function?
>=20
> int nand_scan_with_ids(struct mtd_info *mtd, int max_chips,
> 		       struct nand_flash_dev *ids);
>=20
> static inline int nand_scan(struct mtd_info *mtd, int max_chips)
> {
> 	return nand_scan_with_ids(mtd, max_chips, NULL);
> }

Sure I can do that, but I found too impacting the fact that we should
patch all the drivers to call nand_scan_with_ids() from your example.

I added another exported function called nand_scan_with_ids() but
nand_scan() is still visible so that I only have to patch one driver.

You'll tell me what you think.

Thanks,
Miqu=C3=A8l

>=20
> Regards,
>=20
> Boris
>=20
> >=20
> > Apply this to the sm_common driver which is the only one that actually
> > provides its own ID table, so there is no remaining driver using this
> > third parameter, so all can be moved easily to nand_scan() in a next
> > series.
> >=20
> > Thanks,
> > Miqu=C3=A8l
> >=20
> > Miquel Raynal (2):
> >   mtd: rawnand: add a field in nand_chip to fill an array of IDs
> >   mtd: rawnand: sm_common: make use of the new flash_ids table entry
> >=20
> >  drivers/mtd/nand/raw/nand_base.c | 8 ++++++--
> >  drivers/mtd/nand/raw/sm_common.c | 5 +++--
> >  include/linux/mtd/rawnand.h      | 3 +++
> >  3 files changed, 12 insertions(+), 4 deletions(-)
> >  =20
>=20
>=20
>=20



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
