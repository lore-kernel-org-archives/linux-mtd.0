Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMboo-0001q9-CV
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2013 10:18:27 +0000
Received: by mail-oa0-f52.google.com with SMTP id k14so1877539oag.11
 for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2013 03:18:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
References: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
Date: Mon, 1 Apr 2013 15:48:23 +0530
Message-ID: <CAK9yfHy7xEhQ6r6yUko6U0tA2_k65bD=cBqfDbBZa3yTRr+Eew@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: bf5xx_nand: Use module_platform_driver()
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 March 2013 16:46, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>
> module_platform_driver macro removes some boilerplate and makes
> the code simpler.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/nand/bf5xx_nand.c |   16 +---------------
>  1 files changed, 1 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
> index 4271e94..776df36 100644
> --- a/drivers/mtd/nand/bf5xx_nand.c
> +++ b/drivers/mtd/nand/bf5xx_nand.c
> @@ -874,21 +874,7 @@ static struct platform_driver bf5xx_nand_driver = {
>         },
>  };
>
> -static int __init bf5xx_nand_init(void)
> -{
> -       printk(KERN_INFO "%s, Version %s (c) 2007 Analog Devices, Inc.\n",
> -               DRV_DESC, DRV_VERSION);
> -
> -       return platform_driver_register(&bf5xx_nand_driver);
> -}
> -
> -static void __exit bf5xx_nand_exit(void)
> -{
> -       platform_driver_unregister(&bf5xx_nand_driver);
> -}
> -
> -module_init(bf5xx_nand_init);
> -module_exit(bf5xx_nand_exit);
> +module_platform_driver(bf5xx_nand_driver);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR(DRV_AUTHOR);
> --
> 1.7.4.1
>

Ping..
