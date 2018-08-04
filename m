Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fltIA-0002t9-1N
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 09:56:11 +0000
Date: Sat, 4 Aug 2018 11:56:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "mmayer@broadcom.com" <mmayer@broadcom.com>, "rogerq@ti.com"
 <rogerq@ti.com>, "ladis@linux-mips.org" <ladis@linux-mips.org>,
 "ada@thorsis.co" <ada@thorsis.co>, "honghui.zhang@mediatek.com"
 <honghui.zhang@mediatek.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>
Subject: Re: [LINUX PATCH v11 3/3] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Message-ID: <20180804115602.2f44c007@xps13>
In-Reply-To: <MWHPR02MB26231B9223265E914250FACCAF2E0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1531294612-29526-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180729211532.58c80a20@xps13>
 <MWHPR02MB26231B9223265E914250FACCAF2E0@MWHPR02MB2623.namprd02.prod.outlook.com>
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
> > > + * pl353_nand_read_data_op - read chip data into buffer
> > > + * @chip:	Pointer to the NAND chip info structure
> > > + * @in:		Pointer to the buffer to store read data
> > > + * @len:	Number of bytes to read
> > > + * Return:	Always return zero
> > > + */
> > > +static int pl353_nand_read_data_op(struct nand_chip *chip,
> > > +				   u8 *in,
> > > +				   unsigned int len)
> > > +{
> > > +	int i;
> > > +	struct pl353_nand_info *xnfc =3D
> > > +		container_of(chip, struct pl353_nand_info, chip);
> > > +
> > > +	if (IS_ALIGNED((uint32_t)in, sizeof(uint32_t)) &&
> > > +	    IS_ALIGNED(len, sizeof(uint32_t))) {
> > > +		u32 *ptr =3D (u32 *)in;
> > > +
> > > +		len /=3D 4;
> > > +		for (i =3D 0; i < len; i++)
> > > +			ptr[i] =3D readl(xnfc->nandaddr);
> > > +	} else {
> > > +		for (i =3D 0; i < len; i++)
> > > +			in[i] =3D readb(xnfc->nandaddr);
> > > +	} =20
> >=20
> > What about reading 0-3 bytes with readb if the driver is not aligned, t=
hen doing aligned
> > access with readl until readb must be used again for the last 0-3 bytes=
? =20
> The else case is handling that right?

No it's not. The else case reads byte per byte, always.

[...]

> > > +static int pl353_nand_calculate_hwecc(struct mtd_info *mtd,
> > > +				      const u8 *data, u8 *ecc)
> > > +{
> > > +	u32 ecc_value;
> > > +	u8 ecc_reg, ecc_byte, ecc_status;
> > > +	unsigned long timeout =3D jiffies + PL353_NAND_ECC_BUSY_TIMEOUT;
> > > +
> > > +	/* Wait till the ECC operation is complete or timeout */
> > > +	do {
> > > +		if (pl353_smc_ecc_is_busy())
> > > +			cpu_relax();
> > > +		else
> > > +			break;
> > > +	} while (!time_after_eq(jiffies, timeout));
> > > +
> > > +	if (time_after_eq(jiffies, timeout)) {
> > > +		pr_err("%s timed out\n", __func__);
> > > +		return -ETIMEDOUT;
> > > +	} =20
> >=20
> > All of this should be done by the function calling nand_calculate_hwecc=
(), not here. =20
> Ok, I will update it.
> >=20
> > Plus, it should deserve a function on its own. =20
> Ok, will add new one.
> >  =20
> > > +
> > > +	for (ecc_reg =3D 0; ecc_reg < 4; ecc_reg++) {
> > > +		/* Read ECC value for each block */ =20
> >=20
> > So you assume here that there are 4, and only 4 "blocks" (I prefer "ECC=
 chunks" or
> > "subpages"). Is it always the case? Or is it just how it works in your =
situation? I would rather
> > prefer a to define this value anyway. =20
> Sure, I will define a macro as ECC chunks to represent 4.
> And there are always 4 ECC registers as per the controller. And there is =
no assumption here.

What about smaller or larger NAND chips? Maybe there are some
limitations in what chips are actually supported, then they should be
rejected.


[...]

> > > +static void pl353_prepare_cmd(struct mtd_info *mtd, struct
nand_chip *chip,
> > > +			      int page, int column, int start_cmd, int end_cmd,
> > > +			      bool read)
> > > +{
> > > +	unsigned long data_phase_addr;
> > > +	u32 end_cmd_valid =3D 0;
> > > +	unsigned long cmd_phase_addr =3D 0, cmd_data =3D 0;
> > > +
> > > +	struct pl353_nand_info *xnfc =3D
> > > +		container_of(chip, struct pl353_nand_info, chip);
> > > +
> > > +	end_cmd_valid =3D read ? 1 : 0;
> > > +
> > > +	cmd_phase_addr =3D (unsigned long __force)xnfc->nand_base + =20
> >=20
> > do you really need this cast? =20
> As I said above, during command and data phases, we have to update the AX=
I Read/Write addresses with cycles, start command, end command
> And some extra info. Hence I am converting it to a value and then adding =
the above values and then again converting back as an
> Address.
>=20
> >  =20
> > > +			 ((xnfc->addr_cycles
> > > +			 << ADDR_CYCLES_SHIFT) |
> > > +			 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> > > +			 (COMMAND_PHASE) |
> > > +			 (end_cmd << END_CMD_SHIFT) |
> > > +			 (start_cmd << START_CMD_SHIFT)); =20
> >=20
> > So the number of address cycles changes the address where you should wr=
ite the address
> > cycles? that's weird, no? =20
> I agree, but the implementation of PL353 is like that.
> As I pointed the spec above, for every transfer we have to frame AXI Writ=
e address and Read address.
>=20
> >  =20
> > > +
> > > +	/* Get the data phase address */
> > > +	data_phase_addr =3D (unsigned long __force)xnfc->nand_base +
> > > +			  ((0x0 << CLEAR_CS_SHIFT) |
> > > +			  (0 << END_CMD_VALID_SHIFT) |
> > > +			  (DATA_PHASE) |
> > > +			  (end_cmd << END_CMD_SHIFT) |
> > > +			  (0x0 << ECC_LAST_SHIFT));
> > > + =20
> > Same question here?
> >  =20
> > > +	xnfc->nandaddr =3D (void __iomem * __force)data_phase_addr; =20
> >=20
> > This should be done only once in the probe =20
> No, as explained above, once we frame the Axi Write address/Read address =
with valid data, then we
> Are converting back as memory address with the casting.
> Do you see any issues with that?
> Let me know, is there an alternative to achieve the same.=20
> All is about, constructing AXI Write address and Read address during comm=
and and data phases.

Ok, I'll ask Boris to also review your next version, once -rc1 is out.

Thanks,
Miqu=C3=A8l
