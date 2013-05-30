Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ui08e-0003o0-5g
 for linux-mtd@lists.infradead.org; Thu, 30 May 2013 10:31:21 +0000
Received: by mail-la0-f41.google.com with SMTP id ee20so67367lab.14
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2013 03:30:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51A6B7D8.8090600@huawei.com>
References: <51A6B7D8.8090600@huawei.com>
Date: Thu, 30 May 2013 13:30:57 +0300
Message-ID: <CAHp75Vc9mYmUM4pmeKLBzxNFsx-xiSez6oxC1F5+Hh-hPXto5A@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] mtd: bcm47: convert to module_platform_driver
 instead of init/exit
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Libo Chen <clbchenlibo.chen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, hauke@hauke-m.de,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 30, 2013 at 5:22 AM, Libo Chen <clbchenlibo.chen@huawei.com> wrote:
>
> convert to module_platform_driver instead of init/exit

I give another thought about it. We have to be sure that the flash
device will be online when it's really needed.
module_init initcall is quite far in the boot process. Is it what we want?

> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -108,22 +108,4 @@ static struct platform_driver bcma_sflash_driver = {
>   * Init
>   **************************************************/
>
> -static int __init bcm47xxsflash_init(void)
> -{
> -       int err;
> -
> -       err = platform_driver_register(&bcma_sflash_driver);
> -       if (err)
> -               pr_err("Failed to register BCMA serial flash driver: %d\n",
> -                      err);
> -
> -       return err;
> -}
> -
> -static void __exit bcm47xxsflash_exit(void)
> -{
> -       platform_driver_unregister(&bcma_sflash_driver);
> -}
> -
> -module_init(bcm47xxsflash_init);
> -module_exit(bcm47xxsflash_exit);
> +module_platform_driver(bcma_sflash_driver);
> --
> 1.7.1
>
>



--
With Best Regards,
Andy Shevchenko
