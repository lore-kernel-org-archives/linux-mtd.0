Received: from mail-eopbgr20101.outbound.protection.outlook.com
 ([40.107.2.101] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGtFo-0004gs-6O
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 21:37:38 +0000
From: "Wan, Jane (Nokia - US/Sunnyvale)" <jane.wan@nokia.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jagdish.gediya@nxp.com"
 <jagdish.gediya@nxp.com>, "shreeya.patel23498@gmail.com"
 <shreeya.patel23498@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Bos, Ties (Nokia - US/Sunnyvale)"
 <ties.bos@nokia.com>
Subject: RE: [PATCH v5 2/2] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Date: Thu, 10 May 2018 21:37:19 +0000
Message-ID: <VI1PR07MB161596607D2DF2CE52DF01E881980@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525920400-11392-1-git-send-email-Jane.Wan@nokia.com>
 <20180510140311.02805561@bbrezillon>
In-Reply-To: <20180510140311.02805561@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I've sent v6 of the patch based on your comments.

Thanks.
Jane

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Thursday, May 10, 2018 5:03 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: miquel.raynal@bootlin.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; richard@nod.at; marek.vasut@gmail.com;
> yamada.masahiro@socionext.com; prabhakar.kushwaha@nxp.com;
> shawnguo@kernel.org; jagdish.gediya@nxp.com;
> shreeya.patel23498@gmail.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Bos, Ties (Nokia - US/Sunnyvale) <ties.bos@nokia.=
com>
> Subject: Re: [PATCH v5 2/2] mtd: rawnand: use bit-wise majority to recove=
r the
> contents of ONFI parameter
>=20
> Hi Jane,
>=20
> Subject prefix should be "[PATCH v5] ...", the 2/2 is no longer valid sin=
ce you only
> have one patch here.
>=20
> On Wed,  9 May 2018 19:46:40 -0700
> Jane Wan <Jane.Wan@nokia.com> wrote:
>=20
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
> > CRC values, the bit-wise majority may be used to recover the contents
> > of the parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> > ---
>=20
> There should be a changelog here describing what has changed in each vers=
ion
> of the patch.

[Jane] Added the changelogs in v6.

>=20
> >  drivers/mtd/nand/raw/nand_base.c |   46
> +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 41 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c
> > b/drivers/mtd/nand/raw/nand_base.c
> > index 72f3a89..a7c2507 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5086,6 +5086,34 @@ static int
> nand_flash_detect_ext_param_page(struct nand_chip *chip,
> >  	return ret;
> >  }
> >
> > +#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
>=20
> Not sure we need that macro, see below.

[Jane] Removed.

>=20
> > +
> > +/*
> > + * Recover data with bit-wise majority  */ static void
> > +nand_bit_wise_majority(const void **srcbufs,
> > +				   void *dstbuf,
> > +				   unsigned int nbufs,
> > +				   unsigned int bufsize)
>=20
> I'd prefer to have nbufs just after srcbufs and named nsrcbufs:
>=20
> static void nand_bit_wise_majority(const void **srcbufs,
> 				   unsigned int nsrcbufs,
> 				   void *dstbuf,
> 				   unsigned int bufsize)

[Jane] changed as above in v6.

>=20
> > +{
> > +	int i, j, k;
> > +	u8 v, m;
> > +	u8 *p;
> > +
> > +	p =3D *(u8 **)srcbufs;
>=20
> Nope, I'd like to support the cases where srcbufs are not contiguous, so =
that
> does not work.

[Jane] Changed as you suggested to support non-contiguous srcbufs.

>=20
> > +	for (i =3D 0; i < bufsize; i++) {
> > +		v =3D 0;
>=20
> You can declare the v variable here, since its scope is limited to the fo=
r loop.
> BTW, v, m, can't we pick better names? I guess v is for val, but I'm not =
even sure
> what m stands for.

[Jane] changed the variables to cnt and val in v6.  The "m" was for majorit=
y, now changed to cnt (counts for 1s).

>=20
> > +		for (j =3D 0; j < 8; j++) {
> > +			m =3D 0;
> > +			for (k =3D 0; k < nbufs; k++)
> > +				m +=3D GET_BIT(j, p[k*bufsize + i]);
>=20
> 			for (k =3D 0; k < nbufs; k++) {
> 				const u8 *srcbuf =3D srcbufs[j];
>=20
> 				if (srcbuf[i] & BIT(k))
> 					m++;
> 			}
>=20
> > +			if (m > nbufs/2)
>=20
> Space between operands and operators please
>=20
> 			if (m > nbufs / 2)

[Jane]  Changed as suggested in v6.  Thanks.

>=20
> > +				v |=3D BIT(j);
> > +		}
> > +		((u8 *)dstbuf)[i] =3D v;
> > +	}
> > +}
> > +
> >  /*
> >   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 oth=
erwise.
> >   */
> > @@ -5102,7 +5130,7 @@ static int nand_flash_detect_onfi(struct nand_chi=
p
> *chip)
> >  		return 0;
> >
> >  	/* ONFI chip: allocate a buffer to hold its parameter page */
> > -	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > +	p =3D kzalloc((sizeof(*p) * 3), GFP_KERNEL);
> >  	if (!p)
> >  		return -ENOMEM;
> >
> > @@ -5113,21 +5141,29 @@ static int nand_flash_detect_onfi(struct
> nand_chip *chip)
> >  	}
> >
> >  	for (i =3D 0; i < 3; i++) {
> > -		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
> > +		ret =3D nand_read_data_op(chip, &p[i], sizeof(*p), true);
> >  		if (ret) {
> >  			ret =3D 0;
> >  			goto free_onfi_param_page;
> >  		}
> >
> > -		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
> > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) =3D=3D
> >  				le16_to_cpu(p->crc)) {
> > +			if (i)
> > +				memcpy(p, &p[i], sizeof(*p));
> >  			break;
> >  		}
> >  	}
> >
> >  	if (i =3D=3D 3) {
>=20
> 		const void *srcbufs[3] =3D {p, p + 1, p + 2};
>=20
> > -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> > -		goto free_onfi_param_page;
> > +		pr_err("Could not find valid ONFI parameter page\n");
> > +		pr_info("Recover ONFI params with bit-wise majority\n");
> > +		nand_bit_wise_majority((const void **)&p, p, 3, sizeof(*p));
>=20
> 		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
> 				       sizeof(*p))

[Jane]  Changed in v6.  Thanks.

>=20
> > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=3D
> > +				le16_to_cpu(p->crc)) {
> > +			pr_err("ONFI parameter recovery failed, aborting\n");
> > +			goto free_onfi_param_page;
> > +		}
> >  	}
> >
> >  	/* Check version */
>=20
> Thanks,
>=20
> Boris
