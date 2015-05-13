Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsUEH-00057N-CX
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 10:49:34 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 12:49:01 +0200
Message-ID: <7133995.DH7aRmliCR@wuerfel>
In-Reply-To: <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <1431478424-29230-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 12 May 2015 17:53:41 Brian Norris wrote:
> +static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
> +{
> +       struct bcm63138_nand_soc_priv *priv = soc->priv;
> +       void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
> +       u32 val = brcmnand_readl(mmio);
> +
> +       if (val & BCM63138_CTLRDY) {
> +               brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
> +               return true;
> +       }
> +
> +       return false;
> +}
...
> +static int bcm63138_nand_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct bcm63138_nand_soc_priv *priv;
> +       struct brcmnand_soc *soc;
> +       struct resource *res;
> +
> +       soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
> +       if (!soc)
> +               return -ENOMEM;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +

This is a slightly unconventional method of doing the abstraction.
For consistency with a lot of other drivers, I'd do it like this:

struct bcm63138_controller {
	void __iomem *base;
	brcmnand_controller parent;
};

static bool bcm63138_nand_intc_ack(struct brcmnand_controller *parent)
{
	struct bcm63138_controller *controller;
	controller = container_of(parent, struct brcmnand_controller, parent);

	...
}

static int bcm63138_nand_probe(...)
{
	struct bcm63138_controller *controller;

	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
	...
	return brcmnand_probe(pdev, &controller->parent);
}

This also simplifies the probe() functions and means less pointer chasing.

	Arnd
