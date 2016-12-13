Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGlSO-0002Qe-UX
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 11:41:20 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so17817732wme.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 03:40:56 -0800 (PST)
Subject: Re: [PATCH v9] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20161202113144.17970-1-ricardo.ribalda@gmail.com>
 <CAPybu_164GFhKPWcV1qzNhhcmJU4D-07uCzN=FVyqjBzzPJANg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <3cc79f87-1a5c-22ca-d26b-b163480779bb@gmail.com>
Date: Tue, 13 Dec 2016 08:53:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAPybu_164GFhKPWcV1qzNhhcmJU4D-07uCzN=FVyqjBzzPJANg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2016 05:20 PM, Ricardo Ribalda Delgado wrote:
> Hi Marek

Hi,

> Can I get a Reviewed-by or Signed-of?

Yes, sorry for the delay.

> Thanks!
> 
> On Fri, Dec 2, 2016 at 12:31 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
>> their configuration data and (optionally) some user data.
>>
>> The protocol of this flash follows most of the spi-nor standard. With
>> the following differences:
>>
>> - Page size might not be a power of two.
>> - The address calculation (default addressing mode).
>> - The spi nor commands used.
>>
>> Protocol is described on Xilinx User Guide UG333
>>
>> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> ---
>> v9:
>> Suggested by Marek Vasut <marek.vasut@gmail.com>
>> -Add comments
>>
>> v8:
>> -Rebase on top of l2-mtd/master
>> -Set SNOR_F_READY_XSR_RDY as soon as possible to avoid timeout
>> Suggested by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> -Change prototype of s3an_addr_convert to
>>
>> v7:
>> Suggested by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> -Change types of s3an_addr_convert
>> -Use modulus by nor->page_size
>>
>> v6:
>> Suggested by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> -Replace triple operator with if/else
>>
>> v5:
>> -Rebase on top of l2-mtd/master
>> Suggested by: Cyrille Pitchen <cyrille.pitchen@atmel.com>:
>> -Fix to+1 bug
>> -Move all address conversions to spi-nor
>> -Replace pr_dev with dev_err
>>
>> v4:
>> -Rebase on top of l2-mtd/master
>>
>> v3:
>> -Rebase on top of mtd-next
>> -Rename ADDR_NATIVE to ADDR_DEFAULT to follow UG333 naming
>> -Fix bug on probe
>>
>> v2: Suggested by Brian Norris <computersforpeace@gmail.com>
>>
>> -Remove inline qualifier
>> -Improve documentation of Default Addressing Mode
>> -Convert function callbacks into SNOR_F_
>> -Fix missmatch braces
>> -Improve documentation of SPI_S3AN flag
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 154 ++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/mtd/spi-nor.h   |  12 ++++
>>  2 files changed, 161 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index da7cd69d4857..3dccfa594023 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -75,6 +75,12 @@ struct flash_info {
>>                                          * bit. Must be used with
>>                                          * SPI_NOR_HAS_LOCK.
>>                                          */
>> +#define        SPI_S3AN                BIT(10) /*
>> +                                        * Xilinx Spartan 3AN In-System Flash
>> +                                        * (MFR cannot be used for probing
>> +                                        * because it has the same value as
>> +                                        * ATMEL flashes)
>> +                                       */
>>  };
>>
>>  #define JEDEC_MFR(info)        ((info)->id[0])
>> @@ -217,6 +223,21 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>>                 return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>>         }
>>  }
>> +
>> +static int s3an_sr_ready(struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 val;
>> +
>> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
>> +       if (ret < 0) {
>> +               dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
>> +               return ret;
>> +       }
>> +
>> +       return !!(val & XSR_RDY);
>> +}
>> +
>>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>>  {
>>         int sr = read_sr(nor);
>> @@ -238,7 +259,11 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>>  static int spi_nor_ready(struct spi_nor *nor)
>>  {
>>         int sr, fsr;
>> -       sr = spi_nor_sr_ready(nor);
>> +
>> +       if (nor->flags & SNOR_F_READY_XSR_RDY)
>> +               sr = s3an_sr_ready(nor);
>> +       else
>> +               sr = spi_nor_sr_ready(nor);
>>         if (sr < 0)
>>                 return sr;
>>         fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
>> @@ -320,6 +345,24 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>>  }
>>
>>  /*
>> + * This code converts an address to the Default Address Mode, that has non
>> + * power of two page sizes. We must support this mode because it is the default
>> + * mode supported by Xilinx tools, it can access the whole flash area and
>> + * changing over to the Power-of-two mode is irreversible and corrupts the
>> + * original data.
>> + * Addr can safely be unsigned int, the biggest S3AN device is smaller than
>> + * 4 MiB.
>> + */
>> +static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>> +{
>> +       unsigned int offset = addr;
>> +
>> +       offset %= nor->page_size;
>> +
>> +       return ((addr - offset) << 1) | offset;
>> +}
>> +
>> +/*
>>   * Initiate the erasure of a single sector
>>   */
>>  static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>> @@ -327,6 +370,9 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>>         u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
>>         int i;
>>
>> +       if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
>> +               addr = spi_nor_s3an_addr_convert(nor, addr);
>> +
>>         if (nor->erase)
>>                 return nor->erase(nor, addr);
>>
>> @@ -368,7 +414,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>                 return ret;
>>
>>         /* whole-chip erase? */
>> -       if (len == mtd->size) {
>> +       if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>>                 unsigned long timeout;
>>
>>                 write_enable(nor);
>> @@ -782,6 +828,19 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>                 .addr_width = (_addr_width),                            \
>>                 .flags = (_flags),
>>
>> +#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)                   \
>> +               .id = {                                                 \
>> +                       ((_jedec_id) >> 16) & 0xff,                     \
>> +                       ((_jedec_id) >> 8) & 0xff,                      \
>> +                       (_jedec_id) & 0xff                              \
>> +                       },                                              \
>> +               .id_len = 3,                                            \
>> +               .sector_size = (8*_page_size),                          \
>> +               .n_sectors = (_n_sectors),                              \
>> +               .page_size = _page_size,                                \
>> +               .addr_width = 3,                                        \
>> +               .flags = SPI_NOR_NO_FR | SPI_S3AN,
>> +
>>  /* NOTE: double check command sets and memory organization when you add
>>   * more nor chips.  This current list focusses on newer chips, which
>>   * have been converging on command sets which including JEDEC ID.
>> @@ -1014,6 +1073,13 @@ static const struct flash_info spi_nor_ids[] = {
>>         { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +
>> +       /* Xilinx S3AN Internal Flash */
>> +       { "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
>> +       { "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
>> +       { "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
>> +       { "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
>> +       { "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
>>         { },
>>  };
>>
>> @@ -1054,7 +1120,12 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>>                 return ret;
>>
>>         while (len) {
>> -               ret = nor->read(nor, from, len, buf);
>> +               loff_t addr = from;
>> +
>> +               if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
>> +                       addr = spi_nor_s3an_addr_convert(nor, addr);
>> +
>> +               ret = nor->read(nor, addr, len, buf);
>>                 if (ret == 0) {
>>                         /* We shouldn't see 0-length reads */
>>                         ret = -EIO;
>> @@ -1175,8 +1246,23 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>
>>         for (i = 0; i < len; ) {
>>                 ssize_t written;
>> +               loff_t addr = to + i;
>>
>> -               page_offset = (to + i) & (nor->page_size - 1);
>> +               /*
>> +                * If page_size is a power of two, the offset can be quickly
>> +                * calculated with an AND operation. On the other cases we
>> +                * need to do a modulus operation (more expensive).
>> +                * Power of two numbers have only one bit set and we can use
>> +                * the instruction hweight32 to detect if we need to do a
>> +                * modulus (do_div()) or not.
>> +                */
>> +               if (hweight32(nor->page_size) == 1) {
>> +                       page_offset = addr & (nor->page_size - 1);
>> +               } else {
>> +                       uint64_t aux = addr;
>> +
>> +                       page_offset = do_div(aux, nor->page_size);
>> +               }
>>                 WARN_ONCE(page_offset,
>>                           "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
>>                           page_offset);
>> @@ -1184,8 +1270,11 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>                 page_remain = min_t(size_t,
>>                                     nor->page_size - page_offset, len - i);
>>
>> +               if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
>> +                       addr = spi_nor_s3an_addr_convert(nor, addr);
>> +
>>                 write_enable(nor);
>> -               ret = nor->write(nor, to + i, page_remain, buf + i);
>> +               ret = nor->write(nor, addr, page_remain, buf + i);
>>                 if (ret < 0)
>>                         goto write_err;
>>                 written = ret;
>> @@ -1312,6 +1401,47 @@ static int spi_nor_check(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 val;
>> +
>> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
>> +       if (ret < 0) {
>> +               dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
>> +               return ret;
>> +       }
>> +
>> +       nor->erase_opcode = SPINOR_OP_XSE;
>> +       nor->program_opcode = SPINOR_OP_XPP;
>> +       nor->read_opcode = SPINOR_OP_READ;
>> +       nor->flags |= SNOR_F_NO_OP_CHIP_ERASE ;
>> +
>> +       /*
>> +        * This flashes have a page size of 264 or 528 bytes (known as
>> +        * Default addressing mode). It can be changed to a more standard
>> +        * Power of two mode where the page size is 256/512. This comes
>> +        * with a price: there is 3% less of space, the data is corrupted
>> +        * and the page size cannot be changed back to default addressing
>> +        * mode.
>> +        *
>> +        * The current addressing mode can be read from the XRDSR register
>> +        * and should not be changed, because is a destructive operation.
>> +        */
>> +       if (val & XSR_PAGESIZE) {
>> +               /* Flash in Power of 2 mode */
>> +               nor->page_size = (nor->page_size == 264) ? 256 : 512;
>> +               nor->mtd.writebufsize = nor->page_size;
>> +               nor->mtd.size = 8 * nor->page_size * info->n_sectors;
>> +               nor->mtd.erasesize = 8 * nor->page_size;
>> +       } else {
>> +               /* Flash in Default addressing mode */
>> +               nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  {
>>         const struct flash_info *info = NULL;
>> @@ -1360,6 +1490,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>         mutex_init(&nor->lock);
>>
>>         /*
>> +        * Make sure the XSR_RDY flag is set before calling
>> +        * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
>> +        * with Atmel spi-nor
>> +        */
>> +       if (info->flags & SPI_S3AN)
>> +               nor->flags |=  SNOR_F_READY_XSR_RDY;
>> +
>> +       /*
>>          * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>>          * with the software protection bits set
>>          */
>> @@ -1517,6 +1655,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>
>>         nor->read_dummy = spi_nor_read_dummy_cycles(nor);
>>
>> +       if (info->flags & SPI_S3AN) {
>> +               ret = s3an_nor_scan(info, nor);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>>         dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>>                         (long long)mtd->size >> 10);
>>
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index c425c7b4c2a0..4950b2ef08c0 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -68,6 +68,15 @@
>>  #define SPINOR_OP_WRDI         0x04    /* Write disable */
>>  #define SPINOR_OP_AAI_WP       0xad    /* Auto address increment word program */
>>
>> +/* Used for S3AN flashes only */
>> +#define SPINOR_OP_XSE          0x50    /* Sector erase */
>> +#define SPINOR_OP_XPP          0x82    /* Page program */
>> +#define SPINOR_OP_XRDSR                0xd7    /* Read status register */
>> +
>> +#define XSR_PAGESIZE           BIT(0)  /* Page size in Po2 or Linear */
>> +#define XSR_RDY                        BIT(7)  /* Ready */
>> +
>> +
>>  /* Used for Macronix and Winbond flashes. */
>>  #define SPINOR_OP_EN4B         0xb7    /* Enter 4-byte mode */
>>  #define SPINOR_OP_EX4B         0xe9    /* Exit 4-byte mode */
>> @@ -119,6 +128,9 @@ enum spi_nor_ops {
>>  enum spi_nor_option_flags {
>>         SNOR_F_USE_FSR          = BIT(0),
>>         SNOR_F_HAS_SR_TB        = BIT(1),
>> +       SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
>> +       SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
>> +       SNOR_F_READY_XSR_RDY    = BIT(4),
>>  };
>>
>>  /**
>> --
>> 2.10.2
>>
> 
> 
> 


-- 
Best regards,
Marek Vasut
