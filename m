From: Yunhui Cui <yunhui.cui@nxp.com>
To: Han Xu <xhnjupt@gmail.com>
CC: Yunhui Cui <B56489@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode support
Date: Mon, 29 Feb 2016 03:43:36 +0000
Message-ID: <DB5PR0401MB1912E33280B6EB755144995D94BA0@DB5PR0401MB1912.eurprd04.prod.outlook.com>
References: <1454326208-4533-1-git-send-email-B56489@freescale.com>
 <1454326208-4533-3-git-send-email-B56489@freescale.com>
 <20160217180742.GB17485@shlinux2>
 <DB5PR0401MB1912C9D041FF2B408652F4CD94A60@DB5PR0401MB1912.eurprd04.prod.outlook.com>
 <20160226163145.GA2182@shlinux2.ap.freescale.net>
In-Reply-To: <20160226163145.GA2182@shlinux2.ap.freescale.net>
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

Hi Han,

But I don't think QuadSPI driver need to check the m25p,fast-read property =
again since spi-nor layer has already done that. Adding the property in fla=
sh node should work in the same way.

[Yunhui]: There are three modes in fsl-quadspi driver , fast mode, quad mod=
e, ddr quad read. The last parameter mode of spi_nor_scan() I have to speci=
fy . Otherwise, flash is still set to quad mode.
spi-nor.c:=20

1419         if (mode =3D=3D SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_REA=
D) {
1420                 ret =3D set_quad_mode(nor, info);
1421                 if (ret) {
1422                         dev_err(dev, "quad mode not supported\n");
1423                         return ret;
1424                 }
1425                 nor->flash_read =3D SPI_NOR_QUAD;
1426         } else if (mode =3D=3D SPI_NOR_DUAL && info->flags & SPI_NOR_D=
UAL_READ) {
1427                 nor->flash_read =3D SPI_NOR_DUAL;
1428         }


Thanks=20
Yunhui
-----Original Message-----
From: Han Xu [mailto:xhnjupt@gmail.com]=20
Sent: Saturday, February 27, 2016 12:32 AM
To: Yunhui Cui
Cc: Yunhui Cui; dwmw2@infradead.org; computersforpeace@gmail.com; han.xu@fr=
eescale.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-arm-kernel@lists.infradead.org; Yao Yuan
Subject: Re: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode supp=
ort

On Thu, Feb 25, 2016 at 08:07:22AM +0000, Yunhui Cui wrote:
> Hi Han,
>=20
> I have provided the options " m25p,fast-read ", because there are probabl=
e some flashes can't support quad mode.
> So we should support fast-read mode in our driver. Moreover,  There is a =
option to select fast-read mode in spi_nor.c :
>                /* If we were instantiated by DT, use it */
>                  if (of_property_read_bool(np, "m25p,fast-read"))
>                          nor->flash_read =3D SPI_NOR_FAST;

Did you have some REAL cases using SPI NOR that only supports upto fast-rea=
d with Quad SPI driver? Neither fast-read or normal-read, which is actually=
 more general, supported in the driver, just because I didn't see any REAL =
cases till now.

I didn't run against the patch, although IMO it's not that necessary. But I=
 don't think QuadSPI driver need to check the m25p,fast-read property again=
 since spi-nor layer has already done that. Adding the property in flash no=
de should work in the same way.
=20
>=20
> Thanks
> Yunhui
>=20
> -----Original Message-----
> From: Han Xu [mailto:xhnjupt@gmail.com]
> Sent: Thursday, February 18, 2016 2:08 AM
> To: Yunhui Cui
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com;=20
> han.xu@freescale.com; linux-mtd@lists.infradead.org;=20
> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;=20
> Yao Yuan
> Subject: Re: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode=20
> support
>=20
> On Mon, Feb 01, 2016 at 07:30:07PM +0800, Yunhui Cui wrote:
> > The qspi driver add generic fast-read mode for different flash=20
> > venders. There are some different board flash work on different=20
> > mode, such fast-read, quad-mode.
> > So we have to modify the third entrace parameter of spi_nor_scan().
> >=20
> > Signed-off-by: Yunhui Cui <B56489@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
> > b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 9861290..0a31cb1 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -389,11 +389,21 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
> >  	/* Read */
> >  	lut_base =3D SEQID_READ * 4;
> > =20
> > -	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
> > -			base + QUADSPI_LUT(lut_base));
> > -	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> > -		    LUT1(FSL_READ, PAD4, rxfifo),
> > -			base + QUADSPI_LUT(lut_base + 1));
> > +	if (nor->flash_read =3D=3D SPI_NOR_FAST) {
> > +		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
> > +			    LUT1(ADDR, PAD1, addrlen),
> > +				base + QUADSPI_LUT(lut_base));
> > +		qspi_writel(q,  LUT0(DUMMY, PAD1, read_dm) |
> > +			    LUT1(FSL_READ, PAD1, rxfifo),
> > +				base + QUADSPI_LUT(lut_base + 1));
> > +	} else if (nor->flash_read =3D=3D SPI_NOR_QUAD) {
> > +		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
> > +			    LUT1(ADDR, PAD1, addrlen),
> > +				base + QUADSPI_LUT(lut_base));
> > +		qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> > +			    LUT1(FSL_READ, PAD4, rxfifo),
> > +				base + QUADSPI_LUT(lut_base + 1));
> > +	}
> > =20
> >  	/* Write enable */
> >  	lut_base =3D SEQID_WREN * 4;
> > @@ -468,6 +478,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi=20
> > *q,
> > u8 cmd)  {
> >  	switch (cmd) {
> >  	case SPINOR_OP_READ_1_1_4:
> > +	case SPINOR_OP_READ_FAST:
> >  		return SEQID_READ;
> >  	case SPINOR_OP_WREN:
> >  		return SEQID_WREN;
> > @@ -963,6 +974,7 @@ static int fsl_qspi_probe(struct platform_device *p=
dev)
> >  	struct spi_nor *nor;
> >  	struct mtd_info *mtd;
> >  	int ret, i =3D 0;
> > +	enum read_mode mode =3D SPI_NOR_QUAD;
> > =20
> >  	q =3D devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
> >  	if (!q)
> > @@ -1064,7 +1076,10 @@ static int fsl_qspi_probe(struct platform_device=
 *pdev)
> >  		/* set the chip address for READID */
> >  		fsl_qspi_set_base_addr(q, nor);
> > =20
> > -		ret =3D spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> > +		ret =3D of_property_read_bool(np, "m25p,fast-read");
> > +		mode =3D (ret) ? SPI_NOR_FAST : SPI_NOR_QUAD;
> > +
> > +		ret =3D spi_nor_scan(nor, NULL, mode);
> >  		if (ret)
> >  			goto mutex_failed;
> > =20
> I understand you want to provide a more generic read mode, but this is a =
quad spi driver, I prefer to provide the options, either quad read/quad IO =
read, or just normal read.
> > --
> > 2.1.0.27.g96db324
> >=20
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
