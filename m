Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNoAm-0001iI-J3
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 22:32:31 +0000
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id BB30B10535B
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 00:31:56 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: aspeed: include <linux/sizes.h>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1498028809-10595-1-git-send-email-clg@kaod.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1310b80c-01ee-d560-d63d-d30aeb980c6b@wedev4u.fr>
Date: Thu, 22 Jun 2017 00:31:47 +0200
MIME-Version: 1.0
In-Reply-To: <1498028809-10595-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/06/2017 à 09:06, Cédric Le Goater a écrit :
> This fix a compile error on some platforms :
> 
> drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_chip_set_segment':
> drivers/mtd/spi-nor/aspeed-smc.c:554:14: error: 'SZ_128M' undeclared (first use in this function)
>       size == SZ_128M) {
>               ^
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

squashed into ("mtd: spi-nor: aspeed: configure chip window on AHB bus")
in the spi-nor/next branch of l2-mtd

Thanks!

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index d91e0f3897b9..0106357421bd 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -19,6 +19,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/sizes.h>
>  #include <linux/sysfs.h>
>  
>  #define DEVICE_NAME	"aspeed-smc"
> 
