Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZdHp-0006Jf-UW
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 08:30:14 +0000
Date: Tue, 7 May 2013 16:30:07 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 15/26] mtd: nand: gpmi-nand: remove unnecessary
 platform_set_drvdata()
Message-ID: <20130507083005.GL1749@S2101-09.ap.freescale.net>
References: <005301ce4aed$50cc3d70$f264b850$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <005301ce4aed$50cc3d70$f264b850$@samsung.com>
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 'Huang Shijie' <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 07, 2013 at 03:37:16PM +0900, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 25ecfa1..7869210 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1633,7 +1633,6 @@ static int gpmi_nand_probe(struct platform_device *pdev)
>  exit_nfc_init:
>  	release_resources(this);
>  exit_acquire_resources:
> -	platform_set_drvdata(pdev, NULL);
>  	dev_err(this->dev, "driver registration failed: %d\n", ret);
>  	kfree(this);
>  
> @@ -1646,7 +1645,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
>  
>  	gpmi_nfc_exit(this);
>  	release_resources(this);
> -	platform_set_drvdata(pdev, NULL);
>  	kfree(this);
>  	return 0;
>  }
> -- 
> 1.7.2.5
> 
> 
