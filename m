Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgW9a-0004lk-Rp
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2012 07:45:55 +0000
Date: Thu, 6 Dec 2012 08:45:51 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 1/2] mtd: mxc_nand: fix unbalanced clk_disable() in error
 path
Message-ID: <20121206074551.GU10369@pengutronix.de>
References: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 06, 2012 at 08:42:27AM +0100, Lothar Waﬂmann wrote:
> If nand_scan_ident() or nand_scan_tail() fails, the NAND chip may have
> been deselected and the clock already disabled. Thus, check 'clk_act'
> in the error path to decide whether the clock still needs to be
> disabled.
> 
> This fixes a:
> |WARNING: at drivers/clk/clk.c:472 __clk_disable+0x3c/0x78()
> 
> Signed-off-by: Lothar Waﬂmann <LW@KARO-electronics.de>

Both: Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  drivers/mtd/nand/mxc_nand.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index d316324..d965809 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -1556,7 +1556,8 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	return 0;
>  
>  escan:
> -	clk_disable_unprepare(host->clk);
> +	if (host->clk_act)
> +		clk_disable_unprepare(host->clk);
>  
>  	return err;
>  }
> -- 
> 1.7.2.5
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
