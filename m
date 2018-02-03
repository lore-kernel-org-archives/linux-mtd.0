Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ehzNm-0007fh-5w
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 15:05:37 +0000
Date: Sat, 3 Feb 2018 16:05:04 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Punnaiah
 Choudary Kalluri <punnaia@xilinx.com>, Michal Simek <michals@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v9 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Message-ID: <20180203160504.7c91c25e@xps13>
In-Reply-To: <BY2PR02MB14112FAB777449F1B303D85AAFEC0@BY2PR02MB1411.namprd02.prod.outlook.com>
References: <20171214134445.4985-1-nagasure@xilinx.com>
 <20171214134445.4985-3-nagasure@xilinx.com>
 <20171228215528.3ce15bd5@xps13>
 <BY2PR02MB14112FAB777449F1B303D85AAFEC0@BY2PR02MB1411.namprd02.prod.outlook.com>
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

-> Boris, there is one question for you below (about NVDDR).

> > > +static inline struct anfc_nand_chip *to_anfc_nand(struct nand_chip
> > > *nand) +{
> > > +	return container_of(nand, struct anfc_nand_chip, chip); }
> > > +
> > > +static inline struct anfc *to_anfc(struct nand_hw_control *ctrl) {
> > > +	return container_of(ctrl, struct anfc, controller); }
> > > +
> > > +static u8 anfc_page(u32 pagesize)
> > > +{
> > > +	switch (pagesize) {
> > > +	case 512:
> > > +		return REG_PAGE_SIZE_512;
> > > +	case 1024:
> > > +		return REG_PAGE_SIZE_1K;
> > > +	case 2048:
> > > +		return REG_PAGE_SIZE_2K;
> > > +	case 4096:
> > > +		return REG_PAGE_SIZE_4K;
> > > +	case 8192:
> > > +		return REG_PAGE_SIZE_8K;
> > > +	case 16384: =20
> >=20
> > Maybe you can use macros like SZ_512, SZ_1K, SZ_2K, etc, see
> > include/linux/sizes.h =20
> These are not really page size values.
> In CMD_REG[25:23] we need to specify page size as below
> 000: 512-byte Page size.
> 001: 2KB Page size.
> 010: 4KB Page size.
> 011: 8KB Page size.
> 100: 16KB Page size, hence for naming conventions we used the above macro=
s.=20
> Means, REG_PAGE_SIZE_512 =3D 0.

I meant for the 'case' statement, not the return value.
ie. s/case 2048:/case SZ_2K:/

> >  =20
> > > +		return REG_PAGE_SIZE_16K;
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static inline void anfc_enable_intrs(struct anfc *nfc, u32 val) {
> > > +	writel(val, nfc->base + INTR_STS_EN_OFST);
> > > +	writel(val, nfc->base + INTR_SIG_EN_OFST); }
> > > +
> > > +static inline void anfc_config_ecc(struct anfc *nfc, int on) {
> > > +	u32 val;
> > > +
> > > +	val =3D readl(nfc->base + CMD_OFST);
> > > +	if (on)
> > > +		val |=3D ECC_ENABLE;
> > > +	else
> > > +		val &=3D ~ECC_ENABLE;
> > > +	writel(val, nfc->base + CMD_OFST);
> > > +}
> > > +
> > > +static inline void anfc_config_dma(struct anfc *nfc, int on) {
> > > +	u32 val;
> > > +
> > > +	val =3D readl(nfc->base + CMD_OFST);
> > > +	val &=3D ~DMA_EN_MASK;
> > > +	if (on)
> > > +		val |=3D DMA_ENABLE << DMA_EN_SHIFT;
> > > +	writel(val, nfc->base + CMD_OFST);
> > > +} =20
> >=20
> > Nitpick: both anfc_config_ecc/dma() functions do similar actions but th=
e syntax
> > is different. =20
> Yes, we can make it generic, But to identify whether we are configuring e=
cc or dma, these > two functions are added.

Sure, I am not discussing the two functions, but just to achieve the
same goal (put an enable bit or wipe it out) either you do

if (enable)
     enable;
else
     disable;

while right after you do:

val =3D disable;
if (enable)
     val =3D  enable;

I don't care which one you will chose but maybe you could use only one
style.


> > > +}
> > > +
> > > +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> > > +				struct nand_chip *chip, uint8_t *buf,
> > > +				int oob_required, int page)
> > > +{
> > > +	u32 val;
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +	u8 *ecc_code =3D chip->buffers->ecccode;
> > > +	u8 *p =3D buf;
> > > +	int eccsize =3D chip->ecc.size;
> > > +	int eccbytes =3D chip->ecc.bytes;
> > > +	int eccsteps =3D chip->ecc.steps;
> > > +	int stat =3D 0, i;
> > > +
> > > +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT,
> > > NAND_CMD_RNDOUTSTART);
> > > +	anfc_config_ecc(nfc, 1);
> > > +
> > > +	chip->read_buf(mtd, buf, mtd->writesize);
> > > +
> > > +	val =3D readl(nfc->base + ECC_ERR_CNT_OFST);
> > > +	val =3D ((val & PAGE_ERR_CNT_MASK) >> 8); =20
> >=20
> > If I understand this correctly, there is no point doing the upper two l=
ines out of
> > the if statement? =20
> Yes, I will move this to if statement.
> >  =20
> > > +	if (achip->bch) {
> > > +		mtd->ecc_stats.corrected +=3D val; =20
> >=20
> > This is strange that there is no handling of a failing situation when u=
sing BCH
> > algorithm. You should probably add some logic here that either incremen=
ts
> > ecc_stats.corrected or ecc_stats.failed like it is done below. =20
> Yes, in case of BCH, upto 24 bit errors it will correct. After that it wo=
n't even detect the errors.
> Hence when BCH we are not updating errors.

That's weird... Could you please double check this assumption? I find
weird that you have no way to distinguish a "there was no bitflips"
with a "there are too much bitflips so I can't even correct them".

>=20
> >  =20
> > > +	} else {
> > > +		val =3D readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
> > > +		mtd->ecc_stats.corrected +=3D val;
> > > +		val =3D readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
> > > +		mtd->ecc_stats.failed +=3D val;
> > > +		/* Clear ecc error count register 1Bit, 2Bit */
> > > +		writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
> > > +		writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
> > > +	}
> > > +
> > > +	if (oob_required)
> > > +		chip->ecc.read_oob(mtd, chip, page);
> > > +
> > > +	anfc_config_ecc(nfc, 0);
> > > + =20
> >=20
> > Some comments would be welcome from here to the end, that is not entire=
ly
> > clear to me what you try to achieve here.
> >  =20
> > > +	if (val) { =20
> >=20
> > When using Hamming, val !=3D 0 means there is an uncorrectable error, w=
hile
> > when using BCH, it may just mean there was some corrected bitflips. I t=
hink you
> > should enter this statement only if Hamming or BCH failed to recover bi=
tflips? =20
> Yes, I will update.
> >  =20
> > > +		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> > > +		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize); =20
> >=20
> > If OOB area was required, you are most likely overwriting OOB bytes tha=
t were
> > maybe corrected by the ECC engine before it was turned off, by bytes re=
tried
> > with a raw read (potentially with bitflips). =20
> This code is added to handle below case.
> When a page was erased, ECC won't update for erased page.
> And when we do an  empty page read, ECC will be updated and there is mism=
atch between ECC data=20
> At the time erasing and reading, causing ECC errors.
> Hence we are reading entire OOB and updating the correct ECC value for al=
l 0xff's case.
> This we have seen when using UBIFS, sometimes read happens on erased page=
.=20

I see what you try to achieve but actually I don't think this is the
right way. Instead, you should, upon error (val !=3D 0), use the core
helper nand_check_erased_ecc_chunk(). This way you check if the page is
good or not depending on the strength used and can discriminate a bad
written page (almost full of 0xff) and a clean erased page without ECC
bytes for which the ECC calculation failed.

> >  =20
> > > +		mtd_ooblayout_get_eccbytes(mtd, ecc_code,
> > > chip->oob_poi, 0,
> > > +					   chip->ecc.total);
> > > +		for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes,
> > > +		     p +=3D eccsize) {
> > > +			stat =3D nand_check_erased_ecc_chunk(p,
> > > chip->ecc.size, &ecc_code[i], eccbytes, NULL, 0, chip->ecc.strength);=
 =20
> >=20
> > Do you actually check the entire OOB area here ?
> >=20
> > Can't you just do the check on chip->oob_poi? =20
>=20
> Above comments answers this.
> >  =20
> > > +		}
> > > +		if (stat < 0) =20
> >=20
> > Please check this, but I think you should increment ecc_stats.failed he=
re. =20
> Yes,  I will update.
> >  =20
> > > +			stat =3D 0;
> > > +		else
> > > +			mtd->ecc_stats.corrected +=3D stat;
> > > +		return stat;
> > > +	}
> > > +
> > > +	return 0;
> > > +} =20
> >=20
> > Can you run nandbiterrs test (from mtd-utils) with both Hamming and BCH=
 and
> > check it fails after the right number of bitflips? =20
> Ok, I will run.
> >  =20
> > > +
> > > +static int anfc_write_page_hwecc(struct mtd_info *mtd,
> > > +				 struct nand_chip *chip, const
> > > uint8_t *buf,
> > > +				 int oob_required, int page)
> > > +{
> > > +	int ret;
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +	u8 *ecc_calc =3D chip->buffers->ecccalc;
> > > +
> > > +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDIN, 0);
> > > +	anfc_config_ecc(nfc, 1);
> > > +
> > > +	chip->write_buf(mtd, buf, mtd->writesize);
> > > +
> > > +	if (oob_required) {
> > > +		chip->waitfunc(mtd, chip);
> > > +		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> > > +		chip->read_buf(mtd, ecc_calc, mtd->oobsize);
> > > +		ret =3D mtd_ooblayout_set_eccbytes(mtd, ecc_calc,
> > > chip->oob_poi,
> > > +						 0, chip->ecc.total);
> > > +		if (ret)
> > > +			return ret;
> > > +		chip->ecc.write_oob(mtd, chip, page);
> > > +	}
> > > +	anfc_config_ecc(nfc, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static u8 anfc_read_byte(struct mtd_info *mtd) {
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +
> > > +	if (nfc->curr_cmd =3D=3D NAND_CMD_STATUS)
> > > +		return readl(nfc->base + FLASH_STS_OFST);
> > > +	else
> > > +		return nfc->buf[nfc->bufshift++];
> > > +}
> > > +
> > > +static int anfc_extra_init(struct anfc *nfc, struct anfc_nand_chip
> > > *achip) +{
> > > +	int mode, err;
> > > +	unsigned int feature[2];
> > > +	u32 inftimeval;
> > > +	struct nand_chip *chip =3D &achip->chip;
> > > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > > +	bool change_sdr_clk =3D false;
> > > +
> > > +	if (!chip->onfi_version ||
> > > +	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > > +	    & ONFI_OPT_CMD_SET_GET_FEATURES))
> > > +		return -EINVAL; =20
> >=20
> > I think this check is already done by the core. =20
> See my comments below.
> >  =20
> > > +
> > > +	/*
> > > +	 * If the controller is already in the same mode as flash
> > > device
> > > +	 * then no need to change the timing mode again.
> > > +	 */
> > > +	if (readl(nfc->base + DATA_INTERFACE_OFST) =3D=3D
> > > achip->inftimeval)
> > > +		return 0;
> > > +
> > > +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> > > +	/* Get nvddr timing modes */
> > > +	mode =3D onfi_get_sync_timing_mode(chip) & 0xff;
> > > +	if (!mode) {
> > > +		mode =3D fls(onfi_get_async_timing_mode(chip)) - 1;
> > > +		inftimeval =3D mode;
> > > +		if (mode >=3D 2 && mode <=3D 5)
> > > +			change_sdr_clk =3D true;
> > > +	} else {
> > > +		mode =3D fls(mode) - 1;
> > > +		inftimeval =3D NVDDR_MODE | (mode <<
> > > NVDDR_TIMING_MODE_SHIFT);
> > > +		mode |=3D ONFI_DATA_INTERFACE_NVDDR;
> > > +	}
> > > +	feature[0] =3D mode;
> > > +	chip->select_chip(mtd, achip->csnum);
> > > +	err =3D chip->onfi_set_features(mtd, chip,
> > > ONFI_FEATURE_ADDR_TIMING_MODE,
> > > +		(uint8_t *)feature);
> > > +	chip->select_chip(mtd, -1);
> > > +	if (err)
> > > +		return err; =20
> >=20
> > You should forget all the NAND chip related code here, the core already=
 handles
> > it, and then calls ->setup_data_interface() to tune timings on the cont=
roller side
> > only. =20
> Since core doesn't have support for NVDDR,=20
> enum nand_data_interface_type {
> 	NAND_SDR_IFACE,
> };
> we added this logic in setup_data_interface. To achieve the same
> So what we are doing here is,=20
> When core calls setup_data_interface, the flash changes its operating mod=
e to SDR.
> And when flash supports NVDDR, we are changing the=20
> Flash operating mode to NVDDR.

Not sure this is actually supported by the core. Maybe Boris could give
us some clues?

> Also the setup_data_interface call will happen during probe time, and at =
this time we don't have
> Parameter page info, hence I added=20

I sent a patch series to fix that. Let's keep it for now but soon this
will have to be removed.

> if (!chip->onfi_version ||
> 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> 	    & ONFI_OPT_CMD_SET_GET_FEATURES))
> 		return -EINVAL;
> >  =20
> > > +	/*
> > > +	 * SDR timing modes 2-5 will not work for the arasan nand
> > > when
> > > +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to <
> > > 90Mhz
> > > +	 */
> > > +	if (change_sdr_clk) {
> > > +		clk_disable_unprepare(nfc->clk_sys);
> > > +		err =3D clk_set_rate(nfc->clk_sys,
> > > SDR_MODE_DEFLT_FREQ);
> > > +		if (err) {
> > > +			dev_err(nfc->dev, "Can't set the clock
> > > rate\n");
> > > +			return err;
> > > +		}
> > > +		err =3D clk_prepare_enable(nfc->clk_sys);
> > > +		if (err) {
> > > +			dev_err(nfc->dev, "Unable to enable sys
> > > clock.\n");
> > > +			clk_disable_unprepare(nfc->clk_sys);
> > > +			return err;
> > > +		} =20
> >=20
> > You do this twice as it is already handled in ->setup_data_interface().=
 =20
> Yes, we added it twice, once when core sends SDR info
> And the second, because there is a HW bug in controller, i.e SDR timing m=
odes 2-5 will not work, when freq > 90MHz.
> Hence when Flash operates at SDR modes 2-5, we are changing the clock rat=
e to below 90MHz

1/ If you do it twice because of a HW bug: please add a comment.
2/ What if there are several NAND chips using different timing
modes? You probably should handle this in ->select_chip() then.

> >  =20
> > > +	}
> > > +	achip->inftimeval =3D inftimeval;
> > > +	if (mode & ONFI_DATA_INTERFACE_NVDDR)
> > > +		achip->spktsize =3D NVDDR_MODE_PACKET_SIZE;
> > > +	return 0;
> > > +} =20
> >=20
> > I don't think this should be in a separate function and instead should =
be in - =20
> > >setup_data_interface(). =20
> Yes, we can do it in single function, but as mentioned in comments, we ad=
ded this extra_init().
> >  =20
> > > +
> > > +static int anfc_ecc_init(struct mtd_info *mtd,
> > > +			 struct nand_ecc_ctrl *ecc)
> > > +{
> > > +	u32 ecc_addr;
> > > +	unsigned int bchmode, steps;
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +
> > > +	ecc->mode =3D NAND_ECC_HW;
> > > +	ecc->read_page =3D anfc_read_page_hwecc;
> > > +	ecc->write_page =3D anfc_write_page_hwecc;
> > > +	ecc->write_oob =3D anfc_write_oob;
> > > +	mtd_set_ooblayout(mtd, &anfc_ooblayout_ops);
> > > +
> > > +	steps =3D mtd->writesize / chip->ecc_step_ds;
> > > +
> > > +	switch (chip->ecc_strength_ds) {
> > > +	case 12:
> > > +		bchmode =3D 0x1;
> > > +		break;
> > > +	case 8:
> > > +		bchmode =3D 0x2;
> > > +		break;
> > > +	case 4:
> > > +		bchmode =3D 0x3;
> > > +		break;
> > > +	case 24:
> > > +		bchmode =3D 0x4;
> > > +		break;
> > > +	default:
> > > +		bchmode =3D 0x0;
> > > +	}
> > > +
> > > +	if (!bchmode)
> > > +		ecc->total =3D 3 * steps;
> > > +	else
> > > +		ecc->total =3D
> > > +		     DIV_ROUND_UP(fls(8 * chip->ecc_step_ds) *
> > > +			 chip->ecc_strength_ds * steps, 8);
> > > +
> > > +	ecc->strength =3D chip->ecc_strength_ds;
> > > +	ecc->size =3D chip->ecc_step_ds;
> > > +	ecc->bytes =3D ecc->total / steps;
> > > +	ecc->steps =3D steps;
> > > +	achip->bchmode =3D bchmode;
> > > +	achip->bch =3D achip->bchmode;
> > > +	ecc_addr =3D mtd->writesize + (mtd->oobsize - ecc->total);
> > > +
> > > +	achip->eccval =3D ecc_addr | (ecc->total << ECC_SIZE_SHIFT) |
> > > +			(achip->bch << BCH_EN_SHIFT);
> > > +
> > > +	if (chip->ecc_step_ds >=3D 1024)
> > > +		achip->pktsize =3D 1024;
> > > +	else
> > > +		achip->pktsize =3D 512;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void anfc_cmd_function(struct mtd_info *mtd,
> > > +			      unsigned int cmd, int column, int
> > > page_addr) +{
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +	bool wait =3D false;
> > > +	u32 addrcycles, prog;
> > > +
> > > +	nfc->bufshift =3D 0;
> > > +	nfc->curr_cmd =3D cmd;
> > > +
> > > +	if (page_addr =3D=3D -1)
> > > +		page_addr =3D 0;
> > > +	if (column =3D=3D -1)
> > > +		column =3D 0;
> > > +
> > > +	switch (cmd) {
> > > +	case NAND_CMD_RESET:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> > > +		prog =3D PROG_RST;
> > > +		wait =3D true;
> > > +		break;
> > > +	case NAND_CMD_SEQIN:
> > > +		addrcycles =3D achip->raddr_cycles +
> > > achip->caddr_cycles;
> > > +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
> > > +				 mtd->writesize, addrcycles);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		break;
> > > +	case NAND_CMD_READOOB:
> > > +		column +=3D mtd->writesize;
> > > +	case NAND_CMD_READ0:
> > > +	case NAND_CMD_READ1:
> > > +		addrcycles =3D achip->raddr_cycles +
> > > achip->caddr_cycles;
> > > +		anfc_prepare_cmd(nfc, NAND_CMD_READ0,
> > > NAND_CMD_READSTART, 1,
> > > +				 mtd->writesize, addrcycles);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		break;
> > > +	case NAND_CMD_RNDOUT:
> > > +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
> > > +				 mtd->writesize, 2);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		break;
> > > +	case NAND_CMD_PARAM:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		anfc_rw_buf_pio(mtd, nfc->buf,
> > > +				(4 * sizeof(struct
> > > nand_onfi_params)),
> > > +				1, PROG_RDPARAM);
> > > +		break;
> > > +	case NAND_CMD_READID:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		anfc_rw_buf_pio(mtd, nfc->buf, ONFI_ID_LEN, 1,
> > > PROG_RDID);
> > > +		break;
> > > +	case NAND_CMD_ERASE1:
> > > +		addrcycles =3D achip->raddr_cycles;
> > > +		prog =3D PROG_ERASE;
> > > +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0,
> > > addrcycles);
> > > +		column =3D page_addr & 0xffff;
> > > +		page_addr =3D (page_addr >> PG_ADDR_SHIFT) & 0xffff;
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		wait =3D true;
> > > +		break;
> > > +	case NAND_CMD_STATUS:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> > > +		anfc_setpktszcnt(nfc, achip->spktsize / 4, 1);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		prog =3D PROG_STATUS;
> > > +		wait =3D true;
> > > +		break;
> > > +	case NAND_CMD_GET_FEATURES:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		anfc_rw_buf_pio(mtd, nfc->buf, achip->spktsize, 1,
> > > +				PROG_GET_FEATURE);
> > > +		break;
> > > +	case NAND_CMD_SET_FEATURES:
> > > +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> > > +		anfc_setpagecoladdr(nfc, page_addr, column);
> > > +		break;
> > > +	default:
> > > +		return;
> > > +	}
> > > +
> > > +	if (wait) {
> > > +		anfc_enable_intrs(nfc, XFER_COMPLETE);
> > > +		writel(prog, nfc->base + PROG_OFST);
> > > +		anfc_wait_for_event(nfc);
> > > +	}
> > > +	if (nfc->curr_cmd =3D=3D NAND_CMD_STATUS)
> > > +		nfc->status =3D readl(nfc->base + FLASH_STS_OFST); }
> > > +
> > > +static void anfc_select_chip(struct mtd_info *mtd, int num) {
> > > +	u32 val;
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +
> > > +	if (num =3D=3D -1)
> > > +		return;
> > > +
> > > +	val =3D readl(nfc->base + MEM_ADDR2_OFST);
> > > +	val &=3D (val & ~(CS_MASK | BCH_MODE_MASK));
> > > +	val |=3D (achip->csnum << CS_SHIFT) | (achip->bchmode <<
> > > BCH_MODE_SHIFT);
> > > +	writel(val, nfc->base + MEM_ADDR2_OFST);
> > > +	nfc->csnum =3D achip->csnum;
> > > +	writel(achip->eccval, nfc->base + ECC_OFST);
> > > +	writel(achip->inftimeval, nfc->base + DATA_INTERFACE_OFST); }
> > > +
> > > +static irqreturn_t anfc_irq_handler(int irq, void *ptr) {
> > > +	struct anfc *nfc =3D ptr;
> > > +	u32 status;
> > > +
> > > +	status =3D readl(nfc->base + INTR_STS_OFST);
> > > +	if (status & EVENT_MASK) {
> > > +		complete(&nfc->event);
> > > +		writel((status & EVENT_MASK), nfc->base +
> > > INTR_STS_OFST);
> > > +		writel(0, nfc->base + INTR_STS_EN_OFST);
> > > +		writel(0, nfc->base + INTR_SIG_EN_OFST);
> > > +		return IRQ_HANDLED;
> > > +	}
> > > +
> > > +	return IRQ_NONE;
> > > +}
> > > +
> > > +static int anfc_onfi_set_features(struct mtd_info *mtd, struct
> > > nand_chip *chip,
> > > +				  int addr, uint8_t
> > > *subfeature_param) +{
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +	int status;
> > > +
> > > +	if (!chip->onfi_version)
> > > +		return -EINVAL;
> > > +
> > > +	if (!(le16_to_cpu(chip->onfi_params.opt_cmd) &
> > > +		ONFI_OPT_CMD_SET_GET_FEATURES))
> > > +		return -EINVAL;
> > > +
> > > +	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
> > > +	anfc_rw_buf_pio(mtd, subfeature_param, achip->spktsize,
> > > +			0, PROG_SET_FEATURE);
> > > +	status =3D chip->waitfunc(mtd, chip);
> > > +	if (status & NAND_STATUS_FAIL)
> > > +		return -EIO;
> > > +
> > > +	return 0;
> > > +} =20
> >=20
> > Are you sure this function is needed? If yes can you add a comment to e=
xplain
> > why? Otherwise I think the core already handles that kind of logic. =20
> We added this to set/get features of on-die ECC. At the time of adding th=
is, core doesn=E2=80=99t have support
> For this. I will remove it now, since micron on-die ecc driver is there.
> >  =20
> > > +
> > > +static int anfc_setup_data_interface(struct mtd_info *mtd, int
> > > csline,
> > > +				     const struct
> > > nand_data_interface *conf) +{
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct anfc *nfc =3D to_anfc(chip->controller);
> > > +	int err;
> > > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > > +
> > > +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> > > +		return 0;
> > > +
> > > +	clk_disable_unprepare(nfc->clk_sys);
> > > +	err =3D clk_set_rate(nfc->clk_sys, SDR_MODE_DEFLT_FREQ);
> > > +	if (err) {
> > > +		dev_err(nfc->dev, "Can't set the clock rate\n");
> > > +		return err;
> > > +	}
> > > +	err =3D clk_prepare_enable(nfc->clk_sys);
> > > +	if (err) {
> > > +		dev_err(nfc->dev, "Unable to enable sys clock.\n");
> > > +		clk_disable_unprepare(nfc->clk_sys);
> > > +		return err;
> > > +	}
> > > +	achip->inftimeval =3D 0;
> > > +	anfc_extra_init(nfc, achip);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int anfc_nand_chip_init(struct anfc *nfc,
> > > +			       struct anfc_nand_chip *anand_chip,
> > > +			       struct device_node *np)
> > > +{
> > > +	struct nand_chip *chip =3D &anand_chip->chip;
> > > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > > +	int ret;
> > > +
> > > +	ret =3D of_property_read_u32(np, "reg", &anand_chip->csnum);
> > > +	if (ret) {
> > > +		dev_err(nfc->dev, "can't get chip-select\n");
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
> > > "arasan_nand.%d",
> > > +				   anand_chip->csnum);
> > > +	mtd->dev.parent =3D nfc->dev;
> > > +
> > > +	chip->cmdfunc =3D anfc_cmd_function;
> > > +	chip->chip_delay =3D 30;
> > > +	chip->controller =3D &nfc->controller;
> > > +	chip->read_buf =3D anfc_read_buf;
> > > +	chip->write_buf =3D anfc_write_buf;
> > > +	chip->read_byte =3D anfc_read_byte;
> > > +	chip->options =3D NAND_BUSWIDTH_AUTO | =20
> > NAND_NO_SUBPAGE_WRITE; =20
> > > +	chip->bbt_options =3D NAND_BBT_USE_FLASH;
> > > +	chip->select_chip =3D anfc_select_chip;
> > > +	chip->onfi_set_features =3D anfc_onfi_set_features;
> > > +	chip->setup_data_interface =3D anfc_setup_data_interface;
> > > +	nand_set_flash_node(chip, np);
> > > +
> > > +	anand_chip->spktsize =3D SDR_MODE_PACKET_SIZE;
> > > +	ret =3D nand_scan_ident(mtd, 1, NULL);
> > > +	if (ret) {
> > > +		dev_err(nfc->dev, "nand_scan_ident for NAND
> > > failed\n");
> > > +		return ret;
> > > +	}
> > > +	if (chip->onfi_version) {
> > > +		anand_chip->raddr_cycles =3D
> > > chip->onfi_params.addr_cycles & 0xf;
> > > +		anand_chip->caddr_cycles =3D
> > > +				(chip->onfi_params.addr_cycles >> 4)
> > > & 0xf;
> > > +	} else {
> > > +		/* For non-ONFI devices, configuring the address
> > > cyles as 5 */
> > > +		anand_chip->raddr_cycles =3D 3;
> > > +		anand_chip->caddr_cycles =3D 2;
> > > +	} =20
> >=20
> > I think you should remove this block and instead decide how many cycles=
 you
> > will need depending on "chip->options & NAND_ROW_ADDR_3". =20
> If chip supports ONFI, then we are reading addr cycles from parameter pag=
e, if not=20
> We are setting with default values.
> I am not checking the sizes here, instead reading it from parameter page.
> I didn't get your comment, can you please brief it?
> I saw the patch https://patchwork.kernel.org/patch/9950377/.
> These are based on sizes, and cycles are getting updated using " NAND_ROW=
_ADDR_3"
> But the case here is I am setting some default values if not ONFI.=20

I suppose this is already handled by the core. You should probably just
choose the number of address cycles depending on the NAND_ROW_ADDR_3
flag presence in chip->options. Logic should be in the core and shared
across all NAND controllers anyway.

> >  =20
> > > +
> > > +	ret =3D anfc_ecc_init(mtd, &chip->ecc);
> > > +	if (ret)
> > > +		return ret;
> > > + =20
> >=20
> > Shouldn't the controller set mtd->name here if empty? =20
> Yes, driver is not setting the name if empty.
> I will add this in next version of patch.
> >  =20
> > > +	ret =3D nand_scan_tail(mtd);
> > > +	if (ret) {
> > > +		dev_err(nfc->dev, "nand_scan_tail for NAND
> > > failed\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return mtd_device_register(mtd, NULL, 0); }
> > > +
> > > +static int anfc_probe(struct platform_device *pdev) {
> > > +	struct anfc *nfc;
> > > +	struct anfc_nand_chip *anand_chip;
> > > +	struct device_node *np =3D pdev->dev.of_node, *child;
> > > +	struct resource *res;
> > > +	int err;
> > > +
> > > +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > > +	if (!nfc)
> > > +		return -ENOMEM;
> > > +
> > > +	init_waitqueue_head(&nfc->controller.wq);
> > > +	INIT_LIST_HEAD(&nfc->chips);
> > > +	init_completion(&nfc->event);
> > > +	nfc->dev =3D &pdev->dev;
> > > +	platform_set_drvdata(pdev, nfc);
> > > +	nfc->csnum =3D -1;
> > > +
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	nfc->base =3D devm_ioremap_resource(&pdev->dev, res);
> > > +	if (IS_ERR(nfc->base))
> > > +		return PTR_ERR(nfc->base);
> > > +	nfc->dma =3D of_property_read_bool(pdev->dev.of_node,
> > > +					 "arasan,has-mdma");
> > > +	nfc->irq =3D platform_get_irq(pdev, 0);
> > > +	if (nfc->irq < 0) {
> > > +		dev_err(&pdev->dev, "platform_get_irq failed\n");
> > > +		return -ENXIO;
> > > +	}
> > > +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> > > +	err =3D devm_request_irq(&pdev->dev, nfc->irq,
> > > anfc_irq_handler,
> > > +			       0, "arasannfc", nfc);
> > > +	if (err)
> > > +		return err;
> > > +	nfc->clk_sys =3D devm_clk_get(&pdev->dev, "sys");
> > > +	if (IS_ERR(nfc->clk_sys)) {
> > > +		dev_err(&pdev->dev, "sys clock not found.\n");
> > > +		return PTR_ERR(nfc->clk_sys);
> > > +	}
> > > +
> > > +	nfc->clk_flash =3D devm_clk_get(&pdev->dev, "flash");
> > > +	if (IS_ERR(nfc->clk_flash)) {
> > > +		dev_err(&pdev->dev, "flash clock not found.\n");
> > > +		return PTR_ERR(nfc->clk_flash);
> > > +	}
> > > +
> > > +	err =3D clk_prepare_enable(nfc->clk_sys);
> > > +	if (err) {
> > > +		dev_err(&pdev->dev, "Unable to enable sys clock.\n");
> > > +		return err;
> > > +	}
> > > +
> > > +	err =3D clk_prepare_enable(nfc->clk_flash);
> > > +	if (err) {
> > > +		dev_err(&pdev->dev, "Unable to enable flash
> > > clock.\n");
> > > +		goto clk_dis_sys;
> > > +	}
> > > +
> > > +	for_each_available_child_of_node(np, child) {
> > > +		anand_chip =3D devm_kzalloc(&pdev->dev,
> > > sizeof(*anand_chip),
> > > +					  GFP_KERNEL);
> > > +		if (!anand_chip) {
> > > +			of_node_put(child);
> > > +			err =3D -ENOMEM;
> > > +			goto nandchip_clean_up;
> > > +		}
> > > +
> > > +		err =3D anfc_nand_chip_init(nfc, anand_chip, child);
> > > +		if (err) {
> > > +			devm_kfree(&pdev->dev, anand_chip);
> > > +			continue;
> > > +		}
> > > +
> > > +		list_add_tail(&anand_chip->node, &nfc->chips);
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +nandchip_clean_up:
> > > +	list_for_each_entry(anand_chip, &nfc->chips, node)
> > > +		nand_release(nand_to_mtd(&anand_chip->chip));
> > > +	clk_disable_unprepare(nfc->clk_flash);
> > > +clk_dis_sys:
> > > +	clk_disable_unprepare(nfc->clk_sys);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static int anfc_remove(struct platform_device *pdev) {
> > > +	struct anfc *nfc =3D platform_get_drvdata(pdev);
> > > +	struct anfc_nand_chip *anand_chip;
> > > +
> > > +	list_for_each_entry(anand_chip, &nfc->chips, node)
> > > +		nand_release(nand_to_mtd(&anand_chip->chip));
> > > +
> > > +	clk_disable_unprepare(nfc->clk_sys);
> > > +	clk_disable_unprepare(nfc->clk_flash);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id anfc_ids[] =3D {
> > > +	{ .compatible =3D "arasan,nfc-v3p10" },
> > > +	{ .compatible =3D "xlnx,zynqmp-nand" },
> > > +	{  }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, anfc_ids);
> > > +
> > > +static struct platform_driver anfc_driver =3D {
> > > +	.driver =3D {
> > > +		.name =3D DRIVER_NAME,
> > > +		.of_match_table =3D anfc_ids,
> > > +	},
> > > +	.probe =3D anfc_probe,
> > > +	.remove =3D anfc_remove,
> > > +};
> > > +module_platform_driver(anfc_driver);
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Xilinx, Inc");
> > > +MODULE_DESCRIPTION("Arasan NAND Flash Controller Driver"); =20
> >=20
> >=20
> >=20
> > --
> > Miquel Raynal, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com =20
>=20
> I will restructure the driver to sync with exec_op().
> Thanks again for reviewing the driver.
>=20
> Thanks,
> Naga Sureshkumar Relli.

Thanks for your work,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
