Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXPZa-0003Yw-Vh
 for linux-mtd@lists.infradead.org; Wed, 10 Aug 2016 09:13:16 +0000
Received: by mail-wm0-x241.google.com with SMTP id o80so8276140wme.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2016 02:12:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468527505-22767-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1468527505-22767-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 10 Aug 2016 11:12:32 +0200
Message-ID: <CAPybu_3sO=3J=qx-4-F5ObgHc3VWv1cnsQEfDYHq-n3GV7z8sw@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for S3AN spi-nor devices
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Jagan Teki <jteki@openedev.com>, Vignesh R <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Furquan Shaikh <furquan@google.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
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

ping?

On Thu, Jul 14, 2016 at 10:18 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
> their configuration data and (optionally) some user data.
>
> The protocol of this flash follows most of the spi-nor standard. With
> the following differences:
>
> - Page size might not be a power of two.
> - The address calculation (default addressing mode).
> - The spi nor commands used.
>
> Protocol is described on Xilinx User Guide UG333
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v4:
> -Rebase on top of l2-mtd/master
>
> v3:
> -Rebase on top of mtd-next
> -Rename ADDR_NATIVE to ADDR_DEFAULT to follow UG333 naming
> -Fix bug on probe
>
> v2: Suggested by Brian Norris <computersforpeace@gmail.com>
>
> -Remove inline qualifier
> -Improve documentation of Default Addressing Mode
> -Convert function callbacks into SNOR_F_
> -Fix missmatch braces
> -Improve documentation of SPI_S3AN flag
>
>  drivers/mtd/devices/m25p80.c  |   3 ++
>  drivers/mtd/spi-nor/spi-nor.c | 110 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  26 ++++++++++
>  3 files changed, 136 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd28034..a44465f2b73d 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -49,6 +49,9 @@ static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>
>  static void m25p_addr2cmd(struct spi_nor *nor, unsigned int addr, u8 *cmd)
>  {
> +       if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> +               addr = spi_nor_s3an_addr_convert(nor, addr);
> +
>         /* opcode is in cmd[0] */
>         cmd[1] = addr >> (nor->addr_width * 8 -  8);
>         cmd[2] = addr >> (nor->addr_width * 8 - 16);
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165d7d66..dce0a2f156e1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -75,6 +75,12 @@ struct flash_info {
>                                          * bit. Must be used with
>                                          * SPI_NOR_HAS_LOCK.
>                                          */
> +#define        SPI_S3AN                BIT(10) /*
> +                                        * Xilinx Spartan 3AN In-System Flash
> +                                        * (MFR cannot be used for probing
> +                                        * because it has the same value as
> +                                        * ATMEL flashes)
> +                                       */
>  };
>
>  #define JEDEC_MFR(info)        ((info)->id[0])
> @@ -217,6 +223,21 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
>                 return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
>         }
>  }
> +
> +static int s3an_sr_ready(struct spi_nor *nor)
> +{
> +       int ret;
> +       u8 val;
> +
> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +       if (ret < 0) {
> +               pr_err("error %d reading XRDSR\n", (int) ret);
> +               return ret;
> +       }
> +
> +       return !!(val & XSR_RDY);
> +}
> +
>  static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  {
>         int sr = read_sr(nor);
> @@ -238,7 +259,9 @@ static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  static int spi_nor_ready(struct spi_nor *nor)
>  {
>         int sr, fsr;
> -       sr = spi_nor_sr_ready(nor);
> +
> +       sr = nor->flags & SNOR_F_READY_XSR_RDY ? s3an_sr_ready(nor) :
> +                                                spi_nor_sr_ready(nor);
>         if (sr < 0)
>                 return sr;
>         fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> @@ -320,6 +343,23 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  }
>
>  /*
> + * This code converts an address to the Default Address Mode, that has non
> + * power of two page sizes. We must support this mode because it is the default
> + * mode supported by Xilinx tools, it can access the whole flash area and
> + * changing over to the Power-of-two mode is irreversible and corrupts the
> + * original data.
> + */
> +unsigned int spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
> +{
> +       unsigned int offset;
> +
> +       offset = (nor->page_size == 264) ? (addr % 264) : (addr % 528);
> +
> +       return ((addr - offset) << 1) | offset;
> +}
> +EXPORT_SYMBOL_GPL(spi_nor_s3an_addr_convert);
> +
> +/*
>   * Initiate the erasure of a single sector
>   */
>  static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> @@ -330,6 +370,9 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>         if (nor->erase)
>                 return nor->erase(nor, addr);
>
> +       if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> +               addr = spi_nor_s3an_addr_convert(nor, addr);
> +
>         /*
>          * Default implementation, if driver doesn't have a specialized HW
>          * control
> @@ -368,7 +411,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>                 return ret;
>
>         /* whole-chip erase? */
> -       if (len == mtd->size) {
> +       if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>                 unsigned long timeout;
>
>                 write_enable(nor);
> @@ -782,6 +825,19 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>                 .addr_width = (_addr_width),                            \
>                 .flags = (_flags),
>
> +#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)                   \
> +               .id = {                                                 \
> +                       ((_jedec_id) >> 16) & 0xff,                     \
> +                       ((_jedec_id) >> 8) & 0xff,                      \
> +                       (_jedec_id) & 0xff                              \
> +                       },                                              \
> +               .id_len = 3,                                            \
> +               .sector_size = (8*_page_size),                          \
> +               .n_sectors = (_n_sectors),                              \
> +               .page_size = _page_size,                                \
> +               .addr_width = 3,                                        \
> +               .flags = SPI_NOR_NO_FR | SPI_S3AN,
> +
>  /* NOTE: double check command sets and memory organization when you add
>   * more nor chips.  This current list focusses on newer chips, which
>   * have been converging on command sets which including JEDEC ID.
> @@ -1009,6 +1065,13 @@ static const struct flash_info spi_nor_ids[] = {
>         { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
> +
> +       /* Xilinx S3AN Internal Flash */
> +       { "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
> +       { "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
> +       { "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
> +       { "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
> +       { "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
>         { },
>  };
>
> @@ -1171,7 +1234,13 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>         for (i = 0; i < len; ) {
>                 ssize_t written;
>
> -               page_offset = (to + i) & (nor->page_size - 1);
> +               if (hweight32(nor->page_size) == 1)
> +                       page_offset = to & (nor->page_size - 1);
> +               else {
> +                       uint64_t aux = to;
> +
> +                       page_offset = do_div(aux, nor->page_size);
> +               }
>                 WARN_ONCE(page_offset,
>                           "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
>                           page_offset);
> @@ -1300,6 +1369,35 @@ static int spi_nor_check(struct spi_nor *nor)
>         return 0;
>  }
>
> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
> +{
> +       int ret;
> +       u8 val;
> +
> +       ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
> +       if (ret < 0) {
> +               pr_err("error %d reading XRDSR\n", (int) ret);
> +               return ret;
> +       }
> +
> +       nor->erase_opcode = SPINOR_OP_XSE;
> +       nor->program_opcode = SPINOR_OP_XPP;
> +       nor->read_opcode = SPINOR_OP_READ;
> +       nor->flags |= SNOR_F_NO_OP_CHIP_ERASE | SNOR_F_READY_XSR_RDY;
> +
> +       /* Flash in Power of 2 mode */
> +       if (val & XSR_PAGESIZE) {
> +               nor->page_size = (nor->page_size == 264) ? 256 : 512;
> +               nor->mtd.writebufsize = nor->page_size;
> +               nor->mtd.size = 8 * nor->page_size * info->n_sectors;
> +               nor->mtd.erasesize = 8 * nor->page_size;
> +       } else {
> +               nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
> +       }
> +
> +       return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  {
>         const struct flash_info *info = NULL;
> @@ -1505,6 +1603,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>
>         nor->read_dummy = spi_nor_read_dummy_cycles(nor);
>
> +       if (info->flags & SPI_S3AN) {
> +               ret = s3an_nor_scan(info, nor);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         dev_info(dev, "%s (%lld Kbytes)\n", info->name,
>                         (long long)mtd->size >> 10);
>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c425c7b4c2a0..6378de414bca 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -68,6 +68,15 @@
>  #define SPINOR_OP_WRDI         0x04    /* Write disable */
>  #define SPINOR_OP_AAI_WP       0xad    /* Auto address increment word program */
>
> +/* Used for S3AN flashes only */
> +#define SPINOR_OP_XSE          0x50    /* Sector erase */
> +#define SPINOR_OP_XPP          0x82    /* Page program */
> +#define SPINOR_OP_XRDSR                0xd7    /* Read status register */
> +
> +#define XSR_PAGESIZE           BIT(0)  /* Page size in Po2 or Linear */
> +#define XSR_RDY                        BIT(7)  /* Ready */
> +
> +
>  /* Used for Macronix and Winbond flashes. */
>  #define SPINOR_OP_EN4B         0xb7    /* Enter 4-byte mode */
>  #define SPINOR_OP_EX4B         0xe9    /* Exit 4-byte mode */
> @@ -119,6 +128,9 @@ enum spi_nor_ops {
>  enum spi_nor_option_flags {
>         SNOR_F_USE_FSR          = BIT(0),
>         SNOR_F_HAS_SR_TB        = BIT(1),
> +       SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
> +       SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
> +       SNOR_F_READY_XSR_RDY    = BIT(4),
>  };
>
>  /**
> @@ -197,6 +209,20 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
>         return mtd_get_of_node(&nor->mtd);
>  }
>
> +
> +/**
> + * spi_nor_s3an_addr_convert() - convert an address to Default Address Mode
> + * @nor:       the spi_nor structure
> + * @addr:      the contiguous address value
> + *
> + * Spartan-3AN In-System Flash requires an special address mode to access its
> + * whole Flash area. This address mode, named Default Address Mode by Xilinx,
> + * has non power of two page sizes.
> + *
> + * Return: Address in Default Address Mode
> + */
> +unsigned int spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr);
> +
>  /**
>   * spi_nor_scan() - scan the SPI NOR
>   * @nor:       the spi_nor structure
> --
> 2.8.1
>



-- 
Ricardo Ribalda
