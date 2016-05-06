Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayU4P-0000mO-Gr
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:56:42 +0000
Received: by mail-pf0-x22c.google.com with SMTP id 206so43601336pfu.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:56:21 -0700 (PDT)
Date: Thu, 5 May 2016 17:56:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jagan Teki <jteki@openedev.com>, Marek Vasut <marex@denx.de>,
 "Andrew F. Davis" <afd@ti.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 Furquan Shaikh <furquan@google.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mtd: spi-nor: Add support for S3AN spi-nor devices
Message-ID: <20160506005617.GB89390@google.com>
References: <1461762862-8090-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461762862-8090-1-git-send-email-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 27, 2016 at 03:14:22PM +0200, Ricardo Ribalda Delgado wrote:
> Xilinx Spartan-3AN contain an embedded spi device where they keep their
> configuration data and optionally some user data.
> 
> The protocol of this flash follows most of the spi-nor standard. With
> the following differences:
> 
> - Page size might not be a power of two.
> - The address calculation.
> - The spi nor commands used.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> 
> I did send this patch 3 months ago with no feedback.
> I have rebased the code to the latest version of mtd/master
> 
> 
>  drivers/mtd/devices/m25p80.c  |  3 ++
>  drivers/mtd/spi-nor/spi-nor.c | 96 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   | 13 ++++++
>  3 files changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c9c3b7fa3051..869576735978 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -49,6 +49,9 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>  
>  static void m25p_addr2cmd(struct spi_nor *nor, unsigned int addr, u8 *cmd)
>  {
> +	if (nor->addr_convert)
> +		addr = nor->addr_convert(nor, addr);
> +
>  	/* opcode is in cmd[0] */
>  	cmd[1] = addr >> (nor->addr_width * 8 -  8);
>  	cmd[2] = addr >> (nor->addr_width * 8 - 16);
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 157841dc3e99..d07d763fcfc4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,7 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define	SPI_S3AN		BIT(10)	/* Xililnx S3AN Embedded SPI nor*/

Spacing is wrong. Please add a space between "nor" and "*/".

>  };
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
> @@ -217,6 +218,21 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>  		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>  	}
>  }
> +
> +static inline int s3an_sr_ready(struct spi_nor *nor)

We should probably remove some of the inline eslewhere. Drop it, and let
the compiler decide.

> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +	if (ret < 0) {
> +		pr_err("error %d reading SR\n", (int) ret);
> +		return ret;
> +	}
> +
> +	return !!(val & XSR_RDY);
> +}
> +
>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>  	int sr = read_sr(nor);
> @@ -238,7 +254,7 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  static int spi_nor_ready(struct spi_nor *nor)
>  {
>  	int sr, fsr;
> -	sr = spi_nor_sr_ready(nor);
> +	sr = nor->sr_ready(nor);
>  	if (sr < 0)
>  		return sr;
>  	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> @@ -334,6 +350,9 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  	 * Default implementation, if driver doesn't have a specialized HW
>  	 * control
>  	 */
> +	if (nor->addr_convert)
> +		addr = nor->addr_convert(nor, addr);
> +
>  	for (i = nor->addr_width - 1; i >= 0; i--) {
>  		buf[i] = addr & 0xff;
>  		addr >>= 8;
> @@ -368,7 +387,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		return ret;
>  
>  	/* whole-chip erase? */
> -	if (len == mtd->size) {
> +	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>  		unsigned long timeout;
>  
>  		write_enable(nor);
> @@ -782,6 +801,19 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  		.addr_width = (_addr_width),				\
>  		.flags = (_flags),
>  
> +#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
> +		.id = {							\
> +			((_jedec_id) >> 16) & 0xff,			\
> +			((_jedec_id) >> 8) & 0xff,			\
> +			(_jedec_id) & 0xff				\
> +			},						\
> +		.id_len = 3,						\
> +		.sector_size = (8*_page_size),				\
> +		.n_sectors = (_n_sectors),				\
> +		.page_size = _page_size,				\
> +		.addr_width = 3,					\
> +		.flags = SPI_NOR_NO_FR | SPI_S3AN,
> +
>  /* NOTE: double check command sets and memory organization when you add
>   * more nor chips.  This current list focusses on newer chips, which
>   * have been converging on command sets which including JEDEC ID.
> @@ -991,6 +1023,13 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>  	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +
> +	/* Xilinx S3AN Internal Flash */
> +	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
> +	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
> +	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
> +	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
> +	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
>  	{ },
>  };
>  
> @@ -1122,7 +1161,13 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  	write_enable(nor);
>  
> -	page_offset = to & (nor->page_size - 1);
> +	if (hweight32(nor->page_size) == 1)
> +		page_offset = to & (nor->page_size - 1);
> +	else {
> +		uint64_t aux = to;
> +
> +		page_offset = do_div(aux, nor->page_size);
> +	}
>  
>  	/* do all the bytes fit onto one page? */
>  	if (page_offset + len <= nor->page_size) {
> @@ -1250,6 +1295,43 @@ static int spi_nor_check(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static unsigned int s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
> +{
> +	if (nor->page_size == 264)
> +		return (addr / 264) * 512 + (addr % 264);
> +
> +	return (addr / 528) * 1024 + (addr % 528);
> +}

Whoa this is fugly. Why does this mode exist? Can we ignore it and just
use the poewr-of-two mode? If not, I think we need a bit more verbose of
comments in the code to explain what/why we are doing.

> +
> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +	if (ret < 0) {
> +		pr_err("error %d reading SR\n", (int) ret);
> +		return ret;
> +	}
> +
> +	nor->erase_opcode = SPINOR_OP_XSE;
> +	nor->program_opcode = SPINOR_OP_XPP;
> +	nor->read_opcode = SPINOR_OP_READ;
> +	nor->sr_ready = s3an_sr_ready;

No, we don't need another function callback. Can't we use a SNOR_F_...
flag?

> +	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> +
> +	/*Flash in Power of 2 mode*/
> +	if (val & XSR_PAGESIZE) {
> +		nor->page_size = (nor->page_size == 264) ? 256 : 512;
> +		nor->mtd.writebufsize = nor->page_size;
> +		nor->mtd.size = 8 * nor->page_size * info->n_sectors;
> +		nor->mtd.erasesize = 8 * nor->page_size;
> +	} else

Mismatching braces? You should use this style:

	if (foo) {
		more than;
		one line;
	} else {
		just one line;
	}

> +		nor->addr_convert = s3an_addr_convert;
> +
> +	return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  {
>  	const struct flash_info *info = NULL;
> @@ -1415,6 +1497,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	}
>  
>  	nor->program_opcode = SPINOR_OP_PP;
> +	nor->sr_ready = spi_nor_sr_ready;
>  
>  	if (info->addr_width)
>  		nor->addr_width = info->addr_width;
> @@ -1455,6 +1538,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  
>  	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
>  
> +	if (info->flags & SPI_S3AN) {

Maybe instead of this flag, you can just use the mfr ID? So:

	if (JEDEC_MFR(info) == SNOR_MFR_...) { // what would you call the "manfacturer" here anyway?

> +		ret = s3an_nor_scan(info, nor);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
>  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>  			(long long)mtd->size >> 10);
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 3c36113a88e1..0d4b57a0ccd6 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -67,6 +67,15 @@
>  #define SPINOR_OP_WRDI		0x04	/* Write disable */
>  #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
>  
> +/* Used for S3AN flashes only */
> +#define SPINOR_OP_XSE		0x50	/* Sector erase */
> +#define SPINOR_OP_XPP		0x82	/* Page program */
> +#define SPINOR_OP_XRDSR		0xd7	/* Read status register */
> +
> +#define XSR_PAGESIZE		BIT(0)	/* Page size in Po2 or Linear */
> +#define XSR_RDY			BIT(7)	/* Ready */
> +
> +
>  /* Used for Macronix and Winbond flashes. */
>  #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
>  #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
> @@ -118,6 +127,7 @@ enum spi_nor_ops {
>  enum spi_nor_option_flags {
>  	SNOR_F_USE_FSR		= BIT(0),
>  	SNOR_F_HAS_SR_TB	= BIT(1),
> +	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
>  };
>  
>  /**
> @@ -172,6 +182,9 @@ struct spi_nor {
>  	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>  	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>  
> +	int (*sr_ready)(struct spi_nor *nor);
> +	unsigned int (*addr_convert)(struct spi_nor *nor, unsigned int addr);
> +
>  	int (*read)(struct spi_nor *nor, loff_t from,
>  			size_t len, size_t *retlen, u_char *read_buf);
>  	void (*write)(struct spi_nor *nor, loff_t to,

Brian
