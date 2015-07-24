Received: from mail-vn0-x232.google.com ([2607:f8b0:400c:c0f::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf41-0000Lj-0U
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:39:12 +0000
Received: by vnaa140 with SMTP id a140so10349747vna.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:38:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-4-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-4-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:38:48 -0500
Message-ID: <CA+EcR21wBEUWUkmKZt6RDqbtb99gV+nLhJgSio=xbmjF47siCg@mail.gmail.com>
Subject: Re: [PATCH 4/7] mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the random
 QSPI access failed issue
From: Han Xu <xhnjupt@gmail.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "b45815@freescale.com" <b45815@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 2:39 PM,  <Frank.Li@freescale.com> wrote:
> From: Allen Xu <b45815@freescale.com>
>
> We found there is a low probability(5%) QSPI access timeout issue,
> usually it happened on kernel boot stage, the first time kernel tried to
> access QSPI chip. The READ_ID command was sent but not executed,
> consequently the probe function failed.
>
> Finally we located the issue by these steps.
>
> 1. Since the issue happened randomly and usually it cost half day to
> reproduce, we add more debug code in driver, to create a timeout file if
> the issue occurred.
>
> 2. Prepared an autorun script to keep rebooting the system and check if
> the timeout file existed, if the file existed, stop reboot.
>
> 3. The system will stop rebooting when timeout error occurred, set the
> CCM_CCOSR register and related IOMUX to measure QPSI clock, found there
> is no clock output, while clock output can be measured when QSPI driver
> successfully probed.
>
> 4. Check the code and found QSPI clock rate was changed while not
> disabled clock gate, most of the multiplexers on i.MX6 are glitch ones,
> clock glitch may occurred and propagated into downstream clock dividers
>
> Based on the new clock flag(CLK_SET_RATE_GATE) and new framework, we
> need to change the approach of seting clock rate. In current
> implementation, there are several places in which the clock was touched.
>
> 1. probe function. prepare and enable clock before setting the QSPI
> register, disable and unprepare the clock before exit.
>
> 2. nor_setup & nor_setup_last, since we change clock rate in these two
> functions.
>
> 3. fsl_qspi_prep and fsl_qspi_unprep, clock was enabled only when got
> QSPI access request.
>
> 4. resume function. Clock was required to restroe the setting after
> resume, disable the clock before exit.
>
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 83 +++++++++++++++++++++++++++------------
>  1 file changed, 58 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 921fba1..1419f1f 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -653,6 +653,32 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>                 q->iobase + QUADSPI_BFGENCR);
>  }
>
> +/* This function was used to prepare and enable QSPI clock */
> +static int fsl_qspi_clk_prep_enable(struct fsl_qspi *q)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(q->clk_en);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(q->clk);
> +       if (ret) {
> +               clk_disable_unprepare(q->clk_en);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/* This function was used to disable and unprepare QSPI clock */
> +static void fsl_qspi_clk_disable_unprep(struct fsl_qspi *q)
> +{
> +       clk_disable_unprepare(q->clk);
> +       clk_disable_unprepare(q->clk_en);
> +
> +}
> +
>  /* We use this function to do some basic init for spi_nor_scan(). */
>  static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>  {
> @@ -660,11 +686,19 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>         u32 reg;
>         int ret;
>
> -       /* the default frequency, we will change it in the future.*/
> +       /* disable and unprepare clock first */
> +       fsl_qspi_clk_disable_unprep(q);
> +
> +       /* the default frequency, we will change it in the future. */
>         ret = clk_set_rate(q->clk, 66000000);
>         if (ret)
>                 return ret;
>
> +       /* prepare and enable the clock */
> +       ret = fsl_qspi_clk_prep_enable(q);
> +       if (ret)
> +               return ret;
> +
>         /* Init the LUT table. */
>         fsl_qspi_init_lut(q);
>
> @@ -696,10 +730,18 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>         if (needs_4x_clock(q))
>                 rate *= 4;
>
> +       /* disable and unprepare clock first */
> +       fsl_qspi_clk_disable_unprep(q);
> +
>         ret = clk_set_rate(q->clk, rate);
>         if (ret)
>                 return ret;
>
> +       /* prepare and enable the clock */
> +       ret = fsl_qspi_clk_prep_enable(q);
> +       if (ret)
> +               return ret;
> +
>         /* Init the LUT table again. */
>         fsl_qspi_init_lut(q);
>
> @@ -841,22 +883,16 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>         int ret;
>
>         mutex_lock(&q->lock);
> -       ret = clk_enable(q->clk_en);
> -       if (ret)
> -               goto err_mutex;
>
> -       ret = clk_enable(q->clk);
> +       ret = fsl_qspi_clk_prep_enable(q);
>         if (ret)
> -               goto err_clk;
> +               goto err_mutex;
>
>         fsl_qspi_set_base_addr(q, nor);
>         return 0;
>
> -err_clk:
> -       clk_disable(q->clk_en);
>  err_mutex:
>         mutex_unlock(&q->lock);
> -
>         return ret;
>  }
>
> @@ -864,8 +900,7 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  {
>         struct fsl_qspi *q = nor->priv;
>
> -       clk_disable(q->clk);
> -       clk_disable(q->clk_en);
> +       fsl_qspi_clk_disable_unprep(q);
>         mutex_unlock(&q->lock);
>  }
>
> @@ -909,15 +944,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>         if (IS_ERR(q->clk))
>                 return PTR_ERR(q->clk);
>
> -       ret = clk_prepare_enable(q->clk_en);
> +       ret = fsl_qspi_clk_prep_enable(q);
>         if (ret) {
> -               dev_err(dev, "cannot enable the qspi_en clock: %d\n", ret);
> -               return ret;
> -       }
> -
> -       ret = clk_prepare_enable(q->clk);
> -       if (ret) {
> -               dev_err(dev, "cannot enable the qspi clock: %d\n", ret);
> +               dev_err(dev, "can not enable the clock\n");
>                 goto clk_failed;
>         }
>
> @@ -1023,8 +1052,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>         if (ret)
>                 goto last_init_failed;
>
> -       clk_disable(q->clk);
> -       clk_disable(q->clk_en);
> +       fsl_qspi_clk_disable_unprep(q);
>         return 0;
>
>  last_init_failed:
> @@ -1037,9 +1065,9 @@ last_init_failed:
>  mutex_failed:
>         mutex_destroy(&q->lock);
>  irq_failed:
> -       clk_disable_unprepare(q->clk);
> +       fsl_qspi_clk_disable_unprep(q);
>  clk_failed:
> -       clk_disable_unprepare(q->clk_en);
> +       dev_err(dev, "Freescale QuadSPI probe failed\n");
>         return ret;
>  }
>
> @@ -1060,8 +1088,6 @@ static int fsl_qspi_remove(struct platform_device *pdev)
>         writel(0x0, q->iobase + QUADSPI_RSER);
>
>         mutex_destroy(&q->lock);
> -       clk_unprepare(q->clk);
> -       clk_unprepare(q->clk_en);
>
>         if (q->ahb_addr)
>                 iounmap(q->ahb_addr);
> @@ -1076,12 +1102,19 @@ static int fsl_qspi_suspend(struct platform_device *pdev, pm_message_t state)
>
>  static int fsl_qspi_resume(struct platform_device *pdev)
>  {
> +       int ret;
>         struct fsl_qspi *q = platform_get_drvdata(pdev);
>
> +       ret = fsl_qspi_clk_prep_enable(q);
> +       if (ret)
> +               return ret;
> +
>         fsl_qspi_nor_setup(q);
>         fsl_qspi_set_map_addr(q);
>         fsl_qspi_nor_setup_last(q);
>
> +       fsl_qspi_clk_disable_unprep(q);
> +
>         return 0;
>  }
>
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
