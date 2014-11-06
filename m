Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmE06-0005HR-P3
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 03:44:47 +0000
Date: Thu, 6 Nov 2014 11:44:11 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: improve wait-till-ready timeout loop
Message-ID: <20141106034411.GA26529@shldeISGChi005.sh.intel.com>
References: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 02:32:03AM -0800, Brian Norris wrote:
> There are a few small issues with the timeout loop in
> spi_nor_wait_till_ready():
> 
>  * The first operation should not be a reschedule; we should check the
>    status register at least once to see if we're complete!
> 
>  * We should check the status register one last time after declaring the
>    deadline has passed, to prevent a premature timeout erro (this is
>    theoretically possible if we sleep for a long time after the previous
>    status register check).
> 
>  * Add an error message, so it's obvious if we ever hit a timeout.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5e3a1d363895..d0dcaa1372ec 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -202,19 +202,24 @@ static int spi_nor_ready(struct spi_nor *nor)
>  static int spi_nor_wait_till_ready(struct spi_nor *nor)
>  {
>  	unsigned long deadline;
> -	int ret;
> +	int timeout = 0, ret;
>  
>  	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
>  
> -	do {
> -		cond_resched();
> +	while (!timeout) {
> +		if (time_after_eq(jiffies, deadline))
> +			timeout = 1;
>  
>  		ret = spi_nor_ready(nor);
>  		if (ret < 0)
>  			return ret;
>  		if (ret)
>  			return 0;
> -	} while (!time_after_eq(jiffies, deadline));
> +
> +		cond_resched();
> +	}
> +
> +	dev_err(nor->dev, "flash operation timed out\n");
>  
>  	return -ETIMEDOUT;
>  }
look good.

Acked-by: Huang Shijie <shijie.huang@intel.com>
