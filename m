Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=AM1EHSOBE004.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXyd8-0003Rz-Sb
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 17:16:35 +0000
Message-ID: <4EDE4DEC.7010308@freescale.com>
Date: Tue, 6 Dec 2011 11:16:28 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH 1/2 v2] mtd/nand: fixup for fmr initialization of Freescale
 NAND controller
References: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1323161655-19050-1-git-send-email-Shengzhou.Liu@freescale.com>
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

On 12/06/2011 02:54 AM, Shengzhou Liu wrote:
> There was a bug for fmr initialization, which lead to  fmr was always 0x100
> in fsl_elbc_chip_init() and caused FCM command timeout before calling
> fsl_elbc_chip_init_tail(), now we initialize CWTO to maximum timeout value
> and not relying on the setting of bootloader.
> 
> Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
> ---
> v2: make fmr not relying on the setting of bootloader.
> 
>  drivers/mtd/nand/fsl_elbc_nand.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index eedd8ee..4f405a0 100644
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
> @@ -764,8 +762,10 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  	priv->mtd.priv = chip;
>  	priv->mtd.owner = THIS_MODULE;
>  
> -	/* Set the ECCM according to the settings in bootloader.*/
> -	priv->fmr = in_be32(&lbc->fmr) & FMR_ECCM;
> +	/* set timeout to maximum */
> +	priv->fmr = 15 << FMR_CWTO_SHIFT;
> +	if (in_be32(&lbc->bank[priv->bank].or) & OR_FCM_PGS)
> +		priv->fmr |= FMR_ECCM;

Please do not change the way ECCM is handled.  We probably should have
done it this way from the start, but at this point it breaks
compatibility if you have a large page flash and the firmware didn't
touch NAND.

-Scott
