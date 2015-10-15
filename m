Received: from mail-lf0-f52.google.com ([209.85.215.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmnLv-00057F-0S
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 18:34:11 +0000
Received: by lffv3 with SMTP id v3so41606227lff.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 11:33:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
Date: Thu, 15 Oct 2015 15:33:48 -0300
Message-ID: <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

Robert:

Can you test this on a platform with PM support, and make sure
the NAND works fine after a resume?

On 12 October 2015 at 17:33, Brian Norris <computersforpeace@gmail.com> wro=
te:
> mtd_{suspend,resume}() get called from mtdcore in a class suspend/resume
> callback. We don't need to call them again here. In practice, this would
> actually work OK, as nand_base actually handles nesting OK -- it just
> might print warnings.
>
> Untested, but there are few (no?) users of PM for this driver AFAIK.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 17 -----------------
>  1 file changed, 17 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 232c7074624a..cce5a32eef60 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1892,32 +1892,19 @@ static int pxa3xx_nand_probe(struct platform_devi=
ce *pdev)
>  static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_=
t state)
>  {
>         struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev);
> -       struct pxa3xx_nand_platform_data *pdata;
> -       struct mtd_info *mtd;
> -       int cs;
>
> -       pdata =3D dev_get_platdata(&pdev->dev);
>         if (info->state) {
>                 dev_err(&pdev->dev, "driver busy, state =3D %d\n", info->=
state);
>                 return -EAGAIN;
>         }
>
> -       for (cs =3D 0; cs < pdata->num_cs; cs++) {
> -               mtd =3D info->host[cs]->mtd;
> -               mtd_suspend(mtd);
> -       }
> -
>         return 0;
>  }
>
>  static int pxa3xx_nand_resume(struct platform_device *pdev)
>  {
>         struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev);
> -       struct pxa3xx_nand_platform_data *pdata;
> -       struct mtd_info *mtd;
> -       int cs;
>
> -       pdata =3D dev_get_platdata(&pdev->dev);
>         /* We don't want to handle interrupt without calling mtd routine =
*/
>         disable_int(info, NDCR_INT_MASK);
>
> @@ -1935,10 +1922,6 @@ static int pxa3xx_nand_resume(struct platform_devi=
ce *pdev)
>          * all status before resume
>          */
>         nand_writel(info, NDSR, NDSR_MASK);
> -       for (cs =3D 0; cs < pdata->num_cs; cs++) {
> -               mtd =3D info->host[cs]->mtd;
> -               mtd_resume(mtd);
> -       }
>
>         return 0;
>  }
> --
> 2.6.0.rc2.230.g3dd15c0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
