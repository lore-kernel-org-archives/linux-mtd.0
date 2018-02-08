Received: from mail-cys01nam02on0066.outbound.protection.outlook.com
 ([104.47.37.66] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejbjR-0001Wc-Sf
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 02:14:41 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@free-electrons.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Punnaiah Choudary Kalluri
 <punnaia@xilinx.com>, Michal Simek <michals@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [PATCH v9 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Date: Thu, 8 Feb 2018 02:14:18 +0000
Message-ID: <BY2PR02MB1411184282F661DBE43054D0AFF30@BY2PR02MB1411.namprd02.prod.outlook.com>
References: <20171214134445.4985-1-nagasure@xilinx.com>
 <20171214134445.4985-3-nagasure@xilinx.com>	<20171228215528.3ce15bd5@xps13>
 <BY2PR02MB14112FAB777449F1B303D85AAFEC0@BY2PR02MB1411.namprd02.prod.outlook.com>
 <20180203160504.7c91c25e@xps13> <20180203165128.415e9824@bbrezillon>
In-Reply-To: <20180203165128.415e9824@bbrezillon>
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

Hi Boris & Miquel,

Thanks for the review.

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Saturday, February 3, 2018 9:21 PM
> To: Miquel Raynal <miquel.raynal@free-electrons.com>
> Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>; boris.brezillon@free-
> electrons.com; richard@nod.at; computersforpeace@gmail.com;
> marek.vasut@gmail.com; cyrille.pitchen@wedev4u.fr;
> nagasuresh12@gmail.com; linux-mtd@lists.infradead.org; Punnaiah Choudary
> Kalluri <punnaia@xilinx.com>; Michal Simek <michals@xilinx.com>;
> dwmw2@infradead.org
> Subject: Re: [PATCH v9 2/2] mtd: nand: Add support for Arasan NAND Flash
> Controller
>=20
> On Sat, 3 Feb 2018 16:05:04 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
>=20
> >
> > > > > +}
> > > > > +
> > > > > +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> > > > > +				struct nand_chip *chip, uint8_t *buf,
> > > > > +				int oob_required, int page) {
> > > > > +	u32 val;
> > > > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > > > +	u8 *ecc_code =3D chip->buffers->ecccode;
> > > > > +	u8 *p =3D buf;
> > > > > +	int eccsize =3D chip->ecc.size;
> > > > > +	int eccbytes =3D chip->ecc.bytes;
> > > > > +	int eccsteps =3D chip->ecc.steps;
> > > > > +	int stat =3D 0, i;
> > > > > +
> > > > > +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT,
> > > > > NAND_CMD_RNDOUTSTART);
> > > > > +	anfc_config_ecc(nfc, 1);
> > > > > +
> > > > > +	chip->read_buf(mtd, buf, mtd->writesize);
> > > > > +
> > > > > +	val =3D readl(nfc->base + ECC_ERR_CNT_OFST);
> > > > > +	val =3D ((val & PAGE_ERR_CNT_MASK) >> 8);
> > > >
> > > > If I understand this correctly, there is no point doing the upper t=
wo lines
> out of
> > > > the if statement?
> > > Yes, I will move this to if statement.
> > > >
> > > > > +	if (achip->bch) {
> > > > > +		mtd->ecc_stats.corrected +=3D val;
> > > >
> > > > This is strange that there is no handling of a failing situation
> > > > when using BCH algorithm. You should probably add some logic here t=
hat
> either increments
> > > > ecc_stats.corrected or ecc_stats.failed like it is done below.
> > > Yes, in case of BCH, upto 24 bit errors it will correct. After that i=
t won't even
> detect the errors.
>=20
> Duh! sounds like a broken design. What is true is that for a given streng=
th (let's
> call it S), BCH is able to correct S bitflits and is, most of the time, a=
ble to detect
> up to S+1 bitflips. Sometime though, it fails to detect that errors are
> uncorrectable, tries to fix things and do worse. Anyway, assuming that BC=
H
> errors should never be counted/reported is wrong.
>=20
> > > Hence when BCH we are not updating errors.
>=20
> When you know there is an error, it should be reported to the upper layer=
. If the
> controller does not report ECC errors, it's broken and should not be used=
.
>=20
> >
> > That's weird... Could you please double check this assumption? I find
> > weird that you have no way to distinguish a "there was no bitflips"
> > with a "there are too much bitflips so I can't even correct them".

I got confirmation from hardware team, that BCH ECC can correct up to 24bit=
.
But later that it can't even detect the errors. So we don't' have provision
To get error info in this case.

Any thoughts on this?
Punnaiah, Do you have any idea?
>=20
>=20
> > > >
> > > > > +
> > > > > +	/*
> > > > > +	 * If the controller is already in the same mode as flash
> > > > > device
> > > > > +	 * then no need to change the timing mode again.
> > > > > +	 */
> > > > > +	if (readl(nfc->base + DATA_INTERFACE_OFST) =3D=3D
> > > > > achip->inftimeval)
> > > > > +		return 0;
> > > > > +
> > > > > +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> > > > > +	/* Get nvddr timing modes */
> > > > > +	mode =3D onfi_get_sync_timing_mode(chip) & 0xff;
> > > > > +	if (!mode) {
> > > > > +		mode =3D fls(onfi_get_async_timing_mode(chip)) - 1;
> > > > > +		inftimeval =3D mode;
> > > > > +		if (mode >=3D 2 && mode <=3D 5)
> > > > > +			change_sdr_clk =3D true;
> > > > > +	} else {
> > > > > +		mode =3D fls(mode) - 1;
> > > > > +		inftimeval =3D NVDDR_MODE | (mode <<
> > > > > NVDDR_TIMING_MODE_SHIFT);
> > > > > +		mode |=3D ONFI_DATA_INTERFACE_NVDDR;
> > > > > +	}
> > > > > +	feature[0] =3D mode;
> > > > > +	chip->select_chip(mtd, achip->csnum);
> > > > > +	err =3D chip->onfi_set_features(mtd, chip,
> > > > > ONFI_FEATURE_ADDR_TIMING_MODE,
> > > > > +		(uint8_t *)feature);
> > > > > +	chip->select_chip(mtd, -1);
> > > > > +	if (err)
> > > > > +		return err;
> > > >
> > > > You should forget all the NAND chip related code here, the core
> > > > already handles it, and then calls ->setup_data_interface() to tune=
 timings
> on the controller side
> > > > only.
> > > Since core doesn't have support for NVDDR, enum
> > > nand_data_interface_type {
> > > 	NAND_SDR_IFACE,
> > > };
> > > we added this logic in setup_data_interface. To achieve the same So
> > > what we are doing here is, When core calls setup_data_interface, the
> > > flash changes its operating mode to SDR.
> > > And when flash supports NVDDR, we are changing the Flash operating
> > > mode to NVDDR.
> >
> > Not sure this is actually supported by the core. Maybe Boris could
> > give us some clues?
>=20
> It's not, but there's a good reason I defined an interface_type and the s=
dr
> timings are put in a union ;-). So, if you want to support DDR mode, add =
the
> relevant bits to the core (I think that's what Naga did or is planning to=
 do)

I didn't touch the union, for time being I did that in driver.
But will add that in union as other macro and will test with that Boris.
>=20
> >
> > > Also the setup_data_interface call will happen during probe time, and=
 at this
> time we don't have
> > > Parameter page info, hence I added
> >
> > I sent a patch series to fix that. Let's keep it for now but soon this
> > will have to be removed.
> >
> > > if (!chip->onfi_version ||
> > > 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > > 	    & ONFI_OPT_CMD_SET_GET_FEATURES))
> > > 		return -EINVAL;
> > > >
> > > > > +	/*
> > > > > +	 * SDR timing modes 2-5 will not work for the arasan nand
> > > > > when
> > > > > +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to <
> > > > > 90Mhz
> > > > > +	 */
> > > > > +	if (change_sdr_clk) {
> > > > > +		clk_disable_unprepare(nfc->clk_sys);
> > > > > +		err =3D clk_set_rate(nfc->clk_sys,
> > > > > SDR_MODE_DEFLT_FREQ);
> > > > > +		if (err) {
> > > > > +			dev_err(nfc->dev, "Can't set the clock
> > > > > rate\n");
> > > > > +			return err;
> > > > > +		}
> > > > > +		err =3D clk_prepare_enable(nfc->clk_sys);
> > > > > +		if (err) {
> > > > > +			dev_err(nfc->dev, "Unable to enable sys
> > > > > clock.\n");
> > > > > +			clk_disable_unprepare(nfc->clk_sys);
> > > > > +			return err;
> > > > > +		}
> > > >
> > > > You do this twice as it is already handled in ->setup_data_interfac=
e().
> > > Yes, we added it twice, once when core sends SDR info And the
> > > second, because there is a HW bug in controller, i.e SDR timing modes=
 2-5
> will not work, when freq > 90MHz.
> > > Hence when Flash operates at SDR modes 2-5, we are changing the
> > > clock rate to below 90MHz
>=20
> I don't get it. When the timings are selected, you should know which mode
> you're operating in, so you can change the frequency at this specific tim=
e.

Ok Boris, I got it.
I will update this instead of calling twice. Thanks.
>=20
> >
> > 1/ If you do it twice because of a HW bug: please add a comment.
I will modify as Boris suggested by knowing the current operating mode.

> > 2/ What if there are several NAND chips using different timing modes?
> > You probably should handle this in ->select_chip() then.
Yes, I didn't consider this multi NAND chips case.
Will do as suggested.
>=20
> Yep, multi-chip support requires that you move the rate-change logic in
> ->select_chip().
Ok, I will move this to select_chip().

Thanks for your comments.

Regards,
Naga Sureshkukmar Relli.
