Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIUU4-00087o-4J
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 07:34:58 +0000
Date: Tue, 15 May 2018 09:34:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Moore <moore@free.fr>
Cc: "Wan, Jane (Nokia - US/Sunnyvale)" <jane.wan@nokia.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jagdish.gediya@nxp.com"
 <jagdish.gediya@nxp.com>, "shreeya.patel23498@gmail.com"
 <shreeya.patel23498@gmail.com>, "Bos, Ties \(Nokia - US/Sunnyvale\)"
 <ties.bos@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
Message-ID: <20180515093429.34902670@bbrezillon>
In-Reply-To: <ce0c8d75-b02a-cad0-7198-ffbd503427ce@free.fr>
References: <VI1PR07MB1615A02B23D992E84A3B333F819D0@VI1PR07MB1615.eurprd07.prod.outlook.com>
 <ce0c8d75-b02a-cad0-7198-ffbd503427ce@free.fr>
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

On Tue, 15 May 2018 06:45:51 +0200
Chris Moore <moore@free.fr> wrote:

> Hi,
>=20
> Le 13/05/2018 =C3=A0 06:30, Wan, Jane (Nokia - US/Sunnyvale) a =C3=A9crit=
=C2=A0:
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid =
CRC values, the bit-wise majority may be used to recover the contents of th=
e parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
> > ---
> > v7: change debug print messages
> > v6: support the cases that srcbufs are not contiguous
> > v5: make the bit-wise majority functon generic
> > v4: move the bit-wise majority code in a separate function
> > v3: fix warning message detected by kbuild test robot
> > v2: rebase the changes on top of v4.17-rc1
> >  =20
> > drivers/mtd/nand/raw/nand_base.c |   50 +++++++++++++++++++++++++++++++=
+++----
> >   1 file changed, 45 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/na=
nd_base.c
> > index 72f3a89..b43b784 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5087,6 +5087,35 @@ static int nand_flash_detect_ext_param_page(stru=
ct nand_chip *chip,
> >   }
> >  =20
> >   /*
> > + * Recover data with bit-wise majority
> > + */
> > +static void nand_bit_wise_majority(const void **srcbufs,
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
> >    * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 ot=
herwise.
> >    */
> >   static int nand_flash_detect_onfi(struct nand_chip *chip)
> > @@ -5102,7 +5131,7 @@ static int nand_flash_detect_onfi(struct nand_chi=
p *chip)
> >   		return 0;
> >  =20
> >   	/* ONFI chip: allocate a buffer to hold its parameter page */
> > -	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > +	p =3D kzalloc((sizeof(*p) * 3), GFP_KERNEL);
> >   	if (!p)
> >   		return -ENOMEM;
> >  =20
> > @@ -5113,21 +5142,32 @@ static int nand_flash_detect_onfi(struct nand_c=
hip *chip)
> >   	}
> >  =20
> >   	for (i =3D 0; i < 3; i++) {
> > -		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
> > +		ret =3D nand_read_data_op(chip, &p[i], sizeof(*p), true);
> >   		if (ret) {
> >   			ret =3D 0;
> >   			goto free_onfi_param_page;
> >   		}
> >  =20
> > -		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
> > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) =3D=3D
> >   				le16_to_cpu(p->crc)) {
> > +			if (i)
> > +				memcpy(p, &p[i], sizeof(*p));
> >   			break;
> >   		}
> >   	}
> >  =20
> >   	if (i =3D=3D 3) {
> > -		pr_err("Could not find valid ONFI parameter page; aborting\n");
> > -		goto free_onfi_param_page;
> > +		const void *srcbufs[3] =3D {p, p + 1, p + 2};
> > +
> > +		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise=
 majority to recover it\n");
> > +		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
> > +				       sizeof(*p));
> > +
> > +		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=3D
> > +				le16_to_cpu(p->crc)) {
> > +			pr_err("ONFI parameter recovery failed, aborting\n");
> > +			goto free_onfi_param_page;
> > +		}
> >   	}
> >  =20
> >   	/* Check version */ =20
>=20
> This version is still hard coded for a three sample bitwise majority vote.
> So why not use the method which I suggested previously for v2 and which=20
> I repeat below?

Because I want the nand_bit_wise_majority() function to work with
nsrcbufs > 3 (the ONFI spec says there's at least 3 copy of the param
page, but NAND vendor can decide to put more). Also, if the X copies of
the PARAM are corrupted (which is rather unlikely), that means we
already spent quite a lot of time reading the different copies and
calculating the CRC, so I think we don't care about perf optimizations
when doing bit-wise majority.

>=20
> The three sample bitwise majority can be implemented without bit level=20
> manipulation using the identity:
> majority3(a, b, c) =3D (a & b) | (a & c) | (b & c)
> This can be factorized slightly to (a & (b | c)) | (b & c)
> This enables the operation to be performed 8, 16, 32 or even 64 bits at=20
> a time depending on the hardware.
>=20
> This method is not only faster and but also more compact.
>=20
> Cheers,
> Chris
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
