Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFStl-0000yL-BC
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 22:12:27 +0000
Date: Tue, 30 May 2017 00:11:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Message-ID: <20170530001152.1d8beb72@bbrezillon>
In-Reply-To: <1495609631-18880-12-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 May 2017 15:07:07 +0800
Peter Pan <peterpandong@micron.com> wrote:

> This commit is to support read, readoob, write,
> writeoob and erase operations in the new spi nand
> framework. No ECC support right now.

I still don't understand why patch 10 and 11 are separated. I'd prefer
to see one single patch adding basic spi-nand support, that is,
everything to support detection+initialization+read/write access.

> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/core.c | 638 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h |   3 +
>  2 files changed, 641 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 93ce212..6251469 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -108,6 +108,222 @@ static int spinand_read_status(struct spinand_device *spinand, u8 *status)
>  }
>  
>  /**
> + * spinand_get_cfg - get configuration register value
> + * @spinand: SPI NAND device structure
> + * @cfg: buffer to store value
> + * Description:
> + *   Configuration register includes OTP config, Lock Tight enable/disable
> + *   and Internal ECC enable/disable.
> + */
> +static int spinand_get_cfg(struct spinand_device *spinand, u8 *cfg)
> +{
> +	return spinand_read_reg(spinand, REG_CFG, cfg);
> +}
> +
> +/**
> + * spinand_set_cfg - set value to configuration register
> + * @spinand: SPI NAND device structure
> + * @cfg: value to set
> + * Description:
> + *   Configuration register includes OTP config, Lock Tight enable/disable
> + *   and Internal ECC enable/disable.
> + */
> +static int spinand_set_cfg(struct spinand_device *spinand, u8 cfg)
> +{
> +	return spinand_write_reg(spinand, REG_CFG, cfg);
> +}
> +
> +/**
> + * spinand_disable_ecc - disable internal ECC
> + * @spinand: SPI NAND device structure
> + */
> +static void spinand_disable_ecc(struct spinand_device *spinand)
> +{
> +	u8 cfg = 0;
> +
> +	spinand_get_cfg(spinand, &cfg);
> +
> +	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE) {
> +		cfg &= ~CFG_ECC_ENABLE;
> +		spinand_set_cfg(spinand, cfg);
> +	}

Is this really a generic (manufacturer-agnostic) feature??? I had the
feeling that is was only working for Micron. If that's the case, this
'disable-ecc' step should be done in spi/micron.c in a
micron_spinand_init() function.

> +}
> +
> +/**
> + * spinand_write_enable - send command 06h to enable write or erase the
> + * NAND cells
> + * @spinand: SPI NAND device structure
> + */
> +static int spinand_write_enable(struct spinand_device *spinand)
> +{
> +	struct spinand_op op;
> +
> +	spinand_init_op(&op);
> +	op.cmd = SPINAND_CMD_WR_ENABLE;
> +
> +	return spinand_exec_op(spinand, &op);
> +}
> +
> +/**
> + * spinand_read_page_to_cache - send command 13h to read data from NAND array
> + * to cache
> + * @spinand: SPI NAND device structure
> + * @page_addr: page to read
> + */
> +static int spinand_read_page_to_cache(struct spinand_device *spinand,
> +				      u32 page_addr)
> +{
> +	struct spinand_op op;
> +
> +	spinand_init_op(&op);
> +	op.cmd = SPINAND_CMD_PAGE_READ;
> +	op.n_addr = 3;
> +	op.addr[0] = (u8)(page_addr >> 16);
> +	op.addr[1] = (u8)(page_addr >> 8);
> +	op.addr[2] = (u8)page_addr;
> +
> +	return spinand_exec_op(spinand, &op);
> +}
> +
> +/**
> + * spinand_get_address_bits - return address should be transferred
> + * by how many bits
> + * @opcode: command's operation code
> + */
> +static int spinand_get_address_bits(u8 opcode)
> +{
> +	switch (opcode) {
> +	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
> +		return 4;
> +	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +/**
> + * spinand_get_data_bits - return data should be transferred by how many bits
> + * @opcode: command's operation code
> + */
> +static int spinand_get_data_bits(u8 opcode)
> +{
> +	switch (opcode) {
> +	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
> +	case SPINAND_CMD_READ_FROM_CACHE_X4:
> +	case SPINAND_CMD_PROG_LOAD_X4:
> +	case SPINAND_CMD_PROG_LOAD_RDM_DATA_X4:
> +		return 4;
> +	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
> +	case SPINAND_CMD_READ_FROM_CACHE_X2:
> +		return 2;
> +	default:
> +		return 1;
> +	}
> +}
> +
> +/**
> + * spinand_read_from_cache - read data out from cache register
> + * @spinand: SPI NAND device structure
> + * @page_addr: page to read
> + * @column: the location to read from the cache
> + * @len: number of bytes to read
> + * @rbuf: buffer held @len bytes
> + */
> +static int spinand_read_from_cache(struct spinand_device *spinand,
> +				   u32 page_addr, u32 column,
> +				   size_t len, u8 *rbuf)
> +{
> +	struct spinand_op op;
> +
> +	spinand_init_op(&op);
> +	op.cmd = spinand->read_cache_op;
> +	op.n_addr = 2;
> +	op.addr[0] = (u8)(column >> 8);
> +	op.addr[1] = (u8)column;

Casts are unneeded here.

> +	op.addr_nbits = spinand_get_address_bits(spinand->read_cache_op);
> +	op.n_rx = len;
> +	op.rx_buf = rbuf;
> +	op.data_nbits = spinand_get_data_bits(spinand->read_cache_op);
> +
> +	if (spinand->manufacturer.manu->ops->prepare_op)
> +		spinand->manufacturer.manu->ops->prepare_op(spinand, &op,
> +							    page_addr, column);
> +
> +	return spinand_exec_op(spinand, &op);
> +}
> +
> +/**
> + * spinand_write_to_cache - write data to cache register
> + * @spinand: SPI NAND device structure
> + * @page_addr: page to write
> + * @column: the location to write to the cache
> + * @len: number of bytes to write
> + * @wrbuf: buffer held @len bytes
> + */
> +static int spinand_write_to_cache(struct spinand_device *spinand, u32 page_addr,
> +				  u32 column, size_t len, const u8 *wbuf)
> +{
> +	struct spinand_op op;
> +
> +	spinand_init_op(&op);
> +	op.cmd = spinand->write_cache_op;
> +	op.n_addr = 2;
> +	op.addr[0] = (u8)(column >> 8);
> +	op.addr[1] = (u8)column;
> +	op.addr_nbits = spinand_get_address_bits(spinand->write_cache_op);
> +	op.n_tx = len;
> +	op.tx_buf = wbuf;
> +	op.data_nbits = spinand_get_data_bits(spinand->write_cache_op);
> +
> +	if (spinand->manufacturer.manu->ops->prepare_op)
> +		spinand->manufacturer.manu->ops->prepare_op(spinand, &op,
> +							    page_addr, column);
> +
> +	return spinand_exec_op(spinand, &op);
> +}
> +
> +/**
> + * spinand_program_execute - send command 10h to write a page from
> + * cache to the NAND array
> + * @spinand: SPI NAND device structure
> + * @page_addr: the physical page location to write the page.
> + */
> +static int spinand_program_execute(struct spinand_device *spinand,
> +				   u32 page_addr)
> +{
> +	struct spinand_op op;
> +
> +	spinand_init_op(&op);
> +	op.cmd = SPINAND_CMD_PROG_EXC;
> +	op.n_addr = 3;
> +	op.addr[0] = (u8)(page_addr >> 16);
> +	op.addr[1] = (u8)(page_addr >> 8);
> +	op.addr[2] = (u8)page_addr;

You don't need to adjust the number of dummy cycles here?

The usage of ->prepare_op() is really weird, maybe you should document
a bit more when it's supposed to be used.

> +
> +	return spinand_exec_op(spinand, &op);
> +}
> +

[...]

>  
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index dd9da71..04ad1dd 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -103,11 +103,14 @@ struct spinand_controller_ops {
>   *          return directly and let others to detect.
>   * @init: initialize SPI NAND device.
>   * @cleanup: clean SPI NAND device footprint.
> + * @prepare_op: prepara read/write operation.

		   ^ prepare



>   */
>  struct spinand_manufacturer_ops {
>  	bool (*detect)(struct spinand_device *spinand);
>  	int (*init)(struct spinand_device *spinand);
>  	void (*cleanup)(struct spinand_device *spinand);
> +	void (*prepare_op)(struct spinand_device *spinand,
> +			   struct spinand_op *op, u32 page, u32 column);

It seems to be here to prepare read/write page operations, so I'd like
to rename this method ->prepare_page_op() if you don't mind.

>  };
>  
>  /**
