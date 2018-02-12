Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elBBG-0003jd-BU
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 10:17:52 +0000
Date: Mon, 12 Feb 2018 11:17:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?R3LDqWdvcnk=?= Clement
 <gregory.clement@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Antoine Tenart
 <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Ofer
 Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>
Subject: Re: [PATCH v3 7/7] mtd: nand: remove useless fields from pxa3xx
 NAND platform data
Message-ID: <20180212111728.690edacd@xps13>
In-Reply-To: <20180109103637.23798-8-miquel.raynal@free-electrons.com>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180109103637.23798-8-miquel.raynal@free-electrons.com>
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

Hi Robert,

Would you mind reviewing this patch that simplifies the content of the
pxa3xx pdata?

Thank you,
Miqu=C3=A8l

On Tue,  9 Jan 2018 11:36:37 +0100, Miquel Raynal
<miquel.raynal@free-electrons.com> wrote:

> The "enable arbiter" bit is available only for pxa3xx based platforms
> but it was experimentally shown that even if this bit is reserved,
> some Marvell platforms (64-bit) actually need it to be set. The driver
> always set this bit regardless of this property, which is harmless.
> Then this property is not needed.
>=20
> The "num_cs" field is always 1 and for a good reason, the old driver
> (pxa3xx_nand.c) could only handle one. The new driver that replaces it
> (marvell_nand.c) can handle more, but better use device tree for such
> description. As there is only one available chip select, there is no
> need for an array of partitions neither an array of partition numbers.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  arch/arm/mach-pxa/cm-x300.c                   |  6 ++--
>  arch/arm/mach-pxa/colibri-pxa3xx.c            |  6 ++--
>  arch/arm/mach-pxa/littleton.c                 |  6 ++--
>  arch/arm/mach-pxa/mxm8x10.c                   |  6 ++--
>  arch/arm/mach-pxa/raumfeld.c                  |  6 ++--
>  arch/arm/mach-pxa/zylonite.c                  |  6 ++--
>  drivers/mtd/nand/marvell_nand.c               |  3 +-
>  include/linux/platform_data/mtd-nand-pxa3xx.h | 43 ++++++++-------------=
------
>  8 files changed, 25 insertions(+), 57 deletions(-)
>=20
> diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
> index fe1c76bca212..0ac130bbf935 100644
> --- a/arch/arm/mach-pxa/cm-x300.c
> +++ b/arch/arm/mach-pxa/cm-x300.c
> @@ -429,11 +429,9 @@ static struct mtd_partition cm_x300_nand_partitions[=
] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data cm_x300_nand_info =3D {
> -	.enable_arbiter	=3D 1,
>  	.keep_config	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D cm_x300_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(cm_x300_nand_partitions),
> +	.parts		=3D cm_x300_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(cm_x300_nand_partitions),
>  };
> =20
>  static void __init cm_x300_init_nand(void)
> diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colib=
ri-pxa3xx.c
> index 3018eafd723e..e31a591e949f 100644
> --- a/arch/arm/mach-pxa/colibri-pxa3xx.c
> +++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
> @@ -138,11 +138,9 @@ static struct mtd_partition colibri_nand_partitions[=
] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data colibri_nand_info =3D {
> -	.enable_arbiter	=3D 1,
>  	.keep_config	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D colibri_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(colibri_nand_partitions),
> +	.parts		=3D colibri_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(colibri_nand_partitions),
>  };
> =20
>  void __init colibri_pxa3xx_init_nand(void)
> diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.c
> index 380b07a15ef9..48912d60c630 100644
> --- a/arch/arm/mach-pxa/littleton.c
> +++ b/arch/arm/mach-pxa/littleton.c
> @@ -328,10 +328,8 @@ static struct mtd_partition littleton_nand_partition=
s[] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data littleton_nand_info =3D {
> -	.enable_arbiter	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D littleton_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(littleton_nand_partitions),
> +	.parts		=3D littleton_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(littleton_nand_partitions),
>  };
> =20
>  static void __init littleton_init_nand(void)
> diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
> index 743d983fc222..d81b20a85ca7 100644
> --- a/arch/arm/mach-pxa/mxm8x10.c
> +++ b/arch/arm/mach-pxa/mxm8x10.c
> @@ -389,11 +389,9 @@ static struct mtd_partition mxm_8x10_nand_partitions=
[] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data mxm_8x10_nand_info =3D {
> -	.enable_arbiter	=3D 1,
>  	.keep_config	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D mxm_8x10_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(mxm_8x10_nand_partitions)
> +	.parts		=3D mxm_8x10_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(mxm_8x10_nand_partitions)
>  };
> =20
>  static void __init mxm_8x10_nand_init(void)
> diff --git a/arch/arm/mach-pxa/raumfeld.c b/arch/arm/mach-pxa/raumfeld.c
> index 9d662fed03ec..af72e79a7ffa 100644
> --- a/arch/arm/mach-pxa/raumfeld.c
> +++ b/arch/arm/mach-pxa/raumfeld.c
> @@ -346,11 +346,9 @@ static struct mtd_partition raumfeld_nand_partitions=
[] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data raumfeld_nand_info =3D {
> -	.enable_arbiter	=3D 1,
>  	.keep_config	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D raumfeld_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(raumfeld_nand_partitions),
> +	.parts		=3D raumfeld_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(raumfeld_nand_partitions),
>  };
> =20
>  /**
> diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
> index 3a99fc054e96..d69de312d8d9 100644
> --- a/arch/arm/mach-pxa/zylonite.c
> +++ b/arch/arm/mach-pxa/zylonite.c
> @@ -376,10 +376,8 @@ static struct mtd_partition zylonite_nand_partitions=
[] =3D {
>  };
> =20
>  static struct pxa3xx_nand_platform_data zylonite_nand_info =3D {
> -	.enable_arbiter	=3D 1,
> -	.num_cs		=3D 1,
> -	.parts[0]	=3D zylonite_nand_partitions,
> -	.nr_parts[0]	=3D ARRAY_SIZE(zylonite_nand_partitions),
> +	.parts		=3D zylonite_nand_partitions,
> +	.nr_parts	=3D ARRAY_SIZE(zylonite_nand_partitions),
>  };
> =20
>  static void __init zylonite_init_nand(void)
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_n=
and.c
> index 9d01120d97c5..ea05ed8091df 100644
> --- a/drivers/mtd/nand/marvell_nand.c
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -2519,8 +2519,7 @@ static int marvell_nand_chip_init(struct device *de=
v, struct marvell_nfc *nfc,
> =20
>  	if (pdata)
>  		/* Legacy bindings support only one chip */
> -		ret =3D mtd_device_register(mtd, pdata->parts[0],
> -					  pdata->nr_parts[0]);
> +		ret =3D mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
>  	else
>  		ret =3D mtd_device_register(mtd, NULL, 0);
>  	if (ret) {
> diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linu=
x/platform_data/mtd-nand-pxa3xx.h
> index b42ad83cbc20..4fd0f592a2d2 100644
> --- a/include/linux/platform_data/mtd-nand-pxa3xx.h
> +++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
> @@ -6,41 +6,22 @@
>  #include <linux/mtd/partitions.h>
> =20
>  /*
> - * Current pxa3xx_nand controller has two chip select which
> - * both be workable.
> - *
> - * Notice should be taken that:
> - * When you want to use this feature, you should not enable the
> - * keep configuration feature, for two chip select could be
> - * attached with different nand chip. The different page size
> - * and timing requirement make the keep configuration impossible.
> + * Current pxa3xx_nand controller has two chip select which both be work=
able but
> + * historically all platforms remaining on platform data used only one. =
Switch
> + * to device tree if you need more.
>   */
> -
> -/* The max num of chip select current support */
> -#define NUM_CHIP_SELECT		(2)
>  struct pxa3xx_nand_platform_data {
> -
> -	/* the data flash bus is shared between the Static Memory
> -	 * Controller and the Data Flash Controller,  the arbiter
> -	 * controls the ownership of the bus
> -	 */
> -	int	enable_arbiter;
> -
> -	/* allow platform code to keep OBM/bootloader defined NFC config */
> -	int	keep_config;
> -
> -	/* indicate how many chip selects will be used */
> -	int	num_cs;
> -
> -	/* use an flash-based bad block table */
> -	bool	flash_bbt;
> -
> -	/* requested ECC strength and ECC step size */
> +	/* Keep OBM/bootloader NFC timing configuration */
> +	bool keep_config;
> +	/* Use a flash-based bad block table */
> +	bool flash_bbt;
> +	/* Requested ECC strength and ECC step size */
>  	int ecc_strength, ecc_step_size;
> -
> -	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
> -	unsigned int				nr_parts[NUM_CHIP_SELECT];
> +	/* Partitions */
> +	const struct mtd_partition *parts;
> +	unsigned int nr_parts;
>  };
> =20
>  extern void pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data *info);
> +
>  #endif /* __ASM_ARCH_PXA3XX_NAND_H */



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
