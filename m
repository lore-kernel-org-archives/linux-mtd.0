Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYR8w-0006lh-S4
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:15:16 +0000
Date: Thu, 28 Jun 2018 09:14:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>
Subject: Re: [[LINUX PATCH v10] 4/4] mtd: rawnand: pl353: Add basic driver
 for arm pl353 smc nand interface
Message-ID: <20180628091450.25bd54e5@xps13>
In-Reply-To: <MWHPR02MB26236BEABAAF0213B49EC21EAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180627172249.72f878a2@xps13>
 <MWHPR02MB26236BEABAAF0213B49EC21EAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

> > > +/**
> > > + * pl353_nand_read_page_hwecc - Hardware ECC based page read function
> > > + * @mtd:		Pointer to the mtd info structure
> > > + * @chip:		Pointer to the NAND chip info structure
> > > + * @buf:		Pointer to the buffer to store read data
> > > + * @oob_required:	Caller requires OOB data read to chip->oob_poi
> > > + * @page:		Page number to read
> > > + *
> > > + * This functions reads data and checks the data integrity by
> > > +comparing hardware
> > > + * generated ECC values and read ECC values from spare area.
> > > + *
> > > + * Return:	0 always and updates ECC operation status in to MTD struc=
ture
> > > + */
> > > +static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
> > > +				      struct nand_chip *chip,
> > > +				      u8 *buf, int oob_required, int page) {
> > > +	int i, stat, eccsize =3D chip->ecc.size;
> > > +	int eccbytes =3D chip->ecc.bytes;
> > > +	int eccsteps =3D chip->ecc.steps;
> > > +	u8 *p =3D buf;
> > > +	u8 *ecc_calc =3D chip->ecc.calc_buf;
> > > +	u8 *ecc =3D chip->ecc.code_buf;
> > > +	unsigned int max_bitflips =3D 0;
> > > +	u8 *oob_ptr;
> > > +	u32 ret;
> > > +	unsigned long data_phase_addr;
> > > +	struct pl353_nand_info *xnfc =3D
> > > +		container_of(chip, struct pl353_nand_info, chip);
> > > +	unsigned long nand_offset =3D (unsigned long __force)xnfc->nand_bas=
e;
> > > +
> > > +	pl353_prepare_cmd(mtd, chip, page, 0, NAND_CMD_READ0,
> > > +			  NAND_CMD_READSTART, 1);
> > > +	ndelay(100); =20
> >=20
> > What is this delay for? =20
> We have seen failures with out this delay, with older code.
> But i will check this by removing this delay, in this new driver.

Please check all of them. We should get rid of random delays like that.
Either there is something to poll, or there is a specific value to use
(you can get them from the SDR interface structure).

[...]

> > > +
> > > +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> > > +		return -EINVAL; =20
> >=20
> > Why? =20
> It is similar to=20
> if (chipnr < 0)
> 	return 0;

Mmmmmh, no?

(return 0) !=3D (return -EINVAL)

The core is asking you to check if the controller driver support
particular timings (usually ONFI modes 1-5). Returning an error means
"I only support the slowest timings" which, I suppose, is wrong. Please
fix this and compare the speeds.

> hence written like that.
> Also if I didn't do that, then probe is failing.
> Am I missing some thing?
> >  =20

[...]

> > > +/**
> > > + * pl353_nand_probe - Probe method for the NAND driver
> > > + * @pdev:	Pointer to the platform_device structure
> > > + *
> > > + * This function initializes the driver data structures and the hard=
ware.
> > > + *
> > > + * Return:	0 on success or error value on failure
> > > + */
> > > +static int pl353_nand_probe(struct platform_device *pdev) {
> > > +	struct pl353_nand_info *xnfc;
> > > +	struct mtd_info *mtd;
> > > +	struct nand_chip *chip;
> > > +	struct resource *res;
> > > +	struct device_node *np;
> > > +	u32 ret;
> > > +
> > > +	xnfc =3D devm_kzalloc(&pdev->dev, sizeof(*xnfc), GFP_KERNEL);
> > > +	if (!xnfc)
> > > +		return -ENOMEM;
> > > +	xnfc->dev =3D &pdev->dev;
> > > +	/* Map physical address of NAND flash */
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	xnfc->nand_base =3D devm_ioremap_resource(xnfc->dev, res);
> > > +	if (IS_ERR(xnfc->nand_base))
> > > +		return PTR_ERR(xnfc->nand_base);
> > > +
> > > +	chip =3D &xnfc->chip;
> > > +	mtd =3D nand_to_mtd(chip);
> > > +	chip->exec_op =3D pl353_nfc_exec_op;
> > > +	nand_set_controller_data(chip, xnfc);
> > > +	mtd->priv =3D chip;
> > > +	mtd->owner =3D THIS_MODULE;
> > > +	if (!mtd->name) {
> > > +		/*
> > > +		 * If the new bindings are used and the bootloader has not been
> > > +		 * updated to pass a new mtdparts parameter on the cmdline, you
> > > +		 * should define the following property in your NAND node, ie:
> > > +		 *
> > > +		 *	label =3D "pl353-nand";
> > > +		 *
> > > +		 * This way, mtd->name will be set by the core when
> > > +		 * nand_set_flash_node() is called.
> > > +		 */
> > > +		mtd->name =3D devm_kasprintf(xnfc->dev, GFP_KERNEL,
> > > +					   "%s", PL353_NAND_DRIVER_NAME);
> > > +		if (!mtd->name) {
> > > +			dev_err(xnfc->dev, "Failed to allocate mtd->name\n");
> > > +			return -ENOMEM;
> > > +		}
> > > +	}
> > > +	nand_set_flash_node(chip, xnfc->dev->of_node);
> > > +
> > > +	/* Set address of NAND IO lines */
> > > +	chip->IO_ADDR_R =3D xnfc->nand_base;
> > > +	chip->IO_ADDR_W =3D xnfc->nand_base;
> > > +	/* Set the driver entry points for MTD */
> > > +	chip->dev_ready =3D pl353_nand_device_ready;
> > > +	chip->select_chip =3D pl353_nand_select_chip;
> > > +	/* If we don't set this delay driver sets 20us by default */
> > > +	np =3D of_get_next_parent(xnfc->dev->of_node);
> > > +	xnfc->mclk =3D of_clk_get(np, 0);
> > > +	if (IS_ERR(xnfc->mclk)) {
> > > +		dev_err(xnfc->dev, "Failed to retrieve MCK clk\n");
> > > +		return PTR_ERR(xnfc->mclk);
> > > +	}
> > > +	chip->chip_delay =3D 30;
> > > +	/* Set the device option and flash width */
> > > +	chip->options =3D NAND_BUSWIDTH_AUTO;
> > > +	chip->bbt_options =3D NAND_BBT_USE_FLASH;
> > > +	platform_set_drvdata(pdev, xnfc);
> > > +	chip->setup_data_interface =3D pl353_setup_data_interface;
> > > +	/* first scan to find the device and get the page size */
> > > +	if (nand_scan_ident(mtd, 1, NULL)) {
> > > +		dev_err(xnfc->dev, "nand_scan_ident for NAND failed\n");
> > > +		return -ENXIO;
> > > +	}

Space here

> > > +	ret =3D pl353_nand_ecc_init(mtd, &chip->ecc, chip->ecc.mode);

ret should be checked

> > > +	if (chip->options & NAND_BUSWIDTH_16)
> > > +		pl353_smc_set_buswidth(PL353_SMC_MEM_WIDTH_16);

Space

> > > +	/* second phase scan */
> > > +	if (nand_scan_tail(mtd)) {
> > > +		dev_err(xnfc->dev, "nand_scan_tail for NAND failed\n");
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	mtd_device_register(mtd, NULL, 0); =20
> >=20
> > Check the returned code =20
> Ok.

And if it returns an error, please call nand_cleanup().

> >  =20
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * pl353_nand_remove - Remove method for the NAND driver
> > > + * @pdev:	Pointer to the platform_device structure
> > > + *
> > > + * This function is called if the driver module is being unloaded. It
> > > +frees all
> > > + * resources allocated to the device.
> > > + *
> > > + * Return:	0 on success or error value on failure
> > > + */
> > > +static int pl353_nand_remove(struct platform_device *pdev) {
> > > +	struct pl353_nand_info *xnfc =3D platform_get_drvdata(pdev);
> > > +	struct mtd_info *mtd =3D nand_to_mtd(&xnfc->chip);
> > > +
> > > +	/* Release resources, unregister device */
> > > +	nand_release(mtd); =20
> >=20
> > What about MTD core deregistration? =20
> nand_release(), it self will do that.

My bad.

> >  =20
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* Match table for device tree binding */ static const struct
> > > +of_device_id pl353_nand_of_match[] =3D {
> > > +	{ .compatible =3D "arm,pl353-nand-r2p1" },
> > > +	{},
> > > +};

Thanks,
Miqu=C3=A8l
