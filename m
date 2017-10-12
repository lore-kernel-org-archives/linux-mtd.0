Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2bfz-0007ib-6s
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 11:29:22 +0000
Subject: Re: [RESEND PATCH] mtd: nand: omap2: Remove omap_nand_platform_data
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Ladislav Michl
 <ladis@linux-mips.org>
CC: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>
References: <20171006103543.gnb2hxq7msallyzl@lenoch>
 <20171010114047.202d7d44@bbrezillon>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <2cd668a5-1c53-ea90-b7d3-47ddad71c23a@ti.com>
Date: Thu, 12 Oct 2017 14:28:45 +0300
MIME-Version: 1.0
In-Reply-To: <20171010114047.202d7d44@bbrezillon>
Content-Type: text/plain; charset="us-ascii"
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


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 10/10/17 12:40, Boris Brezillon wrote:
> On Fri, 6 Oct 2017 12:35:43 +0200
> Ladislav Michl <ladis@linux-mips.org> wrote:
>
>> As driver is now configured using DT, omap_nand_platform_data structure
>> is no longer needed.
>>
>> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
>> ---
>>  Resend to linux-mtd as other part this patch was depending on
>>  was merged months ago via linux-omap tree...
>>
>>  drivers/mtd/nand/omap2.c                     | 40 +++++++--------------=
-------
>>  include/linux/platform_data/mtd-nand-omap2.h | 17 ------------
>>  2 files changed, 10 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 54540c8fa1a2..b1fc070c8279 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -1588,8 +1588,7 @@ static bool is_elm_present(struct omap_nand_info *=
info,
>>      return true;
>>  }
>>
>> -static bool omap2_nand_ecc_check(struct omap_nand_info *info,
>> -                             struct omap_nand_platform_data *pdata)
>> +static bool omap2_nand_ecc_check(struct omap_nand_info *info)
>>  {
>>      bool ecc_needs_bch, ecc_needs_omap_bch, ecc_needs_elm;
>>
>> @@ -1804,7 +1803,6 @@ static const struct mtd_ooblayout_ops omap_sw_oobl=
ayout_ops =3D {
>>  static int omap_nand_probe(struct platform_device *pdev)
>>  {
>>      struct omap_nand_info           *info;
>> -    struct omap_nand_platform_data  *pdata =3D NULL;
>>      struct mtd_info                 *mtd;
>>      struct nand_chip                *nand_chip;
>>      int                             err;
>> @@ -1814,6 +1812,9 @@ static int omap_nand_probe(struct platform_device =
*pdev)
>>      int                             min_oobbytes =3D BADBLOCK_MARKER_LE=
NGTH;
>>      int                             oobbytes_per_step;
>>
>> +    if (!dev->of_node)
>> +            return -EINVAL;
>> +
>
> Is this really needed? I expect omap_get_dt_info() to return an error
> when dev->of_node is NULL.
>
>>      info =3D devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
>>                              GFP_KERNEL);
>>      if (!info)
>> @@ -1821,29 +1822,9 @@ static int omap_nand_probe(struct platform_device=
 *pdev)
>>
>>      info->pdev =3D pdev;
>>
>> -    if (dev->of_node) {
>> -            if (omap_get_dt_info(dev, info))
>> -                    return -EINVAL;
>> -    } else {
>> -            pdata =3D dev_get_platdata(&pdev->dev);
>> -            if (!pdata) {
>> -                    dev_err(&pdev->dev, "platform data missing\n");
>> -                    return -EINVAL;
>> -            }
>> -
>> -            info->gpmc_cs =3D pdata->cs;
>> -            info->reg =3D pdata->reg;
>> -            info->ecc_opt =3D pdata->ecc_opt;
>> -            if (pdata->dev_ready)
>> -                    dev_info(&pdev->dev, "pdata->dev_ready is deprecate=
d\n");
>> -
>> -            info->xfer_type =3D pdata->xfer_type;
>> -            info->devsize =3D pdata->devsize;
>> -            info->elm_of_node =3D pdata->elm_of_node;
>> -            info->flash_bbt =3D pdata->flash_bbt;
>> -    }
>> +    if (omap_get_dt_info(dev, info))
>> +            return -EINVAL;

how about

        err =3D omap_get_dt_info(dev, info);
        if (err)
                return err;

>>
>> -    platform_set_drvdata(pdev, info);
>
> This removal seems unrelated to the change you're describing in the
> commit log. I'm not saying we should keep this platform_set_drvdata()
> if it's useless, but it should be done in a separate patch.

we do use platform_get_drvdata() in omap_nand_remove() so I suppose
we can't get rid of platorm_set_drvdata().

We need to test if the patch survives a suspend/resume.

>
>>      info->ops =3D gpmc_omap_get_nand_ops(&info->reg, info->gpmc_cs);
>>      if (!info->ops) {
>>              dev_err(&pdev->dev, "Failed to get GPMC->NAND interface\n")=
;
>> @@ -2002,7 +1983,7 @@ static int omap_nand_probe(struct platform_device =
*pdev)
>>              goto return_error;
>>      }
>>
>> -    if (!omap2_nand_ecc_check(info, pdata)) {
>> +    if (!omap2_nand_ecc_check(info)) {
>>              err =3D -EINVAL;
>>              goto return_error;
>>      }
>> @@ -2167,10 +2148,9 @@ static int omap_nand_probe(struct platform_device=
 *pdev)
>>      if (err)
>>              goto return_error;
>>
>> -    if (dev->of_node)
>> -            mtd_device_register(mtd, NULL, 0);
>> -    else
>> -            mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
>> +    err =3D mtd_device_register(mtd, NULL, 0);
>> +    if (err)
>> +            goto return_error;
>>
>>      platform_set_drvdata(pdev, mtd);
>>
>> diff --git a/include/linux/platform_data/mtd-nand-omap2.h b/include/linu=
x/platform_data/mtd-nand-omap2.h
>> index 25e267f1970c..619df2431e75 100644
>> --- a/include/linux/platform_data/mtd-nand-omap2.h
>> +++ b/include/linux/platform_data/mtd-nand-omap2.h
>> @@ -64,21 +64,4 @@ struct gpmc_nand_regs {
>>      void __iomem    *gpmc_bch_result5[GPMC_BCH_NUM_REMAINDER];
>>      void __iomem    *gpmc_bch_result6[GPMC_BCH_NUM_REMAINDER];
>>  };
>> -
>> -struct omap_nand_platform_data {
>> -    int                     cs;
>> -    struct mtd_partition    *parts;
>> -    int                     nr_parts;
>> -    bool                    flash_bbt;
>> -    enum nand_io            xfer_type;
>> -    int                     devsize;
>> -    enum omap_ecc           ecc_opt;
>> -
>> -    struct device_node      *elm_of_node;
>> -
>> -    /* deprecated */
>> -    struct gpmc_nand_regs   reg;
>> -    struct device_node      *of_node;
>> -    bool                    dev_ready;
>> -};
>>  #endif
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
cheers,
-roger
