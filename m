From: Yunhui Cui <yunhui.cui@nxp.com>
To: Yunhui Cui <B56489@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "han.xu@freescale.com" <han.xu@freescale.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH v2 1/9] mtd:fsl-quadspi:use the property fields of SPI-NOR
Date: Thu, 30 Jun 2016 01:54:14 +0000
Message-ID: <DB5PR0401MB191200E18A336E0BE5318D1694240@DB5PR0401MB1912.eurprd04.prod.outlook.com>
References: <1461307192-866-1-git-send-email-B56489@freescale.com>
In-Reply-To: <1461307192-866-1-git-send-email-B56489@freescale.com>
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

Hi Brian and Han,
Could you please give me some comments about this patch set v2 ?

Thanks

> -----Original Message-----
> From: Yunhui Cui [mailto:B56489@freescale.com]
> Sent: Friday, April 22, 2016 2:40 PM
> To: dwmw2@infradead.org; computersforpeace@gmail.com;
> han.xu@freescale.com
> Cc: linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> arm-kernel@lists.infradead.org; Yao Yuan; Yunhui Cui
> Subject: [PATCH v2 1/9] mtd:fsl-quadspi:use the property fields of SPI-
> NOR
>=20
> We can get the read/write/erase opcode from the spi nor framework
> directly. This patch uses the information stored in the SPI-NOR to remove
> the hardcode in the fsl_qspi_init_lut().
>=20
> Signed-off-by: Yunhui Cui <B56489@freescale.com>
> Signed-off-by: Yunhui Cui <yunhui.cui@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 40 ++++++++++++---------------------
> ------
>  1 file changed, 12 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-
> quadspi.c
> index 9ab2b51..517ffe2 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -373,9 +373,13 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	void __iomem *base =3D q->iobase;
>  	int rxfifo =3D q->devtype_data->rxfifo;
>  	u32 lut_base;
> -	u8 cmd, addrlen, dummy;
>  	int i;
>=20
> +	struct spi_nor *nor =3D &q->nor[0];
> +	u8 addrlen =3D (nor->addr_width =3D=3D 3) ? ADDR24BIT : ADDR32BIT;
> +	u8 read_op =3D nor->read_opcode;
> +	u8 read_dm =3D nor->read_dummy;
> +
>  	fsl_qspi_unlock_lut(q);
>=20
>  	/* Clear all the LUT table */
> @@ -385,20 +389,10 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	/* Quad Read */
>  	lut_base =3D SEQID_QUAD_READ * 4;
>=20
> -	if (q->nor_size <=3D SZ_16M) {
> -		cmd =3D SPINOR_OP_READ_1_1_4;
> -		addrlen =3D ADDR24BIT;
> -		dummy =3D 8;
> -	} else {
> -		/* use the 4-byte address */
> -		cmd =3D SPINOR_OP_READ_1_1_4;
> -		addrlen =3D ADDR32BIT;
> -		dummy =3D 8;
> -	}
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
> -	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD4,
> rxfifo),
> +	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
> +		    LUT1(FSL_READ, PAD4, rxfifo),
>  			base + QUADSPI_LUT(lut_base + 1));
>=20
>  	/* Write enable */
> @@ -409,16 +403,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	/* Page Program */
>  	lut_base =3D SEQID_PP * 4;
>=20
> -	if (q->nor_size <=3D SZ_16M) {
> -		cmd =3D SPINOR_OP_PP;
> -		addrlen =3D ADDR24BIT;
> -	} else {
> -		/* use the 4-byte address */
> -		cmd =3D SPINOR_OP_PP;
> -		addrlen =3D ADDR32BIT;
> -	}
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +	qspi_writel(q, LUT0(CMD, PAD1, nor->program_opcode) |
> +		    LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
>  	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
>  			base + QUADSPI_LUT(lut_base + 1));
> @@ -432,10 +418,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	/* Erase a sector */
>  	lut_base =3D SEQID_SE * 4;
>=20
> -	cmd =3D q->nor[0].erase_opcode;
> -	addrlen =3D q->nor_size <=3D SZ_16M ? ADDR24BIT : ADDR32BIT;
> -
> -	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
> +	qspi_writel(q, LUT0(CMD, PAD1, nor->erase_opcode) |
> +		    LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
>=20
>  	/* Erase the whole chip */
> --
> 2.1.0.27.g96db324
