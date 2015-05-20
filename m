Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvCTj-0007qd-LU
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 22:28:44 +0000
Received: by qget53 with SMTP id t53so30934629qge.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 15:28:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520215250.GP11598@ld-irv-0074>
References: <1431546057-16596-1-git-send-email-b45815@freescale.com>
 <20150520215250.GP11598@ld-irv-0074>
Date: Wed, 20 May 2015 17:28:20 -0500
Message-ID: <CA+EcR231boQyR9Jj7SRkmoOgZbv-WLhdzUK+S7ZHDaGqECsF-Q@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: fsl-quadspi: Access multiple chips simultaneously
From: Han Xu <xhnjupt@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie.huang@intel.com>, Han Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 4:52 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Han,
>
> On Wed, May 13, 2015 at 02:40:57PM -0500, Han Xu wrote:
>> Add supports for simultaneous access to multiple chips. Need to lock
>> the mutex before any quad spi operations and unlock the mutex after
>> operations complete.
>>
>> Signed-off-by: Han Xu <b45815@freescale.com>
>> ---
>> v2 -- > v3
>> 1. Unlock the mutex if errors occur.
>> 2. Destroy the mutex when module remove or probe fail.
>>
>> v1 -- > v2
>> 1. Rebase to latest l2-mtd code and resend.
>> ---
>>
>>
>>  drivers/mtd/spi-nor/fsl-quadspi.c | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
>> index 52a872f..e6fc064 100644
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> ...
>> @@ -761,13 +763,17 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>       struct fsl_qspi *q = nor->priv;
>>       int ret;
>>
>> +     mutex_lock(&q->lock);
>>       ret = clk_enable(q->clk_en);
>> -     if (ret)
>> +     if (ret) {
>> +             mutex_unlock(&q->lock);
>>               return ret;
>> +     }
>>
>>       ret = clk_enable(q->clk);
>>       if (ret) {
>>               clk_disable(q->clk_en);
>> +             mutex_unlock(&q->lock);
>>               return ret;
>>       }
>>
>
> I think it'd be better to have a single error path in this function now.
>
> Otherwise, I think this is OK. I can push the appended patch instead, if
> that's OK with you.

Hi Brian, I think that's fine. I will submit another patch to improve it.

>
> Signed-off-by: Han Xu <b45815@freescale.com>
> [Brian: reworked err path in fsl_qspi_prep()]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 52a872fa1b6e..4fe13dd535f8 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -26,6 +26,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/mutex.h>
>
>  /* The registers */
>  #define QUADSPI_MCR                    0x00
> @@ -233,6 +234,7 @@ struct fsl_qspi {
>         u32 clk_rate;
>         unsigned int chip_base_addr; /* We may support two chips. */
>         bool has_second_chip;
> +       struct mutex lock;
>  };
>
>  static inline int is_vybrid_qspi(struct fsl_qspi *q)
> @@ -761,18 +763,24 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>         struct fsl_qspi *q = nor->priv;
>         int ret;
>
> +       mutex_lock(&q->lock);
>         ret = clk_enable(q->clk_en);
>         if (ret)
> -               return ret;
> +               goto err_mutex;
>
>         ret = clk_enable(q->clk);
> -       if (ret) {
> -               clk_disable(q->clk_en);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_clk;
>
>         fsl_qspi_set_base_addr(q, nor);
>         return 0;
> +
> +err_clk:
> +       clk_disable(q->clk_en);
> +err_mutex:
> +       mutex_unlock(&q->lock);
> +
> +       return ret;
>  }
>
>  static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> @@ -781,6 +789,7 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>
>         clk_disable(q->clk);
>         clk_disable(q->clk_en);
> +       mutex_unlock(&q->lock);
>  }
>
>  static int fsl_qspi_probe(struct platform_device *pdev)
> @@ -864,6 +873,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>         if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
>                 q->has_second_chip = true;
>
> +       mutex_init(&q->lock);
> +
>         /* iterate the subnodes. */
>         for_each_available_child_of_node(dev->of_node, np) {
>                 char modalias[40];
> @@ -892,24 +903,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>
>                 ret = of_modalias_node(np, modalias, sizeof(modalias));
>                 if (ret < 0)
> -                       goto irq_failed;
> +                       goto mutex_failed;
>
>                 ret = of_property_read_u32(np, "spi-max-frequency",
>                                 &q->clk_rate);
>                 if (ret < 0)
> -                       goto irq_failed;
> +                       goto mutex_failed;
>
>                 /* set the chip address for READID */
>                 fsl_qspi_set_base_addr(q, nor);
>
>                 ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>                 if (ret)
> -                       goto irq_failed;
> +                       goto mutex_failed;
>
>                 ppdata.of_node = np;
>                 ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>                 if (ret)
> -                       goto irq_failed;
> +                       goto mutex_failed;
>
>                 /* Set the correct NOR size now. */
>                 if (q->nor_size == 0) {
> @@ -950,6 +961,8 @@ last_init_failed:
>                         i *= 2;
>                 mtd_device_unregister(&q->mtd[i]);
>         }
> +mutex_failed:
> +       mutex_destroy(&q->lock);
>  irq_failed:
>         clk_disable_unprepare(q->clk);
>  clk_failed:
> @@ -973,6 +986,7 @@ static int fsl_qspi_remove(struct platform_device *pdev)
>         writel(QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);
>         writel(0x0, q->iobase + QUADSPI_RSER);
>
> +       mutex_destroy(&q->lock);
>         clk_unprepare(q->clk);
>         clk_unprepare(q->clk_en);
>         return 0;
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
