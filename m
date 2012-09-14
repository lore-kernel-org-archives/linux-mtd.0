Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCXsJ-0001U6-TV
 for linux-mtd@lists.infradead.org; Fri, 14 Sep 2012 15:32:13 +0000
Received: by vcbgb22 with SMTP id gb22so5267789vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 08:32:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346839292-31001-1-git-send-email-sachin.kamat@linaro.org>
References: <1346839292-31001-1-git-send-email-sachin.kamat@linaro.org>
Date: Fri, 14 Sep 2012 21:02:08 +0530
Message-ID: <CAK9yfHwP-XOUfPjyi7xUzcWPg_EKLKhhG5z_JktHwf7sDVa--g@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand/gpio: Use module_platform_driver macro
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 patches@linaro.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping..

On 5 September 2012 15:31, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> module_platform_driver simplifies the code by eliminating
> module_init and module_exit calls.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/nand/gpio.c |   15 +--------------
>  1 files changed, 1 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index ce6a284..bc73bc5 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -417,20 +417,7 @@ static struct platform_driver gpio_nand_driver =3D {
>         },
>  };
>
> -static int __init gpio_nand_init(void)
> -{
> -       printk(KERN_INFO "GPIO NAND driver, =A9 2004 Simtec Electronics\n=
");
> -
> -       return platform_driver_register(&gpio_nand_driver);
> -}
> -
> -static void __exit gpio_nand_exit(void)
> -{
> -       platform_driver_unregister(&gpio_nand_driver);
> -}
> -
> -module_init(gpio_nand_init);
> -module_exit(gpio_nand_exit);
> +module_platform_driver(gpio_nand_driver);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
> --
> 1.7.4.1
>



--=20
With warm regards,
Sachin
