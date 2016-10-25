Received: from mail-bl2nam02on0059.outbound.protection.outlook.com
 ([104.47.38.59] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bystU-0000cE-TI
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 03:59:23 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>, "galak@codeaurora.org"
 <galak@codeaurora.org>, "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: RE: [v7, 1/3] nand: pl353: Add basic driver for arm pl353 smc nand
 interface
Date: Tue, 25 Oct 2016 03:58:49 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B764216D8A@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
 <20161021203322.GA28655@obsidianresearch.com>
 <20161021234611.1f737144@bbrezillon>
 <CAGnW=Bb-pnJ9-xjcw-1dR-y+oKjNs53bgD+dh1LwsMTCmzdRmQ@mail.gmail.com>
 <20161024225954.GA12438@obsidianresearch.com>
In-Reply-To: <20161024225954.GA12438@obsidianresearch.com>
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



> -----Original Message-----
> From: Jason Gunthorpe [mailto:jgunthorpe@obsidianresearch.com]
> Sent: Tuesday, October 25, 2016 4:30 AM
> To: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>; Punnaiah Chouda=
ry
> Kalluri <punnaia@xilinx.com>; mark.rutland@arm.com; linux-
> mtd@lists.infradead.org; michal.simek@xilinx.com; ezequiel.garcia@free-
> electrons.com; linux-kernel@vger.kernel.org; rob@landley.net;
> galak@codeaurora.org; Khoronzhuk, Ivan <ivan.khoronzhuk@ti.com>;
> computersforpeace@gmail.com; dwmw2@infradead.org
> Subject: Re: [v7, 1/3] nand: pl353: Add basic driver for arm pl353 smc na=
nd
> interface
>=20
> [cc list trimmed]
>=20
> On Sun, Oct 23, 2016 at 05:37:42PM +0530, punnaiah choudary kalluri wrote=
:
> > Hi Boris and Jason,
> >
> >  I am doing rework on these patches to accommodate recent changes with
> >  respect to ooblayout. Also some of the comments that i have received
> > from Boris as part of the arasan nand controller upstream patches will
> > apply to this driver. So, i will be releasing the next set of patches f=
or this
> > driver soon and request your time for reviewing those patches.
>=20
> I have hacked the v7 patchset enough to work on 4.8 and hacked it some
> more to work on my hardware. The driver appears to be in no better
> shape than the 3.12 out-of-tree Xilinx release I was using previously..


The driver in Xilinx tree works with 4.6 kernel and adopted the required
 Changes (may release in 1-2 weeks). Still it need some rework, now a days
I am seeing many requests from different people for this driver and some of
Them are using different version of IP as you know this IP has four variant=
s and
Xilinx is using the pl353 variant.  Let's wait for the next series of patch=
es and=20
Get the patches tested with others as well along with the review comments.
=20
Regards,
Punnaiah
> I've attached the ugly, ugly patch I made, it may save you some time
> when preparing v8.
>=20
> Commentary:
>  1) nand_chip already includes mtd_info, no reason for a second one in
>     the pl353_nand_info struct. The standard accessors mtd_to_nand/etc
>     should be used instead of priv
>  2) I hacked out all the ECC stuff from the driver since I don't use
>     it and it was broken.. Obviously some has to come back, but fixing
>     other things on this list first will make that much easier and better=
..
>  3) pl353_nand_write_page_swecc/pl353_nand_read_page_swecc are pure
>     outdated copies of the core routines and should not exist in a
>     driver. This needs to be fixed so nand_scan_tail sets them.
>     This seems to be a side effect of #9 ?
>  4) The hacky stuff to detect 2 vs 3 address cycle NAND doesn't work,
>     and doesn't work without ONFI (see patch for possible fix). The
>     driver should probably use the same scheme the core code uses..
>     But this is all a problem because of #10
>  5) The driver assumes alignment of the iomap, needs to use + not |
>     when constructing the address. (yes, this blows up on my system)
>  6) Driver unconditionally sets timing to ONFI mode 0 (slow!)
>     Maybe timing should be common code driven by DT..
>  7) Driver unconditionally selects a BBT format, and an ECC layout
>     (neither match what my system uses, but I guess that is a core mtd
>     issue these days :/)
>  8) Driver unconditionally forces a chip-delay (wrong for my
>     system) maybe this should be common code driven by DT..
>  9) This buisness with pl353_nand_ecc_init and the
>     special functions to do PL353_NAND_LAST_TRANSFER_LENGTH stuff
>     is just horrid. I'd expect that is a big NAK.
>=20
>     The driver needs to implement read_buf *properly* so the core
>     routines can be used instead of trying to 'fix' the call sites
>     to do the PL353_NAND_LAST_TRANSFER_LENGTH stuff.
>  10) pl353_nand_cmd_function is a wonky copy of nand_command_lp,
> maybe
>      this driver should use cmd_ctrl, or the core code should be
>      refactored some more..
>=20
> Jason
>=20
> diff --git a/drivers/mtd/nand/pl353_nand.c
> b/drivers/mtd/nand/pl353_nand.c
> index 7e3993931f75..63a8d8c008e3 100644
> --- a/drivers/mtd/nand/pl353_nand.c
> +++ b/drivers/mtd/nand/pl353_nand.c
> @@ -26,7 +26,6 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> -#include <linux/of_mtd.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -56,7 +55,6 @@
>  #define PL353_NAND_ECC_LAST	BIT(ECC_LAST_SHIFT)	/* Set
> ECC_Last */
>  #define PL353_NAND_CLEAR_CS	BIT(CLEAR_CS_SHIFT)	/* Clear chip
> select */
>=20
> -#define ONDIE_ECC_FEATURE_ADDR	0x90
>  #define PL353_NAND_ECC_BUSY_TIMEOUT	(1 * HZ)
>  #define PL353_NAND_DEV_BUSY_TIMEOUT	(1 * HZ)
>  #define PL353_NAND_LAST_TRANSFER_LENGTH	4
> @@ -88,11 +86,9 @@ struct pl353_nand_command_format {
>   */
>  struct pl353_nand_info {
>  	struct nand_chip chip;
> -	struct mtd_info mtd;
>  	void __iomem *nand_base;
>  	unsigned long end_cmd_pending;
>  	unsigned long end_cmd;
> -	int ecc_mode;
>  	u8 raddr_cycles;
>  	u8 caddr_cycles;
>  };
> @@ -101,13 +97,13 @@ struct pl353_nand_info {
>   * The NAND flash operations command format
>   */
>  static const struct pl353_nand_command_format pl353_nand_commands[]
> =3D {
> -	{NAND_CMD_READ0, NAND_CMD_READSTART, 5,
> PL353_NAND_CMD_PHASE},
> +	{NAND_CMD_READ0, NAND_CMD_READSTART, -1,
> PL353_NAND_CMD_PHASE},
>  	{NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTART, 2,
> PL353_NAND_CMD_PHASE},
>  	{NAND_CMD_READID, NAND_CMD_NONE, 1, NAND_CMD_NONE},
>  	{NAND_CMD_STATUS, NAND_CMD_NONE, 0, NAND_CMD_NONE},
> -	{NAND_CMD_SEQIN, NAND_CMD_PAGEPROG, 5,
> PL353_NAND_DATA_PHASE},
> +	{NAND_CMD_SEQIN, NAND_CMD_PAGEPROG, -1,
> PL353_NAND_DATA_PHASE},
>  	{NAND_CMD_RNDIN, NAND_CMD_NONE, 2, NAND_CMD_NONE},
> -	{NAND_CMD_ERASE1, NAND_CMD_ERASE2, 3,
> PL353_NAND_CMD_PHASE},
> +	{NAND_CMD_ERASE1, NAND_CMD_ERASE2, -1,
> PL353_NAND_CMD_PHASE},
>  	{NAND_CMD_RESET, NAND_CMD_NONE, 0, NAND_CMD_NONE},
>  	{NAND_CMD_PARAM, NAND_CMD_NONE, 1, NAND_CMD_NONE},
>  	{NAND_CMD_GET_FEATURES, NAND_CMD_NONE, 1,
> NAND_CMD_NONE},
> @@ -126,22 +122,58 @@ static const struct pl353_nand_command_format
> pl353_nand_commands[] =3D {
>  };
>=20
>  /* Define default oob placement schemes for large and small page devices
> */
> -static struct nand_ecclayout nand_oob_16 =3D {
> -	.eccbytes =3D 3,
> -	.eccpos =3D {0, 1, 2},
> -	.oobfree =3D {
> -		{.offset =3D 8,
> -		 . length =3D 8} }
> +static int pl353_ooblayout_16_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	if (section !=3D 0)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 0;
> +	oobregion->length =3D 3;
> +	return 0;
> +}
> +
> +static int pl353_ooblayout_16_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	if (section !=3D 0)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 8;
> +	oobregion->length =3D 8;
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops pl353_16_ooblayout_ops =3D {
> +	.ecc =3D pl353_ooblayout_16_ecc,
> +	.free =3D pl353_ooblayout_16_free,
>  };
>=20
> -static struct nand_ecclayout nand_oob_64 =3D {
> -	.eccbytes =3D 12,
> -	.eccpos =3D {
> -		   52, 53, 54, 55, 56, 57,
> -		   58, 59, 60, 61, 62, 63},
> -	.oobfree =3D {
> -		{.offset =3D 2,
> -		 .length =3D 50} }
> +static int pl353_ooblayout_64_ecc(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	if (section !=3D 0)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 52;
> +	oobregion->length =3D 12;
> +	return 0;
> +}
> +
> +static int pl353_ooblayout_64_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	if (section !=3D 0)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 2;
> +	oobregion->length =3D 50;
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops pl353_64_ooblayout_ops =3D {
> +	.ecc =3D pl353_ooblayout_64_ecc,
> +	.free =3D pl353_ooblayout_64_free,
>  };
>=20
>  static unsigned int get_cyc_from_ns(u32 clkrate, u32 ns)
> @@ -163,6 +195,7 @@ static unsigned int get_cyc_from_ns(u32 clkrate, u32
> ns)
>   *
>   * Return:	0 on success or error value on failure
>   */
> +#if 0
>  static int pl353_nand_calculate_hwecc(struct mtd_info *mtd,
>  				const u8 *data, u8 *ecc_code)
>  {
> @@ -202,6 +235,7 @@ static int pl353_nand_calculate_hwecc(struct
> mtd_info *mtd,
>  	}
>  	return 0;
>  }
> +#endif
>=20
>  /**
>   * onehot - onehot function
> @@ -212,10 +246,12 @@ static int pl353_nand_calculate_hwecc(struct
> mtd_info *mtd,
>   *
>   * Return:	1 if it is onehot else 0
>   */
> +#if 0
>  static int onehot(unsigned short value)
>  {
>  	return (value & (value - 1)) =3D=3D 0;
>  }
> +#endif
>=20
>  /**
>   * pl353_nand_correct_data - ECC correction function
> @@ -230,6 +266,7 @@ static int onehot(unsigned short value)
>   *		1 if single bit error found and corrected.
>   *		-1 if multiple ECC errors found.
>   */
> +#if 0
>  static int pl353_nand_correct_data(struct mtd_info *mtd, unsigned char
> *buf,
>  				unsigned char *read_ecc,
>  				unsigned char *calc_ecc)
> @@ -266,6 +303,7 @@ static int pl353_nand_correct_data(struct mtd_info
> *mtd, unsigned char *buf,
>=20
>  	return -EBADMSG; /* Uncorrectable error */
>  }
> +#endif
>=20
>  /**
>   * pl353_nand_read_oob - [REPLACEABLE] the most common OOB data read
> function
> @@ -372,8 +410,8 @@ static int pl353_nand_read_page_raw(struct
> mtd_info *mtd,
>   * Return:	Always return zero
>   */
>  static int pl353_nand_write_page_raw(struct mtd_info *mtd,
> -				    struct nand_chip *chip,
> -				    const uint8_t *buf, int oob_required)
> +				     struct nand_chip *chip, const uint8_t *buf,
> +				     int oob_required, int page)
>  {
>  	unsigned long data_phase_addr;
>  	uint8_t *p;
> @@ -406,6 +444,7 @@ static int pl353_nand_write_page_raw(struct
> mtd_info *mtd,
>   *
>   * Return:	Zero on success and error on failure.
>   */
> +#if 0
>  static int pl353_nand_write_page_hwecc(struct mtd_info *mtd,
>  				    struct nand_chip *chip, const uint8_t *buf,
>  				    int oob_required)
> @@ -459,39 +498,7 @@ static int pl353_nand_write_page_hwecc(struct
> mtd_info *mtd,
>=20
>  	return 0;
>  }
> -
> -/**
> - * pl353_nand_write_page_swecc - [REPLACEABLE] software ecc based
> page write
> - * function
> - * @mtd:		Pointer to the mtd info structure
> - * @chip:		Pointer to the NAND chip info structure
> - * @buf:		Pointer to the data buffer
> - * @oob_required:	Caller requires OOB data read to chip->oob_poi
> - *
> - * Return:	Always return zero
> - */
> -static int pl353_nand_write_page_swecc(struct mtd_info *mtd,
> -				    struct nand_chip *chip, const uint8_t *buf,
> -				    int oob_required)
> -{
> -	int i, eccsize =3D chip->ecc.size;
> -	int eccbytes =3D chip->ecc.bytes;
> -	int eccsteps =3D chip->ecc.steps;
> -	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> -	const uint8_t *p =3D buf;
> -	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> -
> -	/* Software ecc calculation */
> -	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize)
> -		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> -
> -	for (i =3D 0; i < chip->ecc.total; i++)
> -		chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
> -
> -	chip->ecc.write_page_raw(mtd, chip, buf, 1);
> -
> -	return 0;
> -}
> +#endif
>=20
>  /**
>   * pl353_nand_read_page_hwecc - Hardware ECC based page read function
> @@ -506,6 +513,7 @@ static int pl353_nand_write_page_swecc(struct
> mtd_info *mtd,
>   *
>   * Return:	0 always and updates ECC operation status in to MTD
> structure
>   */
> +#if 0
>  static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
>  				     struct nand_chip *chip,
>  				     uint8_t *buf, int oob_required, int page)
> @@ -573,52 +581,7 @@ static int pl353_nand_read_page_hwecc(struct
> mtd_info *mtd,
>  	}
>  	return 0;
>  }
> -
> -/**
> - * pl353_nand_read_page_swecc - [REPLACEABLE] software ecc based page
> read
> - * function
> - * @mtd:		Pointer to the mtd info structure
> - * @chip:		Pointer to the NAND chip info structure
> - * @buf:		Pointer to the buffer to store read data
> - * @oob_required:	Caller requires OOB data read to chip->oob_poi
> - * @page:		Page number to read
> - *
> - * Return:	Always return zero
> - */
> -static int pl353_nand_read_page_swecc(struct mtd_info *mtd,
> -				     struct nand_chip *chip,
> -				     uint8_t *buf,  int oob_required, int page)
> -{
> -	int i, eccsize =3D chip->ecc.size;
> -	int eccbytes =3D chip->ecc.bytes;
> -	int eccsteps =3D chip->ecc.steps;
> -	uint8_t *p =3D buf;
> -	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> -	uint8_t *ecc_code =3D chip->buffers->ecccode;
> -	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> -
> -	chip->ecc.read_page_raw(mtd, chip, buf, page, 1);
> -
> -	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize)
> -		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> -
> -	for (i =3D 0; i < chip->ecc.total; i++)
> -		ecc_code[i] =3D chip->oob_poi[eccpos[i]];
> -
> -	eccsteps =3D chip->ecc.steps;
> -	p =3D buf;
> -
> -	for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize) {
> -		int stat;
> -
> -		stat =3D chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
> -		if (stat < 0)
> -			mtd->ecc_stats.failed++;
> -		else
> -			mtd->ecc_stats.corrected +=3D stat;
> -	}
> -	return 0;
> -}
> +#endif
>=20
>  /**
>   * pl353_nand_select_chip - Select the flash device
> @@ -643,10 +606,10 @@ static void pl353_nand_select_chip(struct mtd_info
> *mtd, int chip)
>  static void pl353_nand_cmd_function(struct mtd_info *mtd, unsigned int
> command,
>  				 int column, int page_addr)
>  {
> -	struct nand_chip *chip =3D mtd->priv;
> -	const struct pl353_nand_command_format *curr_cmd =3D NULL;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	struct pl353_nand_info *xnand =3D
> -		container_of(mtd, struct pl353_nand_info, mtd);
> +	    container_of(chip, struct pl353_nand_info, chip);
> +	const struct pl353_nand_command_format *curr_cmd =3D NULL;
>  	void __iomem *cmd_addr;
>  	unsigned long cmd_data =3D 0, end_cmd_valid =3D 0;
>  	unsigned long cmd_phase_addr, data_phase_addr, end_cmd, i;
> @@ -693,33 +656,27 @@ static void pl353_nand_cmd_function(struct
> mtd_info *mtd, unsigned int command,
>  	else
>  		end_cmd =3D curr_cmd->end_cmd;
>=20
> -	if ((command =3D=3D NAND_CMD_READ0) && (command =3D=3D
> NAND_CMD_SEQIN))
> +	if ((command =3D=3D NAND_CMD_READ0) || (command =3D=3D
> NAND_CMD_SEQIN))
>  		addrcycles =3D xnand->raddr_cycles + xnand->caddr_cycles;
>  	else if (command =3D=3D NAND_CMD_ERASE1)
>  		addrcycles =3D xnand->raddr_cycles;
>  	else
>  		addrcycles =3D curr_cmd->addr_cycles;
>=20
> -	cmd_phase_addr =3D (unsigned long __force)xnand->nand_base        |
> -			 (addrcycles << ADDR_CYCLES_SHIFT)    |
> -			 (end_cmd_valid << END_CMD_VALID_SHIFT)          |
> -			 (COMMAND_PHASE)                                 |
> -			 (end_cmd << END_CMD_SHIFT)                      |
> -			 (curr_cmd->start_cmd << START_CMD_SHIFT);
> -
> -	cmd_addr =3D (void __iomem * __force)cmd_phase_addr;
> +	cmd_addr =3D
> +	    xnand->nand_base + ((addrcycles << ADDR_CYCLES_SHIFT) |
> +				(end_cmd_valid << END_CMD_VALID_SHIFT)
> |
> +				(COMMAND_PHASE) | (end_cmd <<
> END_CMD_SHIFT) |
> +				(curr_cmd->start_cmd <<
> START_CMD_SHIFT));
>=20
>  	/* Get the data phase address */
>  	end_cmd_valid =3D 0;
>=20
> -	data_phase_addr =3D (unsigned long __force)xnand->nand_base       |
> -			  (0x0 << CLEAR_CS_SHIFT)                         |
> -			  (end_cmd_valid << END_CMD_VALID_SHIFT)          |
> -			  (DATA_PHASE)                                    |
> -			  (end_cmd << END_CMD_SHIFT)                      |
> -			  (0x0 << ECC_LAST_SHIFT);
> -
> -	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +	chip->IO_ADDR_R =3D
> +	    xnand->nand_base + ((0x0 << CLEAR_CS_SHIFT) |
> +				(end_cmd_valid << END_CMD_VALID_SHIFT)
> |
> +				(DATA_PHASE) | (end_cmd <<
> END_CMD_SHIFT) |
> +				(0x0 << ECC_LAST_SHIFT));
>  	chip->IO_ADDR_W =3D chip->IO_ADDR_R;
>=20
>  	/* Command phase AXI write */
> @@ -779,6 +736,7 @@ static void pl353_nand_cmd_function(struct mtd_info
> *mtd, unsigned int command,
>=20
>  		if (time_after_eq(jiffies, timeout))
>  			pr_err("%s timed out\n", __func__);
> +
>  		return;
>  	}
>  }
> @@ -791,8 +749,8 @@ static void pl353_nand_cmd_function(struct mtd_info
> *mtd, unsigned int command,
>   */
>  static void pl353_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int
> len)
>  {
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	int i;
> -	struct nand_chip *chip =3D mtd->priv;
>  	unsigned long *ptr =3D (unsigned long *)buf;
>=20
>  	len >>=3D 2;
> @@ -809,8 +767,8 @@ static void pl353_nand_read_buf(struct mtd_info
> *mtd, uint8_t *buf, int len)
>  static void pl353_nand_write_buf(struct mtd_info *mtd, const uint8_t *bu=
f,
>  				int len)
>  {
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	int i;
> -	struct nand_chip *chip =3D mtd->priv;
>  	unsigned long *ptr =3D (unsigned long *)buf;
>=20
>  	len >>=3D 2;
> @@ -843,11 +801,12 @@ static int pl353_nand_device_ready(struct
> mtd_info *mtd)
>   *
>   * Return:	Zero on success and error on failure.
>   */
> +#if 0
>  static int pl353_nand_ecc_init(struct mtd_info *mtd)
>  {
> -	struct nand_chip *nand_chip =3D mtd->priv;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
>  	struct pl353_nand_info *xnand =3D
> -		container_of(mtd, struct pl353_nand_info, mtd);
> +	    container_of(chip, struct pl353_nand_info, chip);
>=20
>  	nand_chip->ecc.read_oob =3D pl353_nand_read_oob;
>  	nand_chip->ecc.write_oob =3D pl353_nand_write_oob;
> @@ -868,7 +827,7 @@ static int pl353_nand_ecc_init(struct mtd_info *mtd)
>  		nand_chip->ecc.hwctl =3D NULL;
>  		nand_chip->ecc.read_page =3D
> pl353_nand_read_page_hwecc;
>  		nand_chip->ecc.size =3D PL353_NAND_ECC_SIZE;
> -		nand_chip->ecc.write_page =3D
> pl353_nand_write_page_hwecc;
> +//		nand_chip->ecc.write_page =3D
> pl353_nand_write_page_hwecc;
>  		pl353_smc_set_ecc_pg_size(mtd->dev.parent, mtd-
> >writesize);
>  		pl353_smc_set_ecc_mode(mtd->dev.parent,
> PL353_SMC_ECCMODE_APB);
>  		/* Hardware ECC generates 3 bytes ECC code for each 512
> bytes */
> @@ -904,6 +863,7 @@ static int pl353_nand_ecc_init(struct mtd_info *mtd)
>=20
>  	return 0;
>  }
> +#endif
>=20
>  static int pl353_nand_init_timing(struct device *dev, int mode)
>  {
> @@ -924,7 +884,7 @@ static int pl353_nand_init_timing(struct device *dev,
> int mode)
>  	t_ar  =3D get_cyc_from_ns(clkrate, time->tAR_min / 1000);
>  	t_rr  =3D get_cyc_from_ns(clkrate, time->tRR_min / 1000);
>=20
> -	pl353_smc_set_cycles(dev, t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
> +//	pl353_smc_set_cycles(dev, t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr)=
;
>=20
>  	return 0;
>  }
> @@ -943,28 +903,24 @@ static int pl353_nand_probe(struct platform_device
> *pdev)
>  	struct mtd_info *mtd;
>  	struct nand_chip *nand_chip;
>  	struct resource *res;
> -	struct mtd_part_parser_data ppdata;
>=20
>  	xnand =3D devm_kzalloc(&pdev->dev, sizeof(*xnand), GFP_KERNEL);
>  	if (!xnand)
>  		return -ENOMEM;
>=20
> +	/* Setup the basic MTD stuff */
> +	mtd =3D nand_to_mtd(&xnand->chip);
> +	nand_chip =3D &xnand->chip;
> +	mtd->dev.parent =3D pdev->dev.parent;
> +	mtd->name =3D PL353_NAND_DRIVER_NAME;
> +	nand_set_flash_node(nand_chip, pdev->dev.of_node);
> +
>  	/* Map physical address of NAND flash */
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	xnand->nand_base =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(xnand->nand_base))
>  		return PTR_ERR(xnand->nand_base);
>=20
> -	/* Link the private data with the MTD structure */
> -	mtd =3D &xnand->mtd;
> -	nand_chip =3D &xnand->chip;
> -
> -	nand_chip->priv =3D xnand;
> -	mtd->priv =3D nand_chip;
> -	mtd->dev.parent =3D pdev->dev.parent;
> -	mtd->owner =3D THIS_MODULE;
> -	mtd->name =3D PL353_NAND_DRIVER_NAME;
> -
>  	/* Set address of NAND IO lines */
>  	nand_chip->IO_ADDR_R =3D xnand->nand_base;
>  	nand_chip->IO_ADDR_W =3D xnand->nand_base;
> @@ -973,42 +929,46 @@ static int pl353_nand_probe(struct platform_device
> *pdev)
>  	nand_chip->cmdfunc =3D pl353_nand_cmd_function;
>  	nand_chip->dev_ready =3D pl353_nand_device_ready;
>  	nand_chip->select_chip =3D pl353_nand_select_chip;
> -
> -	/* If we don't set this delay driver sets 20us by default */
> -	nand_chip->chip_delay =3D 30;
> -
> -	/* Buffer read/write routines */
>  	nand_chip->read_buf =3D pl353_nand_read_buf;
>  	nand_chip->write_buf =3D pl353_nand_write_buf;
> -
> -	/* Set the device option and flash width */
>  	nand_chip->options =3D NAND_BUSWIDTH_AUTO;
> -	nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
> +//	nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
> +
> +	/* If we don't set this delay driver sets 20us by default */
> +	nand_chip->chip_delay =3D 30;
> +	// FIXME: from dt
> +	nand_chip->chip_delay =3D 50;
>=20
>  	platform_set_drvdata(pdev, xnand);
>  	if (pl353_nand_init_timing(pdev->dev.parent, 0))
>  		return -ENOTSUPP;
> +
>  	/* First scan to find the device and get the page size */
>  	if (nand_scan_ident(mtd, 1, NULL)) {
>  		dev_err(&pdev->dev, "nand_scan_ident for NAND
> failed\n");
>  		return -ENXIO;
>  	}
>=20
> -	xnand->ecc_mode =3D of_get_nand_ecc_mode(pdev->dev.of_node);
> -	if (xnand->ecc_mode < 0)
> -		xnand->ecc_mode =3D NAND_ECC_HW;
> -
>  	if (nand_chip->onfi_version) {
>  		xnand->raddr_cycles =3D nand_chip->onfi_params.addr_cycles
> & 0xF;
>  		xnand->caddr_cycles =3D
>  				(nand_chip->onfi_params.addr_cycles >> 4)
> & 0xF;
>  	} else {
> -		/*For non-ONFI devices, configuring the address cyles as 5 */
> -		xnand->raddr_cycles =3D xnand->caddr_cycles =3D 5;
> +		/* For non-ONFI devices, configure the address cyles based
> on
> +		 * the device size */
> +		xnand->caddr_cycles =3D 2;
> +		if (nand_chip->chipsize > (128 << 20))
> +			xnand->raddr_cycles =3D 3;
> +		else
> +			xnand->raddr_cycles =3D 2;
>  	}
>=20
> -	if (pl353_nand_ecc_init(mtd))
> -		return -ENOTSUPP;
> +	nand_chip->ecc.read_oob =3D pl353_nand_read_oob;
> +	nand_chip->ecc.write_oob =3D pl353_nand_write_oob;
> +	nand_chip->ecc.read_page_raw =3D pl353_nand_read_page_raw;
> +	nand_chip->ecc.write_page_raw =3D pl353_nand_write_page_raw;
> +/*	if (pl353_nand_ecc_init(mtd))
> +	return -ENOTSUPP;*/
>=20
>  	if (nand_chip->options & NAND_BUSWIDTH_16)
>  		pl353_smc_set_buswidth(pdev->dev.parent,
> @@ -1021,9 +981,7 @@ static int pl353_nand_probe(struct platform_device
> *pdev)
>  		return -ENXIO;
>  	}
>=20
> -	ppdata.of_node =3D pdev->dev.of_node;
> -
> -	mtd_device_parse_register(&xnand->mtd, NULL, &ppdata, NULL, 0);
> +	mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
>=20
>  	return 0;
>  }
> @@ -1042,7 +1000,7 @@ static int pl353_nand_remove(struct
> platform_device *pdev)
>  	struct pl353_nand_info *xnand =3D platform_get_drvdata(pdev);
>=20
>  	/* Release resources, unregister device */
> -	nand_release(&xnand->mtd);
> +	nand_release(nand_to_mtd(&xnand->chip));
>=20
>  	return 0;
>  }
