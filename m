From: Yunhui Cui <yunhui.cui@nxp.com>
To: Han Xu <xhnjupt@gmail.com>, Yunhui Cui <B56489@freescale.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode support
Date: Thu, 25 Feb 2016 08:07:22 +0000
Message-ID: <DB5PR0401MB1912C9D041FF2B408652F4CD94A60@DB5PR0401MB1912.eurprd04.prod.outlook.com>
References: <1454326208-4533-1-git-send-email-B56489@freescale.com>
 <1454326208-4533-3-git-send-email-B56489@freescale.com>
 <20160217180742.GB17485@shlinux2>
In-Reply-To: <20160217180742.GB17485@shlinux2>
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

I have provided the options " m25p,fast-read ", because there are probable =
some flashes can't support quad mode.
So we should support fast-read mode in our driver. Moreover,  There is a op=
tion to select fast-read mode in spi_nor.c :
               /* If we were instantiated by DT, use it */
                 if (of_property_read_bool(np, "m25p,fast-read"))
                         nor->flash_read =3D SPI_NOR_FAST;

Thanks
Yunhui

-----Original Message-----
From: Han Xu [mailto:xhnjupt@gmail.com]=20
Sent: Thursday, February 18, 2016 2:08 AM
To: Yunhui Cui
Cc: dwmw2@infradead.org; computersforpeace@gmail.com; han.xu@freescale.com;=
 linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; linux-arm-ker=
nel@lists.infradead.org; Yao Yuan
Subject: Re: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode supp=
ort

On Mon, Feb 01, 2016 at 07:30:07PM +0800, Yunhui Cui wrote:
> The qspi driver add generic fast-read mode for different flash=20
> venders. There are some different board flash work on different mode,=20
> such fast-read, quad-mode.
> So we have to modify the third entrace parameter of spi_nor_scan().
>=20
> Signed-off-by: Yunhui Cui <B56489@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c=20
> b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 9861290..0a31cb1 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -389,11 +389,21 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	/* Read */
>  	lut_base =3D SEQID_READ * 4;
> =20
> -	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
> -			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> -		    LUT1(FSL_READ, PAD4, rxfifo),
> -			base + QUADSPI_LUT(lut_base + 1));
> +	if (nor->flash_read =3D=3D SPI_NOR_FAST) {
> +		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
> +			    LUT1(ADDR, PAD1, addrlen),
> +				base + QUADSPI_LUT(lut_base));
> +		qspi_writel(q,  LUT0(DUMMY, PAD1, read_dm) |
> +			    LUT1(FSL_READ, PAD1, rxfifo),
> +				base + QUADSPI_LUT(lut_base + 1));
> +	} else if (nor->flash_read =3D=3D SPI_NOR_QUAD) {
> +		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
> +			    LUT1(ADDR, PAD1, addrlen),
> +				base + QUADSPI_LUT(lut_base));
> +		qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> +			    LUT1(FSL_READ, PAD4, rxfifo),
> +				base + QUADSPI_LUT(lut_base + 1));
> +	}
> =20
>  	/* Write enable */
>  	lut_base =3D SEQID_WREN * 4;
> @@ -468,6 +478,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q,=20
> u8 cmd)  {
>  	switch (cmd) {
>  	case SPINOR_OP_READ_1_1_4:
> +	case SPINOR_OP_READ_FAST:
>  		return SEQID_READ;
>  	case SPINOR_OP_WREN:
>  		return SEQID_WREN;
> @@ -963,6 +974,7 @@ static int fsl_qspi_probe(struct platform_device *pde=
v)
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	int ret, i =3D 0;
> +	enum read_mode mode =3D SPI_NOR_QUAD;
> =20
>  	q =3D devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>  	if (!q)
> @@ -1064,7 +1076,10 @@ static int fsl_qspi_probe(struct platform_device *=
pdev)
>  		/* set the chip address for READID */
>  		fsl_qspi_set_base_addr(q, nor);
> =20
> -		ret =3D spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		ret =3D of_property_read_bool(np, "m25p,fast-read");
> +		mode =3D (ret) ? SPI_NOR_FAST : SPI_NOR_QUAD;
> +
> +		ret =3D spi_nor_scan(nor, NULL, mode);
>  		if (ret)
>  			goto mutex_failed;
> =20
I understand you want to provide a more generic read mode, but this is a qu=
ad spi driver, I prefer to provide the options, either quad read/quad IO re=
ad, or just normal read.
> --
> 2.1.0.27.g96db324
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
