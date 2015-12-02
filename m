Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4DUm-00036b-LS
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 19:55:24 +0000
Subject: Re: [PATCH (v7) 2/2] mtd: brcmnand: Add support for the BCM63268
To: Brian Norris <computersforpeace@gmail.com>
References: <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com>
 <772c4df64731e4e4f5bbbb9051cea28aaf805f4e@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <CAOiHx=mTPfiU40Tbz24vWELcoKEWhi=N2mqwL92SnV61dA2Myg@mail.gmail.com>
 <565610B9.5040407@simon.arlott.org.uk> <20151202191811.GK64635@google.com>
Cc: Jonas Gorski <jogo@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <565F4C89.5030609@simon.arlott.org.uk>
Date: Wed, 2 Dec 2015 19:54:49 +0000
MIME-Version: 1.0
In-Reply-To: <20151202191811.GK64635@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/12/15 19:18, Brian Norris wrote:
> + Broadcom list + Kamal
> 
> Hi Simon,
> 
> On Wed, Nov 25, 2015 at 07:49:13PM +0000, Simon Arlott wrote:
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers. It also has a clock for the NAND controller that needs to be
>> enabled.
>> 
>> Set up the device by enabling the clock, disabling and acking all
>> interrupts, then handle the CTRL_READY interrupt.
>> 
>> Add a brcmnand_get_socdata() function so that bcm63268_nand can obtain its
>> data and disable the clock when the device is removed.
>> 
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>> Added EXPORT_SYMBOL_GPL(brcmnand_get_socdata)
>> 
>> (As the brcmnand module must be loaded first its compatible string will
>> apply to any existing devices before the soc-specific module can be
>> loaded.)
> 
> What's this comment supposed to mean? The brcmnand module will not
> directly probe any devices. It doesn't register any driver structs by
> itself.

I didn't notice that it didn't actually probe devices. In that case the
documentation should not require "brcm,brcmnand" for soc-specific
variants because the hardware's not really compatible with it.

> (BTW given that, it probably doesn't need its MODULE_DEVICE_TABLE.)
> 
>>  drivers/mtd/nand/brcmnand/Makefile        |   1 +
>>  drivers/mtd/nand/brcmnand/bcm63268_nand.c | 179 ++++++++++++++++++++++++++++++
>>  drivers/mtd/nand/brcmnand/brcmnand.c      |   8 ++
>>  drivers/mtd/nand/brcmnand/brcmnand.h      |   1 +
>>  4 files changed, 189 insertions(+)
>>  create mode 100644 drivers/mtd/nand/brcmnand/bcm63268_nand.c
>> 
>> diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcmnand/Makefile
>> index 3b1fbfd..b83a9ae 100644
>> --- a/drivers/mtd/nand/brcmnand/Makefile
>> +++ b/drivers/mtd/nand/brcmnand/Makefile
>> @@ -2,5 +2,6 @@
>>  # more specific iproc_nand.o, for instance
>>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= iproc_nand.o
>>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63138_nand.o
>> +obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63268_nand.o
>>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmstb_nand.o
>>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand.o
>> diff --git a/drivers/mtd/nand/brcmnand/bcm63268_nand.c b/drivers/mtd/nand/brcmnand/bcm63268_nand.c
>> new file mode 100644
>> index 0000000..70ad907
>> --- /dev/null
>> +++ b/drivers/mtd/nand/brcmnand/bcm63268_nand.c
>> @@ -0,0 +1,179 @@
>> +/*
>> + * Copyright 2015 Simon Arlott
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + * Derived from bcm63138_nand.c:
>> + * Copyright © 2015 Broadcom Corporation
>> + *
>> + * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/include/bcm963xx/63268_map_part.h:
>> + * Copyright 2000-2010 Broadcom Corporation
>> + *
>> + * Derived from bcm963xx_4.12L.06B_consumer/shared/opensource/flash/nandflash.c:
>> + * Copyright 2000-2010 Broadcom Corporation
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/ioport.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +#include "brcmnand.h"
>> +
>> +struct bcm63268_nand_soc {
>> +	struct brcmnand_soc soc;
>> +	void __iomem *base;
>> +	struct clk *clk;
>> +};
>> +
>> +#define BCM63268_NAND_INT		0x00
>> +#define  BCM63268_NAND_STATUS_SHIFT	0
>> +#define  BCM63268_NAND_STATUS_MASK	(0xfff << BCM63268_NAND_STATUS_SHIFT)
>> +#define  BCM63268_NAND_ENABLE_SHIFT	16
>> +#define  BCM63268_NAND_ENABLE_MASK	(0xffff << BCM63268_NAND_ENABLE_SHIFT)
>> +#define BCM63268_NAND_BASE_ADDR0	0x04
>> +#define BCM63268_NAND_BASE_ADDR1	0x0c
>> +
>> +enum {
>> +	BCM63268_NP_READ	= BIT(0),
>> +	BCM63268_BLOCK_ERASE	= BIT(1),
>> +	BCM63268_COPY_BACK	= BIT(2),
>> +	BCM63268_PAGE_PGM	= BIT(3),
>> +	BCM63268_CTRL_READY	= BIT(4),
>> +	BCM63268_DEV_RBPIN	= BIT(5),
>> +	BCM63268_ECC_ERR_UNC	= BIT(6),
>> +	BCM63268_ECC_ERR_CORR	= BIT(7),
>> +};
>> +
>> +static bool bcm63268_nand_intc_ack(struct brcmnand_soc *soc)
>> +{
>> +	struct bcm63268_nand_soc *priv =
>> +			container_of(soc, struct bcm63268_nand_soc, soc);
>> +	void __iomem *mmio = priv->base + BCM63268_NAND_INT;
>> +	u32 val = brcmnand_readl(mmio);
>> +
>> +	if (val & (BCM63268_CTRL_READY << BCM63268_NAND_STATUS_SHIFT)) {
>> +		/* Ack interrupt */
>> +		val &= ~BCM63268_NAND_STATUS_MASK;
>> +		val |= BCM63268_CTRL_READY << BCM63268_NAND_STATUS_SHIFT;
>> +		brcmnand_writel(val, mmio);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static void bcm63268_nand_intc_set(struct brcmnand_soc *soc, bool en)
>> +{
>> +	struct bcm63268_nand_soc *priv =
>> +			container_of(soc, struct bcm63268_nand_soc, soc);
>> +	void __iomem *mmio = priv->base + BCM63268_NAND_INT;
>> +	u32 val = brcmnand_readl(mmio);
>> +
>> +	/* Don't ack any interrupts */
>> +	val &= ~BCM63268_NAND_STATUS_MASK;
>> +
>> +	if (en)
>> +		val |= BCM63268_CTRL_READY << BCM63268_NAND_ENABLE_SHIFT;
>> +	else
>> +		val &= ~(BCM63268_CTRL_READY << BCM63268_NAND_ENABLE_SHIFT);
>> +
>> +	brcmnand_writel(val, mmio);
>> +}
>> +
>> +static int bcm63268_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct bcm63268_nand_soc *priv;
>> +	struct brcmnand_soc *soc;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +	soc = &priv->soc;
>> +
>> +	res = platform_get_resource_byname(pdev,
>> +		IORESOURCE_MEM, "nand-intr-base");
>> +	if (!res)
>> +		return -EINVAL;
>> +
>> +	priv->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	priv->clk = devm_clk_get(&pdev->dev, "nand");
>> +	if (IS_ERR(priv->clk))
>> +		return PTR_ERR(priv->clk);
> 
> Perhaps we should put this clock handling in brcmnand.c? Just have it
> treat the clock as optional (i.e., ignore errors except for
> EPROBE_DEFER?), so we don't fail if no clock was provided? This could
> help other platforms too, if they gain clock support.

Unless most soc variants have clocks I'd prefer to leave it in this
module.

> If we do this, you'll want to document the clock in the common binding,
> not the bcm63268-specific part.
> 
> Also, could it help to disable/enable the clock during suspend/resume?
> If you move it to brcmnand.c, this would also be pretty simple.

Alternatively, it could proxy the brcmnand_pm_ops functions. I don't
have any way to test suspend/resume.

>> +
>> +	ret = clk_prepare_enable(priv->clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	soc->ctlrdy_ack = bcm63268_nand_intc_ack;
>> +	soc->ctlrdy_set_enabled = bcm63268_nand_intc_set;
>> +
>> +	/* Disable and ack all interrupts  */
>> +	brcmnand_writel(0, priv->base + BCM63268_NAND_INT);
>> +	brcmnand_writel(BCM63268_NAND_STATUS_MASK,
>> +			priv->base + BCM63268_NAND_INT);
>> +
>> +	ret = brcmnand_probe(pdev, soc);
>> +	if (ret)
>> +		clk_disable_unprepare(priv->clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static int bcm63268_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct brcmnand_soc *soc = brcmnand_get_socdata(pdev);
>> +	struct bcm63268_nand_soc *priv = NULL;
>> +	int ret;
>> +
>> +	if (soc)
>> +		priv = container_of(soc, struct bcm63268_nand_soc, soc);
>> +
>> +	ret = brcmnand_remove(pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (priv)
>> +		clk_disable_unprepare(priv->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id bcm63268_nand_of_match[] = {
>> +	{ .compatible = "brcm,nand-bcm63268" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, bcm63268_nand_of_match);
>> +
>> +static struct platform_driver bcm63268_nand_driver = {
>> +	.probe			= bcm63268_nand_probe,
>> +	.remove			= bcm63268_nand_remove,
>> +	.driver = {
>> +		.name		= "bcm63268_nand",
>> +		.pm		= &brcmnand_pm_ops,
>> +		.of_match_table	= bcm63268_nand_of_match,
>> +	}
>> +};
>> +module_platform_driver(bcm63268_nand_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Simon Arlott");
>> +MODULE_DESCRIPTION("NAND driver for BCM63268");
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
>> index 2c8f67f..5f26b8a 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
>> @@ -2262,6 +2262,14 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>>  }
>>  EXPORT_SYMBOL_GPL(brcmnand_probe);
>>  
>> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev)
>> +{
>> +	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
>> +
>> +	return ctrl ? ctrl->soc : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(brcmnand_get_socdata);
> 
> If you move the clk handling to the core brcmnand.c, then you won't need
> this still.

Would you prefer a clock name in the soc data structure that is used to
call devm_clk_get()?

>> +
>>  int brcmnand_remove(struct platform_device *pdev)
>>  {
>>  	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
>> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
>> index ef5eabb..6680419 100644
>> --- a/drivers/mtd/nand/brcmnand/brcmnand.h
>> +++ b/drivers/mtd/nand/brcmnand/brcmnand.h
>> @@ -65,6 +65,7 @@ static inline void brcmnand_writel(u32 val, void __iomem *addr)
>>  
>>  int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc);
>>  int brcmnand_remove(struct platform_device *pdev);
>> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev);
>>  
>>  extern const struct dev_pm_ops brcmnand_pm_ops;
>>  
> 
> Brian
> 


-- 
Simon Arlott
