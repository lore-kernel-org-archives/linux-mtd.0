Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA66w-0001T9-8a
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 21:29:11 +0000
Received: by dajq27 with SMTP id q27so20949daj.36
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 14:29:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Murali Karicheri <m-karicheri2@ti.com>, <dwmw2@infradead.org>,
 <artem.bityutskiy@linux.intel.com>, <dbaryshkov@gmail.com>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: Mike Turquette <mturquette@linaro.org>
In-Reply-To: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
References: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
Message-ID: <20120907212853.20289.86031@nucleus>
Subject: Re: [PATCH] mtd:nand:clk: preparation for switch to common clock
 framework
Date: Fri, 07 Sep 2012 14:28:53 -0700
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Murali Karicheri (2012-08-30 11:17:04)
> As a first step towards migrating davinci platforms to use common clock
> framework, replace all instances of clk_enable() with clk_prepare_enable()
> and clk_disable() with clk_disable_unprepare(). Until the platform is
> switched to use the CONFIG_HAVE_CLK_PREPARE Kconfig variable, this just
> adds a might_sleep() call and would work without any issues.
> =

> This will make it easy later to switch to common clk based implementation
> of clk driver from DaVinci specific driver.
> =

> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/mtd/nand/davinci_nand.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_n=
and.c
> index d94b03c..6b8cf27 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -656,7 +656,7 @@ static int __init nand_davinci_probe(struct platform_=
device *pdev)
>                 goto err_clk;
>         }
>  =

> -       ret =3D clk_enable(info->clk);
> +       ret =3D clk_prepare_enable(info->clk);
>         if (ret < 0) {
>                 dev_dbg(&pdev->dev, "unable to enable AEMIF clock, err %d=
\n",
>                         ret);
> @@ -767,7 +767,7 @@ syndrome_done:
>  =

>  err_scan:
>  err_timing:
> -       clk_disable(info->clk);
> +       clk_disable_unprepare(info->clk);
>  =

>  err_clk_enable:
>         clk_put(info->clk);
> @@ -804,7 +804,7 @@ static int __exit nand_davinci_remove(struct platform=
_device *pdev)
>  =

>         nand_release(&info->mtd);
>  =

> -       clk_disable(info->clk);
> +       clk_disable_unprepare(info->clk);
>         clk_put(info->clk);
>  =

>         kfree(info);
> -- =

> 1.7.9.5
