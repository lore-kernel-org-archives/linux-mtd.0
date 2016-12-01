Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCOiy-0000fp-C4
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 10:36:21 +0000
Date: Thu, 1 Dec 2016 11:35:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, computersforpeace@gmail.com
Cc: richard@nod.at, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org, john@phrozen.org
Subject: Re: [PATCH] mtd: nand: xway: fix build undefined MODULE_DEVICE_TABLE()
Message-ID: <20161201113527.7a523c89@bbrezillon>
In-Reply-To: <20161130225110.10759-1-hauke@hauke-m.de>
References: <20161130225110.10759-1-hauke@hauke-m.de>
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

On Wed, 30 Nov 2016 23:51:10 +0100
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> The header file with the definition of MODULE_DEVICE_TABLE() was
> missing, add include for linux/module.h to fix the problem in 4.9.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Fixes: 024366750c2e ("mtd: nand: xway: convert to normal platform driver")
Cc: <stable@vger.kernel.org>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you take this patch directly in the MTD tree with the
additional Fixes and Cc tags?

> ---
>  drivers/mtd/nand/xway_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 1f2948c..bcbc1c7 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/mtd/nand.h>
> +#include <linux/module.h>
>  #include <linux/of_gpio.h>
>  #include <linux/of_platform.h>
>  
