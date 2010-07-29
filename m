Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeOtr-0004oA-Cy
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 08:55:37 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
Date: Thu, 29 Jul 2010 10:51:38 +0200
References: <201007290047.06394.ffainelli@freebox.fr>
	<4C5133AC.5010009@parrot.com>
In-Reply-To: <4C5133AC.5010009@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201007291051.38278.ffainelli@freebox.fr>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Thursday 29 July 2010 09:54:20 Matthieu CASTET wrote:
> Hi,
>=20
> Florian Fainelli a =C3=A9crit :
> > A nand_chip which has valid ONFI parameters gets its options field
> > updated with the NAND_ONFI flag. In that case both the ONFI version (in
> > BCD format) as well as the complete page parameters is available in the
> > struct nand_chip. This allows for better detection of some new devices,
> > as well as fine tuning of NAND driver timings. This patch only adds
> > support for ONFI 1.0 parameters.
> >=20
> > Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> > Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
> > ---
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 4a7b864..c255cec 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2773,6 +2773,83 @@ static void nand_set_defaults(struct nand_chip
> > *chip, int busw)
> >=20
> >  }
> >=20
> > +
> > +/*
> > + * Check whether flash support ONFI and read ONFI parameters in that
> > + * case
> > + */
> > +static void nand_read_onfi(struct mtd_info *mtd, struct nand_chip *chi=
p)
> > +{
> > +	struct nand_onfi_params *p;
> > +	uint8_t sig[4];
> > +	uint16_t val;
> > +
> > +	if (!chip->cmdfunc || !chip->read_buf)
> > +		return;
> > +
> > +	/* read ONFI signature */
> > +	chip->cmdfunc(mtd, NAND_CMD_READID, NAND_ADDR_ONFI_ID, -1);
> > +	chip->read_buf(mtd, sig, sizeof(sig));
> > +
> > +	if (memcmp(sig, "ONFI", sizeof(sig)))
> > +		return;
> > +
> > +	/* ONFI seems supported */
> > +	chip->cmdfunc(mtd, NAND_CMD_READ_ONFI_PARAMS, 0, -1);
> > +	p =3D &chip->onfi_params;
> > +	chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> > +
> > +	/* recheck signature */
> > +	if (memcmp(p->sig, "ONFI", sizeof(p->sig))) {
> > +		printk(KERN_INFO "%s: bad ONFI params signature\n", __func__);
> > +		return;
> > +	}
>=20
> You need to check crc. onfi param can be corrupted (bitflip ?) and
> should try at least 3 page.

Ok.

>=20
>=20
> Also you don't handle endianness (integer are little endian) for value
> in nand_onfi_params.

Yes, so far the drivers using those values were doing the correct endian=20
conversion when they need to use them.

>=20
> Also I am not sure it is worth to export all the onfi param. Fill the
> mtd param for page, erase, oob size and other stuff.

What we were interested about are mostly timings, manufacturer and model=20
string because they can help handling new parts correctly.

> After all rev info and features block, manufacturer information block,
> memory organization block should only be used by mtd layer.

You are right.

> Only electrical parameter block can interest driver for fine tunning

Yes.

>=20
> >   * Get the flash and manufacturer id and lookup if the type is support=
ed
> >   */
> > =20
> >  static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >=20
> > @@ -2958,10 +3035,19 @@ static struct nand_flash_dev
> > *nand_get_flash_type(struct mtd_info *mtd,
> >=20
> >  	if (mtd->writesize > 512 && chip->cmdfunc =3D=3D nand_command)
> >  =09
> >  		chip->cmdfunc =3D nand_command_lp;
> >=20
> > +	nand_read_onfi(mtd, chip);
> > +
> >=20
> >  	printk(KERN_INFO "NAND device: Manufacturer ID:"
> >  =09
> >  	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
> >  	       nand_manuf_ids[maf_idx].name, type->name);
> >=20
> > +	if (chip->options & NAND_ONFI)
> > +		printk(KERN_INFO "NAND is ONFI %d.%d compliant "
> > +		       "(man:%s model:%s)\n",
> > +		       chip->onfi_version / 10, chip->onfi_version % 10,
> > +		       chip->onfi_params.manufacturer,
> > +		       chip->onfi_params.model);
> > +
> >=20
> >  	return type;
> > =20
> >  }
>=20
> This won't work this unknown nand, and not work with some LP nand that
> doesn't provide additional id bytes.

So how do you see things regarding the provisioning of the relevant ONFI=20
parameters?
=2D-
=46lorian
