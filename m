Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O6Ti2-0002lu-TK
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 19:11:11 +0000
Date: Mon, 26 Apr 2010 12:11:00 -0700
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "Huang Weiyi" <weiyi.huang@gmail.com>
Subject: Re: [PATCH 05/16] mtd: remove unused #include <linux/version.h>
Message-ID: <20100426191100.GJ18215@broadcom.com>
References: <1270727358-2388-1-git-send-email-weiyi.huang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1270727358-2388-1-git-send-email-weiyi.huang@gmail.com>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Leo Chen <leochen@broadcom.com>

On Thu, Apr 08, 2010 at 04:49:18AM -0700, Huang Weiyi wrote:
> Remove unused #include <linux/version.h>('s) in
>   drivers/mtd/nand/bcm_umi_nand.c
> 
> Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
> ---
>  drivers/mtd/nand/bcm_umi_nand.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index c997f98..2427460 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -13,7 +13,6 @@
>  *****************************************************************************/
>  
>  /* ---- Include Files ---------------------------------------------------- */
> -#include <linux/version.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> -- 
> 1.6.1.3
> 
> 

-- 

Leo Hao Chen

------------------------
Life is short, run long.
