Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3CE7-00013S-Ua
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 18:27:02 +0000
Date: Tue, 5 Oct 2010 20:26:56 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] mtd/nand.h: cleanups
Message-ID: <20101005182656.GA21067@pengutronix.de>
References: <20101005104101.GA18714@www.tglx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20101005104101.GA18714@www.tglx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

just a minor comment.

On Tue, Oct 05, 2010 at 12:41:01PM +0200, Sebastian Andrzej Siewior wrote:
> - *var instead of * var
> - proper multiline comment
> - func(args) instead of func (args)
> - 80 lines
>=20
> So from
> |total: 2 errors, 37 warnings, 654 lines checked
> we got to one warning.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/mtd/nand.h |  155 +++++++++++++++++++++++++++++-----------=
------
>  1 files changed, 99 insertions(+), 56 deletions(-)
>=20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 0238665..acd0b50 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -27,15 +27,17 @@
>  struct mtd_info;
>  struct nand_flash_dev;
>  /* Scan and identify a NAND device */
> -extern int nand_scan (struct mtd_info *mtd, int max_chips);
> -/* Separate phases of nand_scan(), allowing board driver to intervene
> - * and override command or ECC setup according to flash type */
> +extern int nand_scan(struct mtd_info *mtd, int max_chips);
> +/*
> + * Separate phases of nand_scan(), allowing board driver to intervene
> + * and override command or ECC setup according to flash type.
> + */
>  extern int nand_scan_ident(struct mtd_info *mtd, int max_chips,
>  			   struct nand_flash_dev *table);
>  extern int nand_scan_tail(struct mtd_info *mtd);
> =20
>  /* Free resources held by the NAND device */
> -extern void nand_release (struct mtd_info *mtd);
> +extern void nand_release(struct mtd_info *mtd);
> =20
>  /* Internal helper for board drivers which need to override command func=
tion */
>  extern void nand_wait_ready(struct mtd_info *mtd);
> @@ -49,7 +51,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs=
, uint64_t len);
>  /* The maximum number of NAND chips in an array */
>  #define NAND_MAX_CHIPS		8
> =20
> -/* This constant declares the max. oobsize / page, which
> +/*
> + * This constant declares the max. oobsize / page, which
>   * is supported now. If you add a chip with bigger oobsize/page
>   * adjust this accordingly.
>   */
> @@ -153,9 +156,10 @@ typedef enum {
>  #define NAND_GET_DEVICE		0x80
> =20
> =20
> -/* Option constants for bizarre disfunctionality and real
> -*  features
> -*/
> +/*
> + * Option constants for bizarre disfunctionality and real
> + * features.
> + */
>  /* Chip can not auto increment pages */
>  #define NAND_NO_AUTOINCR	0x00000001
>  /* Buswitdh is 16 bit */
> @@ -166,19 +170,27 @@ typedef enum {
>  #define NAND_CACHEPRG		0x00000008
>  /* Chip has copy back function */
>  #define NAND_COPYBACK		0x00000010
> -/* AND Chip which has 4 banks and a confusing page / block
> - * assignment. See Renesas datasheet for further information */
> +/*
> + * AND Chip which has 4 banks and a confusing page / block
> + * assignment. See Renesas datasheet for further information.
> + */
>  #define NAND_IS_AND		0x00000020
> -/* Chip has a array of 4 pages which can be read without
> - * additional ready /busy waits */
> +/*
> + * Chip has a array of 4 pages which can be read without
> + * additional ready /busy waits.
> + */
>  #define NAND_4PAGE_ARRAY	0x00000040
> -/* Chip requires that BBT is periodically rewritten to prevent
> +/*
> + * Chip requires that BBT is periodically rewritten to prevent
>   * bits from adjacent blocks from 'leaking' in altering data.
> - * This happens with the Renesas AG-AND chips, possibly others.  */
> + * This happens with the Renesas AG-AND chips, possibly others.
> + */
>  #define BBT_AUTO_REFRESH	0x00000080
> -/* Chip does not require ready check on read. True
> +/*
> + * Chip does not require ready check on read. True
>   * for all large page devices, as they do not support
> - * autoincrement.*/
> + * autoincrement.
> + */
>  #define NAND_NO_READRDY		0x00000100
>  /* Chip does not allow subpage writes */
>  #define NAND_NO_SUBPAGE_WRITE	0x00000200
> @@ -213,8 +225,10 @@ typedef enum {
>  #define NAND_USE_FLASH_BBT	0x00010000
>  /* This option skips the bbt scan during initialization. */
>  #define NAND_SKIP_BBTSCAN	0x00020000
> -/* This option is defined if the board driver allocates its own buffers
> -   (e.g. because it needs them DMA-coherent */
> +/*
> + * This option is defined if the board driver allocates its own buffers
> + * (e.g. because it needs them DMA-coherent).
> + */
>  #define NAND_OWN_BUFFERS	0x00040000
>  /* Chip may not exist, so silence any errors in scan */
>  #define NAND_SCAN_SILENT_NODEV	0x00080000
> @@ -304,8 +318,9 @@ struct nand_onfi_params {
>   * struct nand_hw_control - Control structure for hardware controller (e=
=2Eg ECC generator) shared among independent devices
>   * @lock:               protection lock
>   * @active:		the mtd device which holds the controller currently
> - * @wq:			wait queue to sleep on if a NAND operation is in progress
> - *                      used instead of the per chip wait queue when a h=
w controller is available
> + * @wq:			wait queue to sleep on if a NAND operation is in
> + *			progress used instead of the per chip wait queue
> + *			when a hw controller is available.
>   */
>  struct nand_hw_control {
>  	spinlock_t	 lock;
> @@ -329,9 +344,11 @@ struct nand_hw_control {
>   * @correct:	function for ecc correction, matching to ecc generator (sw/=
hw)
>   * @read_page_raw:	function to read a raw page without ECC
>   * @write_page_raw:	function to write a raw page without ECC
> - * @read_page:	function to read a page according to the ecc generator re=
quirements
> + * @read_page:	function to read a page according to the ecc generator
> + *		requirements.
>   * @read_subpage:	function to read parts of the page covered by ECC.
> - * @write_page:	function to write a page according to the ecc generator =
requirements
> + * @write_page:	function to write a page according to the ecc generator
> + *		requirements.
>   * @read_oob:	function to read chip OOB data
>   * @write_oob:	function to write chip OOB data
>   */
> @@ -393,13 +410,16 @@ struct nand_buffers {
> =20
>  /**
>   * struct nand_chip - NAND Private Flash Chip Data
> - * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the f=
lash device
> - * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the =
flash device
> + * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
> + *			flash device
> + * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
> + *			flash device.
>   * @read_byte:		[REPLACEABLE] read one byte from the chip
>   * @read_word:		[REPLACEABLE] read one word from the chip
>   * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
>   * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
> - * @verify_buf:		[REPLACEABLE] verify buffer contents against the chip d=
ata
> + * @verify_buf:		[REPLACEABLE] verify buffer contents against the chip
> + *			data.
>   * @select_chip:	[REPLACEABLE] select chip nr
>   * @block_bad:		[REPLACEABLE] check, if the block is bad
>   * @block_markbad:	[REPLACEABLE] mark the block bad
> @@ -409,45 +429,60 @@ struct nand_buffers {
>   *			mtd->oobsize, mtd->writesize and so on.
>   *			@id_data contains the 8 bytes values of NAND_CMD_READID.
>   *			Return with the bus width.
> - * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accesing d=
evice ready/busy line
> - *			If set to NULL no access to ready/busy is available and the ready/b=
usy information
> - *			is read from the chip status register
> - * @cmdfunc:		[REPLACEABLE] hardwarespecific function for writing comman=
ds to the chip
> - * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on ready
> + * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accesing
> + *			device ready/busy line. If set to NULL no access to
> + *			ready/busy is available and the ready/busy information
> + *			is read from the chip status register.
> + * @cmdfunc:		[REPLACEABLE] hardwarespecific function for writing
> + *			commands to the chip.
> + * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on
> + *			ready.
>   * @ecc:		[BOARDSPECIFIC] ecc control ctructure
>   * @buffers:		buffer structure for read/write
>   * @hwcontrol:		platform-specific hardware control structure
>   * @ops:		oob operation operands
> - * @erase_cmd:		[INTERN] erase command write function, selectable due to=
 AND support
> + * @erase_cmd:		[INTERN] erase command write function, selectable due
> + *			to AND support.
>   * @scan_bbt:		[REPLACEABLE] function to scan bad block table
> - * @chip_delay:		[BOARDSPECIFIC] chip dependent delay for transfering da=
ta from array to read regs (tR)
> + * @chip_delay:		[BOARDSPECIFIC] chip dependent delay for transfering
> + *			data from array to read regs (tR).
>   * @state:		[INTERN] the current state of the NAND device
>   * @oob_poi:		poison value buffer
> - * @page_shift:		[INTERN] number of address bits in a page (column addre=
ss bits)
> + * @page_shift:		[INTERN] number of address bits in a page (column
> + *			address bits).
>   * @phys_erase_shift:	[INTERN] number of address bits in a physical eras=
eblock
>   * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
>   * @chip_shift:		[INTERN] number of address bits in one chip
> - * @options:		[BOARDSPECIFIC] various chip options. They can partly be s=
et to inform nand_scan about
> - *			special functionality. See the defines for further explanation
> - * @badblockpos:	[INTERN] position of the bad block marker in the oob ar=
ea
> + * @options:		[BOARDSPECIFIC] various chip options. They can partly
> + *			be set to inform nand_scan about special functionality.
> + *			See the defines for further explanation.
> + * @badblockpos:	[INTERN] position of the bad block marker in the oob
> + *			area.
>   * @cellinfo:		[INTERN] MLC/multichip data from chip ident
>   * @numchips:		[INTERN] number of physical chips
>   * @chipsize:		[INTERN] the size of one chip for multichip arrays
>   * @pagemask:		[INTERN] page number mask =3D number of (pages / chip) - 1
> - * @pagebuf:		[INTERN] holds the pagenumber which is currently in data_b=
uf
> + * @pagebuf:		[INTERN] holds the pagenumber which is currently in
> + *			data_buf.
>   * @subpagesize:	[INTERN] holds the subpagesize
> - * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded), no=
n 0 if ONFI supported
> - * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is sup=
ported, 0 otherwise
> + * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded),
> + *			non 0 if ONFI supported.
> + * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
> + *			supported, 0 otherwise.
>   * @ecclayout:		[REPLACEABLE] the default ecc placement scheme
>   * @bbt:		[INTERN] bad block table pointer
> - * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash lookup
> + * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
> + *			lookup.
>   * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
> - * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for init=
ial bad block scan
> - * @controller:		[REPLACEABLE] a pointer to a hardware controller struct=
ure
> - *			which is shared among multiple independend devices
> + * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for init=
ial
> + *			bad block scan.
> + * @controller:		[REPLACEABLE] a pointer to a hardware controller
> + *			structure which is shared among multiple independend
> + *			devices.
>   * @priv:		[OPTIONAL] pointer to private chip date
> - * @errstat:		[OPTIONAL] hardware specific function to perform additiona=
l error status checks
> - *			(determine if errors are correctable)
> + * @errstat:		[OPTIONAL] hardware specific function to perform
> + *			additional error status checks (determine if errors are
> + *			correctable).
>   * @write_page:		[REPLACEABLE] High-level page write function
>   */
> =20
> @@ -457,24 +492,32 @@ struct nand_chip {
> =20
>  	uint8_t		(*read_byte)(struct mtd_info *mtd);
>  	u16		(*read_word)(struct mtd_info *mtd);
> -	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
> -	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
> -	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
> +	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf,
> +			int len);

It might be more readable to get rid of the tabs after the type and keep the
arguments in one line?

> +	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf,
> +			int len);
> +	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf,
> +			int len);
>  	void		(*select_chip)(struct mtd_info *mtd, int chip);
> -	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
> +	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs,
> +			int getchip);
>  	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
>  	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
>  				    unsigned int ctrl);
>  	int		(*init_size)(struct mtd_info *mtd,
>  					struct nand_chip *this, u8 *id_data);
>  	int		(*dev_ready)(struct mtd_info *mtd);
> -	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command, int column, in=
t page_addr);
> -	int		(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
> +	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command,
> +			int column, int page_addr);
> +	int		(*waitfunc)(struct mtd_info *mtd,
> +			struct nand_chip *this);
>  	void		(*erase_cmd)(struct mtd_info *mtd, int page);
>  	int		(*scan_bbt)(struct mtd_info *mtd);
> -	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state=
, int status, int page);
> -	int		(*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> -				      const uint8_t *buf, int page, int cached, int raw);
> +	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this,
> +			int state, int status, int page);
> +	int		(*write_page)(struct mtd_info *mtd,
> +			struct nand_chip *chip, const uint8_t *buf, int page,
> +			int cached, int raw);
> =20
>  	int		chip_delay;
>  	unsigned int	options;
> @@ -557,7 +600,7 @@ struct nand_flash_dev {
>  */
>  struct nand_manufacturers {
>  	int id;
> -	char * name;
> +	char *name;
>  };
> =20
>  extern struct nand_flash_dev nand_flash_ids[];
> @@ -570,7 +613,7 @@ extern int nand_isbad_bbt(struct mtd_info *mtd, loff_=
t offs, int allowbbt);
>  extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *inst=
r,
>  			   int allowbbt);
>  extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
> -			size_t * retlen, uint8_t * buf);
> +			size_t *retlen, uint8_t *buf);
> =20
>  /**
>   * struct platform_nand_chip - chip level device structure
> --=20
> 1.7.2.3
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkyrbfAACgkQD27XaX1/VRuRswCeOwkfAGzMsW5zrViFaCKrEOcF
9j8An2dbRfr7zp9qpg/cwApokecM68xq
=IqEN
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
