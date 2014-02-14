Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEEKH-0001b7-Gw
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 08:40:50 +0000
Date: Fri, 14 Feb 2014 15:58:21 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: fix off-by-one read retry mode counting
Message-ID: <20140214075820.GC22570@shlinux2.ap.freescale.net>
References: <1392254531-1796-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1392254531-1796-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 12, 2014 at 05:22:11PM -0800, Brian Norris wrote:
> A flash may support N read retry voltage threshold modes, numbered 1
> through N-1 (where mode 0 represents the initial state). However,
> nand_do_read_ops() tries to use mode 0 through N.
> 
> This off-by-one error shows up, for instance, when using nanddump, and
> we have cycled through available modes:
> 
>     nand: setting READ RETRY mode 0
>     nand: setting READ RETRY mode 1
>     nand: setting READ RETRY mode 2
>     nand: setting READ RETRY mode 3
>     nand: setting READ RETRY mode 4
>     nand: setting READ RETRY mode 5
>     nand: setting READ RETRY mode 6
>     nand: setting READ RETRY mode 7
>     nand: setting READ RETRY mode 8
>     libmtd: error!: cannot read 8192 bytes from mtd0 (eraseblock 20, offset 0)
>             error 22 (Invalid argument)
>     nanddump: error!: mtd_read
> 
> Tested on Micron MT29F64G08CBCBBH1, with 8 retry modes.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v1 -> v2: N modes means we should use modes 0 to N-1, not 0 to N
> 
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9be7842f300e..3cb1cefcd926 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1586,7 +1586,7 @@ read_retry:
>  			}
>  
>  			if (mtd->ecc_stats.failed - ecc_failures) {
> -				if (retry_mode + 1 <= chip->read_retries) {
> +				if (retry_mode + 1 < chip->read_retries) {
>  					retry_mode++;
>  					ret = nand_setup_read_retry(mtd,
>  							retry_mode);
> -- 
> 1.8.3.2
> 
> 
> 

Acked-by: Huang Shijie <b32955@freescale.com>
