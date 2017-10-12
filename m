Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2eCD-0000xU-8i
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 14:10:47 +0000
Subject: Re: [RESEND PATCH] mtd: nand: omap2: Remove omap_nand_platform_data
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, Richard Weinberger <richard@nod.at>
References: <20171006103543.gnb2hxq7msallyzl@lenoch>
 <20171010114047.202d7d44@bbrezillon>
 <2cd668a5-1c53-ea90-b7d3-47ddad71c23a@ti.com>
 <20171012133837.13bfe1e4@bbrezillon>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <97596107-9b96-f8eb-bf44-466aff99e943@ti.com>
Date: Thu, 12 Oct 2017 17:09:26 +0300
MIME-Version: 1.0
In-Reply-To: <20171012133837.13bfe1e4@bbrezillon>
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

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 12/10/17 14:38, Boris Brezillon wrote:
> On Thu, 12 Oct 2017 14:28:45 +0300
> Roger Quadros <rogerq@ti.com> wrote:
>=20
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus=
/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
>> On 10/10/17 12:40, Boris Brezillon wrote:
>>> On Fri, 6 Oct 2017 12:35:43 +0200
>>> Ladislav Michl <ladis@linux-mips.org> wrote:
>>> =20
>>>> As driver is now configured using DT, omap_nand_platform_data structur=
e
>>>> is no longer needed.
>>>>
>>>> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
>>>> ---
>>>>  Resend to linux-mtd as other part this patch was depending on
>>>>  was merged months ago via linux-omap tree...
>>>>
>>>>  drivers/mtd/nand/omap2.c                     | 40 +++++++------------=
---------
>>>>  include/linux/platform_data/mtd-nand-omap2.h | 17 ------------
>>>>  2 files changed, 10 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>>>> index 54540c8fa1a2..b1fc070c8279 100644
>>>> --- a/drivers/mtd/nand/omap2.c
>>>> +++ b/drivers/mtd/nand/omap2.c
>>>> @@ -1588,8 +1588,7 @@ static bool is_elm_present(struct omap_nand_info=
 *info,
>>>>      return true;
>>>>  }
>>>>
>>>> -static bool omap2_nand_ecc_check(struct omap_nand_info *info,
>>>> -                             struct omap_nand_platform_data *pdata)
>>>> +static bool omap2_nand_ecc_check(struct omap_nand_info *info)
>>>>  {
>>>>      bool ecc_needs_bch, ecc_needs_omap_bch, ecc_needs_elm;
>>>>
>>>> @@ -1804,7 +1803,6 @@ static const struct mtd_ooblayout_ops omap_sw_oo=
blayout_ops =3D {
>>>>  static int omap_nand_probe(struct platform_device *pdev)
>>>>  {
>>>>      struct omap_nand_info           *info;
>>>> -    struct omap_nand_platform_data  *pdata =3D NULL;
>>>>      struct mtd_info                 *mtd;
>>>>      struct nand_chip                *nand_chip;
>>>>      int                             err;
>>>> @@ -1814,6 +1812,9 @@ static int omap_nand_probe(struct platform_devic=
e *pdev)
>>>>      int                             min_oobbytes =3D BADBLOCK_MARKER_=
LENGTH;
>>>>      int                             oobbytes_per_step;
>>>>
>>>> +    if (!dev->of_node)
>>>> +            return -EINVAL;
>>>> + =20
>>>
>>> Is this really needed? I expect omap_get_dt_info() to return an error
>>> when dev->of_node is NULL.
>>> =20
>>>>      info =3D devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
>>>>                              GFP_KERNEL);
>>>>      if (!info)
>>>> @@ -1821,29 +1822,9 @@ static int omap_nand_probe(struct platform_devi=
ce *pdev)
>>>>
>>>>      info->pdev =3D pdev;
>>>>
>>>> -    if (dev->of_node) {
>>>> -            if (omap_get_dt_info(dev, info))
>>>> -                    return -EINVAL;
>>>> -    } else {
>>>> -            pdata =3D dev_get_platdata(&pdev->dev);
>>>> -            if (!pdata) {
>>>> -                    dev_err(&pdev->dev, "platform data missing\n");
>>>> -                    return -EINVAL;
>>>> -            }
>>>> -
>>>> -            info->gpmc_cs =3D pdata->cs;
>>>> -            info->reg =3D pdata->reg;
>>>> -            info->ecc_opt =3D pdata->ecc_opt;
>>>> -            if (pdata->dev_ready)
>>>> -                    dev_info(&pdev->dev, "pdata->dev_ready is depreca=
ted\n");
>>>> -
>>>> -            info->xfer_type =3D pdata->xfer_type;
>>>> -            info->devsize =3D pdata->devsize;
>>>> -            info->elm_of_node =3D pdata->elm_of_node;
>>>> -            info->flash_bbt =3D pdata->flash_bbt;
>>>> -    }
>>>> +    if (omap_get_dt_info(dev, info))
>>>> +            return -EINVAL; =20
>>
>> how about
>>
>>         err =3D omap_get_dt_info(dev, info);
>>         if (err)
>>                 return err;
>=20
> Already done like that in v2 [1]
>=20
>>
>>>>
>>>> -    platform_set_drvdata(pdev, info); =20
>>>
>>> This removal seems unrelated to the change you're describing in the
>>> commit log. I'm not saying we should keep this platform_set_drvdata()
>>> if it's useless, but it should be done in a separate patch. =20
>>
>> we do use platform_get_drvdata() in omap_nand_remove() so I suppose
>> we can't get rid of platorm_set_drvdata()
>=20
> There's another platform_set_drvdata() later in the probe function, I
> think this one is indeed useless (see patch [2])

I agree.

>=20
> [1]http://patchwork.ozlabs.org/patch/823820/
> [2]http://patchwork.ozlabs.org/patch/823839/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
cheers,
-roger
