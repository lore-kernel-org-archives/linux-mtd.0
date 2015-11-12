Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwn6f-00037T-An
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:19:46 +0000
Date: Thu, 12 Nov 2015 09:19:09 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: baruch@tkos.co.il, computersforpeace@gmail.com, dwmw2@infradead.org,
 fransklaver@gmail.com, k.kozlowski.k@gmail.com,
 luis@debethencourt.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
Message-ID: <20151112081909.GD24008@pengutronix.de>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Corentin,

On Thu, Nov 12, 2015 at 08:46:55AM +0100, LABBE Corentin wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.
> 
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/mtd/nand/mxc_nand.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 136e73a..9e42431 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1464,8 +1464,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  {
>  	struct device_node *np = host->dev->of_node;
>  	struct mxc_nand_platform_data *pdata = &host->pdata;
> -	const struct of_device_id *of_id =
> -		of_match_device(mxcnd_dt_ids, host->dev);
> +	const struct of_device_id *of_id;
>  	int buswidth;
>  
>  	if (!np)
> @@ -1482,6 +1481,9 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
>  
>  	pdata->width = buswidth / 8;
>  
> +	of_id = of_match_device(mxcnd_dt_ids, host->dev);
> +	if (!of_id)
> +		return -ENODEV;

You should return 1 here instead of -ENODEV. Also this check should
better be done instead of

	if (!np)
		return 1;

at the start of the function. I really wonder there is no helper
function like:

	#define of_sensible_name(dev)	of_match_device(dev->driver->of_match_table, dev)

Best regards
Uwe

>  	host->devtype_data = of_id->data;
>  
>  	return 0;
> -- 
> 2.4.10
> 
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
