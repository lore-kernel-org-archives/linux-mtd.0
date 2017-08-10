Received: from ni.piap.pl ([195.187.100.4])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dfffh-00044h-MK
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 05:06:15 +0000
From: khalasa@piap.pl (Krzysztof =?utf-8?Q?Ha=C5=82asa?=)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Rename nand.h into rawnand.h
References: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: khalasa@piap.pl
Date: Thu, 10 Aug 2017 07:05:45 +0200
In-Reply-To: <1501860550-16506-1-git-send-email-boris.brezillon@free-electrons.com>
 (Boris Brezillon's message of "Fri, 4 Aug 2017 17:29:09 +0200")
Message-ID: <m38tisf1w6.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> --- a/arch/arm/mach-ixp4xx/ixdp425-setup.c
> +++ b/arch/arm/mach-ixp4xx/ixdp425-setup.c
> @@ -17,7 +17,7 @@
>  #include <linux/i2c-gpio.h>
>  #include <linux/io.h>
>  #include <linux/mtd/mtd.h>
> -#include <linux/mtd/nand.h>
> +#include <linux/mtd/rawnand.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/delay.h>
>  #include <linux/gpio.h>

Acked-by: Krzysztof Halasa <khalasa@piap.pl>
-- 
Krzysztof Halasa

Industrial Research Institute for Automation and Measurements PIAP
Al. Jerozolimskie 202, 02-486 Warsaw, Poland
