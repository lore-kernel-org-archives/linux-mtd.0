Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjqI-0001Cx-Mo
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:27:35 +0000
Received: by mail-ob0-f169.google.com with SMTP id ta14so909767obb.14
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 04:27:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
References: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
Date: Wed, 13 Mar 2013 16:57:32 +0530
Message-ID: <CAK9yfHxNmeMF7VnnvcP233Y7Ojt=9QrLB0P=tpvuomtbzGimAA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mtd: txx9ndfmc: Use module_platform_driver_probe macro
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 5 March 2013 14:15, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> module_platform_driver_probe() eliminates the boilerplate and simplifies
> the code.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Does this series look good?

> ---
>  drivers/mtd/nand/txx9ndfmc.c |   13 +------------
>  1 files changed, 1 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
> index e1e8748..7ed654c 100644
> --- a/drivers/mtd/nand/txx9ndfmc.c
> +++ b/drivers/mtd/nand/txx9ndfmc.c
> @@ -427,18 +427,7 @@ static struct platform_driver txx9ndfmc_driver = {
>         },
>  };
>
> -static int __init txx9ndfmc_init(void)
> -{
> -       return platform_driver_probe(&txx9ndfmc_driver, txx9ndfmc_probe);
> -}
> -
> -static void __exit txx9ndfmc_exit(void)
> -{
> -       platform_driver_unregister(&txx9ndfmc_driver);
> -}
> -
> -module_init(txx9ndfmc_init);
> -module_exit(txx9ndfmc_exit);
> +module_platform_driver_probe(txx9ndfmc_driver, txx9ndfmc_probe);
>
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("TXx9 SoC NAND flash controller driver");
> --
> 1.7.4.1
>



-- 
With warm regards,
Sachin
