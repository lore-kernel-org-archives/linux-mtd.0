Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxiQo-0006Im-4U
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 15:37:27 +0000
Received: by ewy9 with SMTP id 9so2081017ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 08:37:24 -0700 (PDT)
Date: Mon, 20 Sep 2010 19:37:18 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
Subject: Re: [PATCH 1/3 v4] P4080/eLBC: Make Freescale elbc interrupt
	common to elbc devices
Message-ID: <20100920153718.GA4411@oksana.dev.rtsoft.ru>
References: <1284706869-12555-1-git-send-email-tie-fei.zang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1284706869-12555-1-git-send-email-tie-fei.zang@freescale.com>
Cc: B07421@freescale.com, dedekind1@gmail.com, B25806@freescale.com,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 17, 2010 at 03:01:07PM +0800, Roy Zang wrote:
[...]
> +struct fsl_lbc_ctrl {
> +	/* device info */
> +	struct device			*dev;

Forward declaration for struct device is needed (and enough).

> +	struct fsl_lbc_regs __iomem	*regs;
> +	int				irq;
> +	wait_queue_head_t		irq_wait;

#include <linux/wait.h> is needed for this.

> +	spinlock_t			lock;

#include <linux/spinlock.h>

[...]
> diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
> index dceb8d1..4920cd3 100644
> --- a/arch/powerpc/sysdev/fsl_lbc.c
> +++ b/arch/powerpc/sysdev/fsl_lbc.c
[...]
> +#include <linux/slab.h>
> +#include <linux/of_platform.h>

I guess of_platform.h is not needed any longer.

> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
>  
[...]
>  	default:
>  		return -EINVAL;
> @@ -143,14 +130,18 @@ EXPORT_SYMBOL(fsl_upm_find);
>   * thus UPM pattern actually executed. Note that mar usage depends on the
>   * pre-programmed AMX bits in the UPM RAM.
>   */
> +

No need for this empty line.

>  int fsl_upm_run_pattern(struct fsl_upm *upm, void __iomem *io_base, u32 mar)
>  {
>  	int ret = 0;
>  	unsigned long flags;
[...]
> +static int __devinit fsl_lbc_ctrl_probe(struct platform_device *dev)
> +{
> +	int ret;
> +
> +	if (!dev->dev.of_node) {
> +		dev_err(&dev->dev, "Device OF-Node is NULL");
> +		return -EFAULT;
> +	}
> +	fsl_lbc_ctrl_dev = kzalloc(sizeof(*fsl_lbc_ctrl_dev), GFP_KERNEL);

Btw, the code in the NAND driver checks for !fsl_lbc_ctrl_dev.

So it might make sense to assign the global variable after the
struct is fully initialized.

> +	if (!fsl_lbc_ctrl_dev)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&dev->dev, fsl_lbc_ctrl_dev);
> +
> +	spin_lock_init(&fsl_lbc_ctrl_dev->lock);
> +	init_waitqueue_head(&fsl_lbc_ctrl_dev->irq_wait);
> +
> +	fsl_lbc_ctrl_dev->regs = of_iomap(dev->dev.of_node, 0);
> +	if (!fsl_lbc_ctrl_dev->regs) {
> +		dev_err(&dev->dev, "failed to get memory region\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	fsl_lbc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
> +	if (fsl_lbc_ctrl_dev->irq == NO_IRQ) {
> +		dev_err(&dev->dev, "failed to get irq resource\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	fsl_lbc_ctrl_dev->dev = &dev->dev;
> +
> +	ret = fsl_lbc_ctrl_init(fsl_lbc_ctrl_dev);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = request_irq(fsl_lbc_ctrl_dev->irq, fsl_lbc_ctrl_irq, 0,
> +				"fsl-lbc", fsl_lbc_ctrl_dev);
> +	if (ret != 0) {
> +		dev_err(&dev->dev, "failed to install irq (%d)\n",
> +			fsl_lbc_ctrl_dev->irq);
> +		ret = fsl_lbc_ctrl_dev->irq;
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	iounmap(fsl_lbc_ctrl_dev->regs);
> +	kfree(fsl_lbc_ctrl_dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id fsl_lbc_match[] = {

#include <linux/mod_devicetable.h> is needed for this.


Plus, I think the patch is not runtime bisectable (i.e. you
now do request_irq() here, but not removing it from the nand
driver, so nand will fail to probe).

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
