Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFzjZ-0000rf-Ov
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 09:16:07 +0000
Date: Wed, 31 May 2017 11:15:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mips@linux-mips.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH] bcm47xx: fix build regression
Message-ID: <20170531111541.0ce9a99d@bbrezillon>
In-Reply-To: <20170530112027.3983554-1-arnd@arndb.de>
References: <20170530112027.3983554-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2017 13:20:12 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> An unknown change in the kernel headers caused a build regression
> in an MTD partition driver:
> 
> In file included from drivers/mtd/bcm47xxpart.c:12:0:
> include/linux/bcm47xx_nvram.h: In function 'bcm47xx_nvram_init_from_mem':
> include/linux/bcm47xx_nvram.h:27:10: error: 'ENOTSUPP' undeclared (first use in this function)
> 
> Clearly we want to include linux/errno.h here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  include/linux/bcm47xx_nvram.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/bcm47xx_nvram.h b/include/linux/bcm47xx_nvram.h
> index 2793652fbf66..a414a2b53e41 100644
> --- a/include/linux/bcm47xx_nvram.h
> +++ b/include/linux/bcm47xx_nvram.h
> @@ -8,6 +8,7 @@
>  #ifndef __BCM47XX_NVRAM_H
>  #define __BCM47XX_NVRAM_H
>  
> +#include <linux/errno.h>
>  #include <linux/types.h>
>  #include <linux/kernel.h>
>  #include <linux/vmalloc.h>
