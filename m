Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwjoo-0001yd-24
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 04:49:07 +0000
Received: by oies6 with SMTP id s6so2605354oie.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 20:48:44 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <1447077023.31665.72.camel@linux.intel.com>
References: <1446691741-8393-1-git-send-email-punnaia@xilinx.com>
 <1447077023.31665.72.camel@linux.intel.com>
Date: Thu, 12 Nov 2015 10:18:44 +0530
Message-ID: <CAGnW=BYBRfVhuj-jFpe8BYTTg=n4ZqDsbfYDprapf538R=wZ9w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] mtd: nand: Add support for Arasan Nand Flash
 Controller
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, geert@linux-m68k.org,
 "michals@xilinx.com" <michals@xilinx.com>, wangzhou1@hisilicon.com,
 Florian Fainelli <f.fainelli@gmail.com>, gsi@denx.de, haokexin@gmail.com,
 rogerq@ti.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary <kpc528@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 9, 2015 at 7:20 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, 2015-11-05 at 08:19 +0530, Punnaiah Choudary Kalluri wrote:
>> Added the basic driver for Arasan Nand Flash Controller used in
>> Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
>> correction.
>>
>
>> +config MTD_NAND_ARASAN
>> +     tristate "Support for Arasan Nand Flash controller"
>> +     depends on MTD_NAND
>
> This looks useless since you can't see the item without MTD_NAND is
> chosen.
>
>> +     help
>> +       Enables the driver for the Arasan Nand Flash controller on
>> +       Zynq UltraScale+ MPSoC.
>> +
>>  endif # MTD_NAND
>>
>
> +obj-$(CONFIG_MTD_NAND_ARASAN)          += arasan_nfc.o
>
> "nfc" part a bit ambiguous since NFC might be Near Field Communication.

This driver is under mtd/nand so, there is no point of confusion and
in this context nfc is nand flash controller.
>
> Perhaps "nand_fc" or something like that?
>
>>
>>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
>> diff --git a/drivers/mtd/nand/arasan_nfc.c
>> b/drivers/mtd/nand/arasan_nfc.c
>> new file mode 100644
>> index 0000000..9d4665e
>> --- /dev/null
>> +++ b/drivers/mtd/nand/arasan_nfc.c
>> @@ -0,0 +1,1026 @@
>> +/*
>> + * Arasan Nand Flash Controller Driver
>> + *
>> + * Copyright (C) 2014 - 2015 Xilinx, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> modify it under
>> + * the terms of the GNU General Public License version 2 as
>> published by the
>> + * Free Software Foundation; either version 2 of the License, or (at
>> your
>> + * option) any later version.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/of.h>
>> +#include <linux/of_mtd.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DRIVER_NAME                  "arasan_nfc"
>
> Ditto.
>
>> +#define EVNT_TIMEOUT                 1000
>> +#define STATUS_TIMEOUT                       2000
>> +
>> +#define PKT_OFST                     0x00
>> +#define MEM_ADDR1_OFST                       0x04
>> +#define MEM_ADDR2_OFST                       0x08
>> +#define CMD_OFST                     0x0C
>> +#define PROG_OFST                    0x10
>> +#define INTR_STS_EN_OFST             0x14
>> +#define INTR_SIG_EN_OFST             0x18
>> +#define INTR_STS_OFST                        0x1C
>> +#define READY_STS_OFST                       0x20
>> +#define DMA_ADDR1_OFST                       0x24
>> +#define FLASH_STS_OFST                       0x28
>> +#define DATA_PORT_OFST                       0x30
>> +#define ECC_OFST                     0x34
>> +#define ECC_ERR_CNT_OFST             0x38
>> +#define ECC_SPR_CMD_OFST             0x3C
>> +#define ECC_ERR_CNT_1BIT_OFST                0x40
>> +#define ECC_ERR_CNT_2BIT_OFST                0x44
>> +#define DMA_ADDR0_OFST                       0x50
>> +#define DATA_INTERFACE_REG           0x6C
>> +
>> +#define PKT_CNT_SHIFT                        12
>> +
>> +#define ECC_ENABLE                   BIT(31)
>> +#define DMA_EN_MASK                  GENMASK(27, 26)
>> +#define DMA_ENABLE                   0x2
>> +#define DMA_EN_SHIFT                 26
>> +#define PAGE_SIZE_MASK                       GENMASK(25, 23)
>
> PAGE_SIZE_ prefix is too broad, might conflict with global definitions
> on some architectures.
>
>> +#define PAGE_SIZE_SHIFT                      23
>> +#define PAGE_SIZE_512                        0
>> +#define PAGE_SIZE_1K                 5
>> +#define PAGE_SIZE_2K                 1
>> +#define PAGE_SIZE_4K                 2
>> +#define PAGE_SIZE_8K                 3
>> +#define PAGE_SIZE_16K                        4
>> +#define CMD2_SHIFT                   8
>> +#define ADDR_CYCLES_SHIFT            28
>> +
>> +#define XFER_COMPLETE                        BIT(2)
>> +#define READ_READY                   BIT(1)
>> +#define WRITE_READY                  BIT(0)
>> +#define MBIT_ERROR                   BIT(3)
>> +#define ERR_INTRPT                   BIT(4)
>> +
>> +#define PROG_PGRD                    BIT(0)
>> +#define PROG_ERASE                   BIT(2)
>> +#define PROG_STATUS                  BIT(3)
>> +#define PROG_PGPROG                  BIT(4)
>> +#define PROG_RDID                    BIT(6)
>> +#define PROG_RDPARAM                 BIT(7)
>> +#define PROG_RST                     BIT(8)
>> +#define PROG_GET_FEATURE             BIT(9)
>> +#define PROG_SET_FEATURE             BIT(10)
>> +
>> +#define ONFI_STATUS_FAIL             BIT(0)
>> +#define ONFI_STATUS_READY            BIT(6)
>> +
>> +#define PG_ADDR_SHIFT                        16
>> +#define BCH_MODE_SHIFT                       25
>> +#define BCH_EN_SHIFT                 27
>> +#define ECC_SIZE_SHIFT                       16
>> +
>> +#define MEM_ADDR_MASK                        GENMASK(7, 0)
>> +#define BCH_MODE_MASK                        GENMASK(27, 25)
>> +
>> +#define CS_MASK                              GENMASK(31, 30)
>> +#define CS_SHIFT                     30
>> +
>> +#define PAGE_ERR_CNT_MASK            GENMASK(16, 8)
>> +#define PKT_ERR_CNT_MASK             GENMASK(7, 0)
>> +
>> +#define NVDDR_MODE                   BIT(9)
>> +#define NVDDR_TIMING_MODE_SHIFT              3
>> +
>> +#define ONFI_ID_LEN                  8
>> +#define TEMP_BUF_SIZE                        512
>> +#define NVDDR_MODE_PACKET_SIZE               8
>> +#define SDR_MODE_PACKET_SIZE         4
>> +
>> +/**
>> + * struct anfc_ecc_matrix - Defines ecc information storage format
>> + * @pagesize:                Page size in bytes.
>> + * @codeword_size:   Code word size information.
>> + * @eccbits:         Number of ecc bits.
>> + * @bch:             Bch / Hamming mode enable/disable.
>> + * @eccsize:         Ecc size information.
>> + */
>> +struct anfc_ecc_matrix {
>> +     u32 pagesize;
>> +     u32 codeword_size;
>> +     u8 eccbits;
>> +     u8 bch;
>> +     u16 eccsize;
>> +};
>> +
>> +static const struct anfc_ecc_matrix ecc_matrix[] = {
>> +     {512,   512,    1,      0,      0x3},
>> +     {512,   512,    4,      1,      0x7},
>> +     {512,   512,    8,      1,      0xD},
>> +     /* 2K byte page */
>> +     {2048,  512,    1,      0,      0xC},
>> +     {2048,  512,    4,      1,      0x1A},
>> +     {2048,  512,    8,      1,      0x34},
>> +     {2048,  512,    12,     1,      0x4E},
>> +     {2048,  1024,   24,     1,      0x54},
>> +     /* 4K byte page */
>> +     {4096,  512,    1,      0,      0x18},
>> +     {4096,  512,    4,      1,      0x34},
>> +     {4096,  512,    8,      1,      0x68},
>> +     {4096,  512,    12,     1,      0x9C},
>> +     {4096,  1024,   4,      1,      0xA8},
>> +     /* 8K byte page */
>> +     {8192,  512,    1,      0,      0x30},
>> +     {8192,  512,    4,      1,      0x68},
>> +     {8192,  512,    8,      1,      0xD0},
>> +     {8192,  512,    12,     1,      0x138},
>> +     {8192,  1024,   24,     1,      0x150},
>> +     /* 16K byte page */
>> +     {16384, 512,    1,      0,      0x60},
>> +     {16384, 512,    4,      1,      0xD0},
>> +     {16384, 512,    8,      1,      0x1A0},
>> +     {16384, 512,    12,     1,      0x270},
>> +     {16384, 1024,   24,     1,      0x2A0}
>> +};
>> +
>> +/**
>> + * struct anfc - Defines the Arasan NAND flash driver instance
>> + * @chip:            NAND chip information structure.
>> + * @mtd:             MTD information structure.
>> + * @dev:             Pointer to the device structure.
>> + * @base:            Virtual address of the NAND flash device.
>> + * @curr_cmd:                Current command issued.
>> + * @clk_sys:         Pointer to the system clock.
>> + * @clk_flash:               Pointer to the flash clock.
>> + * @dma:             Dma enable/disable.
>> + * @bch:             Bch / Hamming mode enable/disable.
>> + * @err:             Error identifier.
>> + * @iswriteoob:              Identifies if oob write operation is
>> required.
>> + * @buf:             Buffer used for read/write byte operations.
>> + * @raddr_cycles:    Row address cycle information.
>> + * @caddr_cycles:    Column address cycle information.
>> + * @irq:             irq number
>> + * @page:            Page address to be use for write oob
>> operations.
>> + * @pktsize:         Packet size for read / write operation.
>> + * @bufshift:                Variable used for indexing buffer
>> operation
>> + * @rdintrmask:              Interrupt mask value for read
>> operation.
>> + * @num_cs:          Number of chip selects in use.
>> + * @spktsize:                Packet size in ddr mode for status
>> operation.
>> + * @bufrdy:          Completion event for buffer ready.
>> + * @xfercomp:                Completion event for transfer complete.
>> + * @ecclayout:               Ecc layout object
>> + */
>> +struct anfc {
>> +     struct nand_chip chip;
>> +     struct mtd_info mtd;
>> +     struct device *dev;
>> +
>> +     void __iomem *base;
>> +     int curr_cmd;
>> +     struct clk *clk_sys;
>> +     struct clk *clk_flash;
>> +
>> +     bool dma;
>> +     bool bch;
>> +     bool err;
>> +     bool iswriteoob;
>> +
>> +     u8 buf[TEMP_BUF_SIZE];
>> +
>> +     u16 raddr_cycles;
>> +     u16 caddr_cycles;
>> +
>> +     u32 irq;
>> +     u32 page;
>> +     u32 pktsize;
>> +     u32 bufshift;
>> +     u32 rdintrmask;
>> +     u32 num_cs;
>> +     u32 spktsize;
>> +
>> +     struct completion bufrdy;
>> +     struct completion xfercomp;
>> +     struct nand_ecclayout ecclayout;
>> +};
>> +
>> +static u8 anfc_page(u32 pagesize)
>> +{
>> +     switch (pagesize) {
>> +     case 512:
>> +             return PAGE_SIZE_512;
>> +     case 2048:
>> +             return PAGE_SIZE_2K;
>> +     case 4096:
>> +             return PAGE_SIZE_4K;
>> +     case 8192:
>> +             return PAGE_SIZE_8K;
>> +     case 16384:
>> +             return PAGE_SIZE_16K;
>> +     case 1024:
>
> Why not keep sorted here?

It is sorted based on the return value. I will change the
sorting order based on the page size bytes.
>
>> +             return PAGE_SIZE_1K;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return 0;
>
>
>
>> +}
>> +
>> +static inline void anfc_enable_intrs(struct anfc *nfc, u32 val)
>> +{
>> +     writel(val, nfc->base + INTR_STS_EN_OFST);
>> +     writel(val, nfc->base + INTR_SIG_EN_OFST);
>> +}
>> +
>> +static int anfc_wait_for_event(struct anfc *nfc, u32 event)
>> +{
>> +     struct completion *comp;
>> +     int ret;
>> +
>> +     if (event == XFER_COMPLETE)
>> +             comp = &nfc->xfercomp;
>> +     else
>> +             comp = &nfc->bufrdy;
>> +
>> +     ret = wait_for_completion_timeout(comp,
>> msecs_to_jiffies(EVNT_TIMEOUT));
>> +
>> +     return ret;
>
> return func();
>
>> +}
>> +
>> +static inline void anfc_setpktszcnt(struct anfc *nfc, u32 pktsize,
>> +                                 u32 pktcount)
>> +{
>> +     writel(pktsize | (pktcount << PKT_CNT_SHIFT), nfc->base +
>> PKT_OFST);
>> +}
>> +
>> +static inline void anfc_set_eccsparecmd(struct anfc *nfc, u8 cmd1,
>> u8 cmd2)
>> +{
>> +     writel(cmd1 | (cmd2 << CMD2_SHIFT) |
>> +            (nfc->caddr_cycles << ADDR_CYCLES_SHIFT),
>> +            nfc->base + ECC_SPR_CMD_OFST);
>> +}
>> +
>> +static void anfc_setpagecoladdr(struct anfc *nfc, u32 page, u16 col)
>> +{
>> +     u32 val;
>> +
>> +     writel(col | (page << PG_ADDR_SHIFT), nfc->base +
>> MEM_ADDR1_OFST);
>> +
>> +     val = readl(nfc->base + MEM_ADDR2_OFST);
>> +     val = (val & ~MEM_ADDR_MASK) |
>> +           ((page >> PG_ADDR_SHIFT) & MEM_ADDR_MASK);
>> +     writel(val, nfc->base + MEM_ADDR2_OFST);
>> +}
>> +
>> +static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2,
>> +                          u8 dmamode, u32 pagesize, u8
>> addrcycles)
>> +{
>> +     u32 regval;
>> +
>> +     regval = cmd1 | (cmd2 << CMD2_SHIFT);
>> +     if (dmamode && nfc->dma)
>> +             regval |= DMA_ENABLE << DMA_EN_SHIFT;
>> +     if (addrcycles)
>> +             regval |= addrcycles << ADDR_CYCLES_SHIFT;
>> +     if (pagesize)
>> +             regval |= anfc_page(pagesize) << PAGE_SIZE_SHIFT;
>> +     writel(regval, nfc->base + CMD_OFST);
>> +}
>> +
>> +static int anfc_device_ready(struct mtd_info *mtd,
>> +                          struct nand_chip *chip)
>> +{
>> +     u8 status;
>> +     unsigned long timeout = jiffies + STATUS_TIMEOUT;
>> +
>> +     do {
>> +             chip->cmdfunc(mtd, NAND_CMD_STATUS, 0, 0);
>> +             status = chip->read_byte(mtd);
>> +             if (status & ONFI_STATUS_READY) {
>
>> +                     if (status & ONFI_STATUS_FAIL)
>> +                             return NAND_STATUS_FAIL;
>
> This is invariant to the loop, perhaps move outside.

Nand device is ready means it is ready to accept next command and
it is done with previous command. It doesn't mean that previous
command is success, it can fail also.
>
>> +                     break;
>> +             }
>> +             cpu_relax();
>> +     } while (!time_after_eq(jiffies, timeout));
>> +
>> +     if (time_after_eq(jiffies, timeout)) {
>> +             pr_err("%s timed out\n", __func__);
>
> dev_err?
>
>> +             return -ETIMEDOUT;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_read_oob(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> +                      int page)
>> +{
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>
> Since you use it more than once might be a good idea to do something
> like
>
> #define to_anfc() container_of()
>
>> +
>> +     chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
>> +     if (nfc->dma)
>> +             nfc->rdintrmask = XFER_COMPLETE;
>> +     else
>> +             nfc->rdintrmask = READ_READY;
>> +     chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip
>> *chip,
>> +                       int page)
>> +{
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +
>> +     nfc->iswriteoob = true;
>> +     chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
>> +     chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +     nfc->iswriteoob = false;
>> +
>> +     return 0;
>> +}
>> +
>> +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int
>> len)
>> +{
>> +     u32 i, pktcount, buf_rd_cnt = 0, pktsize;
>
> Type for i looks unsigned int, why u32? Same question for all variables
> that are not used to directly program HW.
>
>> +     u32 *bufptr = (u32 *)buf;
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr = 0;
>> +
>> +     if (nfc->curr_cmd == NAND_CMD_READ0) {
>> +             pktsize = nfc->pktsize;
>>
>
>
>> +             if (mtd->writesize % pktsize)
>> +                     pktcount = mtd->writesize / pktsize + 1;
>> +             else
>> +                     pktcount = mtd->writesize / pktsize;
>
> DIV_ROUND_UP ?
>
>
>> +     } else {
>> +             pktsize = len;
>> +             pktcount = 1;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr = dma_map_single(nfc->dev, buf, len,
>> DMA_FROM_DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Read buffer mapping
>> error");
>> +                     return;
>> +             }
>> +             writel(lower_32_bits(paddr), nfc->base +
>> DMA_ADDR0_OFST);
>> +             writel(upper_32_bits(paddr), nfc->base +
>> DMA_ADDR1_OFST);
>> +             anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +             writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +             dma_unmap_single(nfc->dev, paddr, len,
>> DMA_FROM_DEVICE);
>> +             return;
>> +     }
>> +
>> +     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +
>> +     while (buf_rd_cnt < pktcount) {
>> +
>> +             anfc_wait_for_event(nfc, READ_READY);
>> +             buf_rd_cnt++;
>> +
>> +             if (buf_rd_cnt == pktcount)
>> +                     anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +
>> +             for (i = 0; i < pktsize / 4; i++)
>> +                     bufptr[i] = readl(nfc->base +
>> DATA_PORT_OFST);
>> +
>> +             bufptr += (pktsize / 4);
>
> Useless parens.
>
>> +
>> +             if (buf_rd_cnt < pktcount)
>> +                     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     }
>> +
>> +     anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +}
>> +
>> +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
>> int len)
>> +{
>> +     u32 buf_wr_cnt = 0, pktcount = 1, i, pktsize;
>
> Useless assignment of pktcount. Check all your definition blocks for
> similar thing.

what is the problem with u32 here ? may be i am missing something here but
i really want to know the reason.
>
>> +     u32 *bufptr = (u32 *)buf;
>> +     struct anfc *nfc = container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr = 0;
>> +
>> +     if (nfc->iswriteoob) {
>> +             pktsize = len;
>> +             pktcount = 1;
>> +     } else {
>> +             pktsize = nfc->pktsize;
>> +             pktcount = mtd->writesize / pktsize;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr = dma_map_single(nfc->dev, (void *)buf, len,
>> +                                    DMA_TO_DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Write buffer mapping
>> error");
>> +                     return;
>> +             }
>>
>
>> +             writel(lower_32_bits(paddr), nfc->base +
>> DMA_ADDR0_OFST);
>> +             writel(upper_32_bits(paddr), nfc->base +
>> DMA_ADDR1_OFST);
>
> lo_hi_writeq();

Ok. let me check if this function is available across all
the platforms.

Thanks for the detailed review. I agree with you for all other
comments and i will fix them in next version.

Regards,
Punnaiah
