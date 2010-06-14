Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OO3lu-0002lH-R1
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 07:07:51 +0000
Message-ID: <4C15D542.2060102@eukrea.com>
Date: Mon, 14 Jun 2010 09:07:46 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mxc_nand: fix PM
References: <1274942000-3580-2-git-send-email-eric@eukrea.com>
	<1274982919-13251-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1274982919-13251-1-git-send-email-eric@eukrea.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

Le 27/05/2010 19:55, Eric Bénard a écrit :
> * when resuming, we get the following log :
> nand_resume called for a chip which is not in suspended state
> * this happens because mtd->suspend and mtd->resume are already
> called from the mtd layer, thus they were called a second time
> in mxc_nand so mtd complains when trying to resume for the
> second time
> * the fix is to remove these call and thus remove the supend and
> resume functions of mxc_nand
>
any news concerning this patch ?

Eric

> Signed-off-by: Eric Bénard<eric@eukrea.com>
> Cc: s.hauer@pengutronix.de
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mtd@lists.infradead.org
> ---
>   drivers/mtd/nand/mxc_nand.c |   44 +------------------------------------------
>   1 files changed, 1 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 314e2bf..217b247 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -892,53 +892,11 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
>   	return 0;
>   }
>
> -#ifdef CONFIG_PM
> -static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
> -{
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> -	struct nand_chip *nand_chip = mtd->priv;
> -	struct mxc_nand_host *host = nand_chip->priv;
> -	int ret = 0;
> -
> -	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
> -
> -	ret = mtd->suspend(mtd);
> -
> -	/*
> -	 * nand_suspend locks the device for exclusive access, so
> -	 * the clock must already be off.
> -	 */
> -	BUG_ON(!ret&&  host->clk_act);
> -
> -	return ret;
> -}
> -
> -static int mxcnd_resume(struct platform_device *pdev)
> -{
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> -	struct nand_chip *nand_chip = mtd->priv;
> -	struct mxc_nand_host *host = nand_chip->priv;
> -	int ret = 0;
> -
> -	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
> -
> -	mtd->resume(mtd);
> -
> -	return ret;
> -}
> -
> -#else
> -# define mxcnd_suspend   NULL
> -# define mxcnd_resume    NULL
> -#endif				/* CONFIG_PM */
> -
>   static struct platform_driver mxcnd_driver = {
>   	.driver = {
>   		   .name = DRIVER_NAME,
> -		   },
> +	},
>   	.remove = __devexit_p(mxcnd_remove),
> -	.suspend = mxcnd_suspend,
> -	.resume = mxcnd_resume,
>   };
>
>   static int __init mxc_nd_init(void)
