Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGHJ-0004f4-Rp
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:16:03 +0000
Date: Thu, 19 Jul 2018 23:15:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/7] mtd: rawnand: Expose _notsupp() helpers for raw
 page accessors
Message-ID: <20180719231539.0f519cc5@xps13>
In-Reply-To: <20180719112217.592b6484@bbrezillon>
References: <20180718084221.27821-1-boris.brezillon@bootlin.com>
 <20180718084221.27821-3-boris.brezillon@bootlin.com>
 <20180719112217.592b6484@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
11:22:17 +0200:

> On Wed, 18 Jul 2018 10:42:17 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>=20
> > Some implementations simply can't disable their ECC engine. Expose
> > helpers returning -ENOTSUPP so that the caller knows that raw accesses
> > are not supported instead of silently falling back to non-raw
> > accessors.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 33 +++++++++++++++++++++++++++++++++
> >  include/linux/mtd/rawnand.h      |  4 ++++
> >  2 files changed, 37 insertions(+)
> >=20
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/na=
nd_base.c
> > index 4fa5e20d9690..323a900f3697 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -2966,6 +2966,23 @@ int nand_check_erased_ecc_chunk(void *data, int =
datalen,
> >  }
> >  EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
> > =20
> > +/**
> > + * nand_read_page_raw_notsupp - dummy read raw page function
> > + * @mtd: mtd info structure
> > + * @chip: nand chip info structure
> > + * @buf: buffer to store read data
> > + * @oob_required: caller requires OOB data read to chip->oob_poi
> > + * @page: page number to read
> > + *
> > + * Returns -ENOTSUPP unconditionally.
> > + */
> > +int nand_read_page_raw_notsupp(struct mtd_info *mtd, struct nand_chip =
*chip,
> > +			       u8 *buf, int oob_required, int page)
> > +{
> > +	return -ENOTSUPP;
> > +}
> > +EXPORT_SYMBOL(nand_read_page_raw_notsupp);
> > +
> >  /**
> >   * nand_read_page_raw - [INTERN] read raw page data without ecc
> >   * @mtd: mtd info structure
> > @@ -3960,6 +3977,22 @@ static int nand_read_oob(struct mtd_info *mtd, l=
off_t from,
> >  	return ret;
> >  }
> > =20
> > +/**
> > + * nand_write_page_raw - dummy raw page write function =20
>=20
> Crap, I forgot to add the _notsupp suffix in the doc.

Suffix "_notsupp" added.

Miqu=C3=A8l
