Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHxDr-0002ss-CS
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 10:23:15 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Dec 2009 11:23:06 +0100
References: <200912081056.40210.jbe@pengutronix.de>
In-Reply-To: <200912081056.40210.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912081123.06630.jbe@pengutronix.de>
Subject: Re: [PATCH] [NAND] S3C2410: Fix NFC clock enable/disable imbalance
Cc: linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

ups, forget this patch, does't work as expected (thanks Wolfram!). Will try 
again later...

Juergen Beisert wrote:
> When unmounting an mtd filesystem the s3c2410_nand_select_chip() function
> gets called again with "chip == -1". In this case the current code disables
> the NFC clock at least a second time, so it does not work anymore.
> Clock disabling should only happen if it was really enabled.
>
> Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
>
> ---
>  drivers/mtd/nand/s3c2410.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> Index: linux-2.6.32/drivers/mtd/nand/s3c2410.c
> ===================================================================
> --- linux-2.6.32.orig/drivers/mtd/nand/s3c2410.c
> +++ linux-2.6.32/drivers/mtd/nand/s3c2410.c
> @@ -329,12 +329,16 @@ static void s3c2410_nand_select_chip(str
>  	struct s3c2410_nand_mtd *nmtd;
>  	struct nand_chip *this = mtd->priv;
>  	unsigned long cur;
> +	int clock_enabled;
>
>  	nmtd = this->priv;
>  	info = nmtd->info;
>
> -	if (chip != -1 && allow_clk_stop(info))
> +	if (chip != -1 && allow_clk_stop(info)) {
>  		clk_enable(info->clk);
> +		clock_enabled = 1;
> +	} else
> +		clock_enabled = 0;
>
>  	cur = readl(info->sel_reg);
>
> @@ -356,7 +360,7 @@ static void s3c2410_nand_select_chip(str
>
>  	writel(cur, info->sel_reg);
>
> -	if (chip == -1 && allow_clk_stop(info))
> +	if (chip == -1 && allow_clk_stop(info) && clock_enabled != 0)
>  		clk_disable(info->clk);
>  }

Juergen

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
