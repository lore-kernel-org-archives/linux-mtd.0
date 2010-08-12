Received: from zmc.proxad.net ([212.27.53.206])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ojdk7-0001SB-EB
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 19:47:13 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] NAND: add support for reading ONFI parameters from
	NAND device
Date: Thu, 12 Aug 2010 21:47:53 +0200
References: <201008121453.50207.ffainelli@freebox.fr>
	<4C644426.9010106@broadcom.com>
In-Reply-To: <4C644426.9010106@broadcom.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008122147.54733.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Le Thursday 12 August 2010 20:57:42, Brian Norris a =E9crit :
> Hello,
>=20
> I've got a few comments and a patch; I cannot test them, though,
> just build.
>=20
> On 08/12/2010 05:53 AM, Florian Fainelli wrote:
> > +static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
> > +{
> > +	int i;
> > +	while (len--) {
> > +		crc ^=3D *p++<<  8;
> > +		for (i =3D 0; i<  8; i++)
> > +			crc =3D (crc<<  1) ^ ((crc&  0x8000) ? 0x8005 : 0);
> > +	}
> > +	return crc;
> > +}
>=20
> Can this function safely be replaced by the library function crc16?
> #include <linux/crc16.h>
> u16 crc16(u16 crc, u8 const *buffer, size_t len);

Certainly, thanks for noticing.

>=20
> > +/*
> > + * sanitize ONFI strings so we can safely print them
> > + */
> > +static void sanitize_string(uint8_t *s, size_t len)
> > +{
> > +	ssize_t i;
> > +
> > +	/* null terminate */
> > +	s[len - 1] =3D 0;
> > +
> > +	/* remove non printable chars */
> > +	for (i =3D 0; i<  len - 1; i++) {
> > +		if (s[i]<  ' ' || s[i]>  127)
> > +			s[i] =3D '?';
> > +	}
> > +
> > +	/* remove trailing spaces */
> > +	for (i =3D len - 1; i>=3D 0; i--) {
> > +		if (s[i]&&  s[i] !=3D ' ')
> > +			break;
> > +		s[i] =3D 0;
> > +	}
> > +}
>=20
> And the "remove trailing spaces" can be accomplished via strim.
> #include <linux/string.h>
> char *strim(char *);

Again yes.

>=20
> > @@ -2811,7 +2846,7 @@ static struct nand_flash_dev
> > *nand_get_flash_type(struct mtd_info *mtd,
> >=20
> >   	/* Read manufacturer and device IDs */
> >   	*maf_id =3D chip->read_byte(mtd);
> >=20
> > -	dev_id =3D chip->read_byte(mtd);
> > +	*dev_id =3D chip->read_byte(mtd);
> >=20
> >   	/* Try again to make sure, as some systems the bus-hold or other
> >   =09
> >   	 * interface concerns can cause random data which looks like a
> >=20
> > @@ -2821,15 +2856,13 @@ static struct nand_flash_dev
> > *nand_get_flash_type(struct mtd_info *mtd,
> >=20
> >   	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> >=20
> > -	/* Read entire ID string */
> > -
> > -	for (i =3D 0; i<  8; i++)
> > +	for (i =3D 0; i<  2; i++)
> >=20
> >   		id_data[i] =3D chip->read_byte(mtd);
> >=20
> > -	if (id_data[0] !=3D *maf_id || id_data[1] !=3D dev_id) {
> > +	if (id_data[0] !=3D *maf_id || id_data[1] !=3D *dev_id) {
> >=20
> >   		printk(KERN_INFO "%s: second ID read did not match "
> >   	=09
> >   		       "%02x,%02x against %02x,%02x\n", __func__,
> >=20
> > -		       *maf_id, dev_id, id_data[0], id_data[1]);
> > +		       *maf_id, *dev_id, id_data[0], id_data[1]);
> >=20
> >   		return ERR_PTR(-ENODEV);
> >   =09
> >   	}
>=20
> <snip>
>=20
> > +
> > +	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> > +
> > +	/* Read entire ID string */
> > +
> > +	for (i =3D 0; i<  8; i++)
> > +		id_data[i] =3D chip->read_byte(mtd);
> > +
> >=20
> >   	if (!type->name)
> >   =09
> >   		return ERR_PTR(-ENODEV);
>=20
> Do we really need a third chance to read the ID bytes? It seems like we
> can just read the whole string the second time instead of shortening it
> to two bytes and waiting to reread all 8 bytes until after the ONFI scan.
>=20
> > +					if (val&  (1<<  1))
> > +						chip->onfi_version =3D 10;
> > +					else if (val&  (1<<  2))
> > +						chip->onfi_version =3D 20;
> > +					else if (val&  (1<<  3))
> > +						chip->onfi_version =3D 21;
> > +					else
> > +						chip->onfi_version =3D 22;
>=20
> I cannot currently test ONFI on a real chip, but shouldn't the order of
> these conditionals be switched? It seems possible that the bits could be
> set high for more the one version (e.g., a chip supports 1.0 and 2.0, so
> we have val =3D 00000110 (binary), so the current logic would succeed at =
1.0,
> not realizing that it supports 2.0. Again, I don't know about the actual
> behavior in a real chip, but anyway, it seems harmless to reverse this.

I think you are right about this. We only have ONFI 1.0 compliant chips rig=
ht
now, so we can't know for sure, but as you say, this is harmless.

>=20
> Also, previously, you said:
> > +	if (!is_power_of_2(val) || val =3D=3D 1 || val > (1 << 4)) {
> > the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I
> > would only keep the two other checks."
>=20
> So why is it now:
> > +	if (is_power_of_2(val) || val =3D=3D 1 || val > (1 << 4)) {
>=20
> Is that a typo? Perhaps it's better to throw that test out altogether.

That was not a typo, I actually misread the ONFI specification and confused=
 bit
is set, with the actual value. So this is the correct check, sorry about th=
at.

>=20
> I "fixed" the changes I mentioned as well as a few coding style, logic
> cleanups, etc. (e.g. too many levels of logic, creating lines > 80 chars).
> Here's a new patch. I didn't change over the crc function to the library
> function because that would require configuring the Kbuild options and
> setting a dependency, which I'm not familiar with. I'm certainly not an
> expert on most of this, so take my patch with a grain of salt!

It is usually as simple as doing the proper select FOO in the related Kconf=
ig.

I will test your patch and respin with your changes, thanks!

>=20
> Brian
>=20
> Note: I didn't know what to do on the "Signed-off" when I have edited
> someone else's patch. Include mine if you'd like:

I think the usual rule of thumb is adding the signed-off-by of the people w=
ho
contributed to the patch.

>=20
> Signed-off-by: Brian Norris <norris@broadcom.com>
> -------------------------------------------------------------------------
>=20
> This patch adds support for reading NAND device ONFI parameters and use
> the ONFI informations to define its geometry. In case the device supports
> ONFI, the onfi_version field in struct nand_chip contains the version (BC=
D)
> and the onfi_params structure can be used by drivers to set up timings and
> such. We currently only support ONFI 1.0 parameters.
>=20
> ---
>  drivers/mtd/nand/nand_base.c |  158
> ++++++++++++++++++++++++++++++++++-------- include/linux/mtd/nand.h     |=
=20
>  66 +++++++++++++++++
>  2 files changed, 194 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a3c7473..b6d6121 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -33,6 +33,7 @@
>   */
>=20
>  #include <linux/module.h>
> +#include <linux/crc16.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/err.h>
> @@ -2786,15 +2787,47 @@ static void nand_set_defaults(struct nand_chip
> *chip, int busw)
>=20
>  }
>=20
> +static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
> +{
> +	int i;
> +	while (len--) {
> +		crc ^=3D *p++ << 8;
> +		for (i =3D 0; i < 8; i++)
> +			crc =3D (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
> +	}
> +	return crc;
> +}
> +
> +/*
> + * sanitize ONFI strings so we can safely print them
> + */
> +static void sanitize_string(uint8_t *s, size_t len)
> +{
> +	ssize_t i;
> +
> +	/* null terminate */
> +	s[len - 1] =3D '\0';
> +
> +	/* remove non-printable chars */
> +	for (i =3D 0; i < len - 1; i++) {
> +		if (s[i] < ' ' || s[i] > 127)
> +			s[i] =3D '?';
> +	}
> +
> +	/* remove trailing spaces */
> +	strim(s);
> +}
> +
>  /*
>   * Get the flash and manufacturer id and lookup if the type is supported
>   */
>  static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  						  struct nand_chip *chip,
>  						  int busw, int *maf_id,
> +						  int *dev_id,
>  						  struct nand_flash_dev *type)
>  {
> -	int i, dev_id, maf_idx;
> +	int i, maf_idx;
>  	u8 id_data[8];
>=20
>  	/* Select the device */
> @@ -2811,7 +2844,7 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd,
>=20
>  	/* Read manufacturer and device IDs */
>  	*maf_id =3D chip->read_byte(mtd);
> -	dev_id =3D chip->read_byte(mtd);
> +	*dev_id =3D chip->read_byte(mtd);
>=20
>  	/* Try again to make sure, as some systems the bus-hold or other
>  	 * interface concerns can cause random data which looks like a
> @@ -2822,14 +2855,13 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, chip->cmdfunc(mtd,
> NAND_CMD_READID, 0x00, -1);
>=20
>  	/* Read entire ID string */
> -
>  	for (i =3D 0; i < 8; i++)
>  		id_data[i] =3D chip->read_byte(mtd);
>=20
> -	if (id_data[0] !=3D *maf_id || id_data[1] !=3D dev_id) {
> +	if (id_data[0] !=3D *maf_id || id_data[1] !=3D *dev_id) {
>  		printk(KERN_INFO "%s: second ID read did not match "
>  		       "%02x,%02x against %02x,%02x\n", __func__,
> -		       *maf_id, dev_id, id_data[0], id_data[1]);
> +		       *maf_id, *dev_id, id_data[0], id_data[1]);
>  		return ERR_PTR(-ENODEV);
>  	}
>=20
> @@ -2837,8 +2869,72 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, type =3D nand_flash_ids;
>=20
>  	for (; type->name !=3D NULL; type++)
> -		if (dev_id =3D=3D type->id)
> -                        break;
> +		if (*dev_id =3D=3D type->id)
> +			break;
> +
> +	chip->onfi_version =3D 0;
> +	/* try ONFI for unknown or large page size chips */
> +	if (!type->name || !type->pagesize) {
> +		struct nand_onfi_params *p =3D &chip->onfi_params;
> +		int i, val;
> +
> +		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> +		if (chip->read_byte(mtd) =3D=3D 'O' &&
> +			chip->read_byte(mtd) =3D=3D 'N' &&
> +			chip->read_byte(mtd) =3D=3D 'F' &&
> +			chip->read_byte(mtd) =3D=3D 'I') {
> +
> +			printk(KERN_INFO "ONFI flash detected\n");
> +			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> +			for (i =3D 0; i < 3; i++) {
> +				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> +				if (onfi_crc(0x4F4E, (uint8_t *)p, 254) =3D=3D
> +						le16_to_cpu(p->crc)) {
> +					printk(KERN_INFO "ONFI param page %d"
> +						       "valid\n", i);
> +					break;
> +				}
> +			}
> +
> +			/* check version */
> +			val =3D (i < 3) ? le16_to_cpu(p->revision) : 0;
> +			if (val & (4 << 1))
> +				chip->onfi_version =3D 22;
> +			else if (val & (1 << 3))
> +				chip->onfi_version =3D 21;
> +			else if (val & (1 << 2))
> +				chip->onfi_version =3D 20;
> +			else if (val & (1 << 1))
> +				chip->onfi_version =3D 10;
> +			else
> +				printk(KERN_INFO "%s: unsupported ONFI version:"
> +						" %d\n", __func__, val);
> +			if (chip->onfi_version) {
> +				sanitize_string(p->manufacturer,
> +						sizeof(p->manufacturer));
> +				sanitize_string(p->model, sizeof(p->model));
> +				if (!mtd->name)
> +					mtd->name =3D p->model;
> +				mtd->writesize =3D le32_to_cpu(p->byte_per_page);
> +				mtd->erasesize =3D le32_to_cpu(p->pages_per_block)
> +					* mtd->writesize;
> +				mtd->oobsize =3D le16_to_cpu(
> +						p->spare_bytes_per_page);
> +				chip->chipsize =3D le32_to_cpu(p->blocks_per_lun)
> +					* mtd->erasesize;
> +				busw =3D 0;
> +				if (le16_to_cpu(p->features) & 1)
> +					busw =3D NAND_BUSWIDTH_16;
> +
> +				chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
> +				chip->options |=3D (NAND_NO_READRDY |
> +						NAND_NO_AUTOINCR)
> +					& NAND_CHIPOPTIONS_MSK;
> +
> +				goto ident_done;
> +			}
> +		}
> +	}
>=20
>  	if (!type->name)
>  		return ERR_PTR(-ENODEV);
> @@ -2900,6 +2996,21 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, mtd->oobsize =3D mtd->writesiz=
e /
> 32;
>  		busw =3D type->options & NAND_BUSWIDTH_16;
>  	}
> +	/* Get chip options, preserve non chip based options */
> +	chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
> +	chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;
> +
> +	/* Check if chip is a not a samsung device. Do not clear the
> +	 * options for chips which are not having an extended id.
> +	 */
> +	if (*maf_id !=3D NAND_MFR_SAMSUNG && !type->pagesize)
> +		chip->options &=3D ~NAND_SAMSUNG_LP_OPTIONS;
> +ident_done:
> +
> +	/*
> +	 * Set chip as a default. Board drivers can override it, if necessary
> +	 */
> +	chip->options |=3D NAND_NO_AUTOINCR;
>=20
>  	/* Try to identify manufacturer */
>  	for (maf_idx =3D 0; nand_manuf_ids[maf_idx].id !=3D 0x0; maf_idx++) {
> @@ -2914,10 +3025,10 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, if (busw !=3D (chip->options &
> NAND_BUSWIDTH_16)) {
>  		printk(KERN_INFO "NAND device: Manufacturer ID:"
>  		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
> -		       dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
> +		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
>  		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
> -		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
> -		       busw ? 16 : 8);
> +				(chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
> +				busw ? 16 : 8);
>  		return ERR_PTR(-EINVAL);
>  	}
>=20
> @@ -2943,21 +3054,6 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, chip->badblockpos =3D
> NAND_LARGE_BADBLOCK_POS;
>=20
>=20
> -	/* Get chip options, preserve non chip based options */
> -	chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
> -	chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;
> -
> -	/*
> -	 * Set chip as a default. Board drivers can override it, if necessary
> -	 */
> -	chip->options |=3D NAND_NO_AUTOINCR;
> -
> -	/* Check if chip is a not a samsung device. Do not clear the
> -	 * options for chips which are not having an extended id.
> -	 */
> -	if (*maf_id !=3D NAND_MFR_SAMSUNG && !type->pagesize)
> -		chip->options &=3D ~NAND_SAMSUNG_LP_OPTIONS;
> -
>  	/*
>  	 * Bad block marker is stored in the last page of each block
>  	 * on Samsung and Hynix MLC devices; stored in first two pages
> @@ -2997,9 +3093,11 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, if (mtd->writesize > 512 &&
> chip->cmdfunc =3D=3D nand_command)
>  		chip->cmdfunc =3D nand_command_lp;
>=20
> +	/* TODO onfi flash name */
>  	printk(KERN_INFO "NAND device: Manufacturer ID:"
> -	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
> -	       nand_manuf_ids[maf_idx].name, type->name);
> +		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
> +		nand_manuf_ids[maf_idx].name,
> +		chip->onfi_version ? type->name:chip->onfi_params.model);
>=20
>  	return type;
>  }
> @@ -3018,7 +3116,7 @@ static struct nand_flash_dev
> *nand_get_flash_type(struct mtd_info *mtd, int nand_scan_ident(struct
> mtd_info *mtd, int maxchips,
>  		    struct nand_flash_dev *table)
>  {
> -	int i, busw, nand_maf_id;
> +	int i, busw, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip =3D mtd->priv;
>  	struct nand_flash_dev *type;
>=20
> @@ -3028,7 +3126,7 @@ int nand_scan_ident(struct mtd_info *mtd, int
> maxchips, nand_set_defaults(chip, busw);
>=20
>  	/* Read the flash type */
> -	type =3D nand_get_flash_type(mtd, chip, busw, &nand_maf_id, table);
> +	type =3D nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_i=
d,
> table);
>=20
>  	if (IS_ERR(type)) {
>  		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
> @@ -3046,7 +3144,7 @@ int nand_scan_ident(struct mtd_info *mtd, int
> maxchips, chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>  		/* Read manufacturer and device IDs */
>  		if (nand_maf_id !=3D chip->read_byte(mtd) ||
> -		    type->id !=3D chip->read_byte(mtd))
> +		    nand_dev_id !=3D chip->read_byte(mtd))
>  			break;
>  	}
>  	if (i > 1)
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 8b288b6..135576f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -228,6 +228,67 @@ typedef enum {
>  /* Keep gcc happy */
>  struct nand_chip;
>=20
> +struct nand_onfi_params {
> +	/* rev info and features block */
> +	u8		sig[4]; /* 'O' 'N' 'F' 'I'  */
> +	__le16		revision;
> +	__le16		features;
> +	__le16		opt_cmd;
> +	u8		reserved[22];
> +
> +	/* manufacturer information block */
> +	char		manufacturer[12];
> +	char		model[20];
> +	u8		jedec_id;
> +	__le16		date_code;
> +	u8		reserved2[13];
> +
> +	/* memory organization block */
> +	__le32		byte_per_page;
> +	__le16		spare_bytes_per_page;
> +	__le32		data_bytes_per_ppage;
> +	__le16		sparre_bytes_per_ppage;
> +	__le32		pages_per_block;
> +	__le32		blocks_per_lun;
> +	u8		lun_count;
> +	u8		addr_cycles;
> +	u8		bits_per_cell;
> +	__le16		bb_per_lun;
> +	__le16		block_endurance;
> +	u8		guaranteed_good_blocks;
> +	__le16		guaranteed_block_endurance;
> +	u8		programs_per_page;
> +	u8		ppage_attr;
> +	u8		ecc_bits;
> +	u8		interleaved_bits;
> +	u8		interleaved_ops;
> +	u8		reserved3[13];
> +
> +	/* electrical parameter block */
> +	u8		io_pin_capacitance_max;
> +	__le16		async_timing_mode;
> +	__le16		program_cache_timing_mode;
> +	__le16		t_prog;
> +	__le16		t_bers;
> +	__le16		t_r;
> +	__le16		t_ccs;
> +	__le16		src_sync_timing_mode;
> +	__le16		src_ssync_features;
> +	__le16		clk_pin_capacitance_typ;
> +	__le16		io_pin_capacitance_typ;
> +	__le16		input_pin_capacitance_typ;
> +	u8		input_pin_capacitance_max;
> +	u8		driver_strenght_support;
> +	__le16		t_int_r;
> +	__le16		t_ald;
> +	u8		reserved4[7];
> +
> +	/* vendor */
> +	u8		reserved5[90];
> +
> +	__le16 crc;
> +} __attribute__((packed));
> +
>  /**
>   * struct nand_hw_control - Control structure for hardware controller (e=
=2Eg
> ECC generator) shared among independent devices * @lock:             =20
> protection lock
> @@ -360,6 +421,8 @@ struct nand_buffers {
>   * @pagemask:		[INTERN] page number mask =3D number of (pages / chip) - 1
>   * @pagebuf:		[INTERN] holds the pagenumber which is currently in data_b=
uf
>   * @subpagesize:	[INTERN] holds the subpagesize
> + * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded), non
> 0 if ONFI supported + * @onfi_params:	[INTERN] holds the ONFI page
> parameter when ONFI is supported, 0 otherwise * @ecclayout:		[REPLACEABLE]
> the default ecc placement scheme
>   * @bbt:		[INTERN] bad block table pointer
>   * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash lookup
> @@ -412,6 +475,9 @@ struct nand_chip {
>  	int		badblockpos;
>  	int		badblockbits;
>=20
> +	int		onfi_version;
> +	struct nand_onfi_params	onfi_params;
> +
>  	flstate_t	state;
>=20
>  	uint8_t		*oob_poi;
