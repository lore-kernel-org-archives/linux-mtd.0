Received: from mail-he1eur01on0116.outbound.protection.outlook.com
 ([104.47.0.116] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGA8F-0000qF-3c
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 21:26:48 +0000
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
Subject: RE: [PATCH v3 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority to
 recover the contents of ONFI parameter
Date: Tue, 8 May 2018 21:26:31 +0000
Message-ID: <VI1PR07MB1615C323E5C3404A14D5A734819A0@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525710855-8159-1-git-send-email-Jane.Wan@nokia.com>
 <20180508110858.7b1432f5@bbrezillon>
In-Reply-To: <20180508110858.7b1432f5@bbrezillon>
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

I've sent v4 of the patches based on the comments.

Thanks.
Jane

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Tuesday, May 08, 2018 2:09 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: miquel.raynal@bootlin.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; richard@nod.at; marek.vasut@gmail.com;
> yamada.masahiro@socionext.com; prabhakar.kushwaha@nxp.com;
> shawnguo@kernel.org; jagdish.gediya@nxp.com;
> shreeya.patel23498@gmail.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Bos, Ties (Nokia - US/Sunnyvale) <ties.bos@nokia.=
com>
> Subject: Re: [PATCH v3 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority =
to
> recover the contents of ONFI parameter
>=20
> On Mon,  7 May 2018 09:34:15 -0700
> Jane Wan <Jane.Wan@nokia.com> wrote:
>=20
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
> > CRC values, the bit-wise majority may be used to recover the contents
> > of the parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
>=20
> I never received patch 1 of this series. When you fix something in a comm=
it,
> please resend the whole patchset, even if other patches haven't changed.

 [Jane] Thanks for the info.  I've sent both patches on v4.

>=20
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |   41
> ++++++++++++++++++++++++++++++--------
> >  1 file changed, 33 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c
> > b/drivers/mtd/nand/raw/nand_base.c
> > index 72f3a89..48f2dec 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5086,15 +5086,18 @@ static int
> nand_flash_detect_ext_param_page(struct nand_chip *chip,
> >  	return ret;
> >  }
> >
> > +#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
> > +
> >  /*
> >   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 oth=
erwise.
> >   */
> >  static int nand_flash_detect_onfi(struct nand_chip *chip)  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > -	struct nand_onfi_params *p;
> > +	struct nand_onfi_params *p =3D NULL;
> >  	char id[4];
> > -	int i, ret, val;
> > +	int i, ret, val, pagesize;
> > +	u8 *buf =3D NULL;
> >
> >  	/* Try ONFI for unknown chip or LP */
> >  	ret =3D nand_readid_op(chip, 0x20, id, sizeof(id)); @@ -5102,8 +5105,=
9
> > @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
> >  		return 0;
> >
> >  	/* ONFI chip: allocate a buffer to hold its parameter page */
> > -	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > -	if (!p)
> > +	pagesize =3D sizeof(*p);
> > +	buf =3D kzalloc((pagesize * 3), GFP_KERNEL);
>=20
> Not sure why you have to add a new buf variable here, and pagesize is not
> needed either, just use sizeof(*p) directly.

[Jane] Removed buf in v4.

>=20
> > +	if (!buf)
> >  		return -ENOMEM;
> >
> >  	ret =3D nand_read_param_page_op(chip, 0, NULL, 0); @@ -5113,7
> +5117,8
> > @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
> >  	}
> >
> >  	for (i =3D 0; i < 3; i++) {
> > -		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
> > +		p =3D (struct nand_onfi_params *)&buf[i*pagesize];
> > +		ret =3D nand_read_data_op(chip, p, pagesize, true);
> >  		if (ret) {
> >  			ret =3D 0;
> >  			goto free_onfi_param_page;
> > @@ -5126,8 +5131,27 @@ static int nand_flash_detect_onfi(struct nand_ch=
ip
> *chip)
> >  	}
> >
> >  	if (i =3D=3D 3) {
> > -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> > -		goto free_onfi_param_page;
> > +		int j, k, l;
> > +		u8 v, m;
> > +
> > +		pr_err("Could not find valid ONFI parameter page\n");
> > +		pr_info("Recover ONFI params with bit-wise majority\n");
> > +		for (j =3D 0; j < pagesize; j++) {
> > +			v =3D 0;
> > +			for (k =3D 0; k < 8; k++) {
> > +				m =3D 0;
> > +				for (l =3D 0; l < 3; l++)
> > +					m +=3D GET_BIT(k, buf[l*pagesize + j]);
> > +				if (m > 1)
> > +					v |=3D BIT(k);
> > +			}
> > +			((u8 *)p)[j] =3D v;
> > +		}
>=20
> Can you move the bit-wise majority code in a separate function?

[Jane] Done as suggested in v4.

>=20
> > +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) !=3D
> > +				le16_to_cpu(p->crc)) {
> > +			pr_err("ONFI parameter recovery failed, aborting\n");
> > +			goto free_onfi_param_page;
> > +		}
> >  	}
> >
> >  	/* Check version */
> > @@ -5220,7 +5244,8 @@ static int nand_flash_detect_onfi(struct nand_chi=
p
> *chip)
> >  	       sizeof(p->vendor));
> >
> >  free_onfi_param_page:
> > -	kfree(p);
> > +	if (buf !=3D NULL)
> > +		kfree(buf);
>=20
> kfree() already handles the buf =3D=3D NULL case, no need to check it her=
e.

[Jane]  Removed the check.  Thanks.
=20
>=20
> >  	return ret;
> >  }
> >
