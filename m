Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erXW5-0002x5-49
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 23:21:41 +0000
Date: Fri, 2 Mar 2018 00:21:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/6] mtd: nand: Stop using a static parameter page for
 all chips
Message-ID: <20180302002122.1bbcf8d1@xps13>
In-Reply-To: <20180214094145.6e4c1663@bbrezillon>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-5-miquel.raynal@bootlin.com>
 <20180214094145.6e4c1663@bbrezillon>
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

Hi Boris,

On Wed, 14 Feb 2018 09:41:45 +0100, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Sat,  3 Feb 2018 10:55:42 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > From: Miquel Raynal <miquel.raynal@free-electrons.com>
> >=20
> > The NAND chip parameter page is statically allocated within the
> > nand_chip structure, which reserves a lot of space. Even not ONFI nor
> > JEDEC chips have it embedded. Also, only a few parameters are still be
> > read from the parameter page after the detection.
> >=20
> > Remove these pages from the nand_chip structure and instead create a
> > small structure with all the parameters that will be needed outside of
> > the identification phase. =20
>=20
> Can we move this change at the end of the patch series? I'm not
> entirely sure where/how I want to store the information extracted from
> the ONFI param page, and I don't want to block the other changes just
> for that.

As discussed elsewhere, I propose to keep a static "nand_parameters"
structure in the nand_chip structure with an ONFI parameters structure
inside. Aside, I am working on removing the "no allocation in
nand_scan_ident()" limitation, this way I will then remove the
ONFI-related structure and allocate it dynamically only when needed as
soon as this second series will be ready.

However, I did split some patches and reorganized them in order for you
to get rid of the parameter pages only when you'll be ready for it
without blocking the rest of the series. See the next iteration.

>=20
> >=20
> > During identification, allocate dynamically the parameter page after the
> > chip is declared ONFI or JEDEC. Extract all information from it and free
> > this space when exiting.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c    | 111 +++++++++++++++++++++++++-------=
--------
> >  drivers/mtd/nand/nand_micron.c  |  15 +++---
> >  drivers/mtd/nand/nand_timings.c |  10 ++--
> >  include/linux/mtd/rawnand.h     |  45 ++++++----------
> >  4 files changed, 98 insertions(+), 83 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 8d2c37011979..4a879b1635b3 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -1174,9 +1174,7 @@ int nand_get_features(struct nand_chip *chip, int=
 addr,
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > =20
> > -	if (!chip->onfi_version ||
> > -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> > +	if (!chip->parameters.support_setting_features)
> >  		return -ENOTSUPP;
> > =20
> >  	return chip->onfi_get_features(mtd, chip, addr, subfeature_param);
> > @@ -1197,9 +1195,7 @@ int nand_set_features(struct nand_chip *chip, int=
 addr,
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > =20
> > -	if (!chip->onfi_version ||
> > -	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> > -	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> > +	if (!chip->parameters.support_setting_features)
> >  		return -ENOTSUPP;
> > =20
> >  	return chip->onfi_set_features(mtd, chip, addr, subfeature_param);
> > @@ -5198,7 +5194,7 @@ static int nand_flash_detect_ext_param_page(struc=
t nand_chip *chip,
> >  static int nand_flash_detect_onfi(struct nand_chip *chip)
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > -	struct nand_onfi_params *p =3D &chip->onfi_params;
> > +	struct nand_onfi_params *p;
> >  	char id[4];
> >  	int i, ret, val;
> > =20
> > @@ -5207,14 +5203,23 @@ static int nand_flash_detect_onfi(struct nand_c=
hip *chip)
> >  	if (ret || strncmp(id, "ONFI", 4))
> >  		return 0;
> > =20
> > +	/* ONFI chip: allocate a buffer to hold its parameter page */
> > +	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> >  	ret =3D nand_read_param_page_op(chip, 0, NULL, 0);
> > -	if (ret)
> > -		return 0;
> > +	if (ret) {
> > +		ret =3D 0;
> > +		goto free_onfi_param_page;
> > +	}
> > =20
> >  	for (i =3D 0; i < 3; i++) {
> >  		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
> > -		if (ret)
> > -			return 0;
> > +		if (ret) {
> > +			ret =3D 0;
> > +			goto free_onfi_param_page;
> > +		}
> > =20
> >  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
> >  				le16_to_cpu(p->crc)) {
> > @@ -5224,7 +5229,7 @@ static int nand_flash_detect_onfi(struct nand_chi=
p *chip)
> > =20
> >  	if (i =3D=3D 3) {
> >  		pr_err("Could not find valid ONFI parameter page; aborting\n");
> > -		return 0;
> > +		goto free_onfi_param_page;
> >  	}
> > =20
> >  	/* Check version */
> > @@ -5242,13 +5247,16 @@ static int nand_flash_detect_onfi(struct nand_c=
hip *chip)
> > =20
> >  	if (!chip->onfi_version) {
> >  		pr_info("unsupported ONFI version: %d\n", val);
> > -		return 0;
> > +		goto free_onfi_param_page;
> > +	} else {
> > +		ret =3D 1;
> >  	}
> > =20
> >  	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> >  	sanitize_string(p->model, sizeof(p->model));
> > +	memcpy(chip->parameters.model, p->model, sizeof(p->model));
> >  	if (!mtd->name)
> > -		mtd->name =3D p->model;
> > +		mtd->name =3D chip->parameters.model;
> > =20
> >  	mtd->writesize =3D le32_to_cpu(p->byte_per_page);
> > =20
> > @@ -5270,14 +5278,14 @@ static int nand_flash_detect_onfi(struct nand_c=
hip *chip)
> >  	chip->max_bb_per_die =3D le16_to_cpu(p->bb_per_lun);
> >  	chip->blocks_per_die =3D le32_to_cpu(p->blocks_per_lun);
> > =20
> > -	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
> > +	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
> >  		chip->options |=3D NAND_BUSWIDTH_16;
> > =20
> >  	if (p->ecc_bits !=3D 0xff) {
> >  		chip->ecc_strength_ds =3D p->ecc_bits;
> >  		chip->ecc_step_ds =3D 512;
> >  	} else if (chip->onfi_version >=3D 21 &&
> > -		(onfi_feature(chip) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
> > +		(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
> > =20
> >  		/*
> >  		 * The nand_flash_detect_ext_param_page() uses the
> > @@ -5295,7 +5303,20 @@ static int nand_flash_detect_onfi(struct nand_ch=
ip *chip)
> >  		pr_warn("Could not retrieve ONFI ECC requirements\n");
> >  	}
> > =20
> > -	return 1;
> > +	/* Save some parameters from the parameter page for future use */
> > +	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
> > +		chip->parameters.support_setting_features =3D true;
> > +	chip->parameters.t_prog =3D le16_to_cpu(p->t_prog);
> > +	chip->parameters.t_bers =3D le16_to_cpu(p->t_bers);
> > +	chip->parameters.t_r =3D le16_to_cpu(p->t_r);
> > +	chip->parameters.t_ccs =3D le16_to_cpu(p->t_ccs);
> > +	chip->parameters.async_timing_mode =3D le16_to_cpu(p->async_timing_mo=
de);
> > +	chip->parameters.vendor_revision =3D le16_to_cpu(p->vendor_revision);
> > +	memcpy(chip->parameters.vendor, p->vendor, sizeof(p->vendor));
> > +
> > +free_onfi_param_page:
> > +	kfree(p);
> > +	return ret;
> >  }
> > =20
> >  /*
> > @@ -5304,7 +5325,7 @@ static int nand_flash_detect_onfi(struct nand_chi=
p *chip)
> >  static int nand_flash_detect_jedec(struct nand_chip *chip)
> >  {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > -	struct nand_jedec_params *p =3D &chip->jedec_params;
> > +	struct nand_jedec_params *p;
> >  	struct jedec_ecc_info *ecc;
> >  	char id[5];
> >  	int i, val, ret;
> > @@ -5314,14 +5335,23 @@ static int nand_flash_detect_jedec(struct nand_=
chip *chip)
> >  	if (ret || strncmp(id, "JEDEC", sizeof(id)))
> >  		return 0;
> > =20
> > +	/* JEDEC chip: allocate a buffer to hold its parameter page */
> > +	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> >  	ret =3D nand_read_param_page_op(chip, 0x40, NULL, 0);
> > -	if (ret)
> > -		return 0;
> > +	if (ret) {
> > +		ret =3D 0;
> > +		goto free_jedec_param_page;
> > +	}
> > =20
> >  	for (i =3D 0; i < 3; i++) {
> >  		ret =3D nand_read_data_op(chip, p, sizeof(*p), true);
> > -		if (ret)
> > -			return 0;
> > +		if (ret) {
> > +			ret =3D 0;
> > +			goto free_jedec_param_page;
> > +		}
> > =20
> >  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) =3D=3D
> >  				le16_to_cpu(p->crc))
> > @@ -5330,7 +5360,7 @@ static int nand_flash_detect_jedec(struct nand_ch=
ip *chip)
> > =20
> >  	if (i =3D=3D 3) {
> >  		pr_err("Could not find valid JEDEC parameter page; aborting\n");
> > -		return 0;
> > +		goto free_jedec_param_page;
> >  	}
> > =20
> >  	/* Check version */
> > @@ -5342,13 +5372,14 @@ static int nand_flash_detect_jedec(struct nand_=
chip *chip)
> > =20
> >  	if (!chip->jedec_version) {
> >  		pr_info("unsupported JEDEC version: %d\n", val);
> > -		return 0;
> > +		goto free_jedec_param_page;
> >  	}
> > =20
> >  	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> >  	sanitize_string(p->model, sizeof(p->model));
> > +	memcpy(chip->parameters.model, p->model, sizeof(p->model));
> >  	if (!mtd->name)
> > -		mtd->name =3D p->model;
> > +		mtd->name =3D chip->parameters.model;
> > =20
> >  	mtd->writesize =3D le32_to_cpu(p->byte_per_page);
> > =20
> > @@ -5363,7 +5394,7 @@ static int nand_flash_detect_jedec(struct nand_ch=
ip *chip)
> >  	chip->chipsize *=3D (uint64_t)mtd->erasesize * p->lun_count;
> >  	chip->bits_per_cell =3D p->bits_per_cell;
> > =20
> > -	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
> > +	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
> >  		chip->options |=3D NAND_BUSWIDTH_16;
> > =20
> >  	/* ECC info */
> > @@ -5376,7 +5407,9 @@ static int nand_flash_detect_jedec(struct nand_ch=
ip *chip)
> >  		pr_warn("Invalid codeword size\n");
> >  	}
> > =20
> > -	return 1;
> > +free_jedec_param_page:
> > +	kfree(p);
> > +	return ret;
> >  } =20
>=20
> Looks like the JEDEC param page is not needed after nand_scan_ident()
> has done its job, so this one is easy to get rid of. Could you do this
> change (get rid of chip->jedec_param) in a separate patch so that I can
> apply it independently.

Okay

>=20
> > =20
> >  /*
> > @@ -5678,11 +5711,17 @@ static int nand_detect(struct nand_chip *chip, =
struct nand_flash_dev *type)
> >  	chip->onfi_version =3D 0;
> >  	if (!type->name || !type->pagesize) {
> >  		/* Check if the chip is ONFI compliant */
> > -		if (nand_flash_detect_onfi(chip))
> > +		ret =3D nand_flash_detect_onfi(chip);
> > +		if (ret < 0)
> > +			return ret;
> > +		if (ret)
> >  			goto ident_done;
> > =20
> >  		/* Check if the chip is JEDEC compliant */
> > -		if (nand_flash_detect_jedec(chip))
> > +		ret =3D nand_flash_detect_jedec(chip);
> > +		if (ret < 0)
> > +			return ret;
> > +		if (ret)
> >  			goto ident_done;
> >  	}
> > =20
> > @@ -5749,17 +5788,9 @@ static int nand_detect(struct nand_chip *chip, s=
truct nand_flash_dev *type)
> > =20
> >  	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
> >  		maf_id, dev_id);
> > -
> > -	if (chip->onfi_version)
> > -		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> > -			chip->onfi_params.model);
> > -	else if (chip->jedec_version)
> > -		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> > -			chip->jedec_params.model);
> > -	else
> > -		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> > -			type->name);
> > -
> > +	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> > +		(chip->onfi_version || chip->jedec_version) ?
> > +		chip->parameters.model : type->name);
> >  	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\=
n",
> >  		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> >  		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
> > diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_mic=
ron.c
> > index 48847b441ef7..eaf14885e059 100644
> > --- a/drivers/mtd/nand/nand_micron.c
> > +++ b/drivers/mtd/nand/nand_micron.c
> > @@ -56,17 +56,14 @@ static int micron_nand_setup_read_retry(struct mtd_=
info *mtd, int retry_mode)
> >   */
> >  static int micron_nand_onfi_init(struct nand_chip *chip)
> >  {
> > -	struct nand_onfi_params *p =3D &chip->onfi_params;
> > +	struct nand_parameters *p =3D &chip->parameters;
> >  	struct nand_onfi_vendor_micron *micron =3D (void *)p->vendor;
> > =20
> > -	if (!chip->onfi_version)
> > -		return 0;
> > -
> > -	if (le16_to_cpu(p->vendor_revision) < 1)
> > -		return 0;
> > +	if (chip->onfi_version && p->vendor_revision) {
> > +		chip->read_retries =3D micron->read_retry_options;
> > +		chip->setup_read_retry =3D micron_nand_setup_read_retry;
> > +	}
> > =20
> > -	chip->read_retries =3D micron->read_retry_options;
> > -	chip->setup_read_retry =3D micron_nand_setup_read_retry;
> > =20
> >  	return 0;
> >  }
> > @@ -237,7 +234,7 @@ static int micron_supports_on_die_ecc(struct nand_c=
hip *chip)
> >  	 * Some Micron NANDs have an on-die ECC of 4/512, some other
> >  	 * 8/512. We only support the former.
> >  	 */
> > -	if (chip->onfi_params.ecc_bits !=3D 4)
> > +	if (chip->ecc_strength_ds !=3D 4)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> > =20
> >  	return MICRON_ON_DIE_SUPPORTED;
> > diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_ti=
mings.c
> > index 9400d039ddbd..ac140fa4257f 100644
> > --- a/drivers/mtd/nand/nand_timings.c
> > +++ b/drivers/mtd/nand/nand_timings.c
> > @@ -307,16 +307,16 @@ int onfi_fill_data_interface(struct nand_chip *ch=
ip,
> >  	 * These information are part of the ONFI parameter page.
> >  	 */
> >  	if (chip->onfi_version) {
> > -		struct nand_onfi_params *params =3D &chip->onfi_params;
> > +		struct nand_parameters *params =3D &chip->parameters;
> >  		struct nand_sdr_timings *timings =3D &iface->timings.sdr;
> > =20
> >  		/* microseconds -> picoseconds */
> > -		timings->tPROG_max =3D 1000000ULL * le16_to_cpu(params->t_prog);
> > -		timings->tBERS_max =3D 1000000ULL * le16_to_cpu(params->t_bers);
> > -		timings->tR_max =3D 1000000ULL * le16_to_cpu(params->t_r);
> > +		timings->tPROG_max =3D 1000000ULL * params->t_prog;
> > +		timings->tBERS_max =3D 1000000ULL * params->t_bers;
> > +		timings->tR_max =3D 1000000ULL * params->t_r;
> > =20
> >  		/* nanoseconds -> picoseconds */
> > -		timings->tCCS_min =3D 1000UL * le16_to_cpu(params->t_ccs);
> > +		timings->tCCS_min =3D 1000UL * params->t_ccs;
> >  	}
> > =20
> >  	return 0;
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 3244f2594b6b..6d8667bb96f4 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -429,6 +429,20 @@ struct nand_jedec_params {
> >  	__le16 crc;
> >  } __packed;
> > =20
> > +struct nand_parameters {
> > +	/* Generic parameters */
> > +	char model[20]; =20
>=20
> Why not const char *? I know the model name is stored in a 20 bytes

For now I will keep a char model[]. As soon as the limitation about
dynamic allocations at identification time is removed, I will switch
this field to const char *.

> array in the ONFI and JEDEC param page, but I'm not sure 20 bytes will
> be enough for non-JEDEC/ONFI NANDs.

I will set it to 100 then, that should be enough. In the near future it
will be possible to allocate dynamically the right size anyway.

>=20
> > +	/* ONFI parameters */
> > +	bool support_setting_features;
> > +	u16 t_prog;
> > +	u16 t_bers;
> > +	u16 t_r;
> > +	u16 t_ccs;
> > +	u16 async_timing_mode;
> > +	u16 vendor_revision;
> > +	u8 vendor[88]; =20
>=20
> That's clearly the part I don't like. If we have ONFI specific
> information that we want/need to keep around, they should be placed in a
> different struct (with onfi in its name), and it should probably be
> dynamically allocated to not grow the nand_chip struct. I know
> allocating things in nand_scan_ident() is forbidden and that's why you
> stored things directly in nand_chip, but maybe we should address that
> problem instead of continuously find alternative solutions every time
> we need to allocate something from nand_scan_ident()...

I created a struct onfi_params that is static for now, but will be
dynamically allocated when the time will come.=20

>=20
> > +} __packed; =20
>=20
> I'm pretty sure __packed is not needed here.

Removed (I put it because nand_onfi_params and nand_jedec_params have
it).

>=20
> > +
> >  /* The maximum expected count of bytes in the NAND ID sequence */
> >  #define NAND_MAX_ID_LEN 8
> > =20
> > @@ -1161,10 +1175,6 @@ int nand_op_parser_exec_op(struct nand_chip *chi=
p,
> >   *			non 0 if ONFI supported.
> >   * @jedec_version:	[INTERN] holds the chip JEDEC version (BCD encoded),
> >   *			non 0 if JEDEC supported.
> > - * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
> > - *			supported, 0 otherwise.
> > - * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
> > - *			supported, 0 otherwise.
> >   * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
> >   *			this nand device will encounter their life times.
> >   * @blocks_per_die:	[INTERN] The number of PEBs in a die
> > @@ -1245,10 +1255,7 @@ struct nand_chip {
> >  	struct nand_id id;
> >  	int onfi_version;
> >  	int jedec_version;
> > -	union {
> > -		struct nand_onfi_params	onfi_params;
> > -		struct nand_jedec_params jedec_params;
> > -	};
> > +	struct nand_parameters parameters;
> >  	u16 max_bb_per_die;
> >  	u32 blocks_per_die;
> > =20
> > @@ -1535,26 +1542,13 @@ struct platform_nand_data {
> >  	struct platform_nand_ctrl ctrl;
> >  };
> > =20
> > -/* return the supported features. */
> > -static inline int onfi_feature(struct nand_chip *chip)
> > -{
> > -	return chip->onfi_version ? le16_to_cpu(chip->onfi_params.features) :=
 0;
> > -}
> > -
> >  /* return the supported asynchronous timing mode. */
> >  static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
> >  {
> >  	if (!chip->onfi_version)
> >  		return ONFI_TIMING_MODE_UNKNOWN;
> > -	return le16_to_cpu(chip->onfi_params.async_timing_mode);
> > -}
> > =20
> > -/* return the supported synchronous timing mode. */
> > -static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
> > -{
> > -	if (!chip->onfi_version)
> > -		return ONFI_TIMING_MODE_UNKNOWN;
> > -	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
> > +	return chip->parameters.async_timing_mode;
> >  }
> > =20
> >  int onfi_fill_data_interface(struct nand_chip *chip,
> > @@ -1591,13 +1585,6 @@ static inline int nand_opcode_8bits(unsigned int=
 command)
> >  	return 0;
> >  }
> > =20
> > -/* return the supported JEDEC features. */
> > -static inline int jedec_feature(struct nand_chip *chip)
> > -{
> > -	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
> > -		: 0;
> > -}
> > -
> >  /* get timing characteristics from ONFI timing mode. */
> >  const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(i=
nt mode);
> >   =20
>=20
>=20
>=20

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
