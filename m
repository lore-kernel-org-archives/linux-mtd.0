Received: from mms1.broadcom.com ([216.31.210.17])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVThn-0005ny-U5
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 19:51:05 +0000
Message-ID: <4ED53793.80209@broadcom.com>
Date: Tue, 29 Nov 2011 11:50:43 -0800
From: "Jiandong Zheng" <jdzheng@broadcom.com>
MIME-Version: 1.0
To: "Axel Lin" <axel.lin@gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
References: <1322397903.2799.5.camel@phoenix>
In-Reply-To: <1322397903.2799.5.camel@phoenix>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Manuel Lauss <manuel.lauss@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/27/2011 4:45 AM, Axel Lin wrote:
> This patch converts the drivers in drivers/mtd/* to use the
> module_platform_driver() macro which makes the code smaller and a bit
> simpler.
>
> Cc: David Woodhouse<dwmw2@infradead.org>
> Cc: Jiandong Zheng<jdzheng@broadcom.com>
> Cc: Scott Branden<sbranden@broadcom.com>
> Cc: Wan ZongShun<mcuos.com@gmail.com>
> Cc: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> Cc: Jamie Iles<jamie@jamieiles.com>
> Cc: Olof Johansson<olof@lixom.net>
> Cc: Kyungmin Park<kyungmin.park@samsung.com>
> Cc: Haojian Zhuang<haojian.zhuang@gmail.com>
> Cc: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> Cc: Ralf Baechle<ralf@linux-mips.org>
> Cc: Brian Norris<computersforpeace@gmail.com>
> Cc: Lars-Peter Clausen<lars@metafoo.de>
> Cc: Manuel Lauss<manuel.lauss@googlemail.com>
> Cc: Vimal Singh<vimal.newwork@gmail.com>
> Cc: Andres Salomon<dilinger@queued.net>
> Cc: Sukumar Ghorai<s-ghorai@ti.com>
> Signed-off-by: Axel Lin<axel.lin@gmail.com>
> ---

>   drivers/mtd/nand/bcm_umi_nand.c     |   13 +------------

> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index 46b58d6..50387fd 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -546,18 +546,7 @@ static struct platform_driver nand_driver = {
>          .resume = bcm_umi_nand_resume,
>   };
>
> -static int __init nand_init(void)
> -{
> -       return platform_driver_register(&nand_driver);
> -}
> -
> -static void __exit nand_exit(void)
> -{
> -       platform_driver_unregister(&nand_driver);
> -}
> -
> -module_init(nand_init);
> -module_exit(nand_exit);
> +module_platform_driver(nand_driver);
>
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Broadcom");

Acked-by: Jiandong Zheng <jdzheng@broadcom.com>
