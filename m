Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHf-00026y-Kd
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:24 +0000
Received: by mail-wm0-x241.google.com with SMTP id a20so5316801wme.2
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:04 -0800 (PST)
Subject: Re: [PATCH 01/11] mtd: nand: denali: remove unneeded <linux/slab.h>
 includes
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <1478666130-13413-2-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Jason Roberts <jason.e.roberts@intel.com>, linux-kernel@vger.kernel.org,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>,
 Alan Cox <alan@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <94e0b7c7-ab2e-c7a7-fcf3-a7c4bd123008@gmail.com>
Date: Sat, 12 Nov 2016 22:28:53 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-2-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
> The driver calls devm_kzalloc()/devm_kfree() to allocate/free memory.
> They are declared in <linux/device.h>, not in <linux/slab.h>.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
> 
>  drivers/mtd/nand/denali.c     | 1 -
>  drivers/mtd/nand/denali_dt.c  | 1 -
>  drivers/mtd/nand/denali_pci.c | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 7e2c650..062d5b5 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -21,7 +21,6 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/wait.h>
>  #include <linux/mutex.h>
> -#include <linux/slab.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/module.h>
>  
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index f821dc1..5607fcd 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -21,7 +21,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/slab.h>
>  
>  #include "denali.h"
>  
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index de31514..ac84323 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -14,7 +14,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/slab.h>
>  
>  #include "denali.h"
>  
> 


-- 
Best regards,
Marek Vasut
