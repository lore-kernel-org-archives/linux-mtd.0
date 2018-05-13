Received: from mail-eopbgr20128.outbound.protection.outlook.com
 ([40.107.2.128] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHinf-0003AY-16
 for linux-mtd@lists.infradead.org; Sun, 13 May 2018 04:40:00 +0000
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
Subject: RE: [PATCH v6] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Date: Sun, 13 May 2018 04:39:42 +0000
Message-ID: <VI1PR07MB1615A4F4FAF56D8064F173AA819D0@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525987717-31675-1-git-send-email-Jane.Wan@nokia.com>
 <20180512102040.3e5c2cbe@bbrezillon>
In-Reply-To: <20180512102040.3e5c2cbe@bbrezillon>
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

I've sent v7 of the patch.

Thanks.
Jane

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Saturday, May 12, 2018 1:21 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: miquel.raynal@bootlin.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; richard@nod.at; marek.vasut@gmail.com;
> yamada.masahiro@socionext.com; prabhakar.kushwaha@nxp.com;
> shawnguo@kernel.org; jagdish.gediya@nxp.com;
> shreeya.patel23498@gmail.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Bos, Ties (Nokia - US/Sunnyvale) <ties.bos@nokia.=
com>
> Subject: Re: [PATCH v6] mtd: rawnand: use bit-wise majority to recover th=
e
> contents of ONFI parameter
>=20
> On Thu, 10 May 2018 14:28:37 -0700
> Jane Wan <Jane.Wan@nokia.com> wrote:
>=20
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
> > CRC values, the bit-wise majority may be used to recover the contents
> > of the parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> > ---
> > v6: support the cases that srcbufs are not contiguous
> > v5: make the bit-wise majority functon generic
> > v4: move the bit-wise majority code in a separate function
> > v3: fix warning message detected by kbuild test robot
> > v2: rebase the changes on top of v4.17-rc1
> >
> >  drivers/mtd/nand/raw/nand_base.c |   52
> ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 47 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c
> > b/drivers/mtd/nand/raw/nand_base.c
> > index 72f3a89..acf905c 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5087,6 +5087,35 @@ static int
> > nand_flash_detect_ext_param_page(struct nand_chip *chip,  }
> >
> >  /*
> > + * Recover data with bit-wise majority  */ static void
> > +nand_bit_wise_majority(const void **srcbufs,
> > +				   unsigned int nsrcbufs,
> > +				   void *dstbuf,
> > +				   unsigned int bufsize)
> > +{
> > +	int i, j, k;
> > +
> > +	for (i =3D 0; i < bufsize; i++) {
> > +		u8 cnt, val;
> > +
> > +		val =3D 0;
> > +		for (j =3D 0; j < 8; j++) {
> > +			cnt =3D 0;
> > +			for (k =3D 0; k < nsrcbufs; k++) {
> > +				const u8 *srcbuf =3D srcbufs[k];
> > +
> > +				if (srcbuf[i] & BIT(j))
> > +					cnt++;
> > +			}
> > +			if (cnt > nsrcbufs / 2)
> > +				val |=3D BIT(j);
> > +		}
> > +		((u8 *)dstbuf)[i] =3D val;
> > +	}
> > +}
> > +
> > +/*
> >   * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 oth=
erwise.
> >   */
> >  static int nand_flash_detect_onfi(struct nand_chip *chip) @@ -5102,7
> > +5131,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
> >  		return 0;
> >
> >  	/* ONFI chip: allocate a buffer to hold its parameter page */
> > -	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > +	p =3D kzalloc((sizeof(*p) * 3), GFP_KERNEL);
> >  	if (!p)
> >  		return -ENOMEM;
> >
> > @@ -5113,21 +5142,34 @@ static int nand_flash_detect_onfi(struct
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
> > +		const void *srcbufs[3] =3D {p, p + 1, p + 2};
> > +
> > +		pr_err("Could not find valid ONFI parameter page\n");
>=20
> Maybe pr_warn() here
>=20
> > +		pr_info("Recover ONFI params with bit-wise majority\n");
>=20
> and maybe you can pack the 2 messages:
>=20
> 		pr_warn("Could not find a valid ONFI parameter page, trying
> bit-wise majority to recover it");

[Jane] Changed as suggested.

>=20
> > +
> > +		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
> > +				       sizeof(*p));
> > +
> > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=3D
> > +				le16_to_cpu(p->crc)) {
> > +			pr_err("ONFI parameter recovery failed, aborting\n");
> > +			goto free_onfi_param_page;
> > +		}
> >  	}
> >
> >  	/* Check version */
