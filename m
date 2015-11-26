Received: from mail-bn1bon0138.outbound.protection.outlook.com
 ([157.56.111.138] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1qXP-000642-Vr
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 07:00:16 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: Xu Han <han.xu@freescale.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 4/5] mtd: spi-nor: fsl-quadspi: add support for layerscape
Date: Thu, 26 Nov 2015 06:59:51 +0000
Message-ID: <BLUPR03MB1342EF63DE8E8A2F77C57DF83040@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1447838342-9932-1-git-send-email-yao.yuan@freescale.com>
 <20151125191627.GC2959@chopperman.am.freescale.net>
In-Reply-To: <20151125191627.GC2959@chopperman.am.freescale.net>
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

Hi Allen,

Yes, I will.
In fact, I have already send the patch<mtd: spi-nor: fsl-quadspi: add suppo=
rt for ls1021a>.
This patch will add the new compatible entries in qspi driver for the ls102=
1a platform.

Thanks for your review.

Best Regards,

Yuan Yao

-----Original Message-----
From: Han Xu [mailto:han.xu@freescale.com]=20
Sent: Wednesday, November 25, 2015 2:16 PM
To: Yuan Yao-B46683 <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org; computersforpeace@gmail.com; linux-kernel@vger.ker=
nel.org; linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/5] mtd: spi-nor: fsl-quadspi: add support for layersc=
ape

On Wed, Nov 18, 2015 at 05:19:02PM +0800, Yuan Yao wrote:
> LS1043a and LS2080A in the Layerscape family also support Freescale=20
> Quad SPI, make Quad SPI selectable for these hardwares.
>=20
> Signed-off-by: Yuan Yao <yao.yuan@freescale.com>
> ---
>  drivers/mtd/spi-nor/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig=20
> index 1368221..9373141 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -23,7 +23,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
> =20
>  config SPI_FSL_QUADSPI
>  	tristate "Freescale Quad SPI controller"
> -	depends on ARCH_MXC || SOC_LS1021A || COMPILE_TEST
> +	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE ||=20
> +COMPILE_TEST

So will you add new compatible entries in qspi driver for these two platfor=
ms?

>  	depends on HAS_IOMEM
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
> --
> 2.1.0.27.g96db324
>=20

--=20
Best Regards,

Han "Allen" Xu
