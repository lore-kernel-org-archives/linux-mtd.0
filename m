MIME-Version: 1.0
In-Reply-To: <AANLkTiliVtvBEmJPgkha444k9XGB_dNm0lQ9TCif8AAj@mail.gmail.com>
References: <AANLkTiliVtvBEmJPgkha444k9XGB_dNm0lQ9TCif8AAj@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Fri, 18 Jun 2010 14:43:08 +0800
Message-ID: <AANLkTikKNw7purkGZoYMN7rWuHwkLdILSoDAaIzpugYe@mail.gmail.com>
Subject: Re: [PATCH 04/25] pxa3xx_nand: make scan procedure more clear
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 1:33 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 9023ee9b020ebda0c6ee299807a7fd2eb8fae53d Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Sun, 16 May 2010 17:03:52 +0800
> Subject: [PATCH 04/25] pxa3xx_nand: make scan procedure more clear
>

Looks like a good cleanup to me. The git diff, though, seems to generate po=
or
differences here.

> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 88 ++++++++++++++++++++++--=
---------------
> =C2=A01 files changed, 50 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 291610a..1f52701 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -160,6 +160,7 @@ struct pxa3xx_nand_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf_start;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf_count;
>
> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info =C2=A0 =C2=A0 =C2=A0 =C2=A0 *mtd;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* DMA information */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_dat;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_cmd;
> @@ -1105,21 +1106,13 @@ static void pxa3xx_nand_init_mtd(struct mtd_info =
*mtd,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->chip_delay =3D 25;
> =C2=A0}
>
> -static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
> +static int alloc_nand_resource(struct platform_device *pdev)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata =3D pdev->=
dev.platform_data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info;
> - =C2=A0 =C2=A0 =C2=A0 struct nand_chip *this;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *r;
> - =C2=A0 =C2=A0 =C2=A0 int ret =3D 0, irq;
> -
> - =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
> -
> - =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "n=
o platform data defined\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> - =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 int ret, irq;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd =3D kzalloc(sizeof(struct mtd_info) + size=
of(struct pxa3xx_nand_info),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GFP_KERNEL);
> @@ -1131,8 +1124,8 @@ static int __devinit pxa3xx_nand_probe(struct
> platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D (struct pxa3xx_nand_info *)(&mtd[1]);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->pdev =3D pdev;
>
> - =C2=A0 =C2=A0 =C2=A0 this =3D &info->nand_chip;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->priv =3D info;
> + =C2=A0 =C2=A0 =C2=A0 info->mtd =3D mtd;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->owner =3D THIS_MODULE;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->clk =3D clk_get(&pdev->dev, NULL);
> @@ -1210,27 +1203,9 @@ static int __devinit pxa3xx_nand_probe(struct
> platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_init_mtd(mtd, info);
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, info);
>
> - =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, mtd);
> -
> - =C2=A0 =C2=A0 =C2=A0 if (nand_scan(mtd, 1)) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "f=
ailed to scan nand\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENXIO;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_free_irq;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 if (mtd_has_cmdlinepart()) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char *pro=
bes[] =3D { "cmdlinepart", NULL };
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_partition *=
parts;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_parts;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_parts =3D parse_mtd=
_partitions(mtd, probes, &parts, 0);
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_parts)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return add_mtd_partitions(mtd, parts, nr_parts);
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(mtd, pdata->parts, pdata=
->nr_parts);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
>
> =C2=A0fail_free_irq:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(irq, info);
> @@ -1255,8 +1230,8 @@ fail_free_mtd:
>
> =C2=A0static int pxa3xx_nand_remove(struct platform_device *pdev)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D platform_get_drvdata(pdev=
);
> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_drv=
data(pdev);
> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *r;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;
>
> @@ -1285,11 +1260,48 @@ static int pxa3xx_nand_remove(struct
> platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info;
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
> + =C2=A0 =C2=A0 =C2=A0 if (!pdata) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "n=
o platform data defined\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D alloc_nand_resource(pdev);
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 info =3D platform_get_drvdata(pdev);
> + =C2=A0 =C2=A0 =C2=A0 if (nand_scan(info->mtd, 1)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "f=
ailed to scan nand\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_remove(pde=
v);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (mtd_has_cmdlinepart()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char *pro=
bes[] =3D { "cmdlinepart", NULL };
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_partition *=
parts;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int nr_parts;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_parts =3D parse_mtd=
_partitions(mtd, probes, &parts, 0);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nr_parts)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return add_mtd_partitions(mtd, parts, nr_parts);
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return add_mtd_partitions(info->mtd, pdata->parts,=
 pdata->nr_parts);
> +}
> +
> =C2=A0#ifdef CONFIG_PM
> =C2=A0static int pxa3xx_nand_suspend(struct platform_device *pdev,
> pm_message_t state)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info *)platfo=
rm_get_drvdata(pdev);
> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_drv=
data(pdev);
> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->state !=3D STATE_READY) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&pdev->dev=
, "driver busy, state =3D %d\n", info->state);
> @@ -1301,8 +1313,8 @@ static int pxa3xx_nand_suspend(struct
> platform_device *pdev, pm_message_t state)
>
> =C2=A0static int pxa3xx_nand_resume(struct platform_device *pdev)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D (struct mtd_info *)platfo=
rm_get_drvdata(pdev);
> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D platform_get_drv=
data(pdev);
> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR0CS0, info->ndtr0cs0);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, info->ndtr1cs0);
> --
> 1.7.0.4
>
