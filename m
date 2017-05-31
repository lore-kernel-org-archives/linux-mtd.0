Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG0Ab-000687-5X
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 09:44:02 +0000
Received: by mail-qk0-x234.google.com with SMTP id y201so7319833qka.0
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 02:43:40 -0700 (PDT)
Subject: Re: [PATCH] bcm47xx: fix build regression
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
References: <20170530112027.3983554-1-arnd@arndb.de>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <7b6903a2-ce54-44f9-18ed-a14bd32069ce@broadcom.com>
Date: Wed, 31 May 2017 11:43:36 +0200
MIME-Version: 1.0
In-Reply-To: <20170530112027.3983554-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/30/2017 1:20 PM, Arnd Bergmann wrote:
> An unknown change in the kernel headers caused a build regression
> in an MTD partition driver:
> 
> In file included from drivers/mtd/bcm47xxpart.c:12:0:
> include/linux/bcm47xx_nvram.h: In function 'bcm47xx_nvram_init_from_mem':
> include/linux/bcm47xx_nvram.h:27:10: error: 'ENOTSUPP' undeclared (first use in this function)
> 
> Clearly we want to include linux/errno.h here.

unfortunate that you did not find the commit that caused this build 
regression. You could produce preprocessor output when it was working to 
see where errno.h got implicitly included and start looking there for 
git history.

Regards,
Arend

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   include/linux/bcm47xx_nvram.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/bcm47xx_nvram.h b/include/linux/bcm47xx_nvram.h
> index 2793652fbf66..a414a2b53e41 100644
> --- a/include/linux/bcm47xx_nvram.h
> +++ b/include/linux/bcm47xx_nvram.h
> @@ -8,6 +8,7 @@
>   #ifndef __BCM47XX_NVRAM_H
>   #define __BCM47XX_NVRAM_H
>   
> +#include <linux/errno.h>
>   #include <linux/types.h>
>   #include <linux/kernel.h>
>   #include <linux/vmalloc.h>
> 
