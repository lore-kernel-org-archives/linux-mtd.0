Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UotVT-0004kl-9m
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2013 10:51:23 +0000
Date: Tue, 18 Jun 2013 03:50:51 -0700
From: Tony Lindgren <tony@atomide.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v5 2/3] arm: gpmc: Low power transition support
Message-ID: <20130618105051.GM5523@atomide.com>
References: <1371494799-11876-1-git-send-email-pekon@ti.com>
 <1371494799-11876-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371494799-11876-3-git-send-email-pekon@ti.com>
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 khilman@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Pekon Gupta <pekon@ti.com> [130617 11:52]:
> From: avinash philip <avinashphilip@ti.com>
> 
> GPMC is hardware controller for external memory interfaces.
> This patch adds suspend/resume support for GPMC driver.
> It also preserves GPMC register configurations across device low-power states
> in which GPMC hardware can be powered-off.
> gpmc_suspend()/gpmc_resume() are called by default by core PM framework as part
> of driver's runtime PM callbacks.
> 
> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>

Thanks applying this into omap-for-v3.11/gpmc, patch 1/3 I already
have applied and the MTD change should get merged along with other
MTD patches.

Regards,

Tony

> ---
>  arch/arm/mach-omap2/gpmc.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 1380cee..9b579d0 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -1655,6 +1655,24 @@ static int gpmc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int gpmc_suspend(struct device *dev)
> +{
> +	omap3_gpmc_save_context();
> +	pm_runtime_put_sync(dev);
> +	return 0;
> +}
> +
> +static int gpmc_resume(struct device *dev)
> +{
> +	pm_runtime_get_sync(dev);
> +	omap3_gpmc_restore_context();
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(gpmc_pm_ops, gpmc_suspend, gpmc_resume);
> +
>  static struct platform_driver gpmc_driver = {
>  	.probe		= gpmc_probe,
>  	.remove		= gpmc_remove,
> @@ -1662,6 +1680,7 @@ static struct platform_driver gpmc_driver = {
>  		.name	= DEVICE_NAME,
>  		.owner	= THIS_MODULE,
>  		.of_match_table = of_match_ptr(gpmc_dt_ids),
> +		.pm	= &gpmc_pm_ops,
>  	},
>  };
>  
> @@ -1724,7 +1743,6 @@ static irqreturn_t gpmc_handle_irq(int irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -#ifdef CONFIG_ARCH_OMAP3
>  static struct omap3_gpmc_regs gpmc_context;
>  
>  void omap3_gpmc_save_context(void)
> @@ -1789,4 +1807,3 @@ void omap3_gpmc_restore_context(void)
>  		}
>  	}
>  }
> -#endif /* CONFIG_ARCH_OMAP3 */
> -- 
> 1.8.1
> 
