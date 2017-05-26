Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dEI1P-0001ST-EH
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 16:23:30 +0000
Date: Fri, 26 May 2017 18:22:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: nand: Add support for Toshiba BENAND
 (Built-in ECC NAND)
Message-ID: <20170526182254.6a4f98c8@bbrezillon>
In-Reply-To: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
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

Hi KOBAYASHI,

Le Fri, 26 May 2017 10:15:35 +0900,
KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> a =C3=A9crit :

> This patch enables support for Toshiba BENAND. It was originally posted on
>   https://lkml.org/lkml/2015/7/24/571
>=20
> This patch is rewrote to adapt the recent mtd "separate vendor specific c=
ode
> from core" cleanup process.
>=20
> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---
>  drivers/mtd/nand/Kconfig        |  17 ++++++
>  drivers/mtd/nand/nand_base.c    |  15 ++++++
>  drivers/mtd/nand/nand_toshiba.c | 112 ++++++++++++++++++++++++++++++++++=
+++++-
>  include/linux/mtd/nand.h        |   1 +
>  4 files changed, 143 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 0bd2319..6634d4b 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -36,6 +36,23 @@ config MTD_NAND_ECC_BCH
>  	  ECC codes. They are used with NAND devices requiring more than 1 bit
>  	  of error correction.
> =20
> +config MTD_NAND_BENAND
> +	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
> +	default n
> +	help
> +	  This enables support for Toshiba BENAND.
> +	  Toshiba BENAND is a SLC NAND solution that automatically
> +	  generates ECC inside NAND chip.
> +
> +config MTD_NAND_BENAND_ECC_STATUS
> +	bool "Enable ECC Status Read Command(0x7A)"
> +	depends on MTD_NAND_BENAND
> +	default n
> +	help
> +	  This enables support for ECC Status Read Command(0x7A) of BENAND.
> +	  When this enables, report the real number of bitflips.
> +	  In other cases, report the assumud number.
> +

Please drop the Kconfig options. The amount of code added here is quite
small, and I don't think we need to compile it out. If the vendor code
continues to grow we'll see how we want to deal with that, but we're
not there yet.

>  config MTD_SM_COMMON
>  	tristate
>  	default n
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 43722a8..ab8652e 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4186,6 +4186,7 @@ static const char * const nand_ecc_modes[] =3D {
>  	[NAND_ECC_HW_SYNDROME]	=3D "hw_syndrome",
>  	[NAND_ECC_HW_OOB_FIRST]	=3D "hw_oob_first",
>  	[NAND_ECC_ON_DIE]	=3D "on-die",
> +	[NAND_ECC_BENAND]	=3D "benand",

No. BENAND and on-die ECC are the same thing (not the same
implementation, but the same feature). Please re-use the existing
ECC_ON_DIE definition.

>  };
> =20
>  static int of_get_nand_ecc_mode(struct device_node *np)
> @@ -4751,6 +4752,19 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			ecc->write_oob =3D nand_write_oob_std;
>  		break;
> =20
> +	case NAND_ECC_BENAND:
> +		if (!ecc->read_page || !ecc->read_subpage) {
> +			WARN(1, "No ECC functions supplied; benand ECC not possible\n");
> +			ret =3D -EINVAL;
> +			goto err_free;
> +		}
> +		ecc->write_page =3D nand_write_page_raw;
> +		ecc->read_page_raw =3D nand_read_page_raw;
> +		ecc->write_page_raw =3D nand_write_page_raw;
> +		ecc->read_oob =3D nand_read_oob_std;
> +		ecc->write_oob =3D nand_write_oob_std;
> +		break;

Ditto.

> +
>  	case NAND_ECC_NONE:
>  		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommend=
ed!\n");
>  		ecc->read_page =3D nand_read_page_raw;
> @@ -4831,6 +4845,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Large page NAND with SOFT_ECC should support subpage reads */
>  	switch (ecc->mode) {
>  	case NAND_ECC_SOFT:
> +	case NAND_ECC_BENAND:

And here as well.

>  		if (chip->page_shift > 9)
>  			chip->options |=3D NAND_SUBPAGE_READ;
>  		break;
> diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_tosh=
iba.c
> index fa787ba..bb3c852 100644
> --- a/drivers/mtd/nand/nand_toshiba.c
> +++ b/drivers/mtd/nand/nand_toshiba.c
> @@ -17,6 +17,97 @@
> =20
>  #include <linux/mtd/nand.h>
> =20
> +/* ECC Status Read Command for BENAND */
> +#define NAND_CMD_ECC_STATUS	0x7A

Can you prefix the name with TOSHIBA_:

#define TOSHIBA_NAND_CMD_ECC_STATUS	0x7a

> +
> +/* Recommended to rewrite for BENAND */
> +#define NAND_STATUS_RECOM_REWRT	0x08

Ditto, add a TOSHIBA somewhere:

#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED		BIT(3)

But anyway, I'm not sure we want to use this metric since we have the
number of corrected bitflips thanks to the TOSHIBA_NAND_CMD_ECC_STATUS
command.

> +
> +

Drop the extra empty line.

> +static int toshiba_nand_benand_status_chk(struct mtd_info *mtd,
> +			struct nand_chip *chip)

Try to align parameters on the open parenthesis when you have multiple
lines.

> +{
> +	unsigned int max_bitflips =3D 0;
> +	u8 status;
> +
> +	/* Check Read Status */
> +	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> +	status =3D chip->read_byte(mtd);
> +
> +	/* timeout */
> +	if (!(status & NAND_STATUS_READY)) {
> +		pr_debug("BENAND : Time Out!\n");
> +		return -EIO;
> +	}

Hm, I think this one has already been checked by the core.

> +
> +	/* uncorrectable */
> +	else if (status & NAND_STATUS_FAIL)
> +		mtd->ecc_stats.failed++;

You have all the information to add the exact number of failures (it's
a per-sector information, not per-page).

> +
> +	/* correctable */
> +	else if (status & NAND_STATUS_RECOM_REWRT) {
> +		if (chip->cmd_ctrl &&
> +			IS_ENABLED(CONFIG_MTD_NAND_BENAND_ECC_STATUS)) {
> +
> +			int i;
> +			u8 ecc_status;
> +			unsigned int bitflips;
> +
> +			/* Check Read ECC Status */
> +			chip->cmd_ctrl(mtd, NAND_CMD_ECC_STATUS,
> +				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +			/* Get bitflips info per 512Byte */
> +			for (i =3D 0; i < mtd->writesize >> 9; i++) {
> +				ecc_status =3D chip->read_byte(mtd);
> +				bitflips =3D ecc_status & 0x0f;
> +				max_bitflips =3D max_t(unsigned int,
> +						max_bitflips, bitflips);
> +			}
> +			mtd->ecc_stats.corrected +=3D max_bitflips;
> +		} else {
> +			/*
> +			 * If can't use chip->cmd_ctrl,
> +			 * we can't get real number of bitflips.
> +			 * So, we set max_bitflips mtd->bitflip_threshold.
> +			 */

And that's exactly the kind of situation I want to avoid. I hate the
fact that, depending on the NAND controller, we have this feature
working or not. Well, if it's a real limitation of the
controller, that's acceptable, but most of the time it's just a driver
limitation.

I'd like to have the ->exec_op() [1] infrastructure ready before we
start adding vendor specific commands. It probably needs to be extended
with an ->supports_op() hook to ask the controller whether it supports a
specific operation or not and let the core/vendor driver decide whether
this part can be attached to the controller based on the result.

> +			max_bitflips =3D mtd->bitflip_threshold;
> +			mtd->ecc_stats.corrected +=3D max_bitflips;
> +		}
> +	}

For the if () ... else if () ... blocks please try to do:

	if (...) {
		/* comment here */
		...
	} else if (...) {
		/* comment here */
		...
	} else {
		/* comment here */
		...
	}

> +
> +	return max_bitflips;
> +}
> +
> +static int toshiba_nand_read_page_benand(struct mtd_info *mtd,
> +			struct nand_chip *chip, uint8_t *buf,
> +			int oob_required, int page)
> +{
> +	unsigned int max_bitflips =3D 0;
> +
> +	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);
> +	max_bitflips =3D toshiba_nand_benand_status_chk(mtd, chip);
> +
> +	return max_bitflips;
> +}
> +
> +static int toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
> +			struct nand_chip *chip, uint32_t data_offs,
> +			uint32_t readlen, uint8_t *bufpoi, int page)
> +{
> +	uint8_t *p;
> +	unsigned int max_bitflips =3D 0;
> +
> +	if (data_offs !=3D 0)
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
> +
> +	p =3D bufpoi + data_offs;
> +	chip->read_buf(mtd, p, readlen);
> +
> +	max_bitflips =3D toshiba_nand_benand_status_chk(mtd, chip);
> +
> +	return max_bitflips;
> +}
> +
>  static void toshiba_nand_decode_id(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> @@ -33,15 +124,32 @@ static void toshiba_nand_decode_id(struct nand_chip =
*chip)
>  	 */
>  	if (chip->id.len >=3D 6 && nand_is_slc(chip) &&
>  	    (chip->id.data[5] & 0x7) =3D=3D 0x6 /* 24nm */ &&
> -	    !(chip->id.data[4] & 0x80) /* !BENAND */)
> -		mtd->oobsize =3D 32 * mtd->writesize >> 9;
> +	    (chip->id.data[4] & 0x80) /* BENAND */) {
> +		if (IS_ENABLED(CONFIG_MTD_NAND_BENAND))
> +			chip->ecc.mode =3D NAND_ECC_BENAND;

No, you should not set that explicitly. This choice should be left to
the user. Now, since the internal ECC engine cannot be disabled here,
you should fail in toshiba_nand_init() if you are dealing with a BENAND
and chip->ecc.mode !=3D NAND_ECC_ON_DIE.


> +	} else {
> +		mtd->oobsize =3D 32 * mtd->writesize >> 9;	/* !BENAND */
> +	}

You're changing the ID decoding logic here.

It should be:

	if (chip->id.len >=3D 6 && nand_is_slc(chip) &&
  	    (chip->id.data[5] & 0x7) =3D=3D 0x6 /* 24nm */) {
		if (chip->id.data[4] & 0x80)
			chip->ecc.mode =3D NAND_ECC_BENAND;
		else
			mtd->oobsize =3D 32 * mtd->writesize >> 9;
	}
>  }
> =20
>  static int toshiba_nand_init(struct nand_chip *chip)
>  {
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
>  	if (nand_is_slc(chip))
>  		chip->bbt_options |=3D NAND_BBT_SCAN2NDPAGE;
> =20
> +	if (chip->ecc.mode =3D=3D NAND_ECC_BENAND) {
> +		chip->ecc.options =3D NAND_ECC_CUSTOM_PAGE_ACCESS;
> +		chip->ecc.bytes =3D 0;

It should be set to 16 according to the datasheet. But I guess this is
not exactly true. I'm pretty sure we can use some of these bytes to
store real data. Assuming you're using BCH, only 13bytes are needed for
8bits/512bytes strength, and I guess the BBM region is also left
untouched (first 2 bytes of the OOB region).

> +		chip->ecc.strength =3D 8;
> +		chip->ecc.total =3D 0;

No need to explicitly set that one, but you should set chip->ecc.size
to 512.

> +		chip->ecc.read_page =3D toshiba_nand_read_page_benand;
> +		chip->ecc.read_subpage =3D toshiba_nand_read_subpage_benand;
> +
> +		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	}

Should be:


	if (chip->id.len >=3D 6 && nand_is_slc(chip) &&
  	    (chip->id.data[5] & 0x7) =3D=3D 0x6 &&
	    (chip->id.data[4] & 0x80)) {
		/* BENAND */

		/*
		 * We can't disable the internal ECC engine, the user
		 * has to use on-die ECC, there is no alternative.
		 */
		if (chip->ecc.mode !=3D NAND_ECC_ON_DIE)
			return -EINVAL;

		....
	}

> +
>  	return 0;
>  }
> =20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 3a6a77f..6821334 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -117,6 +117,7 @@ typedef enum {
>  	NAND_ECC_HW_SYNDROME,
>  	NAND_ECC_HW_OOB_FIRST,
>  	NAND_ECC_ON_DIE,
> +	NAND_ECC_BENAND,

As explained above: this is unneeded.

>  } nand_ecc_modes_t;
> =20
>  enum nand_ecc_algo {

[1]https://github.com/bbrezillon/linux/commits/nand/exec_op1
