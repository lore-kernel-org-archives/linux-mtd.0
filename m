Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSTzC-00046g-HT
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:00:23 +0000
Received: by pvh11 with SMTP id 11so1180987pvh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 06:00:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307086473.7474.1.camel@phoenix>
References: <1307086473.7474.1.camel@phoenix>
Date: Fri, 3 Jun 2011 15:00:18 +0200
Message-ID: <BANLkTinfOmA1cW6Ktuka1NS+7D0RhFqMvw@mail.gmail.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: remove unused variable 'mtd'
From: Daniel Mack <zonque@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>, linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, Lei Wen <adrian.wenl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(cc Lei Wen)

On Fri, Jun 3, 2011 at 9:34 AM, Axel Lin <axel.lin@gmail.com> wrote:
> Remove unused variable 'mtd' to eliminate below warning.
>
> =A0CC =A0 =A0 =A0drivers/mtd/nand/pxa3xx_nand.o
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_suspend':
> drivers/mtd/nand/pxa3xx_nand.c:1167: warning: unused variable 'mtd'
> drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_resume':
> drivers/mtd/nand/pxa3xx_nand.c:1180: warning: unused variable 'mtd'
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Lei, I had the same patch queued up on my side and dropped it now. Can
you apply this one?

Thanks,
Daniel



> ---
> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 1fb3b3a..5cae8ae 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1164,7 +1164,6 @@ static int pxa3xx_nand_probe(struct platform_device=
 *pdev)
> =A0static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_messag=
e_t state)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D platform_get_drvdata(pde=
v);
> - =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>
> =A0 =A0 =A0 =A0if (info->state) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&pdev->dev, "driver busy, state =
=3D %d\n", info->state);
> @@ -1177,7 +1176,6 @@ static int pxa3xx_nand_suspend(struct platform_devi=
ce *pdev, pm_message_t state)
> =A0static int pxa3xx_nand_resume(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D platform_get_drvdata(pde=
v);
> - =A0 =A0 =A0 struct mtd_info *mtd =3D info->mtd;
>
> =A0 =A0 =A0 =A0nand_writel(info, NDTR0CS0, info->ndtr0cs0);
> =A0 =A0 =A0 =A0nand_writel(info, NDTR1CS0, info->ndtr1cs0);
> --
> 1.7.4.1
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
