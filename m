Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1diSlM-0003sn-AF
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 21:55:40 +0000
Date: Thu, 17 Aug 2017 23:55:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, guohanjun@huawei.com
Subject: Re: [PATCH] mtd: nand: convert to unified device property interface
Message-ID: <20170817235502.6c0e8804@bbrezillon>
In-Reply-To: <1502868545-124616-1-git-send-email-wangkefeng.wang@huawei.com>
References: <1502868545-124616-1-git-send-email-wangkefeng.wang@huawei.com>
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

Le Wed, 16 Aug 2017 15:29:05 +0800,
Kefeng Wang <wangkefeng.wang@huawei.com> a =C3=A9crit :

> Changing from of_* to device_* interface, then we can also extract
> the properties from ACPI tables as well as from DT.
>=20
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>=20
> - APCI will be supported in hisi504_nand.c, and it will use nand_scan_ide=
nt().
>=20
>  drivers/mtd/nand/nand_base.c | 54 ++++++++++++++++++++++----------------=
------
>  1 file changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c6c18b8..27a0947 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -46,7 +46,7 @@
>  #include <linux/bitops.h>
>  #include <linux/io.h>
>  #include <linux/mtd/partitions.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
> =20
>  static int nand_get_device(struct mtd_info *mtd, int new_state);
> =20
> @@ -4209,12 +4209,12 @@ static int nand_detect(struct nand_chip *chip, st=
ruct nand_flash_dev *type)
>  	[NAND_ECC_ON_DIE]	=3D "on-die",
>  };
> =20
> -static int of_get_nand_ecc_mode(struct device_node *np)
> +static int device_get_nand_ecc_mode(struct device *dev)
>  {
>  	const char *pm;
>  	int err, i;
> =20
> -	err =3D of_property_read_string(np, "nand-ecc-mode", &pm);
> +	err =3D device_property_read_string(dev, "nand-ecc-mode", &pm);
>  	if (err < 0)
>  		return err;
> =20
> @@ -4238,12 +4238,12 @@ static int of_get_nand_ecc_mode(struct device_nod=
e *np)
>  	[NAND_ECC_BCH]		=3D "bch",
>  };
> =20
> -static int of_get_nand_ecc_algo(struct device_node *np)
> +static int device_get_nand_ecc_algo(struct device *dev)
>  {
>  	const char *pm;
>  	int err, i;
> =20
> -	err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
> +	err =3D device_property_read_string(dev, "nand-ecc-algo", &pm);
>  	if (!err) {
>  		for (i =3D NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
>  			if (!strcasecmp(pm, nand_ecc_algos[i]))
> @@ -4255,7 +4255,7 @@ static int of_get_nand_ecc_algo(struct device_node =
*np)
>  	 * For backward compatibility we also read "nand-ecc-mode" checking
>  	 * for some obsoleted values that were specifying ECC algorithm.
>  	 */
> -	err =3D of_property_read_string(np, "nand-ecc-mode", &pm);
> +	err =3D device_property_read_string(dev, "nand-ecc-mode", &pm);
>  	if (err < 0)
>  		return err;
> =20
> @@ -4267,29 +4267,29 @@ static int of_get_nand_ecc_algo(struct device_nod=
e *np)
>  	return -ENODEV;
>  }
> =20
> -static int of_get_nand_ecc_step_size(struct device_node *np)
> +static int device_get_nand_ecc_step_size(struct device *dev)
>  {
>  	int ret;
>  	u32 val;
> =20
> -	ret =3D of_property_read_u32(np, "nand-ecc-step-size", &val);
> +	ret =3D device_property_read_u32(dev, "nand-ecc-step-size", &val);
>  	return ret ? ret : val;
>  }
> =20
> -static int of_get_nand_ecc_strength(struct device_node *np)
> +static int device_get_nand_ecc_strength(struct device *dev)
>  {
>  	int ret;
>  	u32 val;
> =20
> -	ret =3D of_property_read_u32(np, "nand-ecc-strength", &val);
> +	ret =3D device_property_read_u32(dev, "nand-ecc-strength", &val);
>  	return ret ? ret : val;
>  }
> =20
> -static int of_get_nand_bus_width(struct device_node *np)
> +static int device_get_nand_bus_width(struct device *dev)
>  {
>  	u32 val;
> =20
> -	if (of_property_read_u32(np, "nand-bus-width", &val))
> +	if (device_property_read_u32(dev, "nand-bus-width", &val))
>  		return 8;
> =20
>  	switch (val) {
> @@ -4301,29 +4301,28 @@ static int of_get_nand_bus_width(struct device_no=
de *np)
>  	}
>  }
> =20
> -static bool of_get_nand_on_flash_bbt(struct device_node *np)
> +static bool device_get_nand_on_flash_bbt(struct device *dev)

Not sure I like the device prefix, for the same reason I don't like
nand_chip_init(). How about fw_ or fwnode_?

>  {
> -	return of_property_read_bool(np, "nand-on-flash-bbt");
> +	return device_property_read_bool(dev, "nand-on-flash-bbt");
>  }
> =20
> -static int nand_dt_init(struct nand_chip *chip)
> +static int nand_chip_init(struct nand_chip *chip, struct device *dev)

Hm, nand_chip_init() is confusing. How about nand_fwnode_init() or
nand_get_fw_props()?

>  {
> -	struct device_node *dn =3D nand_get_flash_node(chip);
>  	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
> =20
> -	if (!dn)
> +	if (!dev)
>  		return 0;
> =20
> -	if (of_get_nand_bus_width(dn) =3D=3D 16)
> +	if (device_get_nand_bus_width(dev) =3D=3D 16)
>  		chip->options |=3D NAND_BUSWIDTH_16;
> =20
> -	if (of_get_nand_on_flash_bbt(dn))
> +	if (device_get_nand_on_flash_bbt(dev))
>  		chip->bbt_options |=3D NAND_BBT_USE_FLASH;
> =20
> -	ecc_mode =3D of_get_nand_ecc_mode(dn);
> -	ecc_algo =3D of_get_nand_ecc_algo(dn);
> -	ecc_strength =3D of_get_nand_ecc_strength(dn);
> -	ecc_step =3D of_get_nand_ecc_step_size(dn);
> +	ecc_mode =3D device_get_nand_ecc_mode(dev);
> +	ecc_algo =3D device_get_nand_ecc_algo(dev);
> +	ecc_strength =3D device_get_nand_ecc_strength(dev);
> +	ecc_step =3D device_get_nand_ecc_step_size(dev);
> =20
>  	if (ecc_mode >=3D 0)
>  		chip->ecc.mode =3D ecc_mode;
> @@ -4337,7 +4336,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  	if (ecc_step > 0)
>  		chip->ecc.size =3D ecc_step;
> =20
> -	if (of_property_read_bool(dn, "nand-ecc-maximize"))
> +	if (device_property_read_bool(dev, "nand-ecc-maximize"))
>  		chip->ecc.options |=3D NAND_ECC_MAXIMIZE;
> =20
>  	return 0;
> @@ -4358,14 +4357,15 @@ int nand_scan_ident(struct mtd_info *mtd, int max=
chips,
>  {
>  	int i, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct device *dev =3D mtd->dev.parent;

Sorry but this is wrong. If you do that you break all drivers that have
NAND devices represented as children nodes of the NAND controller.

If you want to support ACPI, you'll have to use &mtd->dev as the
reference dev, and make sure its ->fwnode is correctly set (just patch
nand_get_flash_node() to do the right thing).

>  	int ret;
> =20
> -	ret =3D nand_dt_init(chip);
> +	ret =3D nand_chip_init(chip, dev);

No need to pass dev as a second argument here (can be extracted inside
the function).

>  	if (ret)
>  		return ret;
> =20
> -	if (!mtd->name && mtd->dev.parent)
> -		mtd->name =3D dev_name(mtd->dev.parent);
> +	if (!mtd->name && dev)
> +		mtd->name =3D dev_name(dev);
> =20
>  	if ((!chip->cmdfunc || !chip->select_chip) && !chip->cmd_ctrl) {
>  		/*
