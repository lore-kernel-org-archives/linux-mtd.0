MIME-Version: 1.0
In-Reply-To: <4BFA29FE.9020001@compulab.co.il>
References: <AANLkTinGQFS93yulT3SxF-K7XdM8SPH_85ZPhVCbiCMw@mail.gmail.com>
	<4BFA29FE.9020001@compulab.co.il>
Date: Mon, 24 May 2010 16:43:18 +0800
Message-ID: <AANLkTin5wNaHGUlHvj0YsjNFD0W-UQ6mVRqObpq72M8b@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: pxa3xx_nand: make scan procedure more clear
From: Lei Wen <adrian.wenl@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 24, 2010 at 3:25 PM, Mike Rapoport <mike@compulab.co.il> wrote:
> Haojian Zhuang wrote:
>>
>> From 3c64457df23b222c7f53b7d8f0601606b95b1ad6 Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Mon, 22 Mar 2010 10:35:49 +0800
>> Subject: [PATCH] mtd: pxa3xx_nand: make scan procedure more clear
>
> The changes below are related mostly to _probe reorganization than to
> nand scan...
>
>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 66
>> +++++++++++++++++++++++----------------
>> =C2=A01 files changed, 39 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index 2dfe6d9..0ef9bf9 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -160,6 +160,7 @@ struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf_start;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf_count;
>>
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info =C2=A0 =C2=A0 =C2=A0 =C2=A0 *mtd;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DMA information */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_dat;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_cmd;
>> @@ -1096,21 +1097,13 @@ static void pxa3xx_nand_init_mtd(struct mtd_info
>> *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->chip_delay =3D 25;
>> =C2=A0}
>>
>> -static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
>> +static int alloc_nand_resource(struct platform_device *pdev)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata =3D pdev-=
>dev.platform_data;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info;
>> - =C2=A0 =C2=A0 =C2=A0 struct nand_chip *this;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *r;
>> - =C2=A0 =C2=A0 =C2=A0 int ret =3D 0, irq;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "=
no platform data defined\n");
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 int ret, irq;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd =3D kzalloc(sizeof(struct mtd_info) + siz=
eof(struct
>> pxa3xx_nand_info),
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0GFP_KERNEL);
>> @@ -1122,8 +1115,8 @@ static int __devinit pxa3xx_nand_probe(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D (struct pxa3xx_nand_info *)(&mtd[1])=
;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->pdev =3D pdev;
>>
>> - =C2=A0 =C2=A0 =C2=A0 this =3D &info->nand_chip;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->priv =3D info;
>> + =C2=A0 =C2=A0 =C2=A0 info->mtd =3D mtd;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->owner =3D THIS_MODULE;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->clk =3D clk_get(&pdev->dev, NULL);
>> @@ -1201,16 +1194,9 @@ static int __devinit pxa3xx_nand_probe(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_init_mtd(mtd, info);
>
> This, and the pxa3xx_nand_detect_flash call not shown in the patch does
> not really belong to resource allocation. I'd move it back to the _probe
> method.
>
>> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, info);
>>
>> - =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, mtd);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (nand_scan(mtd, 1)) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "=
failed to scan nand\n");
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENXIO;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_free_irq;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(mtd, pdata->parts, pdat=
a->nr_parts);
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0fail_free_irq:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(irq, info);
>> @@ -1235,8 +1221,8 @@ fail_free_mtd:
>>
>> =C2=A0static int pxa3xx_nand_remove(struct platform_device *pdev)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D platform_get_drvdata(pde=
v);
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_dr=
vdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *r;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;
>>
>> @@ -1265,11 +1251,37 @@ static int pxa3xx_nand_remove(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>>
>> +static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info;
>> + =C2=A0 =C2=A0 =C2=A0 int ret;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
>> + =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "=
no platform data defined\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 ret =3D alloc_nand_resource(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 if (ret)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 info =3D platform_get_drvdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 if (nand_scan(info->mtd, 1)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "=
failed to scan nand\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_remove(pd=
ev);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(info->mtd, pdata->parts=
,
>> pdata->nr_parts);
>> +}
>> +
>> =C2=A0#ifdef CONFIG_PM
>> =C2=A0static int pxa3xx_nand_suspend(struct platform_device *pdev,
>> pm_message_t state)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info
>> *)platform_get_drvdata(pdev);
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_dr=
vdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->state !=3D STATE_READY) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&pdev->de=
v, "driver busy, state =3D %d\n",
>> info->state);
>> @@ -1281,8 +1293,8 @@ static int pxa3xx_nand_suspend(struct
>> platform_device *pdev, pm_message_t state)
>>
>> =C2=A0static int pxa3xx_nand_resume(struct platform_device *pdev)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info
>> *)platform_get_drvdata(pdev);
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_dr=
vdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR0CS0, info->ndtr0cs0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, info->ndtr1cs0);
>
>
> --
> Sincerely yours,
> Mike.
>
>
Like I said in last mail, the resource allocation need to be done with
the judgement of the status of nand chip in both chip select.
Current our nand driver support two chip select, not the only one in
the past, so the code logic is also changed.

Thanks,
Lei
