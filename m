Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2yk9-0004Sp-A9
 for linux-mtd@lists.infradead.org; Fri, 13 Oct 2017 12:07:11 +0000
Subject: Re: [PATCH v2] mtd: nand: omap2: Remove omap_nand_platform_data
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-omap@vger.kernel.org>
References: <20171010123807.ha43wsnqw5uncf3n@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <a5bb7dad-e0e5-031b-2d08-d3edc216967c@ti.com>
Date: Fri, 13 Oct 2017 15:06:42 +0300
MIME-Version: 1.0
In-Reply-To: <20171010123807.ha43wsnqw5uncf3n@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFHi,


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 10/10/17 15:38, Ladislav Michl wrote:
> As driver is now configured using DT, omap_nand_platform_data structure
> is no longer needed.
>=20
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>


Tested on dra7-evm.

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  Changes:
>  -v2: Remove check for dev->of_node, drop platform_set_drvdata removal
>       change from this patch
>=20
>  drivers/mtd/nand/omap2.c                     |   37 +++++---------------=
-------
>  include/linux/platform_data/mtd-nand-omap2.h |   17 ------------
>  2 files changed, 8 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 54540c8fa1a2..01368a8f9e3f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1588,8 +1588,7 @@ static bool is_elm_present(struct omap_nand_info *i=
nfo,
>  	return true;
>  }
> =20
> -static bool omap2_nand_ecc_check(struct omap_nand_info *info,
> -				 struct omap_nand_platform_data	*pdata)
> +static bool omap2_nand_ecc_check(struct omap_nand_info *info)
>  {
>  	bool ecc_needs_bch, ecc_needs_omap_bch, ecc_needs_elm;
> =20
> @@ -1804,7 +1803,6 @@ static const struct mtd_ooblayout_ops omap_sw_oobla=
yout_ops =3D {
>  static int omap_nand_probe(struct platform_device *pdev)
>  {
>  	struct omap_nand_info		*info;
> -	struct omap_nand_platform_data	*pdata =3D NULL;
>  	struct mtd_info			*mtd;
>  	struct nand_chip		*nand_chip;
>  	int				err;
> @@ -1821,27 +1819,9 @@ static int omap_nand_probe(struct platform_device =
*pdev)
> =20
>  	info->pdev =3D pdev;
> =20
> -	if (dev->of_node) {
> -		if (omap_get_dt_info(dev, info))
> -			return -EINVAL;
> -	} else {
> -		pdata =3D dev_get_platdata(&pdev->dev);
> -		if (!pdata) {
> -			dev_err(&pdev->dev, "platform data missing\n");
> -			return -EINVAL;
> -		}
> -
> -		info->gpmc_cs =3D pdata->cs;
> -		info->reg =3D pdata->reg;
> -		info->ecc_opt =3D pdata->ecc_opt;
> -		if (pdata->dev_ready)
> -			dev_info(&pdev->dev, "pdata->dev_ready is deprecated\n");
> -
> -		info->xfer_type =3D pdata->xfer_type;
> -		info->devsize =3D pdata->devsize;
> -		info->elm_of_node =3D pdata->elm_of_node;
> -		info->flash_bbt =3D pdata->flash_bbt;
> -	}
> +	err =3D omap_get_dt_info(dev, info);
> +	if (err)
> +		return err;
> =20
>  	platform_set_drvdata(pdev, info);
>  	info->ops =3D gpmc_omap_get_nand_ops(&info->reg, info->gpmc_cs);
> @@ -2002,7 +1982,7 @@ static int omap_nand_probe(struct platform_device *=
pdev)
>  		goto return_error;
>  	}
> =20
> -	if (!omap2_nand_ecc_check(info, pdata)) {
> +	if (!omap2_nand_ecc_check(info)) {
>  		err =3D -EINVAL;
>  		goto return_error;
>  	}
> @@ -2167,10 +2147,9 @@ static int omap_nand_probe(struct platform_device =
*pdev)
>  	if (err)
>  		goto return_error;
> =20
> -	if (dev->of_node)
> -		mtd_device_register(mtd, NULL, 0);
> -	else
> -		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
> +	err =3D mtd_device_register(mtd, NULL, 0);
> +	if (err)
> +		goto return_error;
> =20
>  	platform_set_drvdata(pdev, mtd);
> =20
> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linux=
/platform_data/mtd-nand-omap2.h
> index 25e267f1970c..619df2431e75 100644
> --- a/include/linux/platform_data/mtd-nand-omap2.h
> +++ b/include/linux/platform_data/mtd-nand-omap2.h
> @@ -64,21 +64,4 @@ struct gpmc_nand_regs {
>  	void __iomem	*gpmc_bch_result5[GPMC_BCH_NUM_REMAINDER];
>  	void __iomem	*gpmc_bch_result6[GPMC_BCH_NUM_REMAINDER];
>  };
> -
> -struct omap_nand_platform_data {
> -	int			cs;
> -	struct mtd_partition	*parts;
> -	int			nr_parts;
> -	bool			flash_bbt;
> -	enum nand_io		xfer_type;
> -	int			devsize;
> -	enum omap_ecc           ecc_opt;
> -
> -	struct device_node	*elm_of_node;
> -
> -	/* deprecated */
> -	struct gpmc_nand_regs	reg;
> -	struct device_node	*of_node;
> -	bool			dev_ready;
> -};
>  #endif
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
cheers,
-roger
