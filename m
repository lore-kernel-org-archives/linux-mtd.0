Received: from mail-lb0-f175.google.com ([209.85.217.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmnKy-0004od-Hu
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 18:33:13 +0000
Received: by lbcao8 with SMTP id ao8so79829899lbc.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 11:32:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151012210741.GN107187@google.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
 <20151012210741.GN107187@google.com>
Date: Thu, 15 Oct 2015 15:32:50 -0300
Message-ID: <CAAEAJfDWY2ztYK5y=cBsrntztP+Hm_cDFovPY2YeyRS4XXrr8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: pxa3xx_nand: switch to device PM
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

+Robert

On 12 October 2015 at 18:07, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Mon, Oct 12, 2015 at 01:33:12PM -0700, Brian Norris wrote:
>> The old PM model is deprecated. This is equivalent.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> Sorry, this patch was garbage. Below is the correct one:
>
> ---
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index cce5a32eef60..51b67ae5ac1c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1889,21 +1889,21 @@ static int pxa3xx_nand_probe(struct platform_devi=
ce *pdev)
>  }
>
>  #ifdef CONFIG_PM
> -static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_=
t state)
> +static int pxa3xx_nand_suspend(struct device *dev)
>  {
> -       struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev);
> +       struct pxa3xx_nand_info *info =3D dev_get_drvdata(dev);
>
>         if (info->state) {
> -               dev_err(&pdev->dev, "driver busy, state =3D %d\n", info->=
state);
> +               dev_err(dev, "driver busy, state =3D %d\n", info->state);
>                 return -EAGAIN;
>         }
>
>         return 0;
>  }
>
> -static int pxa3xx_nand_resume(struct platform_device *pdev)
> +static int pxa3xx_nand_resume(struct device *dev)
>  {
> -       struct pxa3xx_nand_info *info =3D platform_get_drvdata(pdev);
> +       struct pxa3xx_nand_info *info =3D dev_get_drvdata(dev);
>
>         /* We don't want to handle interrupt without calling mtd routine =
*/
>         disable_int(info, NDCR_INT_MASK);
> @@ -1930,15 +1930,19 @@ static int pxa3xx_nand_resume(struct platform_dev=
ice *pdev)
>  #define pxa3xx_nand_resume     NULL
>  #endif
>
> +static const struct dev_pm_ops pxa3xx_nand_pm_ops =3D {
> +       .suspend        =3D pxa3xx_nand_suspend,
> +       .resume         =3D pxa3xx_nand_resume,
> +};
> +
>  static struct platform_driver pxa3xx_nand_driver =3D {
>         .driver =3D {
>                 .name   =3D "pxa3xx-nand",
>                 .of_match_table =3D pxa3xx_nand_dt_ids,
> +               .pm     =3D &pxa3xx_nand_pm_ops,
>         },
>         .probe          =3D pxa3xx_nand_probe,
>         .remove         =3D pxa3xx_nand_remove,
> -       .suspend        =3D pxa3xx_nand_suspend,
> -       .resume         =3D pxa3xx_nand_resume,
>  };
>
>  module_platform_driver(pxa3xx_nand_driver);
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
