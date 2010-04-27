Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6fPq-000866-Ql
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 07:41:11 +0000
Subject: Re: [PATCH 05/16] mtd: remove unused #include <linux/version.h>
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Weiyi <weiyi.huang@gmail.com>
In-Reply-To: <1270727358-2388-1-git-send-email-weiyi.huang@gmail.com>
References: <1270727358-2388-1-git-send-email-weiyi.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 10:36:54 +0300
Message-ID: <1272353814.26036.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, leochen@broadcom.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-08 at 19:49 +0800, Huang Weiyi wrote:
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

Pushed to l2-mtd-2.6.git / master
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
