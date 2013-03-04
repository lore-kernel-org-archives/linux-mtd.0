Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYbB-0007jw-RY
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:50:55 +0000
Date: Mon, 4 Mar 2013 17:50:45 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20130304165045.GQ22886@pengutronix.de>
References: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I forgot to add Huang Shijie to Cc: and copied the wrong Message-Id for
the --in-reply-to parameter to git-send-email.

@Huang Shijie: I didn't carry over your Ack to this new patch. Are you
still happy with this one?

Sorry,
Uwe

On Mon, Mar 04, 2013 at 05:47:35PM +0100, Uwe Kleine-König wrote:
> According to the Open NAND Flash Interface Specification (ONFI) Revision
> 3.1 "Parameters are always transferred on the lower 8-bits of the data
> bus." for the Get Features and Set Features commands.
> 
> So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> they use I/O[15:0]. The Get Features command is easily fixed using 4
> times the read_byte callback. For Set Features implement a new
> overwritable callback "write_byte". Still I expect the default to work
> just fine for all controllers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> 
> Notes:
>     v1 got an
>     	Acked-by: Huang Shijie <b32955@freescale.com>
>     
>     Changes since (implicit) v1, sent with
>     Message-Id:1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de:
>     
>      - implement a new write_byte callback to also fix
>        nand_onfi_set_features (instead of returning -ENOSUPP in v1)
> 
>  drivers/mtd/nand/nand_base.c | 60 +++++++++++++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     |  3 +++
>  2 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 3766682..956b499 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -205,6 +205,50 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
>  }
>  
>  /**
> + * nand_write_byte - [DEFAULT] write single byte to chip
> + * @mtd: MTD device structure
> + * @byte: value to write
> + *
> + * Default function to write a byte to I/O[7:0]
> + */
> +static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +
> +	chip->write_buf(mtd, &byte, 1);
> +}
> +
> +/**
> + * nand_write_byte16 - [DEFAULT] write single byte to a chip with width 16
> + * @mtd: MTD device structure
> + * @byte: value to write
> + *
> + * Default function to write a byte to I/O[7:0] on a 16-bit wide chip.
> + */
> +static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +
> +	/*
> +	 * It's not entirely clear what should happen to I/O[15:8] when writing
> +	 * a byte. The ONFi spec (Revision 3.1; 2012-09-19, Section 2.16) reads:
> +	 *
> +	 *    When the host supports a 16-bit bus width, only data is
> +	 *    transferred at the 16-bit width. All address and command line
> +	 *    transfers shall use only the lower 8-bits of the data bus. During
> +	 *    command transfers, the host may place any value on the upper
> +	 *    8-bits of the data bus. During address transfers, the host shall
> +	 *    set the upper 8-bits of the data bus to 00h.
> +	 *
> +	 * One user of the write_byte callback is nand_onfi_set_features. The
> +	 * four parameters are specified to be written to I/O[7:0], but this is
> +	 * neither an address nor a command transfer. Let's assume a 0 on the
> +	 * upper I/O lines is OK.
> +	 */
> +	chip->write_buf(mtd, (uint8_t[]){ byte, 0 }, 2);
> +}
> +
> +/**
>   * nand_write_buf - [DEFAULT] write buffer to chip
>   * @mtd: MTD device structure
>   * @buf: data buffer
> @@ -2710,7 +2754,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  }
>  
>  /**
> - * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
> + * nand_onfi_set_features - [REPLACEABLE] set features for ONFI nand
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
> @@ -2720,12 +2764,15 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
>  			int addr, uint8_t *subfeature_param)
>  {
>  	int status;
> +	int i;
>  
>  	if (!chip->onfi_version)
>  		return -EINVAL;
>  
>  	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
> -	chip->write_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
> +	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> +		chip->write_byte(mtd, subfeature_param[i]);
> +
>  	status = chip->waitfunc(mtd, chip);
>  	if (status & NAND_STATUS_FAIL)
>  		return -EIO;
> @@ -2733,7 +2780,7 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /**
> - * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
> + * nand_onfi_get_features - [REPLACEABLE] get features for ONFI nand
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
>   * @addr: feature address.
> @@ -2742,6 +2789,8 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
>  static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
>  			int addr, uint8_t *subfeature_param)
>  {
> +	int i;
> +
>  	if (!chip->onfi_version)
>  		return -EINVAL;
>  
> @@ -2749,7 +2798,8 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
>  	memset(subfeature_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
>  
>  	chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES, addr, -1);
> -	chip->read_buf(mtd, subfeature_param, ONFI_SUBFEATURE_PARAM_LEN);
> +	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> +		*subfeature_param++ = chip->read_byte(mtd);
>  	return 0;
>  }
>  
> @@ -2804,6 +2854,8 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
>  		chip->block_markbad = nand_default_block_markbad;
>  	if (!chip->write_buf)
>  		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
> +	if (!chip->write_byte)
> +		chip->write_byte = busw ? nand_write_byte16 : nand_write_byte;
>  	if (!chip->read_buf)
>  		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
>  	if (!chip->scan_bbt)
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7ccb3c5..8ee4ed1 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -419,6 +419,8 @@ struct nand_buffers {
>   *			flash device.
>   * @read_byte:		[REPLACEABLE] read one byte from the chip
>   * @read_word:		[REPLACEABLE] read one word from the chip
> + * @write_byte		[REPLACEABLE] write a single byte to the chip on the
> + *			low 8 I/O lines
>   * @write_buf:		[REPLACEABLE] write data from the buffer to the chip
>   * @read_buf:		[REPLACEABLE] read data from the chip into the buffer
>   * @select_chip:	[REPLACEABLE] select chip nr
> @@ -503,6 +505,7 @@ struct nand_chip {
>  
>  	uint8_t (*read_byte)(struct mtd_info *mtd);
>  	u16 (*read_word)(struct mtd_info *mtd);
> +	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
>  	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
>  	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
>  	void (*select_chip)(struct mtd_info *mtd, int chip);
> -- 
> 1.8.2.rc2
> 
> 

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
