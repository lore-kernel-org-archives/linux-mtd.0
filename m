Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXeGV-0003Fi-E1
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 19:31:52 +0000
Message-ID: <4EDD1C22.9080801@freescale.com>
Date: Mon, 5 Dec 2011 13:31:46 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH 1/2] mtd/nand: fixup for fmr initialization of Freescale
 NAND controller
References: <1323082493-22617-1-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1323082493-22617-1-git-send-email-Shengzhou.Liu@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kumar.gala@freescale.com,
 linuxppc-dev@lists.ozlabs.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/05/2011 04:54 AM, Shengzhou Liu wrote:
> There was a bug for fmr initialization, which lead to  fmr was always 0x100
> in fsl_elbc_chip_init() and caused FCM command timeout before calling
> fsl_elbc_chip_init_tail().
> 
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index eedd8ee..742bf73 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -659,9 +659,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
>  	if (chip->pagemask & 0xff000000)
>  		al++;
>  
> -	/* add to ECCM mode set in fsl_elbc_init */
> -	priv->fmr |= (12 << FMR_CWTO_SHIFT) |  /* Timeout > 12 ms */
> -	             (al << FMR_AL_SHIFT);
> +	priv->fmr |= al << FMR_AL_SHIFT;
>  
>  	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
>  	        chip->numchips);
> @@ -764,8 +762,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  	priv->mtd.priv = chip;
>  	priv->mtd.owner = THIS_MODULE;
>  
> -	/* Set the ECCM according to the settings in bootloader.*/
> -	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
> +	/* Set fmr according to the settings in bootloader.*/
> +	priv->fmr = in_be32(&lbc->fmr);
>  
>  	/* fill in nand_chip structure */
>  	/* set up function call table */

We shouldn't be relying on the bootloader to provide a sane value here
-- the bootloader may not have used/initialized NAND at all.

It's sort of OK for ECCM, since unless you're trying to match an
externally programmed flash, or the bootloader uses the flash, all we
really care about is that the value stay consistent.  The timeout, OTOH,
must not be set too low or things won't work.

We should just set a value that we believe to be high enough for all uses.

-Scott
