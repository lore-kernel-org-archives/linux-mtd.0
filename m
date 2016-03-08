Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adKSU-0001f2-Sf
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 16:26:09 +0000
Date: Tue, 8 Mar 2016 17:24:37 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160308172437.6eccce05@bbrezillon>
In-Reply-To: <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Hi Jorge,

On Wed,  2 Mar 2016 12:00:12 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701.
> 
> UBIFS support has been successfully tested.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig            |    6 +
>  drivers/mtd/nand/Makefile           |    1 +
>  drivers/mtd/nand/mtksdg1_nand.c     | 1535 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/mtksdg1_nand_ecc.h |   75 ++
>  drivers/mtd/nand/mtksdg1_nand_nfi.h |  119 +++
>  5 files changed, 1736 insertions(+)
>  create mode 100644 drivers/mtd/nand/mtksdg1_nand.c
>  create mode 100644 drivers/mtd/nand/mtksdg1_nand_ecc.h
>  create mode 100644 drivers/mtd/nand/mtksdg1_nand_nfi.h
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index b253654..eb9ac1c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -556,4 +556,10 @@ config MTD_NAND_HISI504
>  	help
>  	  Enables support for NAND controller on Hisilicon SoC Hip04.
>  
> +config MTD_NAND_MTKSDG1
> +	tristate "Support for NAND controller on MTK Smart Device SoCs"
> +	depends on HAS_DMA
> +	help
> +	Enables support for NAND controller on MTK Smart Device SoCs.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 9e36233..2114e4b 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -56,5 +56,6 @@ obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
>  obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
> +obj-$(CONFIG_MTD_NAND_MTKSDG1)		+= mtksdg1_nand.o
>  
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/mtksdg1_nand.c b/drivers/mtd/nand/mtksdg1_nand.c
> new file mode 100644
> index 0000000..55dd17d
> --- /dev/null
> +++ b/drivers/mtd/nand/mtksdg1_nand.c
> @@ -0,0 +1,1535 @@
> +/*
> + * MTK smart device NAND Flash controller driver.
> + * Copyright (C) 2015-2016 MediaTek Inc.
> + * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
> + *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_mtd.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/module.h>
> +
> +#include "mtksdg1_nand_nfi.h"
> +#include "mtksdg1_nand_ecc.h"
> +
> +#define MTK_IRQ_ECC		"mtksdg1-nand-ecc"
> +#define MTK_IRQ_NFI		"mtksdg1-nand-nfi"
> +#define MTK_NAME		"mtksdg1-nand"
> +
> +#define KB(x)			((x) * 1024UL)
> +#define MB(x)			(KB(x) * 1024UL)
> +
> +#define SECTOR_SHIFT		(10)
> +#define SECTOR_SIZE		(1UL << SECTOR_SHIFT)
> +#define BYTES_TO_SECTORS(x)	((x) >> SECTOR_SHIFT)
> +#define SECTORS_TO_BYTES(x)	((x) << SECTOR_SHIFT)
> +
> +#define MTK_TIMEOUT		(500)
> +#define MTK_RESET_TIMEOUT	(1 * HZ)
> +
> +#define MTK_ECC_PARITY_BITS	(14)
> +#define MTK_NAND_MAX_CHIP	(2)
> +
> +#define MTK_OOB_ON		(1)
> +#define MTK_OOB_OFF		(0)
> +
> +/* raw accesses do not use ECC (ecc = !raw) */
> +#define MTK_ECC_OFF		(1)
> +#define MTK_ECC_ON		(0)
> +
> +struct mtk_nfc_clk {
> +	struct clk *nfiecc_clk;
> +	struct clk *nfi_clk;
> +	struct clk *pad_clk;
> +};
> +
> +struct mtk_nfc_saved_reg {
> +	struct {
> +		u32 enccnfg;
> +		u32 deccnfg;
> +	} ecc;
> +	struct {
> +		u32 emp_thresh;
> +		u16 pagefmt;
> +		u32 acccon;
> +		u16 cnrnb;
> +		u16 csel;
> +	} nfi;
> +};
> +
> +struct mtk_nfc_host {
> +	struct mtk_nfc_clk clk;
> +	struct nand_chip chip;
> +	struct device *dev;
> +
> +	struct {
> +		struct completion complete;
> +		void __iomem *base;
> +	} nfi;
> +
> +	struct {
> +		struct completion complete;
> +		void __iomem *base;
> +		u32 dec_sec;
> +	} ecc;
> +
> +	u32 fdm_reg[MTKSDG1_NFI_FDM_REG_SIZE / sizeof(u32)];
> +	bool switch_oob;
> +	u32 row_nob;
> +	u8 *buffer;
> +
> +#ifdef CONFIG_PM_SLEEP
> +	struct mtk_nfc_saved_reg saved_reg;
> +#endif
> +};

Could you split the this structure in 2 different objects: one
representing the NAND chip (should include nand_chip) and the other one
representing the NAND controller (should include nand_hw_ctrl).
You can have a look at the sunxi-nand driver if you want an example.

> +
> +static struct nand_ecclayout nand_2k_64 = {
> +	.oobfree = { {0, 16} },
> +};
> +
> +static struct nand_ecclayout nand_4k_128 = {
> +	.oobfree = { {0, 32} },
> +};

I've recently posted a series reworking the way the OOB layout is
described [1].

> +
> +/* NFI register access */
> +static inline void mtk_nfi_writel(struct mtk_nfc_host *host, u32 val, u32 reg)
> +{
> +	writel(val, host->nfi.base + reg);
> +}
> +static inline void mtk_nfi_writew(struct mtk_nfc_host *host, u16 val, u32 reg)
> +{
> +	writew(val, host->nfi.base + reg);
> +}
> +static inline u32 mtk_nfi_readl(struct mtk_nfc_host *host, u32 reg)
> +{
> +	return readl_relaxed(host->nfi.base + reg);
> +}
> +static inline u16 mtk_nfi_readw(struct mtk_nfc_host *host, u32 reg)
> +{
> +	return readw_relaxed(host->nfi.base + reg);
> +}
> +static inline u8 mtk_nfi_readb(struct mtk_nfc_host *host, u32 reg)
> +{
> +	return readb_relaxed(host->nfi.base + reg);
> +}
> +
> +/* ECC register access */
> +static inline void mtk_ecc_writel(struct mtk_nfc_host *host, u32 val, u32 reg)
> +{
> +	writel(val, host->ecc.base + reg);
> +}
> +static inline void mtk_ecc_writew(struct mtk_nfc_host *host, u16 val, u32 reg)
> +{
> +	writew(val, host->ecc.base + reg);
> +}
> +static inline u32 mtk_ecc_readl(struct mtk_nfc_host *host, u32 reg)
> +{
> +	return readl_relaxed(host->ecc.base + reg);
> +}
> +static inline u16 mtk_ecc_readw(struct mtk_nfc_host *host, u32 reg)
> +{
> +	return readw_relaxed(host->ecc.base + reg);
> +}
> +
> +static void mtk_nfc_hw_reset(struct mtk_nfc_host *host)
> +{
> +	unsigned long timeout = MTK_RESET_TIMEOUT;
> +	struct device *dev = host->dev;
> +	u32 val;
> +
> +	/* reset the state machine, data fifo and fdm data */
> +	mtk_nfi_writel(host, CON_FIFO_FLUSH | CON_NFI_RST, MTKSDG1_NFI_CON);
> +	timeout += jiffies;
> +	do {
> +		val = mtk_nfi_readl(host, MTKSDG1_NFI_MASTER_STA);
> +		val &= MASTER_STA_MASK;
> +		if (!val)
> +			return;
> +		usleep_range(50, 100);
> +
> +	} while (time_before(jiffies, timeout));

You may want to use readl_relaxed_poll_timeout() (even though there's
no way to specify a range).
This comment applies to all the places where you're implementing this
kind of loop.

> +
> +	dev_warn(dev, "nfi master active after in reset [0x%x] = 0x%x\n",
> +		MTKSDG1_NFI_MASTER_STA, val);
> +};

[...]

> +static inline void mtk_ecc_encoder_idle(struct mtk_nfc_host *host)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	struct device *dev = host->dev;
> +	u32 val;
> +
> +	timeout += jiffies;
> +	do {
> +		val = mtk_ecc_readl(host, MTKSDG1_ECC_ENCIDLE);
> +		val &= ENC_IDLE;
> +		if (val)
> +			return;
> +		cpu_relax();
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	dev_warn(dev, "hw init ecc encoder not idle\n");
> +}

Could you put the ECC engine code in a different driver (as done for
the jz4780 engine)?

> +
> +static inline void mtk_ecc_decoder_idle(struct mtk_nfc_host *host)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	struct device *dev = host->dev;
> +	u32 val;
> +
> +	timeout += jiffies;
> +	do {
> +		val = mtk_ecc_readw(host, MTKSDG1_ECC_DECIDLE);
> +		val &= DEC_IDLE;
> +		if (val)
> +			return;
> +		cpu_relax();
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	dev_warn(dev, "hw init ecc decoder not idle\n");
> +}
> +
> +static int mtk_nfc_transfer_done(struct mtk_nfc_host *host, u32 sectors)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	u32 cnt;
> +
> +	/* wait for the sector count */
> +	timeout += jiffies;
> +	do {
> +		cnt = mtk_nfi_readl(host, MTKSDG1_NFI_ADDRCNTR);
> +		cnt &= CNTR_MASK;
> +		if (cnt >= sectors)
> +			return 0;
> +		cpu_relax();
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	return  -EIO;
> +}
> +
> +static int mtk_nfc_subpage_done(struct mtk_nfc_host *host, int sectors)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	u32 val;
> +
> +	timeout += jiffies;
> +	do {
> +		val = mtk_nfi_readl(host, MTKSDG1_NFI_BYTELEN);
> +		val &= CNTR_MASK;
> +		if (val >= sectors)
> +			return 0;
> +		cpu_relax();
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	return -EIO;
> +}
> +
> +static inline int mtk_nfc_data_ready(struct mtk_nfc_host *host)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	u8 val;
> +
> +	timeout += jiffies;
> +	do {
> +		val = mtk_nfi_readw(host, MTKSDG1_NFI_PIO_DIRDY);
> +		val &= PIO_DI_RDY;
> +		if (val)
> +			return 0;
> +		cpu_relax();
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	/* data _MUST_ not be accessed */
> +	return -EIO;
> +}

Nitpick: you seem to have a lot of xxx_ready() functions, which are
pretty much all doing the same thing. Maybe it's worth creating a
single which would take a register offset and status flags, instead of
adding one function per event.

Something like:

static inline int mtk_nfc_ready(struct mtk_nfc_host *host, int reg,
				u32 flags)
{
	/* implem */
}

> +
> +static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> +	struct device *dev = host->dev;
> +	u32 dec_size, enc_size;
> +	u32 ecc_bit, ecc_level;
> +	u32 spare, fmt;
> +	u32 reg;
> +
> +	host->row_nob = 1;
> +	if (chip->chipsize > MB(32))
> +		host->row_nob = chip->chipsize > MB(128) ? 3 : 2;
> +
> +	spare = mtd->oobsize / BYTES_TO_SECTORS(mtd->writesize);

Please prefer the values provided in chip->ecc_strength_ds and
chip->ecc_step_size_ds over maximum ECC strength guessed from the
->oobsize value. And if you want to override this value, use
nand-ecc-strength and nand-ecc-step-size DT properties.

> +	switch (spare) {
> +	case 16:
> +		ecc_bit = ECC_CNFG_4BIT;
> +		ecc_level = 4;
> +		break;
> +	case 32:
> +		ecc_bit = ECC_CNFG_12BIT;
> +		ecc_level = 12;
> +		break;
> +	default:
> +		dev_err(dev, "invalid spare size per sector: %d\n", spare);
> +		return -EINVAL;
> +	}
> +
> +	chip->ecc.strength = ecc_level;
> +	chip->ecc.size = SECTOR_SIZE;

Maybe you should complain if strength and size do not match the NAND
chip requirements (chip->ecc_strength_ds and chip->ecc_step_size_ds
values).

> +
> +	switch (mtd->writesize) {
> +	case KB(2):
> +		fmt = PAGEFMT_512_2K;
> +		chip->ecc.layout = &nand_2k_64;
> +		break;
> +	case KB(4):
> +		fmt = PAGEFMT_2K_4K;
> +		chip->ecc.layout = &nand_4k_128;
> +		break;
> +	case KB(8):
> +		fmt = PAGEFMT_4K_8K;
> +		break;
> +	default:
> +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
> +		return -EINVAL;
> +	}

ecclayout info should be exposed through mtd_ooblayout_ops now.

> +
> +	/* configure PAGE FMT */
> +	reg = fmt;
> +	reg |= PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT;
> +	reg |= MTKSDG1_NFI_FDM_REG_SIZE << PAGEFMT_FDM_SHIFT;
> +	reg |= MTKSDG1_NFI_FDM_REG_SIZE << PAGEFMT_FDM_ECC_SHIFT;
> +	mtk_nfi_writew(host, reg, MTKSDG1_NFI_PAGEFMT);
> +
> +	/* configure ECC encoder (in bits) */
> +	enc_size = (SECTOR_SIZE + MTKSDG1_NFI_FDM_REG_SIZE) << 3;
> +	reg = ecc_bit | ECC_NFI_MODE | (enc_size << ECC_MS_SHIFT);
> +	mtk_ecc_writel(host, reg, MTKSDG1_ECC_ENCCNFG);
> +
> +	/* configure ECC decoder (inbits) */
> +	dec_size = enc_size + ecc_level * MTK_ECC_PARITY_BITS;
> +	reg = ecc_bit | ECC_NFI_MODE | (dec_size << ECC_MS_SHIFT);
> +	reg |= (DEC_CNFG_CORRECT | DEC_EMPTY_EN);
> +	mtk_ecc_writel(host, reg, MTKSDG1_ECC_DECCNFG);
> +
> +	return 0;
> +}
> +
> +static void mtk_nfc_device_reset(struct mtk_nfc_host *host)
> +{
> +	unsigned long timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	struct device *dev = host->dev;
> +	u16 chip;
> +	int rc;
> +
> +	mtk_nfc_hw_reset(host);
> +
> +	/* enable reset done interrupt */
> +	mtk_nfi_writew(host, INTR_RST_DONE_EN, MTKSDG1_NFI_INTR_EN);
> +
> +	/* configure FSM for reset operation */
> +	mtk_nfi_writew(host, CNFG_OP_RESET, MTKSDG1_NFI_CNFG);
> +
> +	init_completion(&host->nfi.complete);
> +
> +	mtk_nfc_set_command(host, NAND_CMD_RESET);
> +	rc = wait_for_completion_timeout(&host->nfi.complete, timeout);
> +	if (!rc) {
> +		chip = mtk_nfi_readw(host, MTKSDG1_NFI_CSEL);
> +		dev_err(dev, "device(%d) reset timeout\n", chip);
> +	}
> +}
> +
> +static void mtk_nfc_select_chip(struct mtd_info *mtd, int chip)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct mtk_nfc_host *host = nand_get_controller_data(nand);
> +
> +	if (chip < 0)
> +		return;
> +
> +	mtk_nfi_writel(host, chip, MTKSDG1_NFI_CSEL);

Hm, the CS line on the controller side is not necessarily the same as
the ID used on the NAND chip side.

For example, you might have NAND controller CS0 line which is connected
to NAND chip CS1 line (assuming the chip exposes 2 CS).
The 'controller CS <-> chip CS' mapping should be built dynamically
when parsing the NAND controller subnodes (I'm talking about DT parsing
here).

> +}
> +
> +static inline bool mtk_nfc_cmd_supported(unsigned command)
> +{
> +	switch (command) {
> +	case NAND_CMD_RESET:
> +	case NAND_CMD_READID:
> +	case NAND_CMD_STATUS:
> +	case NAND_CMD_READOOB:
> +	case NAND_CMD_ERASE1:
> +	case NAND_CMD_ERASE2:
> +	case NAND_CMD_SEQIN:
> +	case NAND_CMD_PAGEPROG:
> +	case NAND_CMD_CACHEDPROG:
> +	case NAND_CMD_READ0:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void mtk_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
> +		int page_addr)
> +{
> +	struct mtk_nfc_host *host = nand_get_controller_data(mtd_to_nand(mtd));
> +	unsigned long const cmd_timeout = msecs_to_jiffies(MTK_TIMEOUT);
> +	struct completion *p = &host->nfi.complete;
> +	u32 val;
> +	int rc;
> +
> +	if (mtk_nfc_cmd_supported(command))
> +		mtk_nfc_hw_reset(host);
> +
> +	switch (command) {
> +	case NAND_CMD_RESET:
> +		mtk_nfc_device_reset(host);
> +		break;
> +	case NAND_CMD_READID:
> +		val = CNFG_READ_EN | CNFG_BYTE_RW | CNFG_OP_SRD;
> +		mtk_nfi_writew(host, val, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_READID);
> +		mtk_nfc_set_address(host, column, 0, 1, 0);
> +		mtk_nfi_writel(host, CON_SRD, MTKSDG1_NFI_CON);
> +		break;
> +	case NAND_CMD_STATUS:
> +		val = CNFG_READ_EN | CNFG_BYTE_RW | CNFG_OP_SRD;
> +		mtk_nfi_writew(host, val, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_STATUS);
> +		mtk_nfi_writel(host, CON_SRD, MTKSDG1_NFI_CON);
> +		break;
> +	case NAND_CMD_READOOB:
> +		val = CNFG_READ_EN | CNFG_BYTE_RW | CNFG_OP_READ;
> +		mtk_nfi_writew(host, val, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_READ0);
> +		column += mtd->writesize;
> +		mtk_nfc_set_address(host, column, page_addr, 2, host->row_nob);
> +		val = CON_BRD | (1 << CON_SEC_SHIFT);
> +		mtk_nfi_writel(host, val, MTKSDG1_NFI_CON);
> +		break;
> +	case NAND_CMD_ERASE1:
> +		mtk_nfi_writew(host, INTR_ERS_DONE_EN, MTKSDG1_NFI_INTR_EN);
> +		mtk_nfi_writew(host, CNFG_OP_ERASE, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_ERASE1);
> +		mtk_nfc_set_address(host, 0, page_addr, 0, host->row_nob);
> +		break;
> +	case NAND_CMD_ERASE2:
> +		init_completion(p);
> +		mtk_nfc_set_command(host, NAND_CMD_ERASE2);
> +		rc = wait_for_completion_timeout(p, cmd_timeout);
> +		if (!rc)
> +			dev_err(host->dev, "erase command timeout\n");
> +		break;
> +	case NAND_CMD_SEQIN:
> +		mtk_nfi_writew(host, CNFG_OP_PRGM, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_SEQIN);
> +		mtk_nfc_set_address(host, column, page_addr, 2, host->row_nob);
> +		break;
> +	case NAND_CMD_PAGEPROG:
> +	case NAND_CMD_CACHEDPROG:
> +		mtk_nfi_writew(host, INTR_BUSY_RT_EN, MTKSDG1_NFI_INTR_EN);
> +		init_completion(p);
> +		mtk_nfc_set_command(host, command);
> +		rc = wait_for_completion_timeout(p, cmd_timeout);
> +		if (!rc)
> +			dev_err(host->dev, "pageprogr command timeout\n");
> +		break;
> +	case NAND_CMD_READ0:
> +		val = CNFG_OP_READ | CNFG_READ_EN;
> +		mtk_nfi_writew(host, val, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(host, NAND_CMD_READ0);
> +		break;
> +	default:
> +		dev_warn(host->dev, "command 0x%x not supported\n", command);
> +		break;
> +	}
> +}

Can you try to implement ->cmd_ctrl() instead of ->cmdfunc()? I'd like
to avoid custom ->cmdfunc() as much as possible (it's a burden to
maintain).

> +
> +static uint8_t mtk_nfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> +	int rc;
> +
> +	rc = mtk_nfc_data_ready(host);

The NAND chip should already be ready when you reach this point.

> +	if (rc < 0) {
> +		dev_err(host->dev, "data not ready\n");
> +		return NAND_STATUS_FAIL;

I can only return a data byte, so return NAND_STATUS_FAIL is clearly
wrong here, unless you're in a READ_STATUS context (which is not
necessarily the case).

> +	}
> +
> +	return mtk_nfi_readb(host, MTKSDG1_NFI_DATAR);
> +}
> +
> +static void mtk_nfc_write_fdm(struct nand_chip *chip, u32 sectors)
> +{
> +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> +	u8 *src, *dst;
> +	int i, j, reg;
> +
> +	for (i = 0; i < sectors ; i++) {
> +		/* read FDM from OOB into private area */
> +		src = chip->oob_poi + i * MTKSDG1_NFI_FDM_REG_SIZE;
> +		dst = (u8 *)host->fdm_reg;

Is it always safe to do that? What about the big-endian kernel case?

> +		memcpy(dst, src, MTKSDG1_NFI_FDM_REG_SIZE);
> +
> +		/* write FDM to registers */
> +		for (j = 0; j < ARRAY_SIZE(host->fdm_reg); j++) {
> +			reg = MTKSDG1_NFI_FDM0L + i * MTKSDG1_NFI_FDM_REG_SIZE;
> +			reg += j * sizeof(host->fdm_reg[0]);
> +			mtk_nfi_writel(host, host->fdm_reg[j], reg);
> +		}
> +	}
> +}
> +
> +static int mtk_nfc_write_page(struct mtd_info *mtd,
> +			struct nand_chip *chip, const uint8_t *buf,
> +			int oob_on, int page, int raw)
> +{
> +
> +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> +	struct completion *nfi = &host->nfi.complete;
> +	struct device *dev = host->dev;
> +	const bool use_ecc = !raw;
> +	void *q = (void *) buf;
> +	dma_addr_t dma_addr;
> +	size_t dmasize;
> +	u32 reg;
> +	int ret;
> +
> +	dmasize = mtd->writesize + (raw ? mtd->oobsize : 0);
> +
> +	dma_addr = dma_map_single(dev, q, dmasize, DMA_TO_DEVICE);

buf is not guaranteed to be physically contiguous, so you can't just
use it with DMA without doing a few more verifications.

In case you're interested in using a generic approach to do this
verification, you can have a look at this series [2].

> +	if (dma_mapping_error(host->dev, dma_addr)) {
> +		dev_err(host->dev, "dma mapping error\n");
> +		return -EINVAL;
> +	}
> +
> +	reg = mtk_nfi_readw(host, MTKSDG1_NFI_CNFG);
> +	reg |= CNFG_AHB | CNFG_DMA_BURST_EN;
> +	if (use_ecc) {
> +		/**
> +		 * OOB will be generated
> +		 *  - FDM: from register
> +		 *  - ECC: from HW
> +		 */
> +		reg |= CNFG_AUTO_FMT_EN | CNFG_HW_ECC_EN;
> +		mtk_nfi_writew(host, reg, MTKSDG1_NFI_CNFG);
> +
> +		mtk_ecc_encoder_idle(host);
> +		mtk_ecc_writew(host, ENC_EN, MTKSDG1_ECC_ENCCON);
> +
> +		/* write OOB into the FDM registers (OOB area in MTK NAND) */
> +		if (oob_on)
> +			mtk_nfc_write_fdm(chip, chip->ecc.steps);
> +	} else {
> +		/* OOB is part of the DMA transfer */
> +		mtk_nfi_writew(host, reg, MTKSDG1_NFI_CNFG);
> +	}
> +
> +	mtk_nfi_writel(host, chip->ecc.steps << CON_SEC_SHIFT, MTKSDG1_NFI_CON);
> +	mtk_nfi_writel(host, lower_32_bits(dma_addr), MTKSDG1_NFI_STRADDR);
> +	mtk_nfi_writew(host, INTR_AHB_DONE_EN, MTKSDG1_NFI_INTR_EN);
> +
> +	init_completion(nfi);
> +
> +	/* start DMA */
> +	reg = mtk_nfi_readl(host, MTKSDG1_NFI_CON) | CON_BWR;
> +	mtk_nfi_writel(host, reg, MTKSDG1_NFI_CON);
> +
> +	ret = wait_for_completion_timeout(nfi, msecs_to_jiffies(MTK_TIMEOUT));
> +	if (!ret) {
> +		dev_err(dev, "program ahb done timeout\n");
> +		mtk_nfi_writew(host, 0, MTKSDG1_NFI_INTR_EN);
> +		ret = -ETIMEDOUT;
> +		goto timeout;
> +	}
> +
> +	ret = mtk_nfc_transfer_done(host, chip->ecc.steps);
> +	if (ret < 0)
> +		dev_err(dev, "hwecc write timeout\n");
> +timeout:
> +	dma_unmap_single(host->dev, dma_addr, dmasize, DMA_TO_DEVICE);
> +
> +	if (use_ecc) {
> +		mtk_ecc_encoder_idle(host);
> +		mtk_ecc_writew(host, ENC_DE, MTKSDG1_ECC_ENCCON);
> +	}
> +
> +	mtk_nfi_writel(host, 0, MTKSDG1_NFI_CON);
> +
> +	return ret;
> +}
> +
> +static int mtk_nfc_write_page_hwecc(struct mtd_info *mtd,
> +			struct nand_chip *chip, const uint8_t *buf,
> +			int oob_on, int page)
> +{
> +	return mtk_nfc_write_page(mtd, chip, buf, oob_on, page, MTK_ECC_ON);
> +}
> +
> +static int mtk_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +					const uint8_t *buf, int oob_on, int pg)
> +{
> +	struct mtk_nfc_host *host = nand_get_controller_data(chip);
> +	uint8_t *src, *dst;
> +	size_t len;
> +	u32 i;
> +
> +	memset(host->buffer, 0xff, mtd->writesize + mtd->oobsize);
> +
> +	/* MTK internal 4KB page data layout:
> +	 * ----------------------------------
> +	 * PAGE = 4KB, SECTOR = 1KB, OOB=128B
> +	 * page = sector_oob1 + sector_oob2 + sector_oob3 + sector_oob4
> +	 * sector_oob = data (1KB) + FDM (8B) + ECC parity (21B) + free (3B)
> +	 *
> +	 */

If you have set the different nand_ecc_ctrl fields correctly (prepad,
postpad and bytes), you should be able to rely on the default
nand_write_page_raw_syndrome() implementation.

> +	len = SECTOR_SIZE + mtd->oobsize / chip->ecc.steps;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +
> +		if (buf) {
> +			src = (uint8_t *) buf + i * SECTOR_SIZE;
> +			dst = host->buffer + i * len;
> +			memcpy(dst, src, SECTOR_SIZE);
> +		}
> +
> +		if (oob_on) {
> +			src = chip->oob_poi + i * MTKSDG1_NFI_FDM_REG_SIZE;
> +			dst = host->buffer + i * len + SECTOR_SIZE;
> +			memcpy(dst, src, MTKSDG1_NFI_FDM_REG_SIZE);
> +		}
> +	}
> +
> +	return mtk_nfc_write_page(mtd, chip, host->buffer, MTK_OOB_OFF, pg,
> +				MTK_ECC_OFF);
> +}

That's quite a long driver, I'll try to finish my review before the end
of the week ;).

Best Regards,

Boris

[1]https://lkml.org/lkml/2016/3/7/117
[2]https://lkml.org/lkml/2016/3/8/270

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
