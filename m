Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4avm-0001OO-7l
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 13:25:08 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: David Brownell <david-b@pacbell.net>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>
Date: Thu, 14 May 2009 08:24:06 -0500
Subject: RE: [PATCH 1/2] NAND: Adding new ECC mode - NAND_ECC_HW_OOB_FIRST
	for TI DaVinci devices
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C01135C316D@dlee02.ent.ti.com>
References: <1241663350-20416-1-git-send-email-nsnehaprabha@ti.com>
	<200905130203.36445.david-b@pacbell.net>
In-Reply-To: <200905130203.36445.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave,

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]
> Sent: Wednesday, May 13, 2009 5:04 AM
> To: davinci-linux-open-source@linux.davincidsp.com
> Cc: Narnakaje, Snehaprabha; linux-mtd@lists.infradead.org;
> dwmw2@infradead.org; tglx@linutronix.de; akpm@linux-foundation.org
> Subject: Re: [PATCH 1/2] NAND: Adding new ECC mode - NAND_ECC_HW_OOB_FIRS=
T
> for TI DaVinci devices
>=20
> On Wednesday 06 May 2009, nsnehaprabha@ti.com wrote:
> > From: Sneha Narnakaje <nsnehaprabha@ti.com>
> >
> > This patch adds new ECC mode NAND_ECC_HW_OOB_FIRST in the nand core to
> > support 4-bit ECC on TI DaVinci devices with large page NAND chips.
>=20
> And it seems quite straightforward too:
>=20
>   (a) add new "page" parameter to all the NAND read_page methods,
>   (b) define a new nand_read_page_hwecc_oob_first() method, and
>       kick it in for ECC_HW_OOB_FIRST
>=20
> I can't see anything going wrong with (a), though some might prefer
> to see it in a separate patch.  And (b) looks obvious too, given
> that design.


I initially thought of keeping them in separate patches, but since the reas=
on for change (a) is actually due to (b), I thought people might prefer to =
keep them together.

>=20
> Comments from any MTD folk?
>=20
>=20
> > This ECC mode is similar to NAND_ECC_HW, with the exception of read_pag=
e
> > handle that should first read the OOB area, read the data in chunks,
> feed the
> > ECC from OOB area to the ECC hw engine and perform any correction on th=
e
> data
> > as per the ECC status reported by hw engine. In order to read the OOB
> area
> > before the data area, the read_page handle has to send READOOB command
> and
> > thus the read_page/read_page_raw APIs are changed to pass the page
> argument.
> >
> > Note: This patch is dependent on [patch 2.6.30-rc1] NAND: don't walk
> past
> > end of oobfree[] from David Brownell:
> > http://lists.infradead.org/pipermail/linux-mtd/2009-April/025205.html
>=20
> ... both of which went from Andrew to David Woodhouse, and I'd
> hope they would get into the MTD queue soon.
>=20
>=20
> >
> > Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
> > ---
> >  drivers/mtd/nand/atmel_nand.c    |    2 +-
> >  drivers/mtd/nand/cafe_nand.c     |    2 +-
> >  drivers/mtd/nand/fsl_elbc_nand.c |    3 +-
> >  drivers/mtd/nand/nand_base.c     |   72
> +++++++++++++++++++++++++++++++++----
> >  drivers/mtd/nand/sh_flctl.c      |    2 +-
> >  include/linux/mtd/nand.h         |    5 ++-
> >  6 files changed, 72 insertions(+), 14 deletions(-)
> >
> > 	... snip ...
> >
> >
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > 	... deletia ...
> >
> > @@ -980,6 +980,49 @@ static int nand_read_page_hwecc(struct mtd_info
> *mtd, struct nand_chip *chip,
> >  }
> >
> >  /**
> > + * nand_read_page_hwecc_oob_first - [REPLACABLE] hw ecc, read oob firs=
t
> > + * @mtd:	mtd info structure
> > + * @chip:	nand chip info structure
> > + * @buf:	buffer to store read data
> > + *
> > + * Hardware ECC for large page chips, require OOB to be read first
>=20
> I'd explain this a bit here.  A key point is that unlike the
> ECC_HW_SYNDROME support when multiple ECC "steps" are involved,
> this doesn't clobber manufacturer bad block markings by using
> an "infix ECC" scheme:  it puts ECC data *only* into the OOB.

Will add the details here in the next patch.

>=20
>=20
> > + */
>=20
>=20
> And this is the guts of it all.  "Looks obvious":
>=20
> > +static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
> > +	struct nand_chip *chip, uint8_t *buf, int page)
> > +{
> > +	int i, eccsize =3D chip->ecc.size;
> > +	int eccbytes =3D chip->ecc.bytes;
> > +	int eccsteps =3D chip->ecc.steps;
> > +	uint8_t *p =3D buf;
> > +	uint8_t *ecc_code =3D chip->buffers->ecccode;
> > +	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> > +	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> > +
> > +	/* Read the OOB area first */
> > +	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> > +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> > +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> > +
> > +	for (i =3D 0; i < chip->ecc.total; i++)
> > +		ecc_code[i] =3D chip->oob_poi[eccpos[i]];
> > +
> > +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize) =
{
> > +		int stat;
> > +
> > +		chip->ecc.hwctl(mtd, NAND_ECC_READ);
> > +		chip->read_buf(mtd, p, eccsize);
> > +		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> > +
> > +		stat =3D chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
> > +		if (stat < 0)
> > +			mtd->ecc_stats.failed++;
> > +		else
> > +			mtd->ecc_stats.corrected +=3D stat;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/**
> >   * nand_read_page_syndrome - [REPLACABLE] hardware ecc syndrom based
> page read
> >   * @mtd:	mtd info structure
> >   * @chip:	nand chip info structure
> >
> >	... deletia ...
> >
> > @@ -2678,6 +2723,17 @@ int nand_scan_tail(struct mtd_info *mtd)
> >  	case NAND_ECC_HW3_512:
> >  	case NAND_ECC_HW3_256:
>=20
> You should reissue the patch against current GIT code.  Those two
> constants are long gone.

OK. I am assuming it is linux-mtd next.

Thanks
Sneha

>=20
>=20
> >  #endif
> > +	case NAND_ECC_HW_OOB_FIRST:
> > +		/* Similar to NAND_ECC_HW, but a separate read_page handle */
> > +		if (!chip->ecc.calculate || !chip->ecc.correct ||
> > +		     !chip->ecc.hwctl) {
> > +			printk(KERN_WARNING "No ECC functions supplied, "
> > +			       "Hardware ECC not possible\n");
> > +			BUG();
> > +		}
> > +		if (!chip->ecc.read_page)
> > +			chip->ecc.read_page =3D nand_read_page_hwecc_oob_first;
> > +
> >  	case NAND_ECC_HW:
> >  		/* Use standard hwecc read page function ? */
> >  		if (!chip->ecc.read_page)
>=20
