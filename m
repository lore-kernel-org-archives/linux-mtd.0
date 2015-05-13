Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YscsG-00086Q-7y
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 20:03:25 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 22:02:49 +0200
Message-ID: <5685584.0QXUdSHDpG@wuerfel>
In-Reply-To: <20150513194521.GF11598@ld-irv-0074>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
 <7133995.DH7aRmliCR@wuerfel> <20150513194521.GF11598@ld-irv-0074>
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

On Wednesday 13 May 2015 12:45:21 Brian Norris wrote:
> On Wed, May 13, 2015 at 12:49:01PM +0200, Arnd Bergmann wrote:
> > On Tuesday 12 May 2015 17:53:41 Brian Norris wrote:
> > 
> > This is a slightly unconventional method of doing the abstraction.
> > For consistency with a lot of other drivers, I'd do it like this:
> > 
> > struct bcm63138_controller {
> > 	void __iomem *base;
> > 	brcmnand_controller parent;
> > };
> 
> Does it really make sense to publicize all of the brcmnand_controller
> details to each of the constituent drivers? I was intentionally keeping
> them private, with a very small and well-defined interface provided for
> shim SoC drivers.
> 
> This is kind of a problem that has plagued the wider MTD (and esp. NAND)
> subsystem in general; we expose a ton of details to low-level drivers,
> and they're free to muck with things however they want, as long as it
> ends up working. I'd rather be more intentional in what I expose.

In most cases like this, the soc-specific glue drivers eventually need
access to some of the struct members anyway, but of course it's possible
that you don't need that here.

> > static bool bcm63138_nand_intc_ack(struct brcmnand_controller *parent)
> > {
> > 	struct bcm63138_controller *controller;
> > 	controller = container_of(parent, struct brcmnand_controller, parent);
> > 
> > 	...
> > }
> > 
> > static int bcm63138_nand_probe(...)
> > {
> > 	struct bcm63138_controller *controller;
> > 
> > 	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> > 	...
> > 	return brcmnand_probe(pdev, &controller->parent);
> > }
> > 
> > This also simplifies the probe() functions and means less pointer chasing.
> 
> I could still avoid one pointer chase and one extra memory allocation by
> embedding 'struct brcmnand_soc' in a 'struct bcm63138_nand_soc'. e.g.:
> 
> struct bcm63138_nand_soc {
> 	void __iomem *base;
> 	struct brcmnand_soc soc;
> };
> 
> static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
> {
> 	struct bcm63138_nand_soc *priv;
> 	priv = container_of(soc, struct bcm63138_nand_soc, soc);
> 
> 	...
> }
> 
> static int bcm63138_nand_probe(...)
> {
> 	struct bcm63138_nand_soc *priv;
> 
> 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> 	...
> 	return brcmnand_probe(pdev, &priv->soc);
> }

That would make struct brcmnand_soc an empty structure, right?
I think that's fine though, at least it avoids passing void pointers
and it avoids one of the two allocations you do.

There is another variation of this model, which some drivers use:

static int bcm63138_nand_probe(...)
{
	struct bcm63138_nand_soc *priv;
	struct brcmnand_controller *controller;

	controller = brcmnand_controller_alloc(dev, sizeof (*priv));

	priv = brcmnand_controller_priv(controller);

	...

	return brcmnand_register(controller);
}

struct brcmnand_controller *brcmnand_controller_alloc(struct device *pdev, size_t extra)
{
	struct brcmnand_controller *p = dev_kzalloc(dev, sizeof(*p) + extra);

	...

	return p;
}

void *brcmnand_controller_priv(brcmnand_controller *p)
{
	/* extra data follows at the next byte after the controller structure */
	return p + 1;
}

Some subsystem maintainers prefer this model over the other one, up to you.

	Arnd
