Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ODtCV-00071b-Cl
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 05:49:16 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Mon, 17 May 2010 11:18:58 +0530
Subject: RE: [PATCH v2 1/2] omap3 nand: cleanup for not to use GPMC virtual
	address
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D8FB825@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1273850591-19040-1-git-send-email-s-ghorai@ti.com>
	<1273850591-19040-2-git-send-email-s-ghorai@ti.com>
	<20100514235852.GN3428@atomide.com>
In-Reply-To: <20100514235852.GN3428@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "sakoman@gmail.com" <sakoman@gmail.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tony,

> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: 2010-05-15 05:29
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org;
> sakoman@gmail.com; mike@compulab.co.il; Artem.Bityutskiy@nokia.com
> Subject: Re: [PATCH v2 1/2] omap3 nand: cleanup for not to use GPMC
> virtual address
>=20
> Few more comments below.
>=20
> * Sukumar Ghorai <s-ghorai@ti.com> [100514 08:18]:
> > +
> > +/**
> > + * gmpc_ecc_init - Initialize the HW ECC for NAND flash in GPMC
> controller
> > + * @cs: Chip select number
> > + * @ecc_size: bytes for which ECC will be generated
> > + */
> > +void gpmc_ecc_init(int cs, int ecc_size)
> > +{
> > +	unsigned int val =3D 0x0;
> > +
> > +	/* Read from ECC Control Register */
> > +	val =3D gpmc_read_reg(GPMC_ECC_CONTROL);
> > +
> > +	/* Clear all ECC | Enable Reg1 */
> > +	val =3D ((0x00000001<<8) | 0x00000001);
> > +	gpmc_write_reg(GPMC_ECC_CONTROL, val);
> > +
> > +	/* Read from ECC Size Config Register */
> > +	val =3D gpmc_read_reg(GPMC_ECC_SIZE_CONFIG);
> > +	/* ECCSIZE1=3D512 | Select eccResultsize[0-3] */
> > +	val =3D ((((ecc_size >> 1) - 1) << 22) | (0x0000000F));
> > +	gpmc_write_reg(GPMC_ECC_SIZE_CONFIG, val);
> > +}
>=20
> There should be some locking as only one chipselect can use
> the ECC or prefetch engine at a time. If you have NAND in
> two chipselects, bad things would happen..
>=20
> Maybe something like:
>=20
> int gpmc_ecc_request(int cs);
> void gpmc_ecc_free(int cs);
> int gpmc_prefetch_request(int cs);
> void gpmc_prefetch_free(int cs);
>=20
> Other than that, looks like a good clean-up so we can easily
> add the platform init code for all the board files.
[Ghorai] agreed.. and -
1). Adding one flag/variable for prefetch enable/reset request
2). Adding another flag/variable for ecc int/reset request

Regards,
Ghorai

>=20
> Regards,
>=20
> Tony
