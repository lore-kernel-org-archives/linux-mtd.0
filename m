Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRGcn-0004Gm-3u
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2018 12:36:15 +0000
Date: Fri, 8 Jun 2018 14:35:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "wmw2@infradead.org"
 <wmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.com" <ada@thorsis.com>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v9 4/4] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Message-ID: <20180608143549.04400f92@xps13>
In-Reply-To: <MWHPR02MB26238A3344D0F611D8D6B0DAAF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1528271382-21690-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180607215949.58e2d15d@xps13>
 <MWHPR02MB26238A3344D0F611D8D6B0DAAF7B0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

> > > +		ecc->read_page =3D pl353_nand_read_page_hwecc;
> > > +		ecc->size =3D PL353_NAND_ECC_SIZE;
> > > +		ecc->write_page =3D pl353_nand_write_page_hwecc;
> > > +		pl353_smc_set_ecc_pg_size(mtd->writesize);
> > > +		switch (mtd->writesize) {
> > > +		case SZ_512:
> > > +		case SZ_1K:
> > > +		case SZ_2K:
> > > +			pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_APB);
> > > +			break;
> > > +		default:
> > > +			/*
> > > +			 * The software ECC routines won't work with the
> > > +			 * SMC controller
> > > +			 */
> > > +			ecc->calculate =3D nand_calculate_ecc;
> > > +			ecc->correct =3D nand_correct_data;
> > > +			ecc->size =3D 256;
> > > +			break;
> > > +		}
> > > +		if (mtd->writesize <=3D SZ_512)
> > > +			xnand->addr_cycles =3D 1;
> > > +		else
> > > +			xnand->addr_cycles =3D 2;
> > > +
> > > +		if (chip->options & NAND_ROW_ADDR_3)
> > > +			xnand->addr_cycles +=3D 3;
> > > +		else
> > > +			xnand->addr_cycles +=3D 2;
> > > +
> > > +		if (mtd->oobsize =3D=3D 16)
> > > +			mtd_set_ooblayout(mtd, &pl353_ecc_ooblayout16_ops);
> > > +		else if (mtd->oobsize =3D=3D 64)
> > > +			mtd_set_ooblayout(mtd, &pl353_ecc_ooblayout64_ops); =20
> >=20
> > else? =20
> You mean to say, add an error condition?

I do.

> >  =20
> > > +	}
> > > +}
> > > +
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
> > > +	struct pl353_nand_info *xnand; =20
> >=20
> > xnand is a strange name, more and more because its a bout NAND controll=
er data, not NAND
> > chip. =20
> We added this name to represent Xilinx Nand(xnand),=20
> >  =20

I see where the x comes from.

Maybe just nfc (for NAND flash controller) or xnfc if you prefer. What
I want is to clearly make the distinction between what is a NAND chip,
what is a NAND controller.

> > > +	struct mtd_info *mtd;
> > > +	struct nand_chip *nand_chip; =20
> >=20
> > This one you can call it just "nand" or "chip". =20
> Ok, I will update.
>=20
> >  =20
> > > +	struct resource *res;
> > > +
> > > +	xnand =3D devm_kzalloc(&pdev->dev, sizeof(*xnand), GFP_KERNEL);
> > > +	if (!xnand)
> > > +		return -ENOMEM;
> > > +
> > > +	/* Map physical address of NAND flash */
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	xnand->nand_base =3D devm_ioremap_resource(&pdev->dev, res);
> > > +	if (IS_ERR(xnand->nand_base))
> > > +		return PTR_ERR(xnand->nand_base);
> > > +
> > > +	nand_chip =3D &xnand->chip;
> > > +	mtd =3D nand_to_mtd(nand_chip);
> > > +	nand_chip->exec_op =3D pl353_nfc_exec_op;
> > > +	nand_set_controller_data(nand_chip, xnand);
> > > +	mtd->priv =3D nand_chip;
> > > +	mtd->owner =3D THIS_MODULE;
> > > +	mtd->name =3D PL353_NAND_DRIVER_NAME; =20
> >=20
> > A label property in the DT might overwrite this value. =20
> Could you please explain a bit more ?
>=20

I meant something like this:

https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/marvell=
_nand.c#L2515

Thanks,
Miqu=C3=A8l
