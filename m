MIME-Version: 1.0
In-Reply-To: <AANLkTinGdpt3kiCas6tpEZPbTknEe1Upz9D_aLgfNWo_@mail.gmail.com>
References: <1283179285-6539-1-git-send-email-haojian.zhuang@marvell.com>
	<AANLkTinGdpt3kiCas6tpEZPbTknEe1Upz9D_aLgfNWo_@mail.gmail.com>
Date: Mon, 13 Sep 2010 19:56:14 +0800
Message-ID: <AANLkTimJOT1AozJEgsvZZ=gCKhKyHgGa3FckOWaDpX20@mail.gmail.com>
Subject: Re: [PATCH 1/6] pxa3xx_nand: make scan procedure more clear
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 9, 2010 at 9:59 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Mon, Aug 30, 2010 at 10:41 PM, Haojian Zhuang
> <haojian.zhuang@gmail.com> wrote:
>> From: Lei Wen <leiwen@marvell.com>
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> Cc: Eric Miao <eric.y.miao@gmail.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 88 ++++++++++++++++++++++-=
----------------
>> =C2=A01 files changed, 50 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 5d24968..3468a3d 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -126,6 +126,7 @@ struct pxa3xx_nand_info {
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
>> @@ -1044,21 +1045,13 @@ static void pxa3xx_nand_init_mtd(struct mtd_info=
 *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->chip_delay =3D 25;
>> =C2=A0}
>>
>> -static int pxa3xx_nand_probe(struct platform_device *pdev)
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
eof(struct pxa3xx_nand_info),
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0GFP_KERNEL);
>> @@ -1070,8 +1063,8 @@ static int pxa3xx_nand_probe(struct platform_devic=
e *pdev)
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
>> @@ -1149,27 +1142,9 @@ static int pxa3xx_nand_probe(struct platform_devi=
ce *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_init_mtd(mtd, info);
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
>> - =C2=A0 =C2=A0 =C2=A0 if (mtd_has_cmdlinepart()) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char *pr=
obes[] =3D { "cmdlinepart", NULL };
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_partition =
*parts;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_parts;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_parts =3D parse_mt=
d_partitions(mtd, probes, &parts, 0);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_parts)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return add_mtd_partitions(mtd, parts, nr_parts);
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(mtd, pdata->parts, pdat=
a->nr_parts);
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>>
>> =C2=A0fail_free_irq:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(irq, info);
>> @@ -1194,8 +1169,8 @@ fail_free_mtd:
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
>> @@ -1224,11 +1199,48 @@ static int pxa3xx_nand_remove(struct platform_de=
vice *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>>
>> +static int pxa3xx_nand_probe(struct platform_device *pdev)
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
>
> Hrm... I'd rather this being something like:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D alloc_nand_info(pdev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info =3D=3D NULL)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blah ... blah ...
>
> Otherwise looks all good to me.
>

That make sense.
How about the other five patches.  :-)

Thanks,
Lei
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
>> + =C2=A0 =C2=A0 =C2=A0 if (mtd_has_cmdlinepart()) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char *pr=
obes[] =3D { "cmdlinepart", NULL };
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_partition =
*parts;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_parts;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_parts =3D parse_mt=
d_partitions(info->mtd, probes, &parts, 0);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_parts)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return add_mtd_partitions(info->mtd, parts, nr_parts);
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(info->mtd, pdata->parts=
, pdata->nr_parts);
>> +}
>> +
>> =C2=A0#ifdef CONFIG_PM
>> =C2=A0static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_me=
ssage_t state)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info *)platf=
orm_get_drvdata(pdev);
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_dr=
vdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->state !=3D STATE_READY) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&pdev->de=
v, "driver busy, state =3D %d\n", info->state);
>> @@ -1240,8 +1252,8 @@ static int pxa3xx_nand_suspend(struct platform_dev=
ice *pdev, pm_message_t state)
>>
>> =C2=A0static int pxa3xx_nand_resume(struct platform_device *pdev)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info *)platf=
orm_get_drvdata(pdev);
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_dr=
vdata(pdev);
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR0CS0, info->ndtr0cs0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, info->ndtr1cs0);
>> --
>> 1.7.0.4
>>
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
