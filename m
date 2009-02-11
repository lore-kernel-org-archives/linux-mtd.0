Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXArU-0005Or-PQ
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 08:54:31 +0000
Date: Wed, 11 Feb 2009 09:54:21 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: [PATCH] max_retries reaches -1, not 0
Message-ID: <20090211085421.GA23048@pengutronix.de>
References: <499202F4.3020408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499202F4.3020408@gmail.com>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 10, 2009 at 11:43:00PM +0100, Roel Kluin wrote:
> With while (max_retries-- > 0) { ... } max_retries reaches -1, not 0,
> so we shouldn't DEBUG() on a max_retries of 0.

Yes, indeed.

> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 21fd4f1..5c34148 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -192,7 +192,7 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
>  			}
>  			udelay(1);
>  		}
> -		if (max_retries <= 0)
> +		if (max_retries < 0)
>  			DEBUG(MTD_DEBUG_LEVEL0, "%s(%d): INT not set\n",
>  			      __func__, param);
>  	}


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
