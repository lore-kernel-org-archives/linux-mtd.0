Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac8S4-0004G4-In
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 09:24:45 +0000
Received: by mail-lb0-x234.google.com with SMTP id x1so85191034lbj.3
 for <linux-mtd@lists.infradead.org>; Sat, 05 Mar 2016 01:24:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPybu_3TLmMrfkG3vDH63NK+LmRLq-A3sHvdrnQPYFtgJVadNA@mail.gmail.com>
References: <1452875105-16963-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAPybu_3TLmMrfkG3vDH63NK+LmRLq-A3sHvdrnQPYFtgJVadNA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Sat, 5 Mar 2016 10:24:01 +0100
Message-ID: <CAPybu_1AwFNgFwtgLE-9NxG62ffHed0KQbN167A3fziRudja_A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for S3AN spi-nor devices
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

It has been almost two months :)... Any feedback about the patch
before I port it to the next version and resend?

Regards!

On Fri, Jan 22, 2016 at 3:52 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> ping?
>
>
> On Fri, Jan 15, 2016 at 5:25 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> Xilinx Spartan-3AN contain an embedded spi device where they keep their
>> configuration data and optionally some user data.
>>
>> The protocol of this flash follows most of the spi-nor standard. With
>> the following differences:
>>
>> - Page size might not be a power of two.
>> - The address calculation.
>> - The spi nor commands used.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  drivers/mtd/devices/m25p80.c  |  3 ++
>>  drivers/mtd/spi-nor/spi-nor.c | 97 +++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/mtd/spi-nor.h   | 13 ++++++
>>  3 files changed, 110 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index c9c3b7fa3051..869576735978 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -49,6 +49,9 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>>
>>  static void m25p_addr2cmd(struct spi_nor *nor, unsigned int addr, u8 *cmd)
>>  {
>> +       if (nor->addr_convert)
>> +               addr = nor->addr_convert(nor, addr);
>> +
>>         /* opcode is in cmd[0] */
>>         cmd[1] = addr >> (nor->addr_width * 8 -  8);
>>         cmd[2] = addr >> (nor->addr_width * 8 - 16);
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index ed0c19c558b5..90215f053916 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -69,6 +69,7 @@ struct flash_info {
>>  #define        SPI_NOR_DUAL_READ       0x20    /* Flash supports Dual Read */
>>  #define        SPI_NOR_QUAD_READ       0x40    /* Flash supports Quad Read */
>>  #define        USE_FSR                 0x80    /* use flag status register */
>> +#define        SPI_S3AN                0x100   /* Xililnx S3AN Embedded SPI nor*/
>>  };
>>
>>  #define JEDEC_MFR(info)        ((info)->id[0])
>> @@ -211,6 +212,21 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>>                 return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>>         }
>>  }
>> +
>> +static inline int s3an_sr_ready(struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 val;
>> +
>> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
>> +       if (ret < 0) {
>> +               pr_err("error %d reading SR\n", (int) ret);
>> +               return ret;
>> +       }
>> +
>> +       return !!(val & XSR_RDY);
>> +}
>> +
>>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>>  {
>>         int sr = read_sr(nor);
>> @@ -232,7 +248,7 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>>  static int spi_nor_ready(struct spi_nor *nor)
>>  {
>>         int sr, fsr;
>> -       sr = spi_nor_sr_ready(nor);
>> +       sr = nor->sr_ready(nor);
>>         if (sr < 0)
>>                 return sr;
>>         fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
>> @@ -328,6 +344,9 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>>          * Default implementation, if driver doesn't have a specialized HW
>>          * control
>>          */
>> +       if (nor->addr_convert)
>> +               addr = nor->addr_convert(nor, addr);
>> +
>>         for (i = nor->addr_width - 1; i >= 0; i--) {
>>                 buf[i] = addr & 0xff;
>>                 addr >>= 8;
>> @@ -362,7 +381,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>                 return ret;
>>
>>         /* whole-chip erase? */
>> -       if (len == mtd->size) {
>> +       if (len == mtd->size && !(nor->flags & SNOR_NO_OP_CHIP_ERASE)) {
>>                 unsigned long timeout;
>>
>>                 write_enable(nor);
>> @@ -680,6 +699,19 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
>> @@ -877,6 +909,14 @@ static const struct flash_info spi_nor_ids[] = {
>>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>         { },
>> +
>> +       /* Xilinx S3AN Internal Flash */
>> +       { "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
>> +       { "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
>> +       { "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
>> +       { "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
>> +       { "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
>> +       { },
>>  };
>>
>>  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>> @@ -1007,7 +1047,13 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>
>>         write_enable(nor);
>>
>> -       page_offset = to & (nor->page_size - 1);
>> +       if (hweight32(nor->page_size) == 1)
>> +               page_offset = to & (nor->page_size - 1);
>> +       else {
>> +               uint64_t aux = to;
>> +
>> +               page_offset = do_div(aux, nor->page_size);
>> +       }
>>
>>         /* do all the bytes fit onto one page? */
>>         if (page_offset + len <= nor->page_size) {
>> @@ -1179,6 +1225,43 @@ static int spi_nor_check(struct spi_nor *nor)
>>         return 0;
>>  }
>>
>> +static unsigned int s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>> +{
>> +       if (nor->page_size == 264)
>> +               return (addr / 264) * 512 + (addr % 264);
>> +
>> +       return (addr / 528) * 1024 + (addr % 528);
>> +}
>> +
>> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 val;
>> +
>> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
>> +       if (ret < 0) {
>> +               pr_err("error %d reading SR\n", (int) ret);
>> +               return ret;
>> +       }
>> +
>> +       nor->erase_opcode = SPINOR_OP_XSE;
>> +       nor->program_opcode = SPINOR_OP_XPP;
>> +       nor->read_opcode = SPINOR_OP_READ;
>> +       nor->sr_ready = s3an_sr_ready;
>> +       nor->flags |= SNOR_NO_OP_CHIP_ERASE;
>> +
>> +       /*Flash in Power of 2 mode*/
>> +       if (val & XSR_PAGESIZE) {
>> +               nor->page_size = (nor->page_size == 264) ? 256 : 512;
>> +               nor->mtd.writebufsize = nor->page_size;
>> +               nor->mtd.size = 8 * nor->page_size * info->n_sectors;
>> +               nor->mtd.erasesize = 8 * nor->page_size;
>> +       } else
>> +               nor->addr_convert = s3an_addr_convert;
>> +
>> +       return 0;
>> +}
>> +
>>  int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  {
>>         const struct flash_info *info = NULL;
>> @@ -1339,6 +1422,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>         }
>>
>>         nor->program_opcode = SPINOR_OP_PP;
>> +       nor->sr_ready = spi_nor_sr_ready;
>>
>>         if (info->addr_width)
>>                 nor->addr_width = info->addr_width;
>> @@ -1379,6 +1463,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>
>>         nor->read_dummy = spi_nor_read_dummy_cycles(nor);
>>
>> +       if (info->flags & SPI_S3AN) {
>> +               ret = s3an_nor_scan(info, nor);
>> +
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>>         dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>>                         (long long)mtd->size >> 10);
>>
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 62356d50815b..8946fa936b46 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -67,6 +67,15 @@
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
>> @@ -116,6 +125,7 @@ enum spi_nor_ops {
>>
>>  enum spi_nor_option_flags {
>>         SNOR_F_USE_FSR          = BIT(0),
>> +       SNOR_NO_OP_CHIP_ERASE   = BIT(1),
>>  };
>>
>>  /**
>> @@ -170,6 +180,9 @@ struct spi_nor {
>>         int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>>         int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>>
>> +       int (*sr_ready)(struct spi_nor *nor);
>> +       unsigned int (*addr_convert)(struct spi_nor *nor, unsigned int addr);
>> +
>>         int (*read)(struct spi_nor *nor, loff_t from,
>>                         size_t len, size_t *retlen, u_char *read_buf);
>>         void (*write)(struct spi_nor *nor, loff_t to,
>> --
>> 2.6.4
>>
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
