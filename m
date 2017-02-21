Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cg77W-0001j1-O9
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 09:52:33 +0000
Date: Tue, 21 Feb 2017 10:51:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 04/11] nand: spi: Add read function support
Message-ID: <20170221105153.75772e25@bbrezillon>
In-Reply-To: <1487664010-25926-5-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-5-git-send-email-peterpandong@micron.com>
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

On Tue, 21 Feb 2017 16:00:03 +0800
Peter Pan <peterpandong@micron.com> wrote:

> Add read/readoob support for SPI NAND. Will be
> registered under struct mtd_info later.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/spi/spi-nand-base.c | 321 +++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nand.h         |   3 +
>  2 files changed, 324 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
> index b75e5cd..ee94eb8 100644
> --- a/drivers/mtd/nand/spi/spi-nand-base.c
> +++ b/drivers/mtd/nand/spi/spi-nand-base.c
> @@ -18,9 +18,62 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/mtd/spi-nand.h>
>  
> +/**
> + * spi_nand_get_device - [GENERIC] Get chip for selected access
> + * @mtd: MTD device structure
> + * @new_state: the state which is requested
> + *
> + * Get the device and lock it for exclusive access
> + */
> +static int spi_nand_get_device(struct mtd_info *mtd, int new_state)
> +{
> +	struct spi_nand_chip *this = mtd_to_spi_nand(mtd);
> +	DECLARE_WAITQUEUE(wait, current);
> +
> +	/*
> +	 * Grab the lock and see if the device is available
> +	 */
> +	while (1) {
> +		spin_lock(&this->chip_lock);
> +		if (this->state == FL_READY) {
> +			this->state = new_state;
> +			spin_unlock(&this->chip_lock);
> +			break;
> +		}
> +		if (new_state == FL_PM_SUSPENDED) {
> +			spin_unlock(&this->chip_lock);
> +			return (this->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
> +		}
> +		set_current_state(TASK_UNINTERRUPTIBLE);
> +		add_wait_queue(&this->wq, &wait);
> +		spin_unlock(&this->chip_lock);
> +		schedule();
> +		remove_wait_queue(&this->wq, &wait);
> +	}

Do we really need this fl_state dance? It could be replaced with a
simple mutex that is taken for the whole flash operation. This leaves
the suspended case which could be handled with:

static void spinand_suspend(struct mtd_info *mtd)
{
	struct spi_nand_chip *this = mtd_to_spinand(mtd);

	if (!mutex_trylock(&this->lock))
		return -EAGAIN;

	return 0;
}

For other operations (read, write, lock, unlock, ...), you just have to
take the lock before accessing the NAND and release it when you're done.

Again, I'm saying that because I don't want to end up with something
that is overly complex for no real reason, but maybe I'm missing
something. 

> +	return 0;
> +}
> +
> +/**
> + * spi_nand_release_device - [GENERIC] release chip
> + * @mtd: MTD device structure
> + *
> + * Deselect, release chip lock and wake up anyone waiting on the device
> + */
> +static void spi_nand_release_device(struct mtd_info *mtd)
> +{
> +	struct spi_nand_chip *this = mtd_to_spi_nand(mtd);
> +
> +	/* Release the chip */
> +	spin_lock(&this->chip_lock);
> +	this->state = FL_READY;
> +	wake_up(&this->wq);
> +	spin_unlock(&this->chip_lock);
> +}
> +
>  static inline int spi_nand_issue_cmd(struct spi_nand_chip *chip,
>  				struct spi_nand_cmd *cmd)
>  {
> @@ -313,6 +366,36 @@ static int spi_nand_erase_block(struct spi_nand_chip *chip,
>  }
>  
>  /**
> + * spi_nand_wait - wait until the command is done
> + * @chip: SPI-NAND device structure
> + * @s: buffer to store status register(can be NULL)
> + */
> +static int spi_nand_wait(struct spi_nand_chip *chip, u8 *s)
> +{
> +	unsigned long timeo = jiffies;
> +	u8 status;
> +	int ret = -ETIMEDOUT;
> +	int count = 0;
> +
> +	#define MIN_TRY_COUNT 3

Please, no macro definitions inside functions.

> +	timeo += msecs_to_jiffies(20);
> +
> +	while (time_before(jiffies, timeo) || count < MIN_TRY_COUNT) {
> +		spi_nand_read_status(chip, &status);
> +		if ((status & STATUS_OIP_MASK) == STATUS_READY) {
> +			ret = 0;
> +			goto out;
> +		}
> +		count++;
> +	}


Hm, if your SPI controller is not able to read 3 times the status reg
in 20ms it means it's really slow.

I'd recommend doing something like:

	do {
		spi_nand_read_status(chip, &status);
		if ((status & STATUS_OIP_MASK) == STATUS_READY)
			goto out;
	} while (time_before(jiffies, timeo));

	/*
	 * Extra read, just in case the STATUS_READY bit has changed
	 * since out last check
	 */
	spi_nand_read_status(chip, &status);

> +out:
> +	if (s)
> +		*s = status;
> +
> +	return ret;

	return (status & STATUS_OIP_MASK) == STATUS_READY ? 0 :	-ETIMEDOUT;

> +}
> +
> +/**
>   * spi_nand_read_id - send 9Fh command to get ID
>   * @chip: SPI-NAND device structure
>   * @buf: buffer to store id
> @@ -363,6 +446,244 @@ static int spi_nand_lock_block(struct spi_nand_chip *chip, u8 lock)
>  	return spi_nand_write_reg(chip, REG_BLOCK_LOCK, &lock);
>  }
>  
> +/**
> + * spi_nand_do_read_page - read page from flash to buffer
> + * @mtd: MTD device structure
> + * @page_addr: page address/raw address
> + * @column: column address
> + * @ecc_off: without ecc or not
> + * @corrected: how many bit error corrected
> + * @buf: data buffer
> + * @len: data length to read
> + */
> +static int spi_nand_do_read_page(struct mtd_info *mtd, u32 page_addr,
> +			bool ecc_off, int *corrected, bool oob_only)
> +{
> +	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	int ret, ecc_error = 0;
> +	u8 status;
> +
> +	spi_nand_read_page_to_cache(chip, page_addr);
> +	ret = spi_nand_wait(chip, &status);
> +	if (ret < 0) {
> +		pr_err("error %d waiting page 0x%x to cache\n",
> +			ret, page_addr);
> +		return ret;
> +	}
> +	if (!oob_only)
> +		spi_nand_read_from_cache(chip, page_addr, 0,
> +		nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
> +	else
> +		spi_nand_read_from_cache(chip, page_addr, nand_page_size(nand),
> +				nand_per_page_oobsize(nand), chip->oobbuf);
> +	if (!ecc_off) {
> +		chip->get_ecc_status(chip, status, corrected, &ecc_error);
> +		/*
> +		 * If there's an ECC error, print a message and notify MTD
> +		 * about it. Then complete the read, to load actual data on
> +		 * the buffer (instead of the status result).
> +		 */
> +		if (ecc_error) {
> +			pr_err("internal ECC error reading page 0x%x\n",
> +				page_addr);
> +			mtd->ecc_stats.failed++;
> +		} else if (*corrected) {
> +			mtd->ecc_stats.corrected += *corrected;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_nand_transfer_oob - transfer oob to client buffer
> + * @chip: SPI-NAND device structure
> + * @oob: oob destination address
> + * @ops: oob ops structure
> + * @len: size of oob to transfer
> + */
> +static void spi_nand_transfer_oob(struct spi_nand_chip *chip, u8 *oob,
> +				  struct mtd_oob_ops *ops, size_t len)
> +{
> +	struct mtd_info *mtd = spi_nand_to_mtd(chip);
> +	int ret;
> +
> +	switch (ops->mode) {
> +
> +	case MTD_OPS_PLACE_OOB:
> +	case MTD_OPS_RAW:
> +		memcpy(oob, chip->oobbuf + ops->ooboffs, len);
> +		return;
> +
> +	case MTD_OPS_AUTO_OOB:
> +		ret = mtd_ooblayout_get_databytes(mtd, oob, chip->oobbuf,
> +						  ops->ooboffs, len);
> +		BUG_ON(ret);
> +		return;
> +
> +	default:
> +		BUG();

Let's try to avoid these BUG_ON() calls. If you want transfer_oob() to
report an error, change the function prototype and check the ret code
in the caller.

> +	}
> +}
> +
> +/**
> + * spi_nand_read_pages - read data from flash to buffer
> + * @mtd: MTD device structure
> + * @from: offset to read from
> + * @ops: oob operations description structure
> + * @max_bitflips: maximum bitflip count
> + * Description:
> + *   Normal read function, read one page to buffer before issue
> + *   another.
> + */
> +static int spi_nand_read_pages(struct mtd_info *mtd, loff_t from,
> +			  struct mtd_oob_ops *ops, unsigned int *max_bitflips)
> +{
> +	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	int page_addr, page_offset, size, ret;
> +	unsigned int corrected = 0;
> +	int readlen = ops->len;
> +	int oobreadlen = ops->ooblen;
> +	bool ecc_off = ops->mode == MTD_OPS_RAW;
> +	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
> +		mtd->oobavail : mtd->oobsize;
> +	bool oob_only = ops->datbuf == NULL;
> +
> +	page_addr = nand_offs_to_page(nand, from);
> +	page_offset = from & (nand_page_size(nand) - 1);
> +	ops->retlen = 0;
> +	*max_bitflips = 0;
> +

Comment for future reworks: we're doing the same thing in the // NAND
framework, maybe we should let the generic NAND layer do this
transformation for us (1 mtd request -> X page read/write requests).

> +	while (1) {
> +		ret = spi_nand_do_read_page(mtd, page_addr, ecc_off,
> +						&corrected, oob_only);
> +		if (ret)
> +			break;
> +		*max_bitflips = max(*max_bitflips, corrected);
> +		if (ops->datbuf) {
> +			size = min_t(int, readlen, nand_page_size(nand) - page_offset);
> +			memcpy(ops->datbuf + ops->retlen,
> +				chip->buf + page_offset, size);
> +			ops->retlen += size;
> +			readlen -= size;
> +			page_offset = 0;
> +		}
> +		if (ops->oobbuf) {
> +			size = min(oobreadlen, ooblen);
> +			spi_nand_transfer_oob(chip,
> +				ops->oobbuf + ops->oobretlen, ops, size);
> +			ops->oobretlen += size;
> +			oobreadlen -= size;
> +		}
> +		if (!readlen && !oobreadlen)
> +			break;
> +		page_addr++;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * spi_nand_do_read_ops - read data from flash to buffer
> + * @mtd: MTD device structure
> + * @from: offset to read from
> + * @ops: oob ops structure
> + * Description:
> + *   Disable internal ECC before reading when MTD_OPS_RAW set.
> + */
> +static int spi_nand_do_read_ops(struct mtd_info *mtd, loff_t from,
> +			  struct mtd_oob_ops *ops)
> +{
> +	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
> +	int ret;
> +	struct mtd_ecc_stats stats;
> +	unsigned int max_bitflips = 0;
> +	int oobreadlen = ops->ooblen;
> +	bool ecc_off = ops->mode == MTD_OPS_RAW;
> +	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
> +		mtd->oobavail : mtd->oobsize;
> +
> +	if (oobreadlen > 0) {
> +		ooblen -= ops->ooboffs;
> +		ops->oobretlen = 0;
> +	}
> +	stats = mtd->ecc_stats;
> +	if (ecc_off)
> +		spi_nand_disable_ecc(chip);
> +	ret = spi_nand_read_pages(mtd, from, ops, &max_bitflips);
> +	if (ecc_off)
> +		spi_nand_enable_ecc(chip);
> +	if (ret)
> +		return ret;
> +
> +	if (mtd->ecc_stats.failed - stats.failed)
> +		return -EBADMSG;
> +
> +	return max_bitflips;
> +}
> +
> +/**
> + * spi_nand_read - [MTD Interface] SPI-NAND read
> + * @mtd: MTD device structure
> + * @from: offset to read from
> + * @len: number of bytes to read
> + * @retlen: pointer to variable to store the number of read bytes
> + * @buf: the databuffer to put data
> + */
> +static int spi_nand_read(struct mtd_info *mtd, loff_t from, size_t len,
> +	size_t *retlen, u8 *buf)
> +{
> +	struct mtd_oob_ops ops;
> +	int ret;
> +
> +	spi_nand_get_device(mtd, FL_READING);
> +
> +	memset(&ops, 0, sizeof(ops));
> +	ops.len = len;
> +	ops.datbuf = buf;
> +	ops.mode = MTD_OPS_PLACE_OOB;
> +	ret = spi_nand_do_read_ops(mtd, from, &ops);
> +
> +	*retlen = ops.retlen;
> +
> +	spi_nand_release_device(mtd);
> +
> +	return ret;
> +}
> +
> +/**
> + * spi_nand_read_oob - [MTD Interface] read data and/or out-of-band
> + * @mtd: MTD device structure
> + * @from: offset to read from
> + * @ops: oob operation description structure
> + */
> +static int spi_nand_read_oob(struct mtd_info *mtd, loff_t from,
> +			struct mtd_oob_ops *ops)
> +{
> +	int ret = -ENOTSUPP;
> +
> +	ops->retlen = 0;
> +	spi_nand_get_device(mtd, FL_READING);
> +
> +	switch (ops->mode) {
> +	case MTD_OPS_PLACE_OOB:
> +	case MTD_OPS_AUTO_OOB:
> +	case MTD_OPS_RAW:
> +		break;
> +
> +	default:
> +		goto out;
> +	}
> +
> +	ret = spi_nand_do_read_ops(mtd, from, ops);
> +
> +out:
> +	spi_nand_release_device(mtd);
> +
> +	return ret;
> +}
>  MODULE_DESCRIPTION("SPI NAND framework");
>  MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
> index 1fcbad7..b61045b 100644
> --- a/include/linux/mtd/spi-nand.h
> +++ b/include/linux/mtd/spi-nand.h
> @@ -132,6 +132,7 @@
>   * @read_cache_op:	[REPLACEABLE] Opcode of read from cache
>   * @write_cache_op:	[REPLACEABLE] Opcode of program load
>   * @command_fn:		[BOARDSPECIFIC] function to handle command transfer
> + * @get_ecc_status:	[REPLACEABLE] get ecc and bitflip status
>   * @buf:		[INTERN] buffer for read/write data
>   * @oobbuf:		[INTERN] buffer for read/write oob
>   * @controller_caps:	[INTERN] capacities of SPI NAND controller
> @@ -153,6 +154,8 @@ struct spi_nand_chip {
>  	u8		write_cache_op;
>  	int (*command_fn)(struct spi_nand_chip *this,
>  			struct spi_nand_cmd *cmd);
> +	void (*get_ecc_status)(struct spi_nand_chip *this, unsigned int status,
> +			unsigned int *corrected, unsigned int *ecc_errors);

As for the ->command_fn(), put that in a different structure (not sure
it is NAND controller related, so maybe a spinand_ecc_engine and
spinand_ecc_engine_ops structures).

>  	u8		*buf;
>  	u8		*oobbuf;
>  	u32		controller_caps;
