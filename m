Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cln7X-0003kM-Ie
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 01:44:03 +0000
Received: by mail-lf0-x235.google.com with SMTP id a6so22143595lfa.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Mar 2017 17:43:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170307185740.327ed9d0@bbrezillon>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-3-git-send-email-peterpandong@micron.com>
 <20170307185740.327ed9d0@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 9 Mar 2017 09:43:36 +0800
Message-ID: <CAAyFOR+vSOSGH_XoZt5Tr5h1fetFUvkMFKGo-iG68obP9eNujg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] nand: spi: add basic operations support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Wed, Mar 8, 2017 at 1:57 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Peter,
>
> I have a few comments (see below).

Thanks for your valuable comments at first.

>
> On Wed, 1 Mar 2017 16:52:06 +0800
> Peter Pan <peterpandong@micron.com> wrote:
>
>> This commit is to support read, readoob, write,
>> writeoob and erase operations in spi nand framwork.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/spi/spinand_base.c | 887 ++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/spinand.h         |   2 +
>>  2 files changed, 889 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
>> index 97d47146..1bc57e9 100644
>> --- a/drivers/mtd/nand/spi/spinand_base.c
>> +++ b/drivers/mtd/nand/spi/spinand_base.c
>> @@ -25,6 +25,31 @@
>>  #include <linux/slab.h>
>>
>>
>> +static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo);
>> +
>> +/**
>> + * spinand_get_device - [GENERIC] Get chip for selected access
>> + * @mtd: MTD device structure
>> + * @new_state: the state which is requested
>> + *
>> + * Get the device and lock it for exclusive access
>> + */
>> +static void spinand_get_device(struct spinand_device *chip)
>> +{
>> +     mutex_lock(&chip->lock);
>> +}
>> +
>> +/**
>> + * spinand_release_device - [GENERIC] release chip
>> + * @mtd: MTD device structure
>> + *
>> + * Deselect, release chip lock and wake up anyone waiting on the device
>> + */
>> +static void spinand_release_device(struct spinand_device *chip)
>> +{
>> +     mutex_unlock(&chip->lock);
>> +}
>> +
>
> Is there a good reason to provide those get/release helpers instead of
> letting the callers directly take/release the lock?

Just in case we need more than a mutex lock to protect in the feature. Of course
we can let the callers directly take/release the lock. Let me fix this in v3.

>
>>  static u64 spinand_get_chip_size(struct spinand_device *chip)
>>  {
>>       struct nand_device *nand = &chip->base;
>> @@ -115,6 +140,258 @@ static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
>>  }
>>
>>  /**
>> + * spinand_get_cfg - get configuration register value
>> + * @chip: SPI-NAND device structure
>> + * @cfg: buffer to store value
>> + * Description:
>> + *   Configuration register includes OTP config, Lock Tight enable/disable
>> + *   and Internal ECC enable/disable.
>> + */
>> +static int spinand_get_cfg(struct spinand_device *chip, u8 *cfg)
>> +{
>> +     return spinand_read_reg(chip, REG_CFG, cfg);
>> +}
>> +
>> +/**
>> + * spinand_set_cfg - set value to configuration register
>> + * @chip: SPI-NAND device structure
>> + * @cfg: buffer stored value
>> + * Description:
>> + *   Configuration register includes OTP config, Lock Tight enable/disable
>> + *   and Internal ECC enable/disable.
>> + */
>> +static int spinand_set_cfg(struct spinand_device *chip, u8 *cfg)
>> +{
>> +     return spinand_write_reg(chip, REG_CFG, cfg);
>> +}
>> +
>> +/**
>> + * spinand_enable_ecc - enable internal ECC
>> + * @chip: SPI-NAND device structure
>> + * Description:
>> + *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
>> + *   Enable chip internal ECC, set the bit to 1
>> + *   Disable chip internal ECC, clear the bit to 0
>
> Be careful, you tend to describe the register layout instead of
> describing what the function does (true for all other comments). If you
> want to describe the layout, do that in the header file just before the
> according macro definitions.

Actually I think we can just remove these register layout info.

>
>> + */
>> +static void spinand_enable_ecc(struct spinand_device *chip)
>> +{
>> +     u8 cfg = 0;
>> +
>> +     spinand_get_cfg(chip, &cfg);
>> +     if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE)
>> +             return;
>> +     cfg |= CFG_ECC_ENABLE;
>> +     spinand_set_cfg(chip, &cfg);
>> +}
>> +
>> +/**
>> + * spinand_disable_ecc - disable internal ECC
>> + * @chip: SPI-NAND device structure
>> + * Description:
>> + *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
>> + *   Enable chip internal ECC, set the bit to 1
>> + *   Disable chip internal ECC, clear the bit to 0
>> + */
>> +static void spinand_disable_ecc(struct spinand_device *chip)
>> +{
>> +     u8 cfg = 0;
>> +
>> +     spinand_get_cfg(chip, &cfg);
>> +     if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE) {
>> +             cfg &= ~CFG_ECC_ENABLE;
>> +             spinand_set_cfg(chip, &cfg);
>> +     }
>> +}
>> +
>> +/**
>> + * spinand_write_enable - send command 06h to enable write or erase the
>> + * Nand cells
>
>       ^ NAND

Fix this in v3.

>
>> + * @chip: SPI-NAND device structure
>> + * Description:
>> + *   Before write and erase the Nand cells, the write enable has to be set.
>> + *   After the write or erase, the write enable bit is automatically
>> + *   cleared (status register bit 2)
>> + *   Set the bit 2 of the status register has the same effect
>
> Again, this not really what I would expect from a function description.
> This comment would be perfectly placed inside the code blocks calling
> spinand_write_enable() though.

Fix this in v3.

>
>> + */
>> +static int spinand_write_enable(struct spinand_device *chip)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = SPINAND_CMD_WR_ENABLE;
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +/**
>> + * spinand_read_page_to_cache - send command 13h to read data from Nand
>> + * to cache
>> + * @chip: SPI-NAND device structure
>> + * @page_addr: page to read
>> + */
>> +static int spinand_read_page_to_cache(struct spinand_device *chip,
>> +                                     u32 page_addr)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = SPINAND_CMD_PAGE_READ;
>> +     cmd.n_addr = 3;
>> +     cmd.addr[0] = (u8)(page_addr >> 16);
>> +     cmd.addr[1] = (u8)(page_addr >> 8);
>> +     cmd.addr[2] = (u8)page_addr;
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +static int spinand_get_address_bits(u8 opcode)
>> +{
>> +     switch (opcode) {
>> +     case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
>> +             return 4;
>> +     case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
>> +             return 2;
>> +     default:
>> +             return 1;
>> +     }
>> +}
>> +
>> +static int spinand_get_data_bits(u8 opcode)
>> +{
>> +     switch (opcode) {
>> +     case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
>> +     case SPINAND_CMD_READ_FROM_CACHE_X4:
>> +     case SPINAND_CMD_PROG_LOAD_X4:
>> +     case SPINAND_CMD_PROG_LOAD_RDM_DATA_X4:
>> +             return 4;
>> +     case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
>> +     case SPINAND_CMD_READ_FROM_CACHE_X2:
>> +             return 2;
>> +     default:
>> +             return 1;
>> +     }
>> +}
>> +
>> +/**
>> + * spinand_read_from_cache - read data out from cache register
>> + * @chip: SPI-NAND device structure
>> + * @page_addr: page to read
>> + * @column: the location to read from the cache
>> + * @len: number of bytes to read
>> + * @rbuf: buffer held @len bytes
>> + * Description:
>> + *   Command can be 03h, 0Bh, 3Bh, 6Bh, BBh, EBh
>> + *   The read can specify 1 to (page size + spare size) bytes of data read at
>> + *   the corresponding locations.
>> + *   No tRd delay.
>> + */
>> +static int spinand_read_from_cache(struct spinand_device *chip,
>> +             u32 page_addr, u32 column, size_t len, u8 *rbuf)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = chip->read_cache_op;
>> +     if (chip->manufacturer.ops->build_column_addr) {
>> +             chip->manufacturer.ops->build_column_addr(chip, &cmd,
>> +                                                       page_addr, column);
>> +     } else {
>> +             cmd.n_addr = 2;
>> +             cmd.addr[0] = (u8)(column >> 8);
>> +             cmd.addr[1] = (u8)column;
>> +     }
>> +     if (chip->manufacturer.ops->get_dummy)
>> +             cmd.dummy_bytes = chip->manufacturer.ops->get_dummy(chip, &cmd);
>> +     cmd.addr_nbits = spinand_get_address_bits(chip->read_cache_op);
>> +     cmd.n_rx = len;
>> +     cmd.rx_buf = rbuf;
>> +     cmd.data_nbits = spinand_get_data_bits(chip->read_cache_op);
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +/**
>> + * spinand_program_data_to_cache - write data to cache register
>> + * @chip: SPI-NAND device structure
>> + * @page_addr: page to write
>> + * @column: the location to write to the cache
>> + * @len: number of bytes to write
>> + * @wrbuf: buffer held @len bytes
>> + * @clr_cache: clear cache register or not
>> + * Description:
>> + *   Command can be 02h, 32h, 84h, 34h
>> + *   02h and 32h will clear the cache with 0xff value first
>> + *   Since it is writing the data to cache, there is no tPROG time.
>> + */
>> +static int spinand_program_data_to_cache(struct spinand_device *chip,
>> +                     u32 page_addr, u32 column, size_t len, const u8 *wbuf)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = chip->write_cache_op;
>> +     if (chip->manufacturer.ops->build_column_addr) {
>> +             chip->manufacturer.ops->build_column_addr(chip, &cmd,
>> +                                                       page_addr, column);
>> +     } else {
>> +             cmd.n_addr = 2;
>> +             cmd.addr[0] = (u8)(column >> 8);
>> +             cmd.addr[1] = (u8)column;
>> +     }
>> +     cmd.addr_nbits = spinand_get_address_bits(chip->write_cache_op);
>> +     cmd.n_tx = len;
>> +     cmd.tx_buf = wbuf;
>> +     cmd.data_nbits = spinand_get_data_bits(chip->write_cache_op);
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +/**
>> + * spinand_program_execute - send command 10h to write a page from
>> + * cache to the Nand array
>> + * @chip: SPI-NAND device structure
>> + * @page_addr: the physical page location to write the page.
>> + * Description:
>> + *   Need to wait for tPROG time to finish the transaction.
>
> I see that you mention those tXX timings in different places. Maybe
> it's worth having a spinand_timings struct. And it seems that the
> controller/core is supposed to wait after executing some commands.
> Can we extend struct spinand_op to pass this information and let the
> controller wait for this time (or use it as a timeout?).
> Something like, cmd.wait_ns.

Actually these tXX timing value are not used by the code right now. Now
the code uses spinand_wait() to poll OIP bit instead. We can remove tXX
from comments.

>
>> + */
>> +static int spinand_program_execute(struct spinand_device *chip, u32 page_addr)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = SPINAND_CMD_PROG_EXC;
>> +     cmd.n_addr = 3;
>> +     cmd.addr[0] = (u8)(page_addr >> 16);
>> +     cmd.addr[1] = (u8)(page_addr >> 8);
>> +     cmd.addr[2] = (u8)page_addr;
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +
>> +/**
>> + * spinand_erase_block_erase - send command D8h to erase a block
>> + * @chip: SPI-NAND device structure
>> + * @page_addr: the page to erase.
>> + * Description:
>> + *   Need to wait for tERS.
>> + */
>> +static int spinand_erase_block(struct spinand_device *chip,
>> +                                     u32 page_addr)
>> +{
>> +     struct spinand_op cmd;
>> +
>> +     spinand_op_init(&cmd);
>> +     cmd.cmd = SPINAND_CMD_BLK_ERASE;
>> +     cmd.n_addr = 3;
>> +     cmd.addr[0] = (u8)(page_addr >> 16);
>> +     cmd.addr[1] = (u8)(page_addr >> 8);
>> +     cmd.addr[2] = (u8)page_addr;
>> +
>> +     return spinand_exec_cmd(chip, &cmd);
>> +}
>> +
>> +/**
>>   * spinand_wait - wait until the command is done
>>   * @chip: SPI-NAND device structure
>>   * @s: buffer to store status register(can be NULL)
>> @@ -197,6 +474,611 @@ static int spinand_lock_block(struct spinand_device *chip, u8 lock)
>>       return spinand_write_reg(chip, REG_BLOCK_LOCK, &lock);
>>  }
>>
>
> Missing comment header.

Fix this in v3.

>
>> +static void spinand_get_ecc_status(struct spinand_device *chip,
>> +     unsigned int status, unsigned int *corrected, unsigned int *ecc_errors)
>> +{
>> +     return chip->ecc_engine.ops->get_ecc_status(chip, status, corrected, ecc_errors);
>> +}
>> +
>> +/**
>> + * spinand_do_read_page - read page from flash to buffer
>> + * @mtd: MTD device structure
>> + * @page_addr: page address/raw address
>> + * @column: column address
>> + * @ecc_off: without ecc or not
>> + * @corrected: how many bit error corrected
>> + * @buf: data buffer
>> + * @len: data length to read
>> + */
>> +static int spinand_do_read_page(struct mtd_info *mtd, u32 page_addr,
>> +                     bool ecc_off, int *corrected, bool oob_only)
>> +{
>> +     struct spinand_device *chip = mtd_to_spinand(mtd);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     int ret, ecc_error = 0;
>> +     u8 status;
>> +
>> +     spinand_read_page_to_cache(chip, page_addr);
>> +     ret = spinand_wait(chip, &status);
>> +     if (ret < 0) {
>> +             pr_err("error %d waiting page 0x%x to cache\n",
>> +                     ret, page_addr);
>> +             return ret;
>> +     }
>> +     if (!oob_only)
>> +             spinand_read_from_cache(chip, page_addr, 0,
>> +             nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
>> +     else
>> +             spinand_read_from_cache(chip, page_addr, nand_page_size(nand),
>> +                             nand_per_page_oobsize(nand), chip->oobbuf);
>> +     if (!ecc_off) {
>> +             spinand_get_ecc_status(chip, status, corrected, &ecc_error);
>> +             /*
>> +              * If there's an ECC error, print a message and notify MTD
>> +              * about it. Then complete the read, to load actual data on
>> +              * the buffer (instead of the status result).
>> +              */
>> +             if (ecc_error) {
>> +                     pr_err("internal ECC error reading page 0x%x\n",
>> +                             page_addr);
>> +                     mtd->ecc_stats.failed++;
>> +             } else if (*corrected) {
>> +                     mtd->ecc_stats.corrected += *corrected;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * spinand_do_write_page - write data from buffer to flash
>> + * @mtd: MTD device structure
>> + * @page_addr: page address/raw address
>> + * @column: column address
>> + * @buf: data buffer
>> + * @len: data length to write
>> + * @clr_cache: clear cache register with 0xFF or not
>> + */
>> +static int spinand_do_write_page(struct mtd_info *mtd, u32 page_addr,
>> +                                             bool oob_only)
>
> Parameter is not aligned to the open parenthesis (and this is not the
> only place showing this problem).

Fix this in v3.

>
>> +{
>> +     struct spinand_device *chip = mtd_to_spinand(mtd);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     u8 status;
>> +     int ret = 0;
>> +
>> +     spinand_write_enable(chip);
>> +     if (!oob_only)
>> +             spinand_program_data_to_cache(chip, page_addr, 0,
>> +             nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
>> +     else
>> +             spinand_program_data_to_cache(chip, page_addr, nand_page_size(nand),
>> +                             nand_per_page_oobsize(nand), chip->oobbuf);
>> +     spinand_program_execute(chip, page_addr);
>> +     ret = spinand_wait(chip, &status);
>> +     if (ret < 0) {
>> +             pr_err("error %d reading page 0x%x from cache\n",
>> +                     ret, page_addr);
>> +             return ret;
>> +     }
>> +     if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
>> +             pr_err("program page 0x%x failed\n", page_addr);
>> +             ret = -EIO;
>> +     }
>> +     return ret;
>> +}
>> +
>> +/**
>> + * spinand_transfer_oob - transfer oob to client buffer
>> + * @chip: SPI-NAND device structure
>> + * @oob: oob destination address
>> + * @ops: oob ops structure
>> + * @len: size of oob to transfer
>> + */
>> +static int spinand_transfer_oob(struct spinand_device *chip, u8 *oob,
>> +                               struct mtd_oob_ops *ops, size_t len)
>> +{
>> +     struct mtd_info *mtd = spinand_to_mtd(chip);
>> +     int ret = 0;
>> +
>> +     switch (ops->mode) {
>> +     case MTD_OPS_PLACE_OOB:
>> +     case MTD_OPS_RAW:
>> +             memcpy(oob, chip->oobbuf + ops->ooboffs, len);
>> +             break;
>> +     case MTD_OPS_AUTO_OOB:
>> +             ret = mtd_ooblayout_get_databytes(mtd, oob, chip->oobbuf,
>> +                                               ops->ooboffs, len);
>> +             break;
>> +     default:
>> +             ret = -EINVAL;
>> +     }
>> +     return ret;
>> +}
>> +
>> +/**
>> + * spinand_fill_oob - transfer client buffer to oob
>> + * @chip: SPI-NAND device structure
>> + * @oob: oob data buffer
>> + * @len: oob data write length
>> + * @ops: oob ops structure
>> + */
>> +static int spinand_fill_oob(struct spinand_device *chip, uint8_t *oob,
>> +                             size_t len, struct mtd_oob_ops *ops)
>> +{
>> +     struct mtd_info *mtd = spinand_to_mtd(chip);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     int ret = 0;
>> +
>> +     memset(chip->oobbuf, 0xff, nand_per_page_oobsize(nand));
>> +     switch (ops->mode) {
>> +     case MTD_OPS_PLACE_OOB:
>> +     case MTD_OPS_RAW:
>> +             memcpy(chip->oobbuf + ops->ooboffs, oob, len);
>> +             break;
>> +     case MTD_OPS_AUTO_OOB:
>> +             ret = mtd_ooblayout_set_databytes(mtd, oob, chip->oobbuf,
>> +                                               ops->ooboffs, len);
>> +             break;
>> +     default:
>> +             ret = -EINVAL;
>> +     }
>> +     return ret;
>> +}
>> +
>> +/**
>> + * spinand_read_pages - read data from flash to buffer
>> + * @mtd: MTD device structure
>> + * @from: offset to read from
>> + * @ops: oob operations description structure
>> + * @max_bitflips: maximum bitflip count
>> + * Description:
>> + *   Normal read function, read one page to buffer before issue
>> + *   another.
>> + */
>> +static int spinand_read_pages(struct mtd_info *mtd, loff_t from,
>> +                       struct mtd_oob_ops *ops, unsigned int *max_bitflips)
>> +{
>> +     struct spinand_device *chip = mtd_to_spinand(mtd);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     int page_addr, page_offset, size, ret;
>> +     unsigned int corrected = 0;
>> +     int readlen = ops->len;
>> +     int oobreadlen = ops->ooblen;
>> +     bool ecc_off = ops->mode == MTD_OPS_RAW;
>> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> +             mtd->oobavail : mtd->oobsize;
>> +     bool oob_only = ops->datbuf == NULL;
>> +
>> +     page_addr = nand_offs_to_page(nand, from);
>> +     page_offset = from & (nand_page_size(nand) - 1);
>> +     ops->retlen = 0;
>> +     *max_bitflips = 0;
>> +
>> +     while (1) {
>> +             ret = spinand_do_read_page(mtd, page_addr, ecc_off,
>> +                                             &corrected, oob_only);
>> +             if (ret)
>> +                     break;
>> +             *max_bitflips = max(*max_bitflips, corrected);
>> +             if (ops->datbuf) {
>> +                     size = min_t(int, readlen, nand_page_size(nand) - page_offset);
>> +                     memcpy(ops->datbuf + ops->retlen,
>> +                             chip->buf + page_offset, size);
>> +                     ops->retlen += size;
>> +                     readlen -= size;
>> +                     page_offset = 0;
>> +                     if (!readlen)
>> +                             break;
>> +             }
>> +             if (ops->oobbuf) {
>> +                     size = min(oobreadlen, ooblen);
>> +                     ret = spinand_transfer_oob(chip,
>> +                             ops->oobbuf + ops->oobretlen, ops, size);
>> +                     if (ret) {
>> +                             pr_err("Transfer oob error %d\n", ret);
>> +                             return ret;
>> +                     }
>> +                     ops->oobretlen += size;
>> +                     oobreadlen -= size;
>> +                     if (!oobreadlen)
>> +                             break;
>> +             }
>> +             page_addr++;
>> +     }
>> +
>> +     return ret;
>> +}
>
> Hm, it seems you need pretty much the same logic for write_pages(). How
> about creating a nand_for_each_page(nand, start, len, page) helper?
>
> #define nand_for_each_page(nand, from, len, page, &poffs)        \
>         for (page = nand_offs_to_page(nand, from, &poffs),       \
>              page = nand_offs_to_page(nand, from + len, &poffs); \
>              page++, poffs = 0)
>
> Assuming we change the prototype of nand_offs_to_page() to return the
> page offset in the 3 parameter (poffs).

Much better idea! Fix this in v3.

>
>> +
>> +/**
>> + * spinand_do_read_ops - read data from flash to buffer
>> + * @mtd: MTD device structure
>> + * @from: offset to read from
>> + * @ops: oob ops structure
>> + * Description:
>> + *   Disable internal ECC before reading when MTD_OPS_RAW set.
>> + */
>> +static int spinand_do_read_ops(struct mtd_info *mtd, loff_t from,
>> +                       struct mtd_oob_ops *ops)
>> +{
>> +     struct spinand_device *chip = mtd_to_spinand(mtd);
>> +     struct nand_device *nand = mtd_to_nand(mtd);
>> +     int ret;
>> +     struct mtd_ecc_stats stats;
>> +     unsigned int max_bitflips = 0;
>> +     int oobreadlen = ops->ooblen;
>> +     bool ecc_off = ops->mode == MTD_OPS_RAW;
>> +     int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
>> +             mtd->oobavail : mtd->oobsize;
>> +
>> +     if (unlikely(from >= mtd->size)) {
>> +             pr_err("%s: attempt to read beyond end of device\n",
>> +                             __func__);
>> +             return -EINVAL;
>> +     }
>
> Again, we can an helper to check the boundaries in the generic NAND
> code.

Let's keep the code the same and move to generic NAND code later.
What do you think Boris?

>
>> +     if (oobreadlen > 0) {
>> +             if (unlikely(ops->ooboffs >= ooblen)) {
>> +                     pr_err("%s: attempt to start read outside oob\n",
>> +                                     __func__);
>> +                     return -EINVAL;
>> +             }
>> +             if (unlikely(ops->ooboffs + oobreadlen >
>> +             (nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, from))
>> +             * ooblen)) {
>> +                     pr_err("%s: attempt to read beyond end of device\n",
>> +                                     __func__);
>> +                     return -EINVAL;
>> +             }
>> +             ooblen -= ops->ooboffs;
>> +             ops->oobretlen = 0;
>> +     }
>> +     stats = mtd->ecc_stats;
>> +     if (ecc_off)
>> +             spinand_disable_ecc(chip);
>> +     ret = spinand_read_pages(mtd, from, ops, &max_bitflips);
>> +     if (ecc_off)
>> +             spinand_enable_ecc(chip);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (mtd->ecc_stats.failed - stats.failed)
>> +             return -EBADMSG;
>> +
>> +     return max_bitflips;
>> +}
>> +
>
> [...]
>
>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>> index f3d0351..ee447c1 100644
>> --- a/include/linux/mtd/spinand.h
>> +++ b/include/linux/mtd/spinand.h
>> @@ -135,6 +135,8 @@ struct spinand_manufacturer_ops {
>>       bool(*detect)(struct spinand_device *chip);
>>       int (*init)(struct spinand_device *chip);
>>       void (*cleanup)(struct spinand_device *chip);
>> +     void (*build_column_addr)(struct spinand_device *chip,
>> +                               struct spinand_op *op, u32 page, u32 column);
>
> Okay, I think Arnaud was right, maybe we should have vendor specific
> ops for basic operations like ->prepare_read/write_op(), instead of
> having these ->get_dummy() and ->build_column_addr() hooks.
> Or maybe just a ->prepare_op() hook that can prepare things for any
> basic operation (read, write, ...).

I prefer ->prepare_read_op() and ->prepare_write_op. Fix this in v3


Thanks
Peter Pan
