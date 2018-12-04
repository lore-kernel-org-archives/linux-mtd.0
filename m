Received: from mail-eopbgr700085.outbound.protection.outlook.com
 ([40.107.70.85] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU6rG-0003AN-46
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 09:19:11 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Tue, 4 Dec 2018 09:18:53 +0000
Message-ID: <MWHPR02MB2623DDF6C43BBBB99A52D5DFAFAF0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181120172443.5fb0bc14@bbrezillon>
In-Reply-To: <20181120172443.5fb0bc14@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Tuesday, November 20, 2018 9:55 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; Michal Simek
> <michals@xilinx.com>; nagasuresh12@gmail.com; linux-mtd@lists.infradead.o=
rg; linux-
> kernel@vger.kernel.org; robh@kernel.org
> Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for =
Arasan
> NAND Flash Controller
>=20
> On Fri, 9 Nov 2018 10:30:41 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > +static int anfc_setup_data_interface(struct nand_chip *chip, int cslin=
e,
> > +				     const struct nand_data_interface *conf) {
> > +	struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
> > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > +	int err;
> > +	const struct nand_sdr_timings *sdr;
> > +	u32 inftimeval;
> > +	bool change_sdr_clk =3D false;
> > +
> > +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> > +		return 0;
> > +
> > +	/*
> > +	 * If the controller is already in the same mode as flash device
> > +	 * then no need to change the timing mode again.
> > +	 */
> > +	sdr =3D nand_get_sdr_timings(conf);
> > +	if (IS_ERR(sdr))
> > +		return PTR_ERR(sdr);
> > +
> > +	if (sdr->mode < 0)
> > +		return -ENOTSUPP;
> > +
> > +	inftimeval =3D sdr->mode & 7;
> > +	if (sdr->mode >=3D 2 && sdr->mode <=3D 5)
> > +		change_sdr_clk =3D true;
> > +	/*
> > +	 * SDR timing modes 2-5 will not work for the arasan nand when
> > +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to < 90Mhz
>=20
> What's the freq for mode 0 and 1?
It is 100MHz in SDR mode 0 and 1.

>=20
> > +	 */
> > +	if (change_sdr_clk) {
> > +		clk_disable_unprepare(nfc->clk_sys);
> > +		err =3D clk_set_rate(nfc->clk_sys, SDR_MODE_DEFLT_FREQ);
>=20
> You should not change the clk rate here. It should be done when the chip =
is selected, so that,
> if you ever have 2 different chips connected to the same controller, you =
can adapt the rate
> when they are accessed.
Ok, got it. I will update.

>=20
> > +		if (err) {
> > +			dev_err(nfc->dev, "Can't set the clock rate\n");
> > +			return err;
> > +		}
> > +		err =3D clk_prepare_enable(nfc->clk_sys);
> > +		if (err) {
> > +			dev_err(nfc->dev, "Unable to enable sys clock.\n");
> > +			clk_disable_unprepare(nfc->clk_sys);
> > +			return err;
> > +		}
> > +	}
> > +	achip->inftimeval =3D inftimeval;
> > +
> > +	return 0;
> > +}
> > +
> > +static int anfc_nand_attach_chip(struct nand_chip *chip) {
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > +	u32 ret;
> > +
> > +	if (mtd->writesize <=3D SZ_512)
> > +		achip->spare_caddr_cycles =3D 1;
> > +	else
> > +		achip->spare_caddr_cycles =3D 2;
> > +
> > +	chip->ecc.calc_buf =3D kmalloc(mtd->oobsize, GFP_KERNEL);
> > +	chip->ecc.code_buf =3D kmalloc(mtd->oobsize, GFP_KERNEL);
>=20
> Those bufs are allocated but never freed (memleak). Also, are you sure yo=
u really need them.
These bufs are freed in nand_release(), which is calling from anfc_remove()=
.

And chip->ecc.code_buf, is used in anfc_read_page_hwecc().
What we are doing here is, extract ECC code from OOB and place it in ecv.co=
de_buf, and passing this info to nand_check_ecc_chunk(buf, chip->ecc.size, =
&ecc_code[i], eccbytes, NULL, 0,chip->ecc.strength).
i.e. just to store ECC code from OOB area.
=20
And chip->ecc.calc_buf is no where used in the driver, I will remove it.

Thanks,
Naga Sureshkumar Relli.
