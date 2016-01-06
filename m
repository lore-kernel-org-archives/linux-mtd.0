Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGrXC-00023A-V3
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 17:06:09 +0000
Date: Wed, 6 Jan 2016 18:05:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, sboyd@codeaurora.org, linux-mtd@lists.infradead.org,
 dehrenberg@google.com, andy.gross@linaro.org
Subject: Re: [PATCH v5 2/3] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20160106180544.281804eb@bbrezillon>
In-Reply-To: <1451971501-18160-3-git-send-email-architt@codeaurora.org>
References: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1451971501-18160-3-git-send-email-architt@codeaurora.org>
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

Hi Archit,

On Tue,  5 Jan 2016 10:55:00 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
> MDM9x15 series.
> 
> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
> broader interface for external slow peripheral devices such as LCD and
> NAND/NOR flash memory or SRAM like interfaces.
> 
> We add support for the NAND controller found within EBI2. For the SoCs
> of our interest, we only use the NAND controller within EBI2. Therefore,
> it's safe for us to assume that the NAND controller is a standalone block
> within the SoC.
> 
> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
> and spare data. The controller contains an internal 512 byte page buffer
> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
> for register read/write and data transfers. The controller performs page
> reads and writes at a codeword/step level of 512 bytes. It can support up
> to 2 external chips of different configurations.
> 
> The driver prepares register read and write configuration descriptors for
> each codeword, followed by data descriptors to read or write data from the
> controller's internal buffer. It uses a single ADM DMA channel that we get
> via dmaengine API. The controller requires 2 ADM CRCIs for command and
> data flow control. These are passed via DT.
> 
> The ecc layout used by the controller is syndrome like, but we can't use
> the standard syndrome ecc ops because of several reasons. First, the amount
> of data bytes covered by ecc isn't same in each step. Second, writing to
> free oob space requires us writing to the entire step in which the oob
> lies. This forces us to create our own ecc ops.
> 
> One more difference is how the controller accesses the bad block marker.
> The controller ignores reading the marker when ECC is enabled. ECC needs
> to be explicity disabled to read or write to the bad block marker. The
> nand_bbt helpers library hence can't access BBMs for the controller.
> For now, we skip the creation of BBT and populate chip->block_bad and
> chip->block_markbad helpers instead.
> 
> Reviewed-by: Andy Gross <agross@codeaurora.org>
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
> v5:
>   - split chip/controller structs
>   - simplify layout by considering reserved bytes as part of ECC
>   - create ecc layouts automatically
>   - implement block_bad and block_markbad chip ops instead of
>   - read_oob_raw/write_oob_raw ecc ops to access BBMs.
>   - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
>   - misc clean ups
>     
> v4:
>   - Shrink submit_descs
>   - add desc list node at the end of dma_prep_desc
>   - Endianness and warning fixes
>   - Add Stephen's Signed-off since he provided a patch to fix
>     endianness problems
>     
> v3:
>   - Refactor dma functions for maximum reuse
>   - Use dma_slave_confing on stack
>   - optimize and clean upempty_page_fixup using memchr_inv
>   - ensure portability with dma register reads using le32_* funcs
>   - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
>   - fix handling of return values of dmaengine funcs
>   - constify wherever possible
>   - Remove dependency on ADM DMA in Kconfig
>   - Misc fixes and clean ups
>     
> v2:
>   - Use new BBT flag that allows us to read BBM in raw mode
>   - reduce memcpy-s in the driver
>   - some refactor and clean ups because of above changes
> 
>  drivers/mtd/nand/Kconfig      |    7 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/qcom_nandc.c | 1981 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1989 insertions(+)
>  create mode 100644 drivers/mtd/nand/qcom_nandc.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 95b8d2b..2fccdfb 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -546,4 +546,11 @@ config MTD_NAND_HISI504
>  	help
>  	  Enables support for NAND controller on Hisilicon SoC Hip04.
>  
> +config MTD_NAND_QCOM
> +	tristate "Support for NAND on QCOM SoCs"
> +	depends on ARCH_QCOM
> +	help
> +	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
> +	  controller. This controller is found on IPQ806x SoC.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 2c7f014..9450cdc 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -55,5 +55,6 @@ obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
>  obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
> +obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
>  
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> new file mode 100644
> index 0000000..a4dd922
> --- /dev/null
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -0,0 +1,1981 @@
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +#include <linux/bitops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +#include <linux/module.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_mtd.h>
> +#include <linux/delay.h>
> +
> +/* NANDc reg offsets */
> +#define NAND_FLASH_CMD			0x00
> +#define NAND_ADDR0			0x04
> +#define NAND_ADDR1			0x08
> +#define NAND_FLASH_CHIP_SELECT		0x0c
> +#define NAND_EXEC_CMD			0x10
> +#define NAND_FLASH_STATUS		0x14
> +#define NAND_BUFFER_STATUS		0x18
> +#define NAND_DEV0_CFG0			0x20
> +#define NAND_DEV0_CFG1			0x24
> +#define NAND_DEV0_ECC_CFG		0x28
> +#define NAND_DEV1_ECC_CFG		0x2c
> +#define NAND_DEV1_CFG0			0x30
> +#define NAND_DEV1_CFG1			0x34
> +#define NAND_READ_ID			0x40
> +#define NAND_READ_STATUS		0x44
> +#define NAND_DEV_CMD0			0xa0
> +#define NAND_DEV_CMD1			0xa4
> +#define NAND_DEV_CMD2			0xa8
> +#define NAND_DEV_CMD_VLD		0xac
> +#define SFLASHC_BURST_CFG		0xe0
> +#define NAND_ERASED_CW_DETECT_CFG	0xe8
> +#define NAND_ERASED_CW_DETECT_STATUS	0xec
> +#define NAND_EBI2_ECC_BUF_CFG		0xf0
> +#define FLASH_BUF_ACC			0x100
> +
> +#define NAND_CTRL			0xf00
> +#define NAND_VERSION			0xf08
> +#define NAND_READ_LOCATION_0		0xf20
> +#define NAND_READ_LOCATION_1		0xf24
> +
> +/* dummy register offsets, used by write_reg_dma */
> +#define NAND_DEV_CMD1_RESTORE		0xdead
> +#define NAND_DEV_CMD_VLD_RESTORE	0xbeef
> +
> +/* NAND_FLASH_CMD bits */
> +#define PAGE_ACC			BIT(4)
> +#define LAST_PAGE			BIT(5)
> +
> +/* NAND_FLASH_CHIP_SELECT bits */
> +#define NAND_DEV_SEL			0
> +#define DM_EN				BIT(2)
> +
> +/* NAND_FLASH_STATUS bits */
> +#define FS_OP_ERR			BIT(4)
> +#define FS_READY_BSY_N			BIT(5)
> +#define FS_MPU_ERR			BIT(8)
> +#define FS_DEVICE_STS_ERR		BIT(16)
> +#define FS_DEVICE_WP			BIT(23)
> +
> +/* NAND_BUFFER_STATUS bits */
> +#define BS_UNCORRECTABLE_BIT		BIT(8)
> +#define BS_CORRECTABLE_ERR_MSK		0x1f
> +
> +/* NAND_DEVn_CFG0 bits */
> +#define DISABLE_STATUS_AFTER_WRITE	4
> +#define CW_PER_PAGE			6
> +#define UD_SIZE_BYTES			9
> +#define ECC_PARITY_SIZE_BYTES_RS	19
> +#define SPARE_SIZE_BYTES		23
> +#define NUM_ADDR_CYCLES			27
> +#define STATUS_BFR_READ			30
> +#define SET_RD_MODE_AFTER_STATUS	31
> +
> +/* NAND_DEVn_CFG0 bits */
> +#define DEV0_CFG1_ECC_DISABLE		0
> +#define WIDE_FLASH			1
> +#define NAND_RECOVERY_CYCLES		2
> +#define CS_ACTIVE_BSY			5
> +#define BAD_BLOCK_BYTE_NUM		6
> +#define BAD_BLOCK_IN_SPARE_AREA		16
> +#define WR_RD_BSY_GAP			17
> +#define ENABLE_BCH_ECC			27
> +
> +/* NAND_DEV0_ECC_CFG bits */
> +#define ECC_CFG_ECC_DISABLE		0
> +#define ECC_SW_RESET			1
> +#define ECC_MODE			4
> +#define ECC_PARITY_SIZE_BYTES_BCH	8
> +#define ECC_NUM_DATA_BYTES		16
> +#define ECC_FORCE_CLK_OPEN		30
> +
> +/* NAND_DEV_CMD1 bits */
> +#define READ_ADDR			0
> +
> +/* NAND_DEV_CMD_VLD bits */
> +#define READ_START_VLD			0
> +
> +/* NAND_EBI2_ECC_BUF_CFG bits */
> +#define NUM_STEPS			0
> +
> +/* NAND_ERASED_CW_DETECT_CFG bits */
> +#define ERASED_CW_ECC_MASK		1
> +#define AUTO_DETECT_RES			0
> +#define MASK_ECC			(1 << ERASED_CW_ECC_MASK)
> +#define RESET_ERASED_DET		(1 << AUTO_DETECT_RES)
> +#define ACTIVE_ERASED_DET		(0 << AUTO_DETECT_RES)
> +#define CLR_ERASED_PAGE_DET		(RESET_ERASED_DET | MASK_ECC)
> +#define SET_ERASED_PAGE_DET		(ACTIVE_ERASED_DET | MASK_ECC)
> +
> +/* NAND_ERASED_CW_DETECT_STATUS bits */
> +#define PAGE_ALL_ERASED			BIT(7)
> +#define CODEWORD_ALL_ERASED		BIT(6)
> +#define PAGE_ERASED			BIT(5)
> +#define CODEWORD_ERASED			BIT(4)
> +#define ERASED_PAGE			(PAGE_ALL_ERASED | PAGE_ERASED)
> +#define ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
> +
> +/* Version Mask */
> +#define NAND_VERSION_MAJOR_MASK		0xf0000000
> +#define NAND_VERSION_MAJOR_SHIFT	28
> +#define NAND_VERSION_MINOR_MASK		0x0fff0000
> +#define NAND_VERSION_MINOR_SHIFT	16
> +
> +/* NAND OP_CMDs */
> +#define PAGE_READ			0x2
> +#define PAGE_READ_WITH_ECC		0x3
> +#define PAGE_READ_WITH_ECC_SPARE	0x4
> +#define PROGRAM_PAGE			0x6
> +#define PAGE_PROGRAM_WITH_ECC		0x7
> +#define PROGRAM_PAGE_SPARE		0x9
> +#define BLOCK_ERASE			0xa
> +#define FETCH_ID			0xb
> +#define RESET_DEVICE			0xd
> +
> +/*
> + * the NAND controller performs reads/writes with ECC in 516 byte chunks.
> + * the driver calls the chunks 'step' or 'codeword' interchangeably
> + */
> +#define NANDC_STEP_SIZE			512

Sometimes you're using spaces...

> +
> +/*
> + * the largest page size we support is 8K, this will have 16 steps/codewords
> + * of 512 bytes each
> + */
> +#define	MAX_NUM_STEPS			(SZ_8K / NANDC_STEP_SIZE)

... and other times tabs between #define and the MACRO name.
I'd suggest choosing one solution and sticking to it.

> +
> +/* we read at most 3 registers per codeword scan */
> +#define MAX_REG_RD			(3 * MAX_NUM_STEPS)
> +
> +/* ECC modes supported by the controller */
> +#define ECC_NONE	BIT(0)
> +#define ECC_RS_4BIT	BIT(1)
> +#define	ECC_BCH_4BIT	BIT(2)
> +#define	ECC_BCH_8BIT	BIT(3)

Ditto.

> +
> +struct desc_info {
> +	struct list_head node;
> +
> +	enum dma_data_direction dir;
> +	struct scatterlist sgl;
> +	struct dma_async_tx_descriptor *dma_desc;
> +};
> +
> +/*
> + * holds the current register values that we want to write. acts as a contiguous
> + * chunk of memory which we use to write the controller registers through DMA.
> + */
> +struct nandc_regs {
> +	__le32 cmd;
> +	__le32 addr0;
> +	__le32 addr1;
> +	__le32 chip_sel;
> +	__le32 exec;
> +
> +	__le32 cfg0;
> +	__le32 cfg1;
> +	__le32 ecc_bch_cfg;
> +
> +	__le32 clrflashstatus;
> +	__le32 clrreadstatus;
> +
> +	__le32 cmd1;
> +	__le32 vld;
> +
> +	__le32 orig_cmd1;
> +	__le32 orig_vld;
> +
> +	__le32 ecc_buf_cfg;
> +};
> +
> +/*
> + * NAND controller data struct
> + *
> + * @controller:			base controller structure
> + * @host_list:			list containing all the chips attached to the
> + *				controller
> + * @dev:			parent device
> + * @res:			resource pointer for platform device (used to
> + *				retrieve the physical addresses of registers
> + *				for DMA)
> + * @base:			MMIO base
> + * @core_clk:			controller clock
> + * @aon_clk:			another controller clock
> + *
> + * @chan:			dma channel
> + * @cmd_crci:			ADM DMA CRCI for command flow control
> + * @data_crci:			ADM DMA CRCI for data flow control
> + * @desc_list:			DMA descriptor list (list of desc_infos)
> + *
> + * @data_buffer:		our local DMA buffer for page read/writes,
> + *				used when we can't use the buffer provided
> + *				by upper layers directly
> + * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
> + * @reg_read_buf:		local buffer for reading back registers via DMA
> + * @reg_read_pos:		marker for data read in reg_read_buf
> + *
> + * @regs:			a contiguous chunk of memory for DMA register
> + *				writes. contains the register values to be
> + *				written to controller
> + * @cmd1/vld:			some fixed controller register values
> + * @ecc_modes:			supported ECC modes by the current controller,
> + *				initialized via DT match data
> + */
> +struct qcom_nand_controller {
> +	struct nand_hw_control controller;
> +	struct list_head host_list;
> +
> +	struct device *dev;
> +
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	struct clk *core_clk;
> +	struct clk *aon_clk;
> +
> +	struct dma_chan *chan;
> +	unsigned int cmd_crci;
> +	unsigned int data_crci;
> +	struct list_head desc_list;
> +
> +	u8		*data_buffer;
> +	int		buf_size;
> +	int		buf_count;
> +	int		buf_start;

Same remark as for the macro definitions.

> +
> +	__le32 *reg_read_buf;
> +	int reg_read_pos;
> +
> +	struct nandc_regs *regs;
> +
> +	u32 cmd1, vld;
> +	u32 ecc_modes;
> +};
> +

[...]

> +
> +/*
> + * when using RS ECC, the NAND controller flags an error when reading an
> + * erased page. however, there are special characters at certain offsets when
> + * we read the erased page. we check here if the page is really empty. if so,
> + * we replace the magic characters with 0xffs
> + */
> +static bool empty_page_fixup(struct qcom_nand_host *host, u8 *data_buf)
> +{
> +	struct qcom_nand_controller *nandc = host->nandc;
> +	struct nand_chip *chip = &host->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int cwperpage = chip->ecc.steps;
> +	u8 orig1[MAX_NUM_STEPS], orig2[MAX_NUM_STEPS];
> +	int i, j;
> +
> +	/* if BCH is enabled, HW will take care of detecting erased pages */
> +	if (host->bch_enabled || !host->use_ecc)
> +		return false;
> +
> +	for (i = 0; i < cwperpage; i++) {
> +		u8 *empty1, *empty2;
> +		u32 flash_status = le32_to_cpu(nandc->reg_read_buf[3 * i]);
> +
> +		/*
> +		 * an erased page flags an error in NAND_FLASH_STATUS, check if
> +		 * the page is erased by looking for 0x54s at offsets 3 and 175
> +		 * from the beginning of each codeword
> +		 */
> +		if (!(flash_status & FS_OP_ERR))
> +			break;
> +
> +		empty1 = &data_buf[3 + i * host->cw_data];
> +		empty2 = &data_buf[175 + i * host->cw_data];
> +
> +		/*
> +		 * if the error wasn't because of an erased page, bail out and
> +		 * and let someone else do the error checking
> +		 */
> +		if ((*empty1 == 0x54 && *empty2 == 0xff) ||
> +				(*empty1 == 0xff && *empty2 == 0x54)) {
> +			orig1[i] = *empty1;
> +			orig2[i] = *empty2;
> +
> +			*empty1 = 0xff;
> +			*empty2 = 0xff;
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	if (i < cwperpage || memchr_inv(data_buf, 0xff, mtd->writesize))
> +		goto not_empty;
> +
> +	/*
> +	 * tell the caller that the page was empty and is fixed up, so that
> +	 * parse_read_errors() doesn't think it's an error
> +	 */
> +	return true;
> +
> +not_empty:
> +	/* restore original values if not empty*/
> +	for (j = 0; j < i; j++) {
> +		data_buf[3 + j * host->cw_data] = orig1[j];
> +		data_buf[175 + j * host->cw_data] = orig2[j];
> +	}
> +
> +	return false;
> +}

This empty page detection seems a bit complicated to me. Could you
consider using nand_check_erased_ecc_chunk() to check is the chunk is
containing 0xff data instead of implementing your own logic?


[...]

> +
> +static int qcom_nand_host_setup(struct qcom_nand_host *host)
> +{
> +	struct qcom_nand_controller *nandc = host->nandc;
> +	struct nand_chip *chip = &host->chip;
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int cwperpage, spare_bytes, bbm_size, bad_block_byte;
> +	bool wide_bus;
> +	int ecc_mode = 1;
> +
> +	/*
> +	 * the controller requires each step consists of 512 bytes of data.
> +	 * bail out if DT has populated a wrong step size.
> +	 */
> +	if (ecc->size != NANDC_STEP_SIZE) {
> +		dev_err(nandc->dev, "invalid ecc size\n");
> +		return -EINVAL;
> +	}
> +
> +	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
> +
> +	if (ecc->strength >= 8) {
> +		/* 8 bit ECC defaults to BCH ECC on all platforms */
> +		host->bch_enabled = true;
> +		ecc_mode = 1;
> +
> +		if (wide_bus) {
> +			host->ecc_bytes_hw = 14;
> +			spare_bytes = 0;
> +			bbm_size = 2;
> +		} else {
> +			host->ecc_bytes_hw = 13;
> +			spare_bytes = 2;
> +			bbm_size = 1;
> +		}
> +	} else {
> +		/*
> +		 * if the controller supports BCH for 4 bit ECC, the controller
> +		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
> +		 * always 10 bytes
> +		 */
> +		if (nandc->ecc_modes & ECC_BCH_4BIT) {
> +			/* BCH */
> +			host->bch_enabled = true;
> +			ecc_mode = 0;
> +
> +			if (wide_bus) {
> +				host->ecc_bytes_hw = 8;
> +				spare_bytes = 2;
> +				bbm_size = 2;
> +			} else {
> +				host->ecc_bytes_hw = 7;
> +				spare_bytes = 4;
> +				bbm_size = 1;
> +			}
> +		} else {
> +			/* RS */
> +			host->ecc_bytes_hw = 10;
> +
> +			if (wide_bus) {
> +				spare_bytes = 0;
> +				bbm_size = 2;
> +			} else {
> +				spare_bytes = 1;
> +				bbm_size = 1;
> +			}
> +		}
> +	}
> +
> +	/*
> +	 * we consider ecc->bytes as the sum of all the non-data content in a
> +	 * step. It gives us a clean representation of the oob area (even if
> +	 * all the bytes aren't used for ECC).It is always 16 bytes for 8 bit
> +	 * ECC and 12 bytes for 4 bit ECC
> +	 */
> +	ecc->bytes = host->ecc_bytes_hw + spare_bytes + bbm_size;

You should add the following check:

	if (ecc->bytes * (mtd->writesize / ecc->size) < mtd->oobsize) {
		dev_err(nandc->dev, "ecc data do not fit in OOB
	area\n");
		return -EINVAL;
	}
		
> +
> +	ecc->read_page		= qcom_nandc_read_page;
> +	ecc->read_oob		= qcom_nandc_read_oob;
> +	ecc->write_page		= qcom_nandc_write_page;
> +	ecc->write_oob		= qcom_nandc_write_oob;
> +
> +	ecc->mode = NAND_ECC_HW;
> +
> +	ecc->layout = qcom_nand_create_layout(host);
> +	if (!ecc->layout)
> +		return -ENOMEM;
> +
> +	cwperpage = mtd->writesize / ecc->size;
> +
> +	/*
> +	 * DATA_UD_BYTES varies based on whether the read/write command protects
> +	 * spare data with ECC too. We protect spare data by default, so we set
> +	 * it to main + spare data, which are 512 and 4 bytes respectively.
> +	 */
> +	host->cw_data = 516;
> +
> +	/*
> +	 * total bytes in a step, either 528 bytes for 4 bit ECC, or 532 bytes
> +	 * for 8 bit ECC
> +	 */
> +	host->cw_size = host->cw_data + ecc->bytes;
> +
> +	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
> +
> +	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
> +				| host->cw_data << UD_SIZE_BYTES
> +				| 0 << DISABLE_STATUS_AFTER_WRITE
> +				| 5 << NUM_ADDR_CYCLES
> +				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
> +				| 0 << STATUS_BFR_READ
> +				| 1 << SET_RD_MODE_AFTER_STATUS
> +				| spare_bytes << SPARE_SIZE_BYTES;
> +
> +	host->cfg1 = 7 << NAND_RECOVERY_CYCLES
> +				| 0 <<  CS_ACTIVE_BSY
> +				| bad_block_byte << BAD_BLOCK_BYTE_NUM
> +				| 0 << BAD_BLOCK_IN_SPARE_AREA
> +				| 2 << WR_RD_BSY_GAP
> +				| wide_bus << WIDE_FLASH
> +				| host->bch_enabled << ENABLE_BCH_ECC;
> +
> +	host->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
> +				| host->cw_size << UD_SIZE_BYTES
> +				| 5 << NUM_ADDR_CYCLES
> +				| 0 << SPARE_SIZE_BYTES;
> +
> +	host->cfg1_raw = 7 << NAND_RECOVERY_CYCLES
> +				| 0 << CS_ACTIVE_BSY
> +				| 17 << BAD_BLOCK_BYTE_NUM
> +				| 1 << BAD_BLOCK_IN_SPARE_AREA
> +				| 2 << WR_RD_BSY_GAP
> +				| wide_bus << WIDE_FLASH
> +				| 1 << DEV0_CFG1_ECC_DISABLE;
> +
> +	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
> +				| 0 << ECC_SW_RESET
> +				| host->cw_data << ECC_NUM_DATA_BYTES
> +				| 1 << ECC_FORCE_CLK_OPEN
> +				| ecc_mode << ECC_MODE
> +				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
> +
> +	host->ecc_buf_cfg = 0x203 << NUM_STEPS;
> +
> +	host->clrflashstatus = FS_READY_BSY_N;
> +	host->clrreadstatus = 0xc0;
> +
> +	dev_dbg(nandc->dev,
> +		"cfg0 %x cfg1 %x ecc_buf_cfg %x ecc_bch cfg %x cw_size %d cw_data %d strength %d parity_bytes %d steps %d\n",
> +		host->cfg0, host->cfg1, host->ecc_buf_cfg, host->ecc_bch_cfg,
> +		host->cw_size, host->cw_data, ecc->strength, ecc->bytes,
> +		cwperpage);
> +
> +	return 0;
> +}

[...]

> +
> +static int qcom_nandc_probe(struct platform_device *pdev)
> +{
> +	struct qcom_nand_controller *nandc;
> +	const void *dev_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *dn = dev->of_node, *child;
> +	int ret;
> +
> +	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
> +	if (!nandc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, nandc);
> +	nandc->dev = dev;
> +
> +	dev_data = of_device_get_match_data(dev);
> +	if (!dev_data) {
> +		dev_err(&pdev->dev, "failed to get device data\n");
> +		return -ENODEV;
> +	}
> +
> +	nandc->ecc_modes = (unsigned long) dev_data;
> +
> +	nandc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nandc->base = devm_ioremap_resource(dev, nandc->res);
> +	if (IS_ERR(nandc->base))
> +		return PTR_ERR(nandc->base);
> +
> +	nandc->core_clk = devm_clk_get(dev, "core");
> +	if (IS_ERR(nandc->core_clk))
> +		return PTR_ERR(nandc->core_clk);
> +
> +	nandc->aon_clk = devm_clk_get(dev, "aon");
> +	if (IS_ERR(nandc->aon_clk))
> +		return PTR_ERR(nandc->aon_clk);
> +
> +	ret = qcom_nandc_parse_dt(pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_nandc_alloc(nandc);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(nandc->core_clk);
> +	if (ret)
> +		goto err_core_clk;
> +
> +	ret = clk_prepare_enable(nandc->aon_clk);
> +	if (ret)
> +		goto err_aon_clk;
> +
> +	ret = qcom_nandc_setup(nandc);
> +	if (ret)
> +		goto err_setup;
> +
> +	for_each_available_child_of_node(dn, child) {
> +		if (of_device_is_compatible(child, "qcom,nandcs")) {
> +			struct qcom_nand_host *host;
> +
> +			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +			if (!host) {
> +				of_node_put(child);
> +				ret = -ENOMEM;
> +				goto err_setup;
> +			}
> +
> +			host->nandc = nandc;
> +			ret = qcom_nand_host_init(host, child);
> +			if (ret) {
> +				devm_kfree(dev, host);
> +				continue;
> +			}
> +
> +			list_add_tail(&host->node, &nandc->host_list);
> +		}
> +	}
> +
> +	if (list_empty(&nandc->host_list)) {
> +		ret = -ENODEV;
> +		goto err_setup;
> +	}
> +
> +	return 0;
> +
> +err_setup:

You should also release the nand devices that may have been registered
in the above loop.

> +	clk_disable_unprepare(nandc->aon_clk);
> +err_aon_clk:
> +	clk_disable_unprepare(nandc->core_clk);
> +err_core_clk:
> +	qcom_nandc_unalloc(nandc);
> +
> +	return ret;
> +}
> +
> +static int qcom_nandc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
> +	struct qcom_nand_host *host;
> +
> +	list_for_each_entry(host, &nandc->host_list, node)
> +		nand_release(nand_to_mtd(&host->chip));
> +
> +	qcom_nandc_unalloc(nandc);
> +
> +	clk_disable_unprepare(nandc->aon_clk);
> +	clk_disable_unprepare(nandc->core_clk);
> +
> +	return 0;
> +}
> +
> +#define EBI2_NANDC_ECC_MODES	(ECC_RS_4BIT | ECC_BCH_8BIT)
> +
> +/*
> + * data will hold a struct pointer containing more differences once we support
> + * more controller variants
> + */
> +static const struct of_device_id qcom_nandc_of_match[] = {
> +	{	.compatible = "qcom,ebi2-nandc",
> +		.data = (void *) EBI2_NANDC_ECC_MODES,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
> +
> +static struct platform_driver qcom_nandc_driver = {
> +	.driver = {
> +		.name = "qcom-nandc",
> +		.of_match_table = qcom_nandc_of_match,
> +	},
> +	.probe   = qcom_nandc_probe,
> +	.remove  = qcom_nandc_remove,
> +};
> +module_platform_driver(qcom_nandc_driver);
> +
> +MODULE_AUTHOR("Archit Taneja <architt@codeaurora.org>");
> +MODULE_DESCRIPTION("Qualcomm NAND Controller driver");
> +MODULE_LICENSE("GPL v2");


Thanks for the rework you've done on the other parts of the code.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
