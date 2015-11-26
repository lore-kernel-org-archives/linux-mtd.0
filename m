Received: from mail-bn1bon0134.outbound.protection.outlook.com
 ([157.56.111.134] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1qY7-0007Qt-1V
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 07:00:59 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: Xu Han <han.xu@freescale.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: fsl-quadspi: add support for ls1021a
Date: Thu, 26 Nov 2015 07:00:36 +0000
Message-ID: <BLUPR03MB134442483CD6D63BBDFA04783040@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1447838103-6034-1-git-send-email-yao.yuan@freescale.com>
 <20151125191456.GB2959@chopperman.am.freescale.net>
In-Reply-To: <20151125191456.GB2959@chopperman.am.freescale.net>
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

Ok.
Thanks.

-----Original Message-----
From: Han Xu [mailto:han.xu@freescale.com]=20
Sent: Wednesday, November 25, 2015 2:15 PM
To: Yuan Yao-B46683 <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org; computersforpeace@gmail.com; linux-kernel@vger.ker=
nel.org; linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add support for ls1021a

On Wed, Nov 18, 2015 at 05:15:03PM +0800, Yuan Yao wrote:
> LS1021a also support Freescale Quad SPI controller.
> Add fsl-quadspi support for ls1021a chip and make SPI_FSL_QUADSPI=20
> selectable for LS1021A SOC hardwares.
>=20
> Signed-off-by: Yuan Yao <yao.yuan@freescale.com>
> ---
>  drivers/mtd/spi-nor/Kconfig       |  2 +-
>  drivers/mtd/spi-nor/fsl-quadspi.c | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig=20
> index 2fe2a7e..1368221 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -23,7 +23,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
> =20
>  config SPI_FSL_QUADSPI
>  	tristate "Freescale Quad SPI controller"
> -	depends on ARCH_MXC || COMPILE_TEST
> +	depends on ARCH_MXC || SOC_LS1021A || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c=20
> b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 0ce7768..03a589d 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -213,6 +213,7 @@ enum fsl_qspi_devtype {
>  	FSL_QUADSPI_IMX6SX,
>  	FSL_QUADSPI_IMX7D,
>  	FSL_QUADSPI_IMX6UL,
> +	FSL_QUADSPI_LS1021A,
>  };
> =20
>  struct fsl_qspi_devtype_data {
> @@ -258,6 +259,14 @@ static struct fsl_qspi_devtype_data imx6ul_data =3D =
{
>  		       | QUADSPI_QUIRK_4X_INT_CLK,
>  };
> =20
> +static struct fsl_qspi_devtype_data ls1021a_data =3D {
> +	.devtype =3D FSL_QUADSPI_LS1021A,
> +	.rxfifo =3D 128,
> +	.txfifo =3D 64,
> +	.ahb_buf_size =3D 1024,
> +	.driver_data =3D 0,
> +};
> +
>  #define FSL_QSPI_MAX_CHIP	4
>  struct fsl_qspi {
>  	struct spi_nor nor[FSL_QSPI_MAX_CHIP]; @@ -812,6 +821,7 @@ static=20
> const struct of_device_id fsl_qspi_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx6sx-qspi", .data =3D (void *)&imx6sx_data, },
>  	{ .compatible =3D "fsl,imx7d-qspi", .data =3D (void *)&imx7d_data, },
>  	{ .compatible =3D "fsl,imx6ul-qspi", .data =3D (void *)&imx6ul_data, },
> +	{ .compatible =3D "fsl,ls1021a-qspi", .data =3D (void *)&ls1021a_data,=
=20
> +},

Same comments, document this compatible.

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
> --
> 2.1.0.27.g96db324
>=20

Acked-by: Han xu <han.xu@freescale.com>
--=20
Best Regards,

Han "Allen" Xu
