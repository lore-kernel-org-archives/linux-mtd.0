Date: Tue, 14 Feb 2017 14:27:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot
 <gnurou@gmail.com>, <linux-gpio@vger.kernel.org>, Vinod Koul
 <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Wenyou Yang
 <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard
 Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt
 <egtvedt@samfundet.no>, <linux-kernel@vger.kernel.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala
 <galak@codeaurora.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND 3/5] mtd: nand: Cleanup/rework the atmel_nand driver
Message-ID: <20170214142704.621170dd@bbrezillon>
In-Reply-To: <1be79cf2-0318-8d07-0df4-911db18f5285@atmel.com>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
 <1485535324-28393-4-git-send-email-boris.brezillon@free-electrons.com>
 <1be79cf2-0318-8d07-0df4-911db18f5285@atmel.com>
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

On Tue, 14 Feb 2017 13:58:30 +0100
Nicolas Ferre <nicolas.ferre@atmel.com> wrote:

[..]

> >  obj-$(CONFIG_MTD_NAND_OMAP2) 		+=3D omap2_nand.o
> > diff --git a/drivers/mtd/nand/atmel/Makefile b/drivers/mtd/nand/atmel/M=
akefile
> > new file mode 100644
> > index 000000000000..15bc4a014f33
> > --- /dev/null
> > +++ b/drivers/mtd/nand/atmel/Makefile
> > @@ -0,0 +1,4 @@
> > +obj-$(CONFIG_MTD_NAND_ATMEL)	+=3D atmel-nand-controller.o atmel-pmecc.o
> > +
> > +atmel-nand-controller-objs	:=3D nfc.o =20
>=20
> I have doubts about the name "nfc" as we have *a part* of the newest
> nand flash controller and its associated register set that is named
> "NFC" in the datasheet: it may lead to some kind of confusion...

Okay, I'll rename it nand-controller.c.

>=20
>=20
> > +atmel-pmecc-objs		:=3D pmecc.o
> > diff --git a/drivers/mtd/nand/atmel/nfc.c b/drivers/mtd/nand/atmel/nfc.c
> > new file mode 100644
> > index 000000000000..3173e5f6c450
> > --- /dev/null
> > +++ b/drivers/mtd/nand/atmel/nfc.c
> > @@ -0,0 +1,2168 @@
> > +/*
> > + * =C2=A9 Copyright 2016 ATMEL =20
>=20
> Yes, I know it comes from the previous driver but could you please
> remove the UTF-8 (or other character encoding).

Sure.

>=20
> > + * =C2=A9 Copyright 2016 Free Electrons =20
>=20
> 2017?

Yep. I started this work in 2016, hence the wrong year.

[...]

> > +static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)
> > +{
> > +	return container_of(chip, struct atmel_nand, base);
> > +}
> > +
> > +enum atmel_sama5_data_xfer { =20
>=20
> Well, sama5 would then mean "all controllers compatible with the one
> found on sama5d3"... And even if some SoC doesn't contain the substrig
> "sama5"... So maybe think about another way to generically call this
> variant of the nand flash controller...

How about enum atmel_nfc_data_xfer here ...

>=20
> > +	ATMEL_NFC_NO_DATA,
> > +	ATMEL_NFC_READ_DATA,
> > +	ATMEL_NFC_WRITE_DATA,
> > +};
> > +
> > +struct atmel_sama5_op {

... struct atmel_nfc_op here ...

> > +	u8 cs;
> > +	u8 ncmds;
> > +	u8 cmds[2];
> > +	u8 naddrs;
> > +	u8 addrs[5];
> > +	enum atmel_sama5_data_xfer data;
> > +};
> > +
> > +struct atmel_nfc; =20
>=20
> Here again: nitpicking about names, but nfc can be confusing with the
> NFC register defined in the datasheet.

... and struct atmel_smc_nand_controller here. This way the objects
related to the NFC block (the one described in the datasheet) are
containing the term 'nfc'.

>=20
> An idea: when you find good naming scheme, you can add a little glossary
> in the header to explain acronyms and naming convention of the driver lik=
e:
> http://lxr.free-electrons.com/source/drivers/dma/at_hdmac.c#L33
>=20

Sure.

[...]

> > +static int atmel_sama5_nfc_exec_op(struct atmel_sama5_nfc *nfc)
> > +{
> > +	u32 addr, val, wait =3D ATMEL_HSMC_NFC_SR_CMDDONE;
> > +	u8 *addrs =3D nfc->op.addrs;
> > +	unsigned int op =3D 0;
> > +	int i, ret;
> > +
> > +	for (i =3D 0; i < nfc->op.ncmds; i++)
> > +		op |=3D ATMEL_NFC_CMD(i, nfc->op.cmds[i]);
> > +
> > +	if (nfc->op.naddrs =3D=3D 5) =20
>=20
> Use a #define for this value.

Yep.

>=20
> > +		regmap_write(nfc->base.smc, ATMEL_HSMC_NFC_ADDR, *addrs++);
> > +
> > +	op |=3D ATMEL_NFC_CSID(nfc->op.cs) |
> > +	      ATMEL_NFC_ACYCLE(nfc->op.naddrs);
> > +
> > +	if (nfc->op.ncmds > 1)
> > +		op |=3D ATMEL_NFC_VCMD2;
> > +
> > +	addr =3D addrs[0] | (addrs[1] << 8) | (addrs[2] << 16) |
> > +	       (addrs[3] << 24);
> > +
> > +	if (nfc->op.data !=3D ATMEL_NFC_NO_DATA) {
> > +		op |=3D ATMEL_NFC_DATAEN;
> > +		wait |=3D ATMEL_HSMC_NFC_SR_XFRDONE;
> > +
> > +		if (nfc->op.data =3D=3D ATMEL_NFC_WRITE_DATA)
> > +			op |=3D ATMEL_NFC_NFCWR;
> > +	}
> > +
> > +	/* Clear all flags. */
> > +	regmap_read(nfc->base.smc, ATMEL_HSMC_NFC_SR, &val);
> > +
> > +	/* Send the command. */
> > +	regmap_write(nfc->io, op, addr);
> > +
> > +	ret =3D atmel_sama5_nfc_wait(nfc, wait, true, 0);
> > +	if (ret)
> > +		dev_err(nfc->base.dev,
> > +			"Failed to send NAND command (err =3D %d)!",
> > +			ret);
> > +
> > +	/* Reset the op state. */
> > +	memset(&nfc->op, 0, sizeof(nfc->op));
> > +
> > +	return ret;
> > +}
> > +
> > +static void atmel_sama5_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
> > +				     unsigned int ctrl)
> > +{
> > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > +	struct atmel_nand *nand =3D to_atmel_nand(chip);
> > +	struct atmel_sama5_nfc *nfc =3D to_sama5_nfc(chip->controller);
> > +
> > +	if (ctrl & NAND_ALE) {
> > +		if (nfc->op.naddrs > 4) =20
>=20
> Here also, I guess it's the same test as "if (nfc->op.naddrs =3D=3D 5)"
> above: so try to use same test to make us understand that it's the same
> condition. With the #defined value it also should help...

Indeed, we should have the same condition here.

>=20
> > +			return;
> > +
> > +		nfc->op.addrs[nfc->op.naddrs++] =3D dat;
> > +	} else if (ctrl & NAND_CLE) {
> > +		if (nfc->op.ncmds > 1)
> > +			return;
> > +
> > +		nfc->op.cmds[nfc->op.ncmds++] =3D dat;
> > +	}
> > +
> > +	if (dat =3D=3D NAND_CMD_NONE) {
> > +		nfc->op.cs =3D nand->activecs->id;
> > +		atmel_sama5_nfc_exec_op(nfc);
> > +	}
> > +}
> > +

[...]

> > +static int atmel_sama5_nfc_pmecc_read_pg(struct nand_chip *chip, u8 *b=
uf,
> > +					 bool oob_required, int page, bool raw)
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	struct atmel_nand *nand =3D to_atmel_nand(chip);
> > +	struct atmel_sama5_nfc *nfc =3D to_sama5_nfc(chip->controller);
> > +	int ret;
> > +
> > +	/*
> > +	 * Optimized read page accessors only work when the NAND R/B pin is
> > +	 * connected to a native SoC R/B pin. If that's not the case, fallback
> > +	 * to the non-optimized one.
> > +	 */
> > +	if (nand->activecs->rb.type !=3D ATMEL_NAND_NATIVE_RB) { =20
>=20
> Can't we optimize this path by not having to test this for each page read?

Hm, it's really negligible to the amount of time you'll spend reading
the page and correcting errors. Don't think it's worth trying to
optimize that.

>=20
> > +		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > +
> > +		return atmel_nfc_pmecc_read_pg(chip, buf, oob_required, page,
> > +					       raw);
> > +	}
> > +
> > +	nfc->op.cmds[nfc->op.ncmds++] =3D NAND_CMD_READ0;
> > +
> > +	if (mtd->writesize > 512)
> > +		nfc->op.cmds[nfc->op.ncmds++] =3D NAND_CMD_READSTART;
> > +
> > +	atmel_sama5_nfc_set_op_addr(chip, page, 0x0);
> > +	nfc->op.cs =3D nand->activecs->id;
> > +	nfc->op.data =3D ATMEL_NFC_READ_DATA;
> > +
> > +	ret =3D atmel_nfc_pmecc_enable(chip, NAND_ECC_READ, raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D atmel_sama5_nfc_exec_op(nfc);
> > +	if (ret) {
> > +		atmel_nfc_pmecc_disable(chip, raw);
> > +		dev_err(nfc->base.dev,
> > +			"Failed to load NAND page data (err =3D %d)\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	atmel_sama5_nfc_copy_from_sram(chip, buf, false);
> > +	atmel_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> > +
> > +	ret =3D atmel_nfc_pmecc_correct_data(chip, buf, raw);
> > +
> > +	atmel_nfc_pmecc_disable(chip, raw);
> > +
> > +	return ret;
> > +}


[...]

> > +static void atmel_sama5_nfc_nand_init(struct atmel_nfc *nfc,
> > +				      struct atmel_nand *nand)
> > +{
> > +	struct nand_chip *chip =3D &nand->base;
> > +
> > +	atmel_nfc_nand_init(nfc, nand);
> > +
> > +	/* Overload some methods for the SAMA5 controller. */ =20
>=20
> "for the SAMA5D3-compatible controller"

I'll probably change the comment after renaming everything as you
suggested.

>=20
> > +	chip->cmd_ctrl =3D atmel_sama5_nfc_cmd_ctrl;
> > +	chip->select_chip =3D atmel_sama5_nfc_select_chip;
> > +}
> > +

[...]

> > +static int atmel_nfc_nand_register(struct atmel_nand *nand)
> > +{
> > +	struct nand_chip *chip =3D &nand->base;
> > +	struct atmel_nfc *nfc =3D to_nfc(chip->controller);
> > +	struct atmel_nand_data *pdata =3D dev_get_platdata(nfc->dev);
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	const struct mtd_partition *parts =3D NULL;
> > +	int nparts =3D 0, ret;
> > +
> > +	if (nfc->caps->legacy_of_bindings || !nfc->dev->of_node) {
> > +		/*
> > +		 * We keep the MTD name unchanged to avoid breaking platforms
> > +		 * where the MTD cmdline parser is used and the bootloader
> > +		 * has not been updated to use the new naming scheme.
> > +		 */
> > +		mtd->name =3D "atmel_nand";
> > +	} else if (!mtd->name) {
> > +		/*
> > +		 * If the new bindings are used and the bootloader has not been
> > +		 * updated to pass a new mtdparts parameter on the cmdline, you
> > +		 * should define the following property in your nand node:
> > +		 *
> > +		 *	label =3D "atmel_nand"; =20
>=20
> I don't see this in the new binding documentation. It is useful to
> document it.

Well, I'm not sure this is something we can/should document in the DT
bindings doc.

>=20
>=20
> > +		 *
> > +		 * This way, mtd->name will be set by the core when
> > +		 * nand_set_flash_node() is called.
> > +		 */
> > +		mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
> > +					   "%s:nand.%d", dev_name(nfc->dev),
> > +					   nand->cs[0].id);
> > +		if (!mtd->name) {
> > +			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
> > +			return -ENOMEM;
> > +		}
> > +	}
> > +
> > +	ret =3D nand_scan_tail(mtd);
> > +	if (ret) {
> > +		dev_err(nfc->dev, "nand_scan_tail() failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (pdata) {
> > +		parts =3D pdata->parts;
> > +		nparts =3D pdata->num_parts;
> > +	}
> > +
> > +	ret =3D mtd_device_register(mtd, parts, nparts);
> > +	if (ret) {
> > +		dev_err(nfc->dev, "Failed to register mtd device: %d\n", ret);
> > +		nand_cleanup(chip);
> > +		return ret;
> > +	}
> > +
> > +	list_add_tail(&nand->node, &nfc->chips);
> > +
> > +	return 0;
> > +}
> > +
> > +struct gpio_desc *atmel_nand_of_get_gpio(struct atmel_nfc *nfc,
> > +					 struct device_node *np,
> > +					 const char *name, int index,
> > +					 enum gpiod_flags flags)
> > +{
> > +	struct gpio_desc *gpio;
> > +	int ret;
> > +
> > +	gpio =3D devm_get_index_gpiod_from_child(nfc->dev, name, index,
> > +					       &np->fwnode);
> > +	if (IS_ERR(gpio)) {
> > +		if (PTR_ERR(gpio) =3D=3D -ENOENT)
> > +			return NULL;
> > +
> > +		return gpio;
> > +	}
> > +
> > +	if (!(flags & GPIOD_FLAGS_BIT_DIR_SET))
> > +		return gpio;
> > +
> > +	/* Process flags */ =20
>=20
> Nit: "." at the end like other comments in the file

I'll fix that.

>=20
> > +	if (flags & GPIOD_FLAGS_BIT_DIR_OUT)
> > +		ret =3D gpiod_direction_output(gpio,
> > +					!!(flags & GPIOD_FLAGS_BIT_DIR_VAL));
> > +	else
> > +		ret =3D gpiod_direction_input(gpio);
> > +
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return gpio;
> > +}
> > +
[...]

> > diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pm=
ecc.c
> > new file mode 100644
> > index 000000000000..9baccae5d5a5
> > --- /dev/null
> > +++ b/drivers/mtd/nand/atmel/pmecc.c
> > @@ -0,0 +1,1011 @@
> > +/*
> > + * =C2=A9 Copyright 2016 ATMEL
> > + * =C2=A9 Copyright 2016 Free Electrons =20
>=20
> Ditto about (c)

Will remove this UTF8 chars.

[...]

> > +
> > +static void atmel_pmecc_gen_syndrome(struct atmel_pmecc_user *user, in=
t sector)
> > +{
> > +	int strength =3D get_strength(user);
> > +	u32 value;
> > +	int i;
> > +
> > +	/* Fill odd syndromes */
> > +	for (i =3D 0; i < strength; i++) {
> > +		value =3D readl_relaxed(user->pmecc->regs.base +
> > +				      ATMEL_PMECC_REM(sector, i / 2));
> > +		if (i & 1)
> > +			value >>=3D 16;
> > +
> > +		user->partial_syn[(2 * i) + 1] =3D value;
> > +	}
> > +} =20
>=20
> What about saying somewhere in this file (header?) that all this
> computation is described in the product datasheet and that a hardware
> software bit correction is put in place following the recomandation of
> the datasheet?

Sure.

Actually, after looking at the software bch code (lib/bch.c), I think
we can re-use a few things instead of open-coding it here, but that's
not for this round ;-).

Thanks for the review.

Regards,

Boris
