Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHriR-0001zb-Im
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 13:38:57 +0000
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id vANDcCwc026036
 for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2017 22:38:13 +0900
Received: by mail-yw0-f171.google.com with SMTP id q37so8490393ywa.12
 for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2017 05:38:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171120205713.86952-1-jc@linux.com>
References: <20171120205713.86952-1-jc@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 22:37:31 +0900
Message-ID: <CAK7LNAQxtVqcw9AvQQYKzhCYDOWVh=3OVUO9ifwG0yr6XX_K8Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: denali_pci: add missing
 MODULE_DESCRIPTION/AUTHOR/LICENSE
To: Jesse Chan <jc@linux.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-11-21 5:57 GMT+09:00 Jesse Chan <jc@linux.com>:
> This change resolves a new compile-time warning
> when built as a loadable module:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mtd/nand/denali_pci.o
> see include/linux/module.h for more information
>
> This adds the license as "GPL v2", which matches the header of the file.
>
> MODULE_DESCRIPTION and MODULE_AUTHOR are also added.
>
> Signed-off-by: Jesse Chan <jc@linux.com>
> ---
>  drivers/mtd/nand/denali_pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index 81370c79aa48..7ad0db65a6fa 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -124,3 +124,7 @@ static struct pci_driver denali_pci_driver = {
>  };
>
>  module_pci_driver(denali_pci_driver);
> +
> +MODULE_DESCRIPTION("PCI driver for Denali NAND controller");
> +MODULE_AUTHOR("Intel Corporation and its suppliers");
> +MODULE_LICENSE("GPL v2");


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
