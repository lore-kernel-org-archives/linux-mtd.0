Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1X0SJq-0003QQ-5f
 for linux-mtd@lists.infradead.org; Fri, 27 Jun 2014 09:19:43 +0000
Date: Fri, 27 Jun 2014 11:19:17 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH 2/2] mxc_nand: use our own read_page function
Message-ID: <20140627091917.GD20413@pengutronix.de>
References: <1403815368-29469-1-git-send-email-m.grzeschik@pengutronix.de>
 <1403815368-29469-2-git-send-email-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403815368-29469-2-git-send-email-m.grzeschik@pengutronix.de>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 26, 2014 at 10:42:48PM +0200, Michael Grzeschik wrote:
> The current approach of the read_page function is to iterate over all
> subpages and call the correct_data function. The correct_data function
> currently does the same. It iterates over all subpages and checks for
> correctable and uncorrectable data. This redundant call for each
> subpage leads to miscalculations.
> 
> This patch changes the driver to use its own read_page function in which
> we call the correct_data function only once per page. With that we do
> the failure and correct statistics counting inside this function.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 73 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 7fd495e..09e3682 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c

[snip]

> @@ -673,15 +728,21 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
>  	do {
>  		err = ecc_stat & ecc_bit_mask;
>  		if (err > err_limit) {
> -			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> -			return -1;
> +			broken++;
>  		} else {
>  			ret += err;
>  		}
>  		ecc_stat >>= 4;
>  	} while (--no_subpages);
>  
> -	pr_debug("%d Symbol Correctable RS-ECC Error\n", ret);
> +	mtd->ecc_stats.corrected += ret;
> +	if (ret)
> +		printk("%d Symbol Correctable RS-ECC Error\n", ret);

This was ment to be pr_debug as before.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
