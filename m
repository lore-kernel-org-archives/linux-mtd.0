Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsxgo-0001sK-64
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 13:58:51 +0000
Received: by wwf10 with SMTP id 10so3542687wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 06:58:46 -0700 (PDT)
Date: Mon, 15 Aug 2011 14:58:43 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Message-ID: <20110815135843.GD2636@pulham.picochip.com>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313416681.2553.2.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313416681.2553.2.camel@sauron>
Cc: devicetree-discuss@lists.ozlabs.org,
	Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2011 at 04:57:56PM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-08-09 at 16:12 +0100, Jamie Iles wrote:
> > +static int gpio_nand_of_get_options(struct device *dev,
> > +				    struct gpio_nand_platdata *plat)
> > +{
> > +	u32 width;
> > +
> > +	if (!of_property_read_u32(dev->of_node, "bank-width", &width)) {
> > +		if (width == 2) {
> > +			plat->options |= NAND_BUSWIDTH_16;
> > +		} else if (width != 1) {
> > +			dev_err(dev, "invalid bank-width %u\n", width);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void gpio_nand_of_get_gpio(struct device *dev,
> > +				  struct gpio_nand_platdata *plat)
> > +{
> > +	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
> > +	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
> > +	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
> > +	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
> > +	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
> > +}
> > +
> > +static void gpio_nand_of_get_chip_delay(struct device *dev,
> > +					struct gpio_nand_platdata *plat)
> > +{
> > +	u32 chip_delay;
> > +
> > +	if (!of_property_read_u32(dev->of_node, "chip-delay", &chip_delay))
> > +		plat->chip_delay = (int)chip_delay;
> > +}
> > +
> > +static int gpio_nand_of_get_config(struct device *dev,
> > +				   struct gpio_nand_platdata *plat)
> > +{
> > +	int ret = gpio_nand_of_get_options(dev, plat);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	gpio_nand_of_get_gpio(dev, plat);
> > +	gpio_nand_of_get_chip_delay(dev, plat);
> > +
> > +	return 0;
> > +}
> 
> Do we really need to have 3 additional helper functions for
> 'gpio_nand_of_get_config()' ?

Not really, I'm happy to fold those all into one if you prefer.

Jamie
