Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG3cS-0000S7-I4
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 11:48:13 +0000
Date: Mon, 4 Jan 2016 12:47:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <alex@alex-smith.me.uk>, Alex Smith <alex.smith@imgtec.com>, "Zubair
 Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20160104124749.6d34aaab@bbrezillon>
In-Reply-To: <568A484F.5060803@imgtec.com>
References: <1450959615-30246-1-git-send-email-harvey.hunt@imgtec.com>
 <1450959615-30246-3-git-send-email-harvey.hunt@imgtec.com>
 <20151228092552.66c88d9b@bbrezillon> <568A484F.5060803@imgtec.com>
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

Hi Harvey,

On Mon, 4 Jan 2016 10:24:15 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:


> >> +
> >> +static void jz4780_bch_disable(struct jz4780_bch *bch)
> >> +{
> >> +	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
> >> +	writel(BCH_BHCR_BCHE, bch->base + BCH_BHCCR);
> >
> > Not sure what BCH_BHCR_BCHE means, but if BCHE stands for "BCH Enable",
> > do you really have to keep this bit set when disabling the engine?
> 
> The JZ4780 has the BHCR (BCH  Control Register) as well as the BHCCR 
> (BCH Control Clear Register) and BHCSR (BCH Control Set Register). 
> Setting the bit BCH_BHCR_BCHE in BHCCR clears the corresponding bit in 
> BHCR, which disables the BCH controller.
> 

Okay, thanks for the explanation. I guess BCHE stands for BCH Engine
then.

[...]

> >
> >> +
> >> +static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
> >> +{
> >> +	struct nand_chip *chip = &nand->chip;
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
> >> +	struct nand_ecclayout *layout = &nand->ecclayout;
> >> +	u32 start, i;
> >> +
> >> +	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
> >> +				(chip->ecc.strength / 8);
> >> +
> >> +	if (nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> >> +		chip->ecc.hwctl = jz4780_nand_ecc_hwctl;
> >> +		chip->ecc.calculate = jz4780_nand_ecc_calculate;
> >> +		chip->ecc.correct = jz4780_nand_ecc_correct;
> >> +	} else if (!nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> >> +		dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	if (chip->ecc.mode != NAND_ECC_NONE)
> >> +		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
> >> +			(nfc->bch) ? "hardware BCH" : "software hamming",
> >
> > As said in my previous review, '!= NAND_ECC_HW' does not necessarily
> > imply '== NAND_ECC_SOFT' (i.e. hamming ECC), so I'd suggest printing
> > something like "software ECC".
> 
> Done.
> 
> >
> >> +			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> >> +	else
> >> +		dev_info(dev, "not using ECC\n");
> >
> > You should probably complain about the invalid NAND_ECC_HW_SYNDROME
> > value and return -EINVAL in this case.
> >

Don't forget that aspect ^.

> >> +
> >> +	/* The NAND core will generate the ECC layout. */
> >> +	if (chip->ecc.mode == NAND_ECC_SOFT || chip->ecc.mode == NAND_ECC_SOFT_BCH)
> >> +		return 0;
> >> +
> >> +	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
> >> +	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
> >> +
> >> +	if (layout->eccbytes > mtd->oobsize - 2) {
> >> +		dev_err(dev,
> >> +			"invalid ECC config: required %d ECC bytes, but only %d are available",
> >> +			layout->eccbytes, mtd->oobsize - 2);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	start = mtd->oobsize - layout->eccbytes;
> >> +	for (i = 0; i < layout->eccbytes; i++)
> >> +		layout->eccpos[i] = start + i;
> >> +
> >> +	layout->oobfree[0].offset = 2;
> >> +	layout->oobfree[0].length = mtd->oobsize - layout->eccbytes - 2;
> >> +
> >> +	chip->ecc.layout = layout;
> >> +	return 0;
> >> +}
> >> +
> >> +static int jz4780_nand_init_chip(struct platform_device *pdev,
> >> +				struct jz4780_nand_controller *nfc,
> >> +				struct device_node *np,
> >> +				unsigned int chipnr)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct jz4780_nand_chip *nand;
> >> +	struct jz4780_nand_cs *cs;
> >> +	struct resource *res;
> >> +	struct nand_chip *chip;
> >> +	struct mtd_info *mtd;
> >> +	const __be32 *reg;
> >> +	int ret = 0;
> >> +
> >> +	cs = &nfc->cs[chipnr];
> >> +
> >> +	reg = of_get_property(np, "reg", NULL);
> >> +	if (!reg)
> >> +		return -EINVAL;
> >> +
> >> +	cs->bank = be32_to_cpu(*reg);
> >> +
> >> +	jz4780_nemc_set_type(nfc->dev, cs->bank, JZ4780_NEMC_BANK_NAND);
> >> +
> >> +	res = platform_get_resource(pdev, IORESOURCE_MEM, chipnr);
> >> +	cs->base = devm_ioremap_resource(dev, res);
> >> +	if (IS_ERR(cs->base))
> >> +		return PTR_ERR(cs->base);
> >> +
> >> +	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> >> +	if (!nand)
> >> +		return -ENOMEM;
> >> +
> >> +	nand->busy_gpio = devm_gpiod_get_optional(dev, "rb", GPIOD_IN);
> >> +
> >> +	if (IS_ERR(nand->busy_gpio)) {
> >> +		ret = PTR_ERR(nand->busy_gpio);
> >> +		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
> >> +		return ret;
> >> +	} else if (nand->busy_gpio) {
> >> +		nand->chip.dev_ready = jz4780_nand_dev_ready;
> >> +	}
> >> +
> >> +	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> >> +
> >> +	if (IS_ERR(nand->wp_gpio)) {
> >> +		ret = PTR_ERR(nand->wp_gpio);
> >> +		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	chip = &nand->chip;
> >> +	mtd = nand_to_mtd(chip);
> >> +	mtd->priv = chip;
> >> +	mtd->owner = THIS_MODULE;
> >> +	mtd->name = DRV_NAME;
> >> +	mtd->dev.parent = dev;
> >> +
> >> +	chip->IO_ADDR_R = cs->base + OFFSET_DATA;
> >> +	chip->IO_ADDR_W = cs->base + OFFSET_DATA;
> >> +	chip->chip_delay = RB_DELAY_US;
> >> +	chip->options = NAND_NO_SUBPAGE_WRITE;
> >> +	chip->select_chip = jz4780_nand_select_chip;
> >> +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
> >> +	chip->ecc.mode = NAND_ECC_HW;
> >> +	chip->controller = &nfc->controller;
> >> +	nand_set_flash_node(chip, np);
> >> +
> >> +	ret = nand_scan_ident(mtd, 1, NULL);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = jz4780_nand_init_ecc(nand, dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = nand_scan_tail(mtd);
> >> +	if (ret)
> >> +		goto err_release_bch;
> >> +
> >> +	ret = mtd_device_register(mtd, NULL, 0);
> >> +	if (ret)
> >> +		goto err_release_nand;
> >> +
> >
> > You probably miss a list_add_tail() call here (otherwise chips are
> > registered but not unregistered when ->remove() is called):
> >
> > 	list_add_tail(&nand->chip_list, &nfc->chips);
> 
> Thanks for spotting this - I've fixed it now,
> 
> >
> >> +	return 0;
> >> +
> >> +err_release_nand:
> >> +	nand_release(mtd);
> >> +
> >> +err_release_bch:
> >> +	if (nfc->bch)
> >> +		jz4780_bch_release(nfc->bch);
> >
> > Why are you releasing the BCH engine here, isn't it the role of the
> > NAND controller to do that? BTW, it's already done in
> > jz4780_nand_remove().
> 
> I don't think jz4780_nand_remove() will get called if we fail to 
> initialise the chips, so perhaps it would be better to move this into 
> jz4780_nand_probe?

No, jz4780_nand_remove() won't get called in case of failure, I was
just trying to point the asymmetry here: if it's released in
->remove() and assigned in ->probe(), then it should be released in
->probe() in case of failure. So yes, moving it in jz4780_nand_probe()
is the right thing to do.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
