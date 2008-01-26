Received: from an-out-0708.google.com ([209.85.132.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JIlKy-0001AB-Nv
	for linux-mtd@lists.infradead.org; Sat, 26 Jan 2008 13:44:54 +0000
Received: by an-out-0708.google.com with SMTP id c3so232051ana.99
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jan 2008 05:44:47 -0800 (PST)
Message-ID: <acd2a5930801260544n22fae0c9if9a2c5d13d67da81@mail.gmail.com>
Date: Sat, 26 Jan 2008 16:44:47 +0300
From: "Vitaly Wool" <vitalywool@gmail.com>
To: spodstavin@ru.mvista.com
Subject: Re: [PATCH] basic pxa3 nand controller support
In-Reply-To: <1201237929.3292.2.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1201237929.3292.2.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

FOn Jan 25, 2008 8:12 AM, Sergey Podstavin <spodstavin@ru.mvista.com> wrote:
> This is updated pxa3 nand controller support, io mapping was removed,
> partition tables were moved outside of the driver into platform code,
> some cleanup was done.

<snip>
> @@ -86,9 +86,9 @@ ENTRY(stext)
>         bl      __lookup_processor_type         @ r5=procinfo r9=cpuid
>         movs    r10, r5                         @ invalid processor (r5=0)?
>         beq     __error_p                       @ yes, error 'p'
> -       bl      __lookup_machine_type           @ r5=machinfo
> -       movs    r8, r5                          @ invalid machine (r5=0)?
> -       beq     __error_a                       @ yes, error 'a'
> +//     bl      __lookup_machine_type           @ r5=machinfo
> +//     movs    r8, r5                          @ invalid machine (r5=0)?
> +//     beq     __error_a                       @ yes, error 'a'
>         bl      __vet_atags
>         bl      __create_page_tables

Nice cleanup :P

> +#include <linux/mtd/nand.h>

I wonder if you really need this header.

> +void __init set_pxa_nand_info(struct pxa3xx_nand_platform_data *info)
> +{
> +       nand_device.dev.platform_data = info;
> +}

That doesn't belong to zylonite.c.

> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> new file mode 100644
> index 0000000..11bebbf
> --- /dev/null
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -0,0 +1,1385 @@
> +/*
> + * drivers/mtd/nand/pxa3xx_nand.c
> + *
> + * Copyright (C) 2005 Intel Corporation
> + * Copyright (C) 2006 Marvell International Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <asm/io.h>
> +#include <asm/irq.h>
> +#include <asm/dma.h>
> +
> +#include <asm/arch/pxa-regs.h>
> +#include <asm/arch/pxa3xx_nand.h>
> +
> +#define        CHIP_DELAY_TIMEOUT      (2 * HZ/10)
> +
> +/* registers and bit definitions */
> +#define NDCR           (0x00) /* Control register */
> +#define NDTR0CS0       (0x04) /* Timing Parameter 0 for CS0 */
> +#define NDTR1CS0       (0x0C) /* Timing Parameter 1 for CS0 */
> +#define NDSR           (0x14) /* Status Register */
> +#define NDPCR          (0x18) /* Page Count Register */
> +#define NDBDR0         (0x1C) /* Bad Block Register 0 */
> +#define NDBDR1         (0x20) /* Bad Block Register 1 */
> +#define NDDB           (0x40) /* Data Buffer */
> +#define NDCB0          (0x48) /* Command Buffer0 */
> +#define NDCB1          (0x4C) /* Command Buffer1 */
> +#define NDCB2          (0x50) /* Command Buffer2 */
> +
> +#define NDCR_SPARE_EN          (0x1 << 31)
> +#define NDCR_ECC_EN            (0x1 << 30)
> +#define NDCR_DMA_EN            (0x1 << 29)
> +#define NDCR_ND_RUN            (0x1 << 28)
> +#define NDCR_DWIDTH_C          (0x1 << 27)
> +#define NDCR_DWIDTH_M          (0x1 << 26)
> +#define NDCR_PAGE_SZ           (0x1 << 24)
> +#define NDCR_NCSX              (0x1 << 23)
> +#define NDCR_ND_MODE           (0x3 << 21)
> +#define NDCR_NAND_MODE         (0x0)
> +#define NDCR_CLR_PG_CNT                (0x1 << 20)
> +#define NDCR_CLR_ECC           (0x1 << 19)
> +#define NDCR_RD_ID_CNT_MASK    (0x7 << 16)
> +#define NDCR_RD_ID_CNT(x)      (((x) << 16) & NDCR_RD_ID_CNT_MASK)
> +
> +#define NDCR_RA_START          (0x1 << 15)
> +#define NDCR_PG_PER_BLK                (0x1 << 14)
> +#define NDCR_ND_ARB_EN         (0x1 << 12)
> +
> +#define NDSR_MASK              (0xfff)
> +#define NDSR_RDY               (0x1 << 11)
> +#define NDSR_CS0_PAGED         (0x1 << 10)
> +#define NDSR_CS1_PAGED         (0x1 << 9)
> +#define NDSR_CS0_CMDD          (0x1 << 8)
> +#define NDSR_CS1_CMDD          (0x1 << 7)
> +#define NDSR_CS0_BBD           (0x1 << 6)
> +#define NDSR_CS1_BBD           (0x1 << 5)
> +#define NDSR_DBERR             (0x1 << 4)
> +#define NDSR_SBERR             (0x1 << 3)
> +#define NDSR_WRDREQ            (0x1 << 2)
> +#define NDSR_RDDREQ            (0x1 << 1)
> +#define NDSR_WRCMDREQ          (0x1)
> +
> +#define NDCB0_AUTO_RS          (0x1 << 25)
> +#define NDCB0_CSEL             (0x1 << 24)
> +#define NDCB0_CMD_TYPE_MASK    (0x7 << 21)
> +#define NDCB0_CMD_TYPE(x)      (((x) << 21) & NDCB0_CMD_TYPE_MASK)
> +#define NDCB0_NC               (0x1 << 20)
> +#define NDCB0_DBC              (0x1 << 19)
> +#define NDCB0_ADDR_CYC_MASK    (0x7 << 16)
> +#define NDCB0_ADDR_CYC(x)      (((x) << 16) & NDCB0_ADDR_CYC_MASK)
> +#define NDCB0_CMD2_MASK                (0xff << 8)
> +#define NDCB0_CMD1_MASK                (0xff)
> +#define NDCB0_ADDR_CYC_SHIFT   (16)
> +
> +/* dma-able I/O address for the NAND data and commands */
> +#define NDCB0_DMA_ADDR         (0x43100048)
> +#define NDDB_DMA_ADDR          (0x43100040)
> +
> +/* macros for registers read/write */
> +#define nand_writel(info, off, val)    \
> +       __raw_writel((val), (info)->mmio_base + (off))
> +
> +#define nand_readl(info, off)          \
> +       __raw_readl((info)->mmio_base + (off))
> +
> +/* error code and state */
> +enum {
> +       ERR_NONE        = 0,
> +       ERR_DMABUSERR   = -1,
> +       ERR_SENDCMD     = -2,
> +       ERR_DBERR       = -3,
> +       ERR_BBERR       = -4,
> +       ERR_BUSY        = -5,
> +};
> +
> +enum {
> +       STATE_CMD_SEND = 1,
> +       STATE_CMD_HANDLE,
> +       STATE_DMA_TRANSFER,
> +       STATE_DMA_DONE,
> +       STATE_READY,
> +       STATE_SUSPENDED,
> +       STATE_DATA_TRANSFER,
> +};
> +
> +struct pxa3xx_nand_timing {
> +       unsigned int    tCH;  /* Enable signal hold time */
> +       unsigned int    tCS;  /* Enable signal setup time */
> +       unsigned int    tWH;  /* ND_nWE high duration */
> +       unsigned int    tWP;  /* ND_nWE pulse time */
> +       unsigned int    tRH;  /* ND_nRE high duration */
> +       unsigned int    tRP;  /* ND_nRE pulse width */
> +       unsigned int    tR;   /* ND_nWE high to ND_nRE low for read */
> +       unsigned int    tWHR; /* ND_nWE high to ND_nRE low for status read */
> +       unsigned int    tAR;  /* ND_ALE low to ND_nRE low delay */
> +};
> +
> +struct pxa3xx_nand_cmdset {
> +       uint16_t        read1;
> +       uint16_t        read2;
> +       uint16_t        program;
> +       uint16_t        read_status;
> +       uint16_t        read_id;
> +       uint16_t        erase;
> +       uint16_t        reset;
> +       uint16_t        lock;
> +       uint16_t        unlock;
> +       uint16_t        lock_status;
> +};
> +
> +struct pxa3xx_nand_flash {
> +       struct pxa3xx_nand_timing *timing; /* NAND Flash timing */
> +       struct pxa3xx_nand_cmdset *cmdset;
> +
> +       uint32_t page_per_block;/* Pages per block (PG_PER_BLK) */
> +       uint32_t page_size;     /* Page size in bytes (PAGE_SZ) */
> +       uint32_t flash_width;   /* Width of Flash memory (DWIDTH_M) */
> +       uint32_t dfc_width;     /* Width of flash controller(DWIDTH_C) */
> +       uint32_t num_blocks;    /* Number of physical blocks in Flash */
> +       uint32_t chip_id;
> +
> +       /* NOTE: these are automatically calculated, do not define */
> +       size_t          oob_size;
> +       size_t          read_id_bytes;
> +
> +       unsigned int    col_addr_cycles;
> +       unsigned int    row_addr_cycles;
> +};
> +
> +struct pxa3xx_nand_info {
> +       struct nand_chip        nand_chip;
> +
> +       struct platform_device   *pdev;
> +       struct pxa3xx_nand_flash *flash_info;
> +
> +       struct clk              *clk;
> +       void __iomem            *mmio_base;
> +
> +       unsigned int            buf_start;
> +       unsigned int            buf_count;
> +
> +       /* DMA information */
> +       unsigned char           *data_buff;
> +       dma_addr_t              data_buff_phys;
> +       size_t                  data_buff_size;
> +       int                     data_dma_ch;
> +       struct pxa_dma_desc     *data_desc;
> +       dma_addr_t              data_desc_addr;
> +
> +       uint32_t                reg_ndcr;
> +
> +       /* saved column/page_addr during CMD_SEQIN */
> +       int                     seqin_column;
> +       int                     seqin_page_addr;
> +
> +       /* relate to the command */
> +       unsigned int            state;
> +
> +       int                     use_ecc;        /* use HW ECC ? */
> +       int                     use_dma;        /* use DMA ? */
> +
> +       size_t                  data_size;      /* data size in FIFO */
> +       unsigned int            cur_cmd;
> +       int                     retcode;
> +       struct completion       cmd_complete;
> +
> +       /* generated NDCBx register values */
> +       uint32_t                ndcb0;
> +       uint32_t                ndcb1;
> +       uint32_t                ndcb2;
> +};
> +
> +static int use_dma = 0;
> +module_param(use_dma, bool, 0444);
> +MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND HW");
> +
> +static struct pxa3xx_nand_cmdset smallpage_cmdset = {
> +       .read1          = 0x0000,
> +       .read2          = 0x0050,
> +       .program        = 0x1080,
> +       .read_status    = 0x0070,
> +       .read_id        = 0x0090,
> +       .erase          = 0xD060,
> +       .reset          = 0x00FF,
> +       .lock           = 0x002A,
> +       .unlock         = 0x2423,
> +       .lock_status    = 0x007A,
> +};
> +
> +static struct pxa3xx_nand_cmdset largepage_cmdset = {
> +       .read1          = 0x3000,
> +       .read2          = 0x0050,
> +       .program        = 0x1080,
> +       .read_status    = 0x0070,
> +       .read_id        = 0x0090,
> +       .erase          = 0xD060,
> +       .reset          = 0x00FF,
> +       .lock           = 0x002A,
> +       .unlock         = 0x2423,
> +       .lock_status    = 0x007A,
> +};
> +
> +static struct pxa3xx_nand_timing samsung512MbX16_timing = {
> +       .tCH    = 10,
> +       .tCS    = 0,
> +       .tWH    = 20,
> +       .tWP    = 40,
> +       .tRH    = 30,
> +       .tRP    = 40,
> +       .tR     = 11123,
> +       .tWHR   = 110,
> +       .tAR    = 10,
> +};
> +
> +static struct pxa3xx_nand_flash samsung512MbX16 = {
> +       .timing         = &samsung512MbX16_timing,
> +       .cmdset         = &smallpage_cmdset,
> +       .page_per_block = 32,
> +       .page_size      = 512,
> +       .flash_width    = 16,
> +       .dfc_width      = 16,
> +       .num_blocks     = 4096,
> +       .chip_id        = 0x46ec,
> +};
> +
> +static struct pxa3xx_nand_timing micron_timing = {
> +       .tCH    = 10,
> +       .tCS    = 25,
> +       .tWH    = 15,
> +       .tWP    = 25,
> +       .tRH    = 15,
> +       .tRP    = 25,
> +       .tR     = 25000,
> +       .tWHR   = 60,
> +       .tAR    = 10,
> +};
> +
> +static struct pxa3xx_nand_flash micron1GbX8 = {
> +       .timing         = &micron_timing,
> +       .cmdset         = &largepage_cmdset,
> +       .page_per_block = 64,
> +       .page_size      = 2048,
> +       .flash_width    = 8,
> +       .dfc_width      = 8,
> +       .num_blocks     = 1024,
> +       .chip_id        = 0xa12c,
> +};
> +
> +static struct pxa3xx_nand_flash micron1GbX16 = {
> +       .timing         = &micron_timing,
> +       .cmdset         = &largepage_cmdset,
> +       .page_per_block = 64,
> +       .page_size      = 2048,
> +       .flash_width    = 16,
> +       .dfc_width      = 16,
> +       .num_blocks     = 1024,
> +       .chip_id        = 0xb12c,
> +};
> +
> +static struct pxa3xx_nand_flash *builtin_flash_types[] = {
> +       &samsung512MbX16,
> +       &micron1GbX8,
> +       &micron1GbX16,
> +};
> +
> +#define NDTR0_tCH(c)   (min((c), 7) << 19)
> +#define NDTR0_tCS(c)   (min((c), 7) << 16)
> +#define NDTR0_tWH(c)   (min((c), 7) << 11)
> +#define NDTR0_tWP(c)   (min((c), 7) << 8)
> +#define NDTR0_tRH(c)   (min((c), 7) << 3)
> +#define NDTR0_tRP(c)   (min((c), 7) << 0)
> +
> +#define NDTR1_tR(c)    (min((c), 65535) << 16)
> +#define NDTR1_tWHR(c)  (min((c), 15) << 4)
> +#define NDTR1_tAR(c)   (min((c), 15) << 0)
> +
> +/* convert nano-seconds to nand flash controller clock cycles */
> +#define ns2cycle(ns, clk)      (int)(((ns) * (clk / 1000000) / 1000) + 1)
> +
> +static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
> +                                  struct pxa3xx_nand_timing *t)
> +{
> +       unsigned long nand_clk = clk_get_rate(info->clk);
> +       uint32_t ndtr0, ndtr1;
> +
> +       ndtr0 = NDTR0_tCH(ns2cycle(t->tCH, nand_clk)) |
> +               NDTR0_tCS(ns2cycle(t->tCS, nand_clk)) |
> +               NDTR0_tWH(ns2cycle(t->tWH, nand_clk)) |
> +               NDTR0_tWP(ns2cycle(t->tWP, nand_clk)) |
> +               NDTR0_tRH(ns2cycle(t->tRH, nand_clk)) |
> +               NDTR0_tRP(ns2cycle(t->tRP, nand_clk));
> +
> +       ndtr1 = NDTR1_tR(ns2cycle(t->tR, nand_clk)) |
> +               NDTR1_tWHR(ns2cycle(t->tWHR, nand_clk)) |
> +               NDTR1_tAR(ns2cycle(t->tAR, nand_clk));
> +
> +       nand_writel(info, NDTR0CS0, ndtr0);
> +       nand_writel(info, NDTR1CS0, ndtr1);
> +}
> +
> +#define WAIT_EVENT_TIMEOUT     10
> +
> +static int wait_for_event(struct pxa3xx_nand_info *info, uint32_t event)
> +{
> +       int timeout = WAIT_EVENT_TIMEOUT;
> +       uint32_t ndsr;
> +
> +       while (timeout--) {
> +               ndsr = nand_readl(info, NDSR) & NDSR_MASK;
> +               if (ndsr & event) {
> +                       nand_writel(info, NDSR, ndsr);
> +                       return 0;
> +               }
> +               udelay(10);
> +       }
> +
> +       return -ETIMEDOUT;
> +}
> +
> +static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
> +                       uint16_t cmd, int column, int page_addr)
> +{
> +       struct pxa3xx_nand_flash *f = info->flash_info;
> +       struct pxa3xx_nand_cmdset *cmdset = f->cmdset;
> +
> +       /* calculate data size */
> +       switch (f->page_size) {
> +       case 2048:
> +               info->data_size = (info->use_ecc) ? 2088 : 2112;
> +               break;
> +       case 512:
> +               info->data_size = (info->use_ecc) ? 520 : 528;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       /* generate values for NDCBx registers */
> +       info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
> +       info->ndcb0 |= NDCB0_ADDR_CYC(f->row_addr_cycles + f->col_addr_cycles);
> +
> +       if (f->col_addr_cycles == 2) {
> +               /* large block, 2 cycles for column address
> +                * row address starts from 3rd cycle
> +                */
> +               info->ndcb1 |= (page_addr << 16) | (column & 0xffff);
> +               if (f->row_addr_cycles == 3)
> +                       info->ndcb2 = (page_addr >> 16) & 0xff;
> +       } else
> +               /* small block, 1 cycles for column address
> +                * row address starts from 2nd cycle
> +                */
> +               info->ndcb1 = (page_addr << 8) | (column & 0xff);
> +
> +       if (cmd == cmdset->program)
> +               info->ndcb0 |= NDCB0_CMD_TYPE(1) | NDCB0_AUTO_RS;
> +
> +       info->cur_cmd = cmd;
> +       return 0;
> +}
> +
> +static int prepare_erase_cmd(struct pxa3xx_nand_info *info,
> +                       uint16_t cmd, int page_addr)
> +{
> +       info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
> +       info->ndcb0 |= NDCB0_CMD_TYPE(2) | NDCB0_AUTO_RS | NDCB0_ADDR_CYC(3);
> +       info->ndcb1 = page_addr;
> +
> +       info->cur_cmd = cmd;
> +       return 0;
> +}
> +
> +static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16_t cmd)
> +{
> +       struct pxa3xx_nand_cmdset *cmdset = info->flash_info->cmdset;
> +
> +       info->ndcb0 = cmd | ((cmd & 0xff00) ? NDCB0_DBC : 0);
> +
> +       if (cmd == cmdset->read_id) {
> +               info->ndcb0 |= NDCB0_CMD_TYPE(3);
> +               info->data_size = 8;
> +       } else if (cmd == cmdset->read_status) {
> +               info->ndcb0 |= NDCB0_CMD_TYPE(4);
> +               info->data_size = 8;
> +       } else if (cmd == cmdset->reset || cmd == cmdset->lock ||
> +                  cmd == cmdset->unlock) {
> +               info->ndcb0 |= NDCB0_CMD_TYPE(5);
> +       } else
> +               return -EINVAL;
> +
> +       info->cur_cmd = cmd;
> +       return 0;
> +}
> +
> +static void enable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
> +{
> +       uint32_t ndcr;
> +
> +       ndcr = nand_readl(info, NDCR);
> +       nand_writel(info, NDCR, ndcr & ~int_mask);
> +}
> +
> +static void disable_int(struct pxa3xx_nand_info *info, uint32_t int_mask)
> +{
> +       uint32_t ndcr;
> +
> +       ndcr = nand_readl(info, NDCR);
> +       nand_writel(info, NDCR, ndcr | int_mask);
> +}
> +
> +/* NOTE: it is a must to set ND_RUN firstly, then write command buffer
> + * otherwise, it does not work
> + */
> +static int write_cmd(struct pxa3xx_nand_info *info)
> +{
> +       uint32_t ndcr;
> +
> +       /* clear status bits and run */
> +       nand_writel(info, NDSR, NDSR_MASK);
> +
> +       ndcr = info->reg_ndcr;
> +
> +       ndcr |= info->use_ecc ? NDCR_ECC_EN : 0;
> +       ndcr |= info->use_dma ? NDCR_DMA_EN : 0;
> +       ndcr |= NDCR_ND_RUN;
> +
> +       nand_writel(info, NDCR, ndcr);
> +
> +       if (wait_for_event(info, NDSR_WRCMDREQ)) {
> +               printk(KERN_ERR "timed out writing command\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       nand_writel(info, NDCB0, info->ndcb0);
> +       nand_writel(info, NDCB0, info->ndcb1);
> +       nand_writel(info, NDCB0, info->ndcb2);
> +       return 0;
> +}
> +
> +/* NOTE: {read, write}_fifo_pio() assume the buffer is 4-byte aligned,
> + * and data_size are 4-byte multiples as well
> + */

Why is that? Is it a hardware requirement?
Then, you're checking data_size % 4 but you don't check buffer
alignment. What's the reason for that?

> +static int pxa3xx_nand_do_cmd(struct pxa3xx_nand_info *info, uint32_t event)
> +{
> +       uint32_t ndcr;
> +       int ret, timeout = CHIP_DELAY_TIMEOUT;
> +
> +       info->state = STATE_CMD_SEND;
> +
> +       if (write_cmd(info)) {
> +               info->retcode = ERR_SENDCMD;
> +               goto fail_stop;
> +       }
> +
> +       info->state = STATE_CMD_HANDLE;
> +
> +       if (info->use_dma)
> +               setup_data_dma(info);
> +
> +       enable_int(info, event);

This is unclear to me. It looks like you use PIO NAND interrupt both
for DMA and PIO transfers. Can you please elaborate on that?

> +
> +       ret = wait_for_completion_timeout(&info->cmd_complete, timeout);
> +       if (!ret) {
> +               printk(KERN_ERR "command execution timed out\n");
> +               info->retcode = ERR_SENDCMD;
> +               goto fail_stop;
> +       }
> +
> +       if (info->use_dma == 0 && info->data_size > 0)
> +               if (handle_data_pio(info))
> +                       goto fail_stop;
> +
> +       return 0;
> +
> +fail_stop:
> +       ndcr = nand_readl(info, NDCR);
> +       nand_writel(info, NDCR, ndcr & ~NDCR_ND_RUN);
> +       udelay(10);
> +       return -ETIMEDOUT;
> +}
> +
> +static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
> +{
> +       struct pxa3xx_nand_info *info = mtd->priv;
> +       return (nand_readl(info, NDSR) & NDSR_RDY) ? 1 : 0;
> +}
> +
> +static inline int is_buf_blank(uint8_t *buf, size_t len)
> +{
> +       for (; len > 0; len--)
> +               if (*buf++ != 0xff)
> +                       return 0;
> +       return 1;
> +}
> +
> +static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
> +               int column, int page_addr )
<snip>
> +       default:
> +               printk(KERN_ERR "non-supported command.\n");

Is random input really unsupported?

> +
> +       info->data_buff = dma_alloc_coherent(&pdev->dev, MAX_BUFF_SIZE,
> +                               &info->data_buff_phys, GFP_KERNEL);
> +       if (info->data_buff == NULL) {
> +               dev_err(&pdev->dev, "failed to allocate dma buffer\n");
> +               return -ENOMEM;
> +       }

Does this really work with coherent_dma_mask not have been set anywhere?

Thanks,
   Vitaly
