Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnEgf-0006fY-WF
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 21:04:06 +0000
Received: by mail-pb0-f54.google.com with SMTP id ro2so10774961pbb.27
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 14:03:41 -0700 (PDT)
From: Kevin Hilman <khilman@linaro.org>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [v4 3/3] mtd: devices: elm: Low power transition support
References: <1371032708-9242-1-git-send-email-pekon@ti.com>
 <1371032708-9242-4-git-send-email-pekon@ti.com>
Date: Thu, 13 Jun 2013 14:03:38 -0700
In-Reply-To: <1371032708-9242-4-git-send-email-pekon@ti.com> (Pekon Gupta's
 message of "Wed, 12 Jun 2013 15:55:08 +0530")
Message-ID: <8761xhbu51.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon Gupta <pekon@ti.com> writes:

> From: avinash philip <avinashphilip@ti.com>
>
> In low power modes of AM335X platforms, peripherals power is cut off.
> This patch supports low power sleep transition support for ELM driver.

This series needs a bit more description about what "low power sleep
transition" is, and how adding runtime PM calls makes this transition
happen.

Kevin

> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index dccef9f..171efcd 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -20,6 +20,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/sched.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_data/elm.h>
>  
> @@ -385,6 +386,23 @@ static int elm_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int elm_suspend(struct device *dev)
> +{
> +	pm_runtime_put_sync(dev);
> +	return 0;
> +}
> +
> +static int elm_resume(struct device *dev)
> +{
> +	struct elm_info *info = dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +	elm_config(dev, info->bch_type);
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
> +
>  #ifdef CONFIG_OF
>  static const struct of_device_id elm_of_match[] = {
>  	{ .compatible = "ti,am3352-elm" },
> @@ -398,6 +416,7 @@ static struct platform_driver elm_driver = {
>  		.name	= "elm",
>  		.owner	= THIS_MODULE,
>  		.of_match_table = of_match_ptr(elm_of_match),
> +		.pm	= &elm_pm_ops,
>  	},
>  	.probe	= elm_probe,
>  	.remove	= elm_remove,
