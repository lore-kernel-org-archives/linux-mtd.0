Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PunZX-0005IX-9S
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 15:02:40 +0000
Date: Wed, 2 Mar 2011 16:02:35 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd/mxc_nand: fix read past buffer end
Message-ID: <20110302150235.GC29521@pengutronix.de>
References: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 02, 2011 at 04:47:55PM +0200, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/nand/mxc_nand.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Looks good to me. Did you stumble upon this by accident or did something
break? If yes, would be good to have it in the commit log.

Otherwise:

Acked-by: Sascha hauer <s.hauer@pengutronix.de>


> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 7b33811..466d7a9 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -641,9 +641,9 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  
>  	n = min(n, len);
>  
> -	memcpy(buf, host->data_buf + col, len);
> +	memcpy(buf, host->data_buf + col, n);
>  
> -	host->buf_start += len;
> +	host->buf_start += n;
>  }
>  
>  /* Used by the upper layer to verify the data in NAND Flash
> -- 
> 1.7.2.3
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
