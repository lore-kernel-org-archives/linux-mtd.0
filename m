Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZedaO-0004SO-AY
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 06:31:26 +0000
Date: Wed, 23 Sep 2015 08:30:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Alex Smith <alex.smith@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Alex Smith
 <alex@alex-smith.me.uk>, linux-kernel@vger.kernel.org, Zubair Lutfullah
 Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v5 3/4] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20150923083059.3f11a6e4@bbrezillon>
In-Reply-To: <20150921220806.GB31505@google.com>
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-4-git-send-email-alex.smith@imgtec.com>
 <20150921220806.GB31505@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, Alex,

On Mon, 21 Sep 2015 15:08:06 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Tue, Sep 08, 2015 at 10:10:52AM +0100, Alex Smith wrote:
> > Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
> > well as the hardware BCH controller. DMA is not currently implemented.
> > 
> > While older 47xx SoCs also have a BCH controller, they are incompatible
> > with the one in the 4780 due to differing register/bit positions, which
> > would make implementing a common driver for them quite messy.
> > 
> > Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> > Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > v4 -> v5:
> >  - Bump RB_DELAY up to be sufficient for the driver to work without a
> >    busy GPIO available.
> >  - Use readl_poll_timeout instead of custom polling loop.
> >  - Remove useless printks.
> >  - Change a BUG_ON to WARN_ON.
> >  - Remove use of of_translate_address(), use standard platform resource
> >    APIs.
> >  - Add DRV_NAME define to avoid duplication of the same string.
> > 
> > v3 -> v4:
> >  - Rebase to 4.2-rc4
> >  - Change ECC_HW_OOB_FIRST to ECC_HW, reading OOB first is not necessary.
> >  - Fix argument to get_device() in jz4780_bch_get()
> > 
> > v2 -> v3:
> >  - Rebase to 4.0-rc6
> >  - Reflect binding changes
> >  - get/put_device in bch get/release
> >  - Removed empty .remove() callback
> >  - Removed .owner
> >  - Set mtd->dev.parent
> > 
> > v1 -> v2:
> >  - Fixed module license macro
> >  - Rebase to 4.0-rc3
> > ---
> >  drivers/mtd/nand/Kconfig       |   7 +
> >  drivers/mtd/nand/Makefile      |   1 +
> >  drivers/mtd/nand/jz4780_bch.c  | 348 +++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/nand/jz4780_bch.h  |  42 +++++
> >  drivers/mtd/nand/jz4780_nand.c | 378 +++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 776 insertions(+)
> >  create mode 100644 drivers/mtd/nand/jz4780_bch.c
> >  create mode 100644 drivers/mtd/nand/jz4780_bch.h
> >  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> > 

[...]


> > +static void jz4780_nand_init_ecc(struct jz4780_nand *nand, struct device *dev)
> > +{
> > +	struct mtd_info *mtd = &nand->mtd;
> > +	struct nand_chip *chip = &nand->chip;
> > +	struct nand_ecclayout *layout = &nand->ecclayout;
> > +	uint32_t start, i;
> > +
> > +	chip->ecc.size = of_get_nand_ecc_step_size(dev->of_node);
> > +	if (chip->ecc.size < 0)
> > +		chip->ecc.size = 1024;
> > +
> > +	chip->ecc.strength = of_get_nand_ecc_strength(dev->of_node);
> > +	if (chip->ecc.strength < 0)
> > +		chip->ecc.strength = 24;
> 
> Can you make use of nand_dt_init()? That means you'd also need to
> specify the generic "nand-ecc-mode" property in your DT, then initialize
> chip->flash_node before running nand_scan_ident().

Also, remember to initialize ->ecc.mode to its default value before
calling nand_scan_ident(), otherwise you won't be able to know whether
ECC_NONE was selected on purpose (nand-ecc-mode = "none" in your DT) or
not.

You'll also have to change your 'chip->ecc.size < 0' and
'chip->ecc.strength < 0' tests into '!chip->ecc.size' and
'!chip->ecc.strength'


[...]

> > +static int jz4780_nand_init_chips(struct jz4780_nand *nand,
> > +				  struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct jz4780_nand_chip *chip;
> > +	const __be32 *prop;
> > +	struct resource *res;
> > +	int i = 0;
> > +
> > +	/*
> > +	 * Iterate over each bank assigned to this device and request resources.
> > +	 * The bank numbers may not be consecutive, but nand_scan_ident()
> > +	 * expects chip numbers to be, so fill out a consecutive array of chips
> > +	 * which map chip number to actual bank number.
> > +	 */
> 
> Hmm, this is an interesting point. Do we really want to lump multiple
> banks in the same device tree node? I've seen the history (nand_scan*()
> supports multipe chips in a single nand_scan*() call) but this can be
> limiting. What if you have two non-identical flash?
> 
> IOW, would following a pattern like the following make more sense? With
> these, each separate flash gets its own device node:
> 
> https://www.kernel.org/doc/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> https://www.kernel.org/doc/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt

Actually, we support this kind of things in the sunxi_nand driver too.
The only valid use case I see for this representation is when you have a
NAND chip embedding several dies, and thus exposing several CS lines.
IMHO, those chips should still be represented as a single entity, and
they need to be attached to several CS lines. I guess that's what
you're trying to support here (tell me if I'm wrong).

[...]

> 
> > +	chip->select_chip = jz4780_nand_select_chip;
> > +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
> > +
> > +	nand->busy_gpio = of_get_named_gpio_flags(dev->of_node,
> > +						  "rb-gpios",
> > +						  0, &flags);
> 
> Note (for future reference, not for your immediate action): this binding
> is shared with at least sunxi-nand. We could probably share the (simple)
> code for it too by moving this to nand_base.

I totally agree. That implies adding an rb_gpio (or rb_gpios, since
some chips have several of them) in the nand_chip struct, and then
parsing the property in nand_dt_init(), so nothing impossible here.
Maybe we should also provide a default dev_ready() implementation when
this gpio is specified.

> 
> > +	if (gpio_is_valid(nand->busy_gpio)) {
> > +		ret = devm_gpio_request(dev, nand->busy_gpio, "NAND busy");
> > +		if (ret) {
> > +			dev_err(dev, "failed to request busy GPIO %d: %d\n",
> > +				nand->busy_gpio, ret);
> > +			goto err_release_bch;
> > +		}
> > +
> > +		nand->busy_gpio_active_low = flags & OF_GPIO_ACTIVE_LOW;
> > +		gpio_direction_input(nand->busy_gpio);
> > +
> > +		chip->dev_ready = jz4780_nand_dev_ready;
> > +	}
> > +
> > +	nand->wp_gpio = of_get_named_gpio_flags(dev->of_node, "wp-gpios",
> > +						0, &flags);
> 
> Another note (again, not necessarily for your your immediate action):
> this binding was requested for other drivers. Having some kind of
> support code for it in nand_base could be helpful, even if it's just as
> simple as to disable WP at startup. I have also seen cases where users
> want a way to control WP policy -- e.g., to only disable WP when
> reprogramming, so that it's more difficult to experience spurious writes
> to the flash due to flaky HW. So handling that in the core driver could
> be useful. But not your problem.

Yep, I guess it's pretty much the same as for the RB gpios.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
