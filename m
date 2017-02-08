Date: Wed, 8 Feb 2017 13:04:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Janos Laube <janos.dev@gmail.com>,
 Paulius Zaleckas <paulius.zaleckas@gmail.com>,
 openwrt-devel@openwrt.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/22 v2] mtd: physmap_of: add a hook for Gemini flash
 probing
Message-ID: <20170208210451.GD94627@google.com>
References: <20170128215048.11676-1-linus.walleij@linaro.org>
 <8f7e75c9-3457-c1b1-5719-a4efb64bf66c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f7e75c9-3457-c1b1-5719-a4efb64bf66c@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 04, 2017 at 10:52:38PM +0100, Marek Vasut wrote:
> On 01/28/2017 10:50 PM, Linus Walleij wrote:
> > In order to support device tree probing of Gemini NOR flash
> > chips, a certain register in the syscon needs to be poked
> > to enable parallel flash mode.
> > 
> > Such things used to happen in "necessarily different" board
> > file code, and this indeed was also done for the Gemini, so
> > the MTD driver could treat it as any memory-mapped NOR flash,
> > but this is not the way in the future: board files need to
> > go, and hardware concerns distributed down to the applicable
> > drivers.
> > 
> > This adds a hook in the same way that the Versatile did: if
> > the Kconfig symbol is not selected the net total of supporting
> > Gemini should be zero bytes of added code. To live up to this
> > promise, also the return value error print from the Versatile
> > extra probe call get to be removed in this patch, all printing
> > need to happen in the add-ons.
> > 
> > Cc: Janos Laube <janos.dev@gmail.com>
> > Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> > Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Put a more elaborate description of the Kconfig option into
> >   the Kconfig item, take this opportunity to also modify the
> >   Versatile Kconfig entry which is equally terse.
> 
> Thanks!
> 
> > - Modify the Makefile to build the Gemini and Versatile drivers
> >   based on their own config symbols and not based on an if on
> >   their symbol, should have been done like that from the start.
> > - Move a dev_info() to dev_dbg() in the driver.
> 
> [...]
> 
> > +	if (val & FLASH_WIDTH_16BIT) {
> > +		if (map->bankwidth != 2)
> > +			dev_warn(dev, "flash hardware say flash is 16 bit wide "
> > +				 "but DT says it is %d bits wide\n",
> 
> Nit, please do not break printed strings, it is not possible to 'git
> grep' for them if you do.
> 
> > +				 map->bankwidth * 8);
> > +	} else {
> > +		if (map->bankwidth != 1)
> > +			dev_warn(dev, "flash hardware say flash is 8 bit wide "
> > +				 "but DT says it is %d bits wide\n",
> 
> DTTO

I've fixed these up myself.

> > +				 map->bankwidth * 8);
> > +	}
> > +
> > +	/* Activate parallel (NOR flash) mode */
> > +	ret = regmap_update_bits(rmap, GLOBAL_MISC_CTRL,
> > +				 FLASH_PADS_MASK,
> > +				 SFLASH_PADS_DISABLE | NAND_PADS_DISABLE);
> > +	if (ret) {
> > +		dev_err(dev, "unable to set up physmap pads\n");
> > +		return -ENODEV;
> > +	}
> 
> [...]
> 
> Once you fix the nit above, add my:
> Acked-by: Marek Vasut <marek.vasut@gmail.com>

smatch also noticed one new problem:

drivers/mtd/maps/physmap_of.c:248 of_flash_probe() warn: possible memory leak of 'mtd_list' [smatch]

This matches an existing leak seen in this function already, but my
scripts look for new warnings. Would be nice to fix this sometime.

Applied to l2-mtd.git, with the above 2 fixed.

Brian
