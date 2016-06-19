Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEaxt-00066g-Ua
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 11:32:34 +0000
Date: Sun, 19 Jun 2016 13:32:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH v2 1/8] MTD: xway: convert to normal platform driver
Message-ID: <20160619133211.04d4bd79@bbrezillon>
In-Reply-To: <1466277252-13867-2-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
 <1466277252-13867-2-git-send-email-hauke@hauke-m.de>
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

Hi Hauke,

On Sat, 18 Jun 2016 21:14:05 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> Instead of hacking this into the plat_nand driver just make this a
> normal nand driver.

Thanks for taking care of that.

>=20
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  drivers/mtd/nand/Kconfig     |   1 -
>  drivers/mtd/nand/xway_nand.c | 119 ++++++++++++++++++++++++++++++-------=
------
>  2 files changed, 84 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9..d7de2c97 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -539,7 +539,6 @@ config MTD_NAND_FSMC
>  config MTD_NAND_XWAY
>  	tristate "Support for NAND on Lantiq XWAY SoC"
>  	depends on LANTIQ && SOC_TYPE_XWAY
> -	select MTD_NAND_PLATFORM
>  	help
>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is att=
ached
>  	  to the External Bus Unit (EBU).
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 0cf0ac0..867a636 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -4,6 +4,7 @@
>   *  by the Free Software Foundation.
>   *
>   *  Copyright =C2=A9 2012 John Crispin <blogic@openwrt.org>
> + *  Copyright =C2=A9 2016 Hauke Mehrtens <hauke@hauke-m.de>
>   */
> =20
>  #include <linux/mtd/nand.h>
> @@ -54,6 +55,10 @@
>  #define NAND_CON_CSMUX		(1 << 1)
>  #define NAND_CON_NANDM		1
> =20
> +struct xway_nand_data {
> +	struct nand_chip	chip;
> +};
> +
>  static void xway_reset_chip(struct nand_chip *chip)
>  {
>  	unsigned long nandaddr =3D (unsigned long) chip->IO_ADDR_W;
> @@ -130,14 +135,50 @@ static unsigned char xway_read_byte(struct mtd_info=
 *mtd)
>  	return ret;
>  }
> =20
> +/*
> + * Probe for the NAND device.
> + */
>  static int xway_nand_probe(struct platform_device *pdev)
>  {
> -	struct nand_chip *this =3D platform_get_drvdata(pdev);
> -	unsigned long nandaddr =3D (unsigned long) this->IO_ADDR_W;
> -	const __be32 *cs =3D of_get_property(pdev->dev.of_node,
> -					"lantiq,cs", NULL);
> +	struct xway_nand_data *data;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	int err =3D 0;
> +	void __iomem *nandaddr;
> +	const __be32 *cs;
>  	u32 cs_flag =3D 0;
> =20
> +	/* Allocate memory for the device structure (and zero it) */
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nandaddr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(nandaddr))
> +		return PTR_ERR(nandaddr);
> +
> +	nand_set_flash_node(&data->chip, pdev->dev.of_node);
> +	mtd =3D nand_to_mtd(&data->chip);
> +	mtd->dev.parent =3D &pdev->dev;
> +
> +	data->chip.IO_ADDR_R =3D nandaddr;
> +	data->chip.IO_ADDR_W =3D nandaddr;
> +	data->chip.cmd_ctrl =3D xway_cmd_ctrl;
> +	data->chip.dev_ready =3D xway_dev_ready;
> +	data->chip.select_chip =3D xway_select_chip;
> +	data->chip.read_byte =3D xway_read_byte;
> +	data->chip.chip_delay =3D 30;
> +
> +	data->chip.ecc.mode =3D NAND_ECC_SOFT;
> +	data->chip.ecc.algo =3D NAND_ECC_HAMMING;
> +
> +	platform_set_drvdata(pdev, data);
> +	nand_set_controller_data(&data->chip, data);
> +
> +	cs =3D of_get_property(pdev->dev.of_node, "lantiq,cs", NULL);

It may be a good time to switch to of_property_read_u32() (here or in a
separate patch).

> +
>  	/* load our CS from the DT. Either we find a valid 1 or default to 0 */
>  	if (cs && (*cs =3D=3D 1))
>  		cs_flag =3D NAND_CON_IN_CS1 | NAND_CON_OUT_CS1;
> @@ -155,43 +196,51 @@ static int xway_nand_probe(struct platform_device *=
pdev)
>  		| cs_flag, EBU_NAND_CON);
> =20
>  	/* finish with a reset */
> -	xway_reset_chip(this);
> -
> -	return 0;
> -}
> +	xway_reset_chip(&data->chip);
> =20
> -static struct platform_nand_data xway_nand_data =3D {
> -	.chip =3D {
> -		.nr_chips		=3D 1,
> -		.chip_delay		=3D 30,
> -	},
> -	.ctrl =3D {
> -		.probe		=3D xway_nand_probe,
> -		.cmd_ctrl	=3D xway_cmd_ctrl,
> -		.dev_ready	=3D xway_dev_ready,
> -		.select_chip	=3D xway_select_chip,
> -		.read_byte	=3D xway_read_byte,
> +	/* Scan to find existence of the device */
> +	if (nand_scan(mtd, 1)) {

How about returning nand_scan() ret code if it's negative.

> +		err =3D -ENXIO;
> +		goto out;

This out label seems useless here, just return the err code directly.

>  	}
> -};
> +
> +	err =3D mtd_device_register(mtd, NULL, 0);
> +
> +	if (!err)
> +		return 0;
> +
> +	nand_release(mtd);

I'd prefer

	if (err)
		nand_release(mtd);

	return err;

> +out:
> +	return err;
> +}
> =20
>  /*
> - * Try to find the node inside the DT. If it is available attach out
> - * platform_nand_data
> + * Remove a NAND device.
>   */
> -static int __init xway_register_nand(void)
> +static int xway_nand_remove(struct platform_device *pdev)
>  {
> -	struct device_node *node;
> -	struct platform_device *pdev;
> -
> -	node =3D of_find_compatible_node(NULL, NULL, "lantiq,nand-xway");
> -	if (!node)
> -		return -ENOENT;
> -	pdev =3D of_find_device_by_node(node);
> -	if (!pdev)
> -		return -EINVAL;
> -	pdev->dev.platform_data =3D &xway_nand_data;
> -	of_node_put(node);
> +	struct xway_nand_data *data =3D platform_get_drvdata(pdev);
> +
> +	nand_release(nand_to_mtd(&data->chip));
> +
>  	return 0;
>  }
> =20
> -subsys_initcall(xway_register_nand);
> +static const struct of_device_id xway_nand_match[] =3D {
> +	{ .compatible =3D "lantiq,nand-xway" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, xway_nand_match);
> +
> +static struct platform_driver xway_nand_driver =3D {
> +	.probe	=3D xway_nand_probe,
> +	.remove	=3D xway_nand_remove,
> +	.driver	=3D {
> +		.name		=3D "lantiq,nand-xway",
> +		.of_match_table =3D xway_nand_match,
> +	},
> +};
> +
> +module_platform_driver(xway_nand_driver);
> +
> +MODULE_LICENSE("GPL");
