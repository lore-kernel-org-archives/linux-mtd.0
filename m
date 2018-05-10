Received: from mail-db5eur01on0124.outbound.protection.outlook.com
 ([104.47.2.124] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGbgm-000833-3d
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 02:52:17 +0000
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
Subject: RE: [PATCH v4 2/2] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Date: Thu, 10 May 2018 02:52:01 +0000
Message-ID: <VI1PR07MB1615E6A80F9EB20DCCABE2DC81980@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525814394-30067-1-git-send-email-Jane.Wan@nokia.com>
 <1525814394-30067-2-git-send-email-Jane.Wan@nokia.com>
 <20180509161928.149a42a7@bbrezillon>
In-Reply-To: <20180509161928.149a42a7@bbrezillon>
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

I've sent v5 of the patch based on your comment.

Thanks.
Jane

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, May 09, 2018 7:19 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: miquel.raynal@bootlin.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; richard@nod.at; marek.vasut@gmail.com;
> yamada.masahiro@socionext.com; prabhakar.kushwaha@nxp.com;
> shawnguo@kernel.org; jagdish.gediya@nxp.com;
> shreeya.patel23498@gmail.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Bos, Ties (Nokia - US/Sunnyvale) <ties.bos@nokia.=
com>
> Subject: Re: [PATCH v4 2/2] mtd: rawnand: use bit-wise majority to recove=
r the
> contents of ONFI parameter
>=20
> On Tue,  8 May 2018 14:19:54 -0700
> Jane Wan <Jane.Wan@nokia.com> wrote:
>=20
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
> > CRC values, the bit-wise majority may be used to recover the contents
> > of the parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |   49
> ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c
> > b/drivers/mtd/nand/raw/nand_base.c
> > index 72f3a89..dfc341c 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5086,6 +5086,38 @@ static int
> nand_flash_detect_ext_param_page(struct nand_chip *chip,
> >  	return ret;
> >  }
> >
> > +#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
> > +
> > +/*
> > + * Recover NAND parameter page with bit-wise majority  */ static int
> > +onfi_recover_param(struct nand_onfi_params *p, int pages)
>=20
> I had something more generic in mind:
>=20
> static void nand_bit_wise_majority(const void **srcbufs,
> 				   void *dstbuf,
> 				   unsigned int nbufs,
> 				   unsigned int bufsize)
> {
> 	...
> }
>=20
> And then you do the crc check in nand_flash_detect_onfi().
>=20
> The reason I'm asking that is because I'm almost sure we'll re-use this f=
unctions
> for extended param pages, and also for vendor specific data (we already h=
ave a
> byte-wise majority check in the hynix driver, so I wouldn't be surprised =
if other
> vendors decided to use a bit-wise approach for some of their OTP area).

[Jane] Modified the function as suggested in v5.

>=20
> > +{
> > +	int i, j, k;
> > +	u8 v, m;
> > +	u8 *buf;
> > +
> > +	buf =3D (u8 *)p;
> > +	for (i =3D 0; i < sizeof(*p); i++) {
> > +		v =3D 0;
> > +		for (j =3D 0; j < 8; j++) {
> > +			m =3D 0;
> > +			for (k =3D 0; k < pages; k++)
> > +				m +=3D GET_BIT(j, buf[k*sizeof(*p) + i]);
> > +			if (m > pages/2)
> > +				v |=3D BIT(j);
> > +		}
> > +		((u8 *)p)[i] =3D v;
> > +	}
> > +
> > +	if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) =3D=3D
> > +			le16_to_cpu(p->crc)) {
> > +		return 1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 oth=
erwise.
> >   */
> > @@ -5102,7 +5134,7 @@ static int nand_flash_detect_onfi(struct nand_chi=
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
> > @@ -5113,21 +5145,28 @@ static int nand_flash_detect_onfi(struct
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
> > -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> > -		goto free_onfi_param_page;
> > +		pr_err("Could not find valid ONFI parameter page\n");
> > +		pr_info("Recover ONFI params with bit-wise majority\n");
> > +		ret =3D onfi_recover_param(p, 3);
> > +		if (ret =3D=3D 0) {
> > +			pr_err("ONFI parameter recovery failed, aborting\n");
> > +			goto free_onfi_param_page;
> > +		}
> >  	}
> >
> >  	/* Check version */
