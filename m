MIME-Version: 1.0
In-Reply-To: <1282813011-6187-2-git-send-email-mark.brown314@gmail.com>
References: <1282813011-6187-1-git-send-email-mark.brown314@gmail.com>
	<1282813011-6187-2-git-send-email-mark.brown314@gmail.com>
Date: Tue, 31 Aug 2010 13:51:06 +0800
Message-ID: <AANLkTinn_Yb+jGOcpc139X2cW0ax5Ev23ovjpp9NrPJC@mail.gmail.com>
Subject: Re: [PATCH] ARM: pxa3xx: fix build error when CONFIG_MTD_PARTITIONS
	is not defined
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: "Mark F. Brown" <mark.brown314@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, dedekind1 <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 26, 2010 at 4:56 PM, Mark F. Brown <mark.brown314@gmail.com> wr=
ote:
> Signed-off-by: Mark F. Brown <mark.brown314@gmail.com>
> ---
> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 4d89f37..4d01cda 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1320,6 +1320,7 @@ static int pxa3xx_nand_probe(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail_free_irq;
> =A0 =A0 =A0 =A0}
>
> +#ifdef CONFIG_MTD_PARTITIONS
> =A0 =A0 =A0 =A0if (mtd_has_cmdlinepart()) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0static const char *probes[] =3D { "cmdline=
part", NULL };
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct mtd_partition *parts;
> @@ -1332,6 +1333,9 @@ static int pxa3xx_nand_probe(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return add_mtd_partitions(mtd, pdata->parts, pdata->nr_par=
ts);
> +#else
> + =A0 =A0 =A0 return 0;
> +#endif
>
> =A0fail_free_irq:
> =A0 =A0 =A0 =A0free_irq(irq, info);
> @@ -1364,7 +1368,9 @@ static int pxa3xx_nand_remove(struct platform_devic=
e *pdev)
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, NULL);
>
> =A0 =A0 =A0 =A0del_mtd_device(mtd);
> +#ifdef CONFIG_MTD_PARTITIONS
> =A0 =A0 =A0 =A0del_mtd_partitions(mtd);
> +#endif
> =A0 =A0 =A0 =A0irq =3D platform_get_irq(pdev, 0);
> =A0 =A0 =A0 =A0if (irq >=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free_irq(irq, info);
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>

Hi Mark,

Don't forget to cc maintainer of mtd tree. I loop them now.

Thanks
Haojian
