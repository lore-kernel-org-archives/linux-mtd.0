Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eUfDN-00045o-JB
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 20:55:50 +0000
Date: Thu, 28 Dec 2017 21:55:28 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 nagasuresh12@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, punnaia@xilinx.com, michals@xilinx.com,
 dwmw2@infradead.org
Subject: Re: [PATCH v9 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Message-ID: <20171228215528.3ce15bd5@xps13>
In-Reply-To: <20171214134445.4985-3-nagasure@xilinx.com>
References: <20171214134445.4985-1-nagasure@xilinx.com>
 <20171214134445.4985-3-nagasure@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Thanks for contributing this driver.

As you may know, the NAND framework is currently moving to an interface
called ->exec_op(). Please look at the l2-mtd -or linux-next- tree to
see what this is (drivers/mtd/nand/nand_base.c is quite well
documented about this interface).

New drivers should drop their ->cmdfunc() / ->cmd_ctrl() /
->read/write_byte/word/buf() implementations and instead switch to
->exec_op(). I know this is a significant amount of work but do not
hesitate to ask if you need some help.

You may take the Marvell NAND controller driver as example of how to
implement it (rework also currently under review):
https://www.spinics.net/lists/arm-kernel/msg624246.html

Otherwise there are some comments below. I am really not a NAND god, so
don't take them as pure truth :)

Thank you,
Miqu=C3=A8l

On Thu, 14 Dec 2017 19:14:45 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> Added the basic driver for Arasan NAND Flash Controller used in
> Zynq UltraScale+ MPSoC. It supports only Hw ECC and upto 24bit
> correction.
>=20
> Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
> Changes in v9:
>  - Added the SPDX tags
> Changes in v8:
>  - Implemented setup_data_interface hook
>  - fixed checkpatch --strict warnings
>  - Added anfc_config_ecc in read_page_hwecc
>  - Fixed returning status value by reading flash status in read_byte()
>    instead of reading previous value.
> Changes in v7:
> - Implemented Marek suggestions and comments
> - Corrected the acronyms those should be in caps
> - Modified kconfig/Make file to keep arasan entry in sorted order
> - Added is_vmlloc_addr check
> - Used ioread/write32_rep variants to avoid compilation error for
> intel platforms
> - separated PIO and DMA mode read/write functions
> - Minor cleanup
> Chnages in v6:
> - Addressed most of the Brian and Boris comments
> - Separated the nandchip from the nand controller
> - Removed the ecc lookup table from driver
> - Now use framework nand waitfunction and readoob
> - Fixed the compiler warning
> - Adapted the new frameowrk changes related to ecc and ooblayout
> - Disabled the clocks after the nand_reelase
> - Now using only one completion object
> - Boris suggessions like adapting cmd_ctrl and rework on read/write
> byte are not implemented and i will patch them later
> - Also check_erased_ecc_chunk for erase and check for is_vmalloc_addr
> will implement later once the basic driver is mainlined.
> Changes in v5:
> - Renamed the driver filei as arasan_nand.c
> - Fixed all comments relaqted coding style
> - Fixed comments related to propagating the errors
> - Modified the anfc_write_page_hwecc as per the write_page
>   prototype
> Changes in v4:
> - Added support for onfi timing mode configuration
> - Added clock supppport
> - Added support for multiple chipselects
> Changes in v3:
> - Removed unused variables
> - Avoided busy loop and used jifies based implementation
> - Fixed compiler warnings "right shift count >=3D width of type"
> - Removed unneeded codei and improved error reporting
> - Added onfi version check to ensure reading the valid address cycles
> Changes in v2:
> - Added missing of.h to avoid kbuild system report erro
> ---
>  drivers/mtd/nand/Kconfig       |    8 +
>  drivers/mtd/nand/Makefile      |    1 +
>  drivers/mtd/nand/arasan_nand.c | 1018
> ++++++++++++++++++++++++++++++++++++++++ 3 files changed, 1027
> insertions(+) create mode 100644 drivers/mtd/nand/arasan_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 3f2036f31da4..bdc97510f758 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -40,6 +40,14 @@ config MTD_SM_COMMON
>  	tristate
>  	default n
> =20
> +config MTD_NAND_ARASAN
> +	tristate "Support for Arasan Nand Flash controller"
> +	depends on HAS_IOMEM
> +	depends on HAS_DMA
> +	help
> +	  Enables the driver for the Arasan NAND Flash controller on
> +	  Zynq UltraScale+ MPSoC.
> +
>  config MTD_NAND_DENALI
>  	tristate
> =20
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 6e2db700d923..b96965a95daf 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MTD_NAND_ECC)		+=3D
> nand_ecc.o obj-$(CONFIG_MTD_NAND_BCH)		+=3D nand_bch.o
>  obj-$(CONFIG_MTD_SM_COMMON) 		+=3D sm_common.o
> =20
> +obj-$(CONFIG_MTD_NAND_ARASAN)		+=3D arasan_nand.o
>  obj-$(CONFIG_MTD_NAND_CAFE)		+=3D cafe_nand.o
>  obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+=3D ams-delta.o
>  obj-$(CONFIG_MTD_NAND_DENALI)		+=3D denali.o
> diff --git a/drivers/mtd/nand/arasan_nand.c
> b/drivers/mtd/nand/arasan_nand.c new file mode 100644
> index 000000000000..89c06b70b65d
> --- /dev/null
> +++ b/drivers/mtd/nand/arasan_nand.c
> @@ -0,0 +1,1018 @@
> +/*
> + * Arasan NAND Flash Controller Driver
> + *
> + * Copyright (C) 2014 - 2017 Xilinx, Inc.
> + * Author: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME			"arasan_nand"
> +#define EVNT_TIMEOUT_MSEC		1000
> +
> +#define PKT_OFST			0x00
> +#define MEM_ADDR1_OFST			0x04
> +#define MEM_ADDR2_OFST			0x08
> +#define CMD_OFST			0x0C
> +#define PROG_OFST			0x10
> +#define INTR_STS_EN_OFST		0x14
> +#define INTR_SIG_EN_OFST		0x18
> +#define INTR_STS_OFST			0x1C
> +#define READY_STS_OFST			0x20
> +#define DMA_ADDR1_OFST			0x24
> +#define FLASH_STS_OFST			0x28
> +#define DATA_PORT_OFST			0x30
> +#define ECC_OFST			0x34
> +#define ECC_ERR_CNT_OFST		0x38
> +#define ECC_SPR_CMD_OFST		0x3C
> +#define ECC_ERR_CNT_1BIT_OFST		0x40
> +#define ECC_ERR_CNT_2BIT_OFST		0x44
> +#define DMA_ADDR0_OFST			0x50
> +#define DATA_INTERFACE_OFST		0x6C
> +
> +#define PKT_CNT_SHIFT			12
> +
> +#define ECC_ENABLE			BIT(31)
> +#define DMA_EN_MASK			GENMASK(27, 26)
> +#define DMA_ENABLE			0x2
> +#define DMA_EN_SHIFT			26
> +#define REG_PAGE_SIZE_SHIFT		23
> +#define REG_PAGE_SIZE_512		0
> +#define REG_PAGE_SIZE_1K		5
> +#define REG_PAGE_SIZE_2K		1
> +#define REG_PAGE_SIZE_4K		2
> +#define REG_PAGE_SIZE_8K		3
> +#define REG_PAGE_SIZE_16K		4
> +#define CMD2_SHIFT			8
> +#define ADDR_CYCLES_SHIFT		28
> +
> +#define XFER_COMPLETE			BIT(2)
> +#define READ_READY			BIT(1)
> +#define WRITE_READY			BIT(0)
> +#define MBIT_ERROR			BIT(3)
> +
> +#define PROG_PGRD			BIT(0)
> +#define PROG_ERASE			BIT(2)
> +#define PROG_STATUS			BIT(3)
> +#define PROG_PGPROG			BIT(4)
> +#define PROG_RDID			BIT(6)
> +#define PROG_RDPARAM			BIT(7)
> +#define PROG_RST			BIT(8)
> +#define PROG_GET_FEATURE		BIT(9)
> +#define PROG_SET_FEATURE		BIT(10)
> +
> +#define PG_ADDR_SHIFT			16
> +#define BCH_MODE_SHIFT			25
> +#define BCH_EN_SHIFT			27
> +#define ECC_SIZE_SHIFT			16
> +
> +#define MEM_ADDR_MASK			GENMASK(7, 0)
> +#define BCH_MODE_MASK			GENMASK(27, 25)
> +
> +#define CS_MASK				GENMASK(31, 30)
> +#define CS_SHIFT			30
> +
> +#define PAGE_ERR_CNT_MASK		GENMASK(16, 8)
> +#define PKT_ERR_CNT_MASK		GENMASK(7, 0)
> +
> +#define NVDDR_MODE			BIT(9)
> +#define NVDDR_TIMING_MODE_SHIFT		3
> +
> +#define ONFI_ID_LEN			8
> +#define TEMP_BUF_SIZE			1024
> +#define NVDDR_MODE_PACKET_SIZE		8
> +#define SDR_MODE_PACKET_SIZE		4
> +
> +#define ONFI_DATA_INTERFACE_NVDDR      BIT(4)
> +#define EVENT_MASK	(XFER_COMPLETE | READ_READY | WRITE_READY
> | MBIT_ERROR) +
> +#define SDR_MODE_DEFLT_FREQ		80000000
> +
> +/**
> + * struct anfc_nand_chip - Defines the nand chip related information

I think you should s/nand/NAND/ when writing plain English?

> + * @node:		used to store NAND chips into a list.
> + * @chip:		NAND chip information structure.
> + * @bch:		Bch / Hamming mode enable/disable.
> + * @bchmode:		Bch mode.
> + * @eccval:		Ecc config value.
> + * @raddr_cycles:	Row address cycle information.
> + * @caddr_cycles:	Column address cycle information.
> + * @pktsize:		Packet size for read / write operation.
> + * @csnum:		chipselect number to be used.
> + * @spktsize:		Packet size in ddr mode for status
> operation.
> + * @inftimeval:		Data interface and timing mode
> information
> + */
> +struct anfc_nand_chip {
> +	struct list_head node;
> +	struct nand_chip chip;
> +	bool bch;
> +	u32 bchmode;
> +	u32 eccval;
> +	u16 raddr_cycles;
> +	u16 caddr_cycles;
> +	u32 pktsize;
> +	int csnum;
> +	u32 spktsize;
> +	u32 inftimeval;
> +};
> +
> +/**
> + * struct anfc - Defines the Arasan NAND flash driver instance
> + * @controller:		base controller structure.
> + * @chips:		list of all nand chips attached to the
> ctrler.
> + * @dev:		Pointer to the device structure.
> + * @base:		Virtual address of the NAND flash device.
> + * @curr_cmd:		Current command issued.
> + * @clk_sys:		Pointer to the system clock.
> + * @clk_flash:		Pointer to the flash clock.
> + * @dma:		Dma enable/disable.
> + * @iswriteoob:		Identifies if oob write operation is
> required.
> + * @buf:		Buffer used for read/write byte operations.
> + * @irq:		irq number
> + * @bufshift:		Variable used for indexing buffer
> operation
> + * @csnum:		Chip select number currently inuse.
> + * @event:		Completion event for nand status events.
> + * @status:		Status of the flash device
> + */
> +struct anfc {
> +	struct nand_hw_control controller;
> +	struct list_head chips;
> +	struct device *dev;
> +	void __iomem *base;
> +	int curr_cmd;
> +	struct clk *clk_sys;
> +	struct clk *clk_flash;
> +	bool dma;
> +	bool iswriteoob;
> +	u8 buf[TEMP_BUF_SIZE];
> +	int irq;
> +	u32 bufshift;
> +	int csnum;
> +	struct completion event;
> +	int status;
> +};
> +
> +static int anfc_ooblayout_ecc(struct mtd_info *mtd, int section,
> +			      struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *nand =3D mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length =3D nand->ecc.total;
> +	oobregion->offset =3D mtd->oobsize - oobregion->length;
> +
> +	return 0;
> +}
> +
> +static int anfc_ooblayout_free(struct mtd_info *mtd, int section,
> +			       struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *nand =3D mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D 2;
> +	oobregion->length =3D mtd->oobsize - nand->ecc.total - 2;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops anfc_ooblayout_ops =3D {
> +	.ecc =3D anfc_ooblayout_ecc,
> +	.free =3D anfc_ooblayout_free,
> +};
> +
> +static inline struct anfc_nand_chip *to_anfc_nand(struct nand_chip
> *nand) +{
> +	return container_of(nand, struct anfc_nand_chip, chip);
> +}
> +
> +static inline struct anfc *to_anfc(struct nand_hw_control *ctrl)
> +{
> +	return container_of(ctrl, struct anfc, controller);
> +}
> +
> +static u8 anfc_page(u32 pagesize)
> +{
> +	switch (pagesize) {
> +	case 512:
> +		return REG_PAGE_SIZE_512;
> +	case 1024:
> +		return REG_PAGE_SIZE_1K;
> +	case 2048:
> +		return REG_PAGE_SIZE_2K;
> +	case 4096:
> +		return REG_PAGE_SIZE_4K;
> +	case 8192:
> +		return REG_PAGE_SIZE_8K;
> +	case 16384:

Maybe you can use macros like SZ_512, SZ_1K, SZ_2K, etc, see
include/linux/sizes.h

> +		return REG_PAGE_SIZE_16K;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void anfc_enable_intrs(struct anfc *nfc, u32 val)
> +{
> +	writel(val, nfc->base + INTR_STS_EN_OFST);
> +	writel(val, nfc->base + INTR_SIG_EN_OFST);
> +}
> +
> +static inline void anfc_config_ecc(struct anfc *nfc, int on)
> +{
> +	u32 val;
> +
> +	val =3D readl(nfc->base + CMD_OFST);
> +	if (on)
> +		val |=3D ECC_ENABLE;
> +	else
> +		val &=3D ~ECC_ENABLE;
> +	writel(val, nfc->base + CMD_OFST);
> +}
> +
> +static inline void anfc_config_dma(struct anfc *nfc, int on)
> +{
> +	u32 val;
> +
> +	val =3D readl(nfc->base + CMD_OFST);
> +	val &=3D ~DMA_EN_MASK;
> +	if (on)
> +		val |=3D DMA_ENABLE << DMA_EN_SHIFT;
> +	writel(val, nfc->base + CMD_OFST);
> +}

Nitpick: both anfc_config_ecc/dma() functions do similar actions but
the syntax is different.

> +
> +static inline int anfc_wait_for_event(struct anfc *nfc)
> +{
> +	return wait_for_completion_timeout(&nfc->event,
> +
> msecs_to_jiffies(EVNT_TIMEOUT_MSEC)); +}
> +
> +static inline void anfc_setpktszcnt(struct anfc *nfc, u32 pktsize,
> +				    u32 pktcount)
> +{
> +	writel(pktsize | (pktcount << PKT_CNT_SHIFT), nfc->base +
> PKT_OFST); +}
> +
> +static inline void anfc_set_eccsparecmd(struct anfc *nfc,
> +					struct anfc_nand_chip
> *achip, u8 cmd1,
> +					u8 cmd2)
> +{
> +	writel(cmd1 | (cmd2 << CMD2_SHIFT) |
> +	       (achip->caddr_cycles << ADDR_CYCLES_SHIFT),
> +	       nfc->base + ECC_SPR_CMD_OFST);
> +}
> +
> +static void anfc_setpagecoladdr(struct anfc *nfc, u32 page, u16 col)
> +{
> +	u32 val;
> +
> +	writel(col | (page << PG_ADDR_SHIFT), nfc->base +
> MEM_ADDR1_OFST); +
> +	val =3D readl(nfc->base + MEM_ADDR2_OFST);
> +	val =3D (val & ~MEM_ADDR_MASK) |
> +	      ((page >> PG_ADDR_SHIFT) & MEM_ADDR_MASK);
> +	writel(val, nfc->base + MEM_ADDR2_OFST);
> +}
> +
> +static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2, u8
> dmamode,
> +			     u32 pagesize, u8 addrcycles)
> +{
> +	u32 regval;
> +
> +	regval =3D cmd1 | (cmd2 << CMD2_SHIFT);
> +	if (dmamode && nfc->dma)
> +		regval |=3D DMA_ENABLE << DMA_EN_SHIFT;
> +	regval |=3D addrcycles << ADDR_CYCLES_SHIFT;
> +	regval |=3D anfc_page(pagesize) << REG_PAGE_SIZE_SHIFT;
> +	writel(regval, nfc->base + CMD_OFST);
> +}
> +
> +static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip
> *chip,
> +			  int page)
> +{
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +
> +	nfc->iswriteoob =3D true;
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
> +	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	nfc->iswriteoob =3D false;
> +
> +	return 0;
> +}
> +
> +static void anfc_rw_buf_dma(struct mtd_info *mtd, uint8_t *buf, int
> len,
> +			    int operation, u32 prog)
> +{
> +	dma_addr_t paddr;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	u32 eccintr =3D 0, dir;
> +	u32 pktsize =3D len, pktcount =3D 1;
> +
> +	if (nfc->curr_cmd =3D=3D NAND_CMD_READ0 ||
> +	    (nfc->curr_cmd =3D=3D NAND_CMD_SEQIN && !nfc->iswriteoob)) {
> +		pktsize =3D achip->pktsize;
> +		pktcount =3D DIV_ROUND_UP(mtd->writesize, pktsize);
> +	}
> +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> +
> +	if (!achip->bch && nfc->curr_cmd =3D=3D NAND_CMD_READ0)
> +		eccintr =3D MBIT_ERROR;
> +
> +	if (operation)
> +		dir =3D DMA_FROM_DEVICE;
> +	else
> +		dir =3D DMA_TO_DEVICE;
> +
> +	paddr =3D dma_map_single(nfc->dev, buf, len, dir);
> +	if (dma_mapping_error(nfc->dev, paddr)) {
> +		dev_err(nfc->dev, "Read buffer mapping error");
> +		return;
> +	}
> +	writel(paddr, nfc->base + DMA_ADDR0_OFST);
> +	writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
> +	anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
> +	writel(prog, nfc->base + PROG_OFST);
> +	anfc_wait_for_event(nfc);
> +	dma_unmap_single(nfc->dev, paddr, len, dir);
> +}
> +
> +static void anfc_rw_buf_pio(struct mtd_info *mtd, uint8_t *buf, int
> len,
> +			    int operation, int prog)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	u32 *bufptr =3D (u32 *)buf;
> +	u32 cnt =3D 0, intr =3D 0;
> +	u32 pktsize =3D len, pktcount =3D 1;
> +
> +	anfc_config_dma(nfc, 0);
> +
> +	if (nfc->curr_cmd =3D=3D NAND_CMD_READ0 ||
> +	    (nfc->curr_cmd =3D=3D NAND_CMD_SEQIN && !nfc->iswriteoob)) {
> +		pktsize =3D achip->pktsize;
> +		pktcount =3D DIV_ROUND_UP(mtd->writesize, pktsize);
> +	}
> +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> +
> +	if (!achip->bch && nfc->curr_cmd =3D=3D NAND_CMD_READ0)
> +		intr =3D MBIT_ERROR;
> +
> +	if (operation)
> +		intr |=3D READ_READY;
> +	else
> +		intr |=3D WRITE_READY;
> +
> +	anfc_enable_intrs(nfc, intr);
> +	writel(prog, nfc->base + PROG_OFST);
> +
> +	while (cnt < pktcount) {
> +		anfc_wait_for_event(nfc);
> +		cnt++;
> +		if (cnt =3D=3D pktcount)
> +			anfc_enable_intrs(nfc, XFER_COMPLETE);
> +		if (operation)
> +			ioread32_rep(nfc->base + DATA_PORT_OFST,
> bufptr,
> +				     pktsize / 4);
> +		else
> +			iowrite32_rep(nfc->base + DATA_PORT_OFST,
> bufptr,
> +				      pktsize / 4);
> +		bufptr +=3D (pktsize / 4);
> +		if (cnt < pktcount)
> +			anfc_enable_intrs(nfc, intr);
> +	}
> +
> +	anfc_wait_for_event(nfc);
> +}
> +
> +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int
> len) +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +
> +	if (nfc->dma && !is_vmalloc_addr(buf))
> +		anfc_rw_buf_dma(mtd, buf, len, 1, PROG_PGRD);
> +	else
> +		anfc_rw_buf_pio(mtd, buf, len, 1, PROG_PGRD);

You put 0 or 1 in the "operation" while this means "do a read" or "do a
write", both anfc_rw_buf_dma/pio() functions would probably benefit to
have this parameter renamed and turned into a boolean.

> +}
> +
> +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
> int len) +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +
> +	if (nfc->dma && !is_vmalloc_addr(buf))
> +		anfc_rw_buf_dma(mtd, (char *)buf, len, 0,
> PROG_PGPROG);
> +	else
> +		anfc_rw_buf_pio(mtd, (char *)buf, len, 0,
> PROG_PGPROG);

I think both "(char *)" casts are abusive and the const qualifier
should probably remain.

> +}
> +
> +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> +				struct nand_chip *chip, uint8_t *buf,
> +				int oob_required, int page)
> +{
> +	u32 val;
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	u8 *ecc_code =3D chip->buffers->ecccode;
> +	u8 *p =3D buf;
> +	int eccsize =3D chip->ecc.size;
> +	int eccbytes =3D chip->ecc.bytes;
> +	int eccsteps =3D chip->ecc.steps;
> +	int stat =3D 0, i;
> +
> +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT,
> NAND_CMD_RNDOUTSTART);
> +	anfc_config_ecc(nfc, 1);
> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +
> +	val =3D readl(nfc->base + ECC_ERR_CNT_OFST);
> +	val =3D ((val & PAGE_ERR_CNT_MASK) >> 8);

If I understand this correctly, there is no point doing the upper two
lines out of the if statement?

> +	if (achip->bch) {
> +		mtd->ecc_stats.corrected +=3D val;

This is strange that there is no handling of a failing situation when
using BCH algorithm. You should probably add some logic here that
either increments ecc_stats.corrected or ecc_stats.failed like it is
done below.

> +	} else {
> +		val =3D readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		mtd->ecc_stats.corrected +=3D val;
> +		val =3D readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +		mtd->ecc_stats.failed +=3D val;
> +		/* Clear ecc error count register 1Bit, 2Bit */
> +		writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +	}
> +
> +	if (oob_required)
> +		chip->ecc.read_oob(mtd, chip, page);
> +
> +	anfc_config_ecc(nfc, 0);
> +

Some comments would be welcome from here to the end, that is not
entirely clear to me what you try to achieve here.

> +	if (val) {

When using Hamming, val !=3D 0 means there is an uncorrectable error,
while when using BCH, it may just mean there was some corrected
bitflips. I think you should enter this statement only if Hamming or BCH
failed to recover bitflips?

> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> +		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);

If OOB area was required, you are most likely overwriting OOB bytes
that were maybe corrected by the ECC engine before it was turned off,
by bytes retried with a raw read (potentially with bitflips).

> +		mtd_ooblayout_get_eccbytes(mtd, ecc_code,
> chip->oob_poi, 0,
> +					   chip->ecc.total);
> +		for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes,
> +		     p +=3D eccsize) {
> +			stat =3D nand_check_erased_ecc_chunk(p,
> chip->ecc.size, &ecc_code[i], eccbytes, NULL, 0, chip->ecc.strength);

Do you actually check the entire OOB area here ?

Can't you just do the check on chip->oob_poi?

> +		}
> +		if (stat < 0)

Please check this, but I think you should increment ecc_stats.failed
here.

> +			stat =3D 0;
> +		else
> +			mtd->ecc_stats.corrected +=3D stat;
> +		return stat;
> +	}
> +
> +	return 0;
> +}

Can you run nandbiterrs test (from mtd-utils) with both Hamming and
BCH and check it fails after the right number of bitflips?

> +
> +static int anfc_write_page_hwecc(struct mtd_info *mtd,
> +				 struct nand_chip *chip, const
> uint8_t *buf,
> +				 int oob_required, int page)
> +{
> +	int ret;
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	u8 *ecc_calc =3D chip->buffers->ecccalc;
> +
> +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDIN, 0);
> +	anfc_config_ecc(nfc, 1);
> +
> +	chip->write_buf(mtd, buf, mtd->writesize);
> +
> +	if (oob_required) {
> +		chip->waitfunc(mtd, chip);
> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> +		chip->read_buf(mtd, ecc_calc, mtd->oobsize);
> +		ret =3D mtd_ooblayout_set_eccbytes(mtd, ecc_calc,
> chip->oob_poi,
> +						 0, chip->ecc.total);
> +		if (ret)
> +			return ret;
> +		chip->ecc.write_oob(mtd, chip, page);
> +	}
> +	anfc_config_ecc(nfc, 0);
> +
> +	return 0;
> +}
> +
> +static u8 anfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +
> +	if (nfc->curr_cmd =3D=3D NAND_CMD_STATUS)
> +		return readl(nfc->base + FLASH_STS_OFST);
> +	else
> +		return nfc->buf[nfc->bufshift++];
> +}
> +
> +static int anfc_extra_init(struct anfc *nfc, struct anfc_nand_chip
> *achip) +{
> +	int mode, err;
> +	unsigned int feature[2];
> +	u32 inftimeval;
> +	struct nand_chip *chip =3D &achip->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	bool change_sdr_clk =3D false;
> +
> +	if (!chip->onfi_version ||
> +	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> +	    & ONFI_OPT_CMD_SET_GET_FEATURES))
> +		return -EINVAL;

I think this check is already done by the core.

> +
> +	/*
> +	 * If the controller is already in the same mode as flash
> device
> +	 * then no need to change the timing mode again.
> +	 */
> +	if (readl(nfc->base + DATA_INTERFACE_OFST) =3D=3D
> achip->inftimeval)
> +		return 0;
> +
> +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> +	/* Get nvddr timing modes */
> +	mode =3D onfi_get_sync_timing_mode(chip) & 0xff;
> +	if (!mode) {
> +		mode =3D fls(onfi_get_async_timing_mode(chip)) - 1;
> +		inftimeval =3D mode;
> +		if (mode >=3D 2 && mode <=3D 5)
> +			change_sdr_clk =3D true;
> +	} else {
> +		mode =3D fls(mode) - 1;
> +		inftimeval =3D NVDDR_MODE | (mode <<
> NVDDR_TIMING_MODE_SHIFT);
> +		mode |=3D ONFI_DATA_INTERFACE_NVDDR;
> +	}
> +	feature[0] =3D mode;
> +	chip->select_chip(mtd, achip->csnum);
> +	err =3D chip->onfi_set_features(mtd, chip,
> ONFI_FEATURE_ADDR_TIMING_MODE,
> +		(uint8_t *)feature);
> +	chip->select_chip(mtd, -1);
> +	if (err)
> +		return err;

You should forget all the NAND chip related code here, the core already
handles it, and then calls ->setup_data_interface() to tune timings on
the controller side only.

> +	/*
> +	 * SDR timing modes 2-5 will not work for the arasan nand
> when
> +	 * freq > 90 MHz, so reduce the freq in SDR modes 2-5 to <
> 90Mhz
> +	 */
> +	if (change_sdr_clk) {
> +		clk_disable_unprepare(nfc->clk_sys);
> +		err =3D clk_set_rate(nfc->clk_sys,
> SDR_MODE_DEFLT_FREQ);
> +		if (err) {
> +			dev_err(nfc->dev, "Can't set the clock
> rate\n");
> +			return err;
> +		}
> +		err =3D clk_prepare_enable(nfc->clk_sys);
> +		if (err) {
> +			dev_err(nfc->dev, "Unable to enable sys
> clock.\n");
> +			clk_disable_unprepare(nfc->clk_sys);
> +			return err;
> +		}

You do this twice as it is already handled in ->setup_data_interface().

> +	}
> +	achip->inftimeval =3D inftimeval;
> +	if (mode & ONFI_DATA_INTERFACE_NVDDR)
> +		achip->spktsize =3D NVDDR_MODE_PACKET_SIZE;
> +	return 0;
> +}

I don't think this should be in a separate function and instead should
be in ->setup_data_interface().

> +
> +static int anfc_ecc_init(struct mtd_info *mtd,
> +			 struct nand_ecc_ctrl *ecc)
> +{
> +	u32 ecc_addr;
> +	unsigned int bchmode, steps;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +
> +	ecc->mode =3D NAND_ECC_HW;
> +	ecc->read_page =3D anfc_read_page_hwecc;
> +	ecc->write_page =3D anfc_write_page_hwecc;
> +	ecc->write_oob =3D anfc_write_oob;
> +	mtd_set_ooblayout(mtd, &anfc_ooblayout_ops);
> +
> +	steps =3D mtd->writesize / chip->ecc_step_ds;
> +
> +	switch (chip->ecc_strength_ds) {
> +	case 12:
> +		bchmode =3D 0x1;
> +		break;
> +	case 8:
> +		bchmode =3D 0x2;
> +		break;
> +	case 4:
> +		bchmode =3D 0x3;
> +		break;
> +	case 24:
> +		bchmode =3D 0x4;
> +		break;
> +	default:
> +		bchmode =3D 0x0;
> +	}
> +
> +	if (!bchmode)
> +		ecc->total =3D 3 * steps;
> +	else
> +		ecc->total =3D
> +		     DIV_ROUND_UP(fls(8 * chip->ecc_step_ds) *
> +			 chip->ecc_strength_ds * steps, 8);
> +
> +	ecc->strength =3D chip->ecc_strength_ds;
> +	ecc->size =3D chip->ecc_step_ds;
> +	ecc->bytes =3D ecc->total / steps;
> +	ecc->steps =3D steps;
> +	achip->bchmode =3D bchmode;
> +	achip->bch =3D achip->bchmode;
> +	ecc_addr =3D mtd->writesize + (mtd->oobsize - ecc->total);
> +
> +	achip->eccval =3D ecc_addr | (ecc->total << ECC_SIZE_SHIFT) |
> +			(achip->bch << BCH_EN_SHIFT);
> +
> +	if (chip->ecc_step_ds >=3D 1024)
> +		achip->pktsize =3D 1024;
> +	else
> +		achip->pktsize =3D 512;
> +
> +	return 0;
> +}
> +
> +static void anfc_cmd_function(struct mtd_info *mtd,
> +			      unsigned int cmd, int column, int
> page_addr) +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	bool wait =3D false;
> +	u32 addrcycles, prog;
> +
> +	nfc->bufshift =3D 0;
> +	nfc->curr_cmd =3D cmd;
> +
> +	if (page_addr =3D=3D -1)
> +		page_addr =3D 0;
> +	if (column =3D=3D -1)
> +		column =3D 0;
> +
> +	switch (cmd) {
> +	case NAND_CMD_RESET:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> +		prog =3D PROG_RST;
> +		wait =3D true;
> +		break;
> +	case NAND_CMD_SEQIN:
> +		addrcycles =3D achip->raddr_cycles +
> achip->caddr_cycles;
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
> +				 mtd->writesize, addrcycles);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_READOOB:
> +		column +=3D mtd->writesize;
> +	case NAND_CMD_READ0:
> +	case NAND_CMD_READ1:
> +		addrcycles =3D achip->raddr_cycles +
> achip->caddr_cycles;
> +		anfc_prepare_cmd(nfc, NAND_CMD_READ0,
> NAND_CMD_READSTART, 1,
> +				 mtd->writesize, addrcycles);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_RNDOUT:
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
> +				 mtd->writesize, 2);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_PARAM:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf,
> +				(4 * sizeof(struct
> nand_onfi_params)),
> +				1, PROG_RDPARAM);
> +		break;
> +	case NAND_CMD_READID:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf, ONFI_ID_LEN, 1,
> PROG_RDID);
> +		break;
> +	case NAND_CMD_ERASE1:
> +		addrcycles =3D achip->raddr_cycles;
> +		prog =3D PROG_ERASE;
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0,
> addrcycles);
> +		column =3D page_addr & 0xffff;
> +		page_addr =3D (page_addr >> PG_ADDR_SHIFT) & 0xffff;
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		wait =3D true;
> +		break;
> +	case NAND_CMD_STATUS:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> +		anfc_setpktszcnt(nfc, achip->spktsize / 4, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		prog =3D PROG_STATUS;
> +		wait =3D true;
> +		break;
> +	case NAND_CMD_GET_FEATURES:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf, achip->spktsize, 1,
> +				PROG_GET_FEATURE);
> +		break;
> +	case NAND_CMD_SET_FEATURES:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (wait) {
> +		anfc_enable_intrs(nfc, XFER_COMPLETE);
> +		writel(prog, nfc->base + PROG_OFST);
> +		anfc_wait_for_event(nfc);
> +	}
> +	if (nfc->curr_cmd =3D=3D NAND_CMD_STATUS)
> +		nfc->status =3D readl(nfc->base + FLASH_STS_OFST);
> +}
> +
> +static void anfc_select_chip(struct mtd_info *mtd, int num)
> +{
> +	u32 val;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +
> +	if (num =3D=3D -1)
> +		return;
> +
> +	val =3D readl(nfc->base + MEM_ADDR2_OFST);
> +	val &=3D (val & ~(CS_MASK | BCH_MODE_MASK));
> +	val |=3D (achip->csnum << CS_SHIFT) | (achip->bchmode <<
> BCH_MODE_SHIFT);
> +	writel(val, nfc->base + MEM_ADDR2_OFST);
> +	nfc->csnum =3D achip->csnum;
> +	writel(achip->eccval, nfc->base + ECC_OFST);
> +	writel(achip->inftimeval, nfc->base + DATA_INTERFACE_OFST);
> +}
> +
> +static irqreturn_t anfc_irq_handler(int irq, void *ptr)
> +{
> +	struct anfc *nfc =3D ptr;
> +	u32 status;
> +
> +	status =3D readl(nfc->base + INTR_STS_OFST);
> +	if (status & EVENT_MASK) {
> +		complete(&nfc->event);
> +		writel((status & EVENT_MASK), nfc->base +
> INTR_STS_OFST);
> +		writel(0, nfc->base + INTR_STS_EN_OFST);
> +		writel(0, nfc->base + INTR_SIG_EN_OFST);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int anfc_onfi_set_features(struct mtd_info *mtd, struct
> nand_chip *chip,
> +				  int addr, uint8_t
> *subfeature_param) +{
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +	int status;
> +
> +	if (!chip->onfi_version)
> +		return -EINVAL;
> +
> +	if (!(le16_to_cpu(chip->onfi_params.opt_cmd) &
> +		ONFI_OPT_CMD_SET_GET_FEATURES))
> +		return -EINVAL;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
> +	anfc_rw_buf_pio(mtd, subfeature_param, achip->spktsize,
> +			0, PROG_SET_FEATURE);
> +	status =3D chip->waitfunc(mtd, chip);
> +	if (status & NAND_STATUS_FAIL)
> +		return -EIO;
> +
> +	return 0;
> +}

Are you sure this function is needed? If yes can you add a comment to
explain why? Otherwise I think the core already handles that kind of
logic.

> +
> +static int anfc_setup_data_interface(struct mtd_info *mtd, int
> csline,
> +				     const struct
> nand_data_interface *conf) +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct anfc *nfc =3D to_anfc(chip->controller);
> +	int err;
> +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> +
> +	if (csline =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
> +		return 0;
> +
> +	clk_disable_unprepare(nfc->clk_sys);
> +	err =3D clk_set_rate(nfc->clk_sys, SDR_MODE_DEFLT_FREQ);
> +	if (err) {
> +		dev_err(nfc->dev, "Can't set the clock rate\n");
> +		return err;
> +	}
> +	err =3D clk_prepare_enable(nfc->clk_sys);
> +	if (err) {
> +		dev_err(nfc->dev, "Unable to enable sys clock.\n");
> +		clk_disable_unprepare(nfc->clk_sys);
> +		return err;
> +	}
> +	achip->inftimeval =3D 0;
> +	anfc_extra_init(nfc, achip);
> +
> +	return 0;
> +}
> +
> +static int anfc_nand_chip_init(struct anfc *nfc,
> +			       struct anfc_nand_chip *anand_chip,
> +			       struct device_node *np)
> +{
> +	struct nand_chip *chip =3D &anand_chip->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "reg", &anand_chip->csnum);
> +	if (ret) {
> +		dev_err(nfc->dev, "can't get chip-select\n");
> +		return -ENXIO;
> +	}
> +
> +	mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
> "arasan_nand.%d",
> +				   anand_chip->csnum);
> +	mtd->dev.parent =3D nfc->dev;
> +
> +	chip->cmdfunc =3D anfc_cmd_function;
> +	chip->chip_delay =3D 30;
> +	chip->controller =3D &nfc->controller;
> +	chip->read_buf =3D anfc_read_buf;
> +	chip->write_buf =3D anfc_write_buf;
> +	chip->read_byte =3D anfc_read_byte;
> +	chip->options =3D NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE;
> +	chip->bbt_options =3D NAND_BBT_USE_FLASH;
> +	chip->select_chip =3D anfc_select_chip;
> +	chip->onfi_set_features =3D anfc_onfi_set_features;
> +	chip->setup_data_interface =3D anfc_setup_data_interface;
> +	nand_set_flash_node(chip, np);
> +
> +	anand_chip->spktsize =3D SDR_MODE_PACKET_SIZE;
> +	ret =3D nand_scan_ident(mtd, 1, NULL);
> +	if (ret) {
> +		dev_err(nfc->dev, "nand_scan_ident for NAND
> failed\n");
> +		return ret;
> +	}
> +	if (chip->onfi_version) {
> +		anand_chip->raddr_cycles =3D
> chip->onfi_params.addr_cycles & 0xf;
> +		anand_chip->caddr_cycles =3D
> +				(chip->onfi_params.addr_cycles >> 4)
> & 0xf;
> +	} else {
> +		/* For non-ONFI devices, configuring the address
> cyles as 5 */
> +		anand_chip->raddr_cycles =3D 3;
> +		anand_chip->caddr_cycles =3D 2;
> +	}

I think you should remove this block and instead decide how many cycles
you will need depending on "chip->options & NAND_ROW_ADDR_3".

> +
> +	ret =3D anfc_ecc_init(mtd, &chip->ecc);
> +	if (ret)
> +		return ret;
> +

Shouldn't the controller set mtd->name here if empty?

> +	ret =3D nand_scan_tail(mtd);
> +	if (ret) {
> +		dev_err(nfc->dev, "nand_scan_tail for NAND
> failed\n");
> +		return ret;
> +	}
> +
> +	return mtd_device_register(mtd, NULL, 0);
> +}
> +
> +static int anfc_probe(struct platform_device *pdev)
> +{
> +	struct anfc *nfc;
> +	struct anfc_nand_chip *anand_chip;
> +	struct device_node *np =3D pdev->dev.of_node, *child;
> +	struct resource *res;
> +	int err;
> +
> +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	init_waitqueue_head(&nfc->controller.wq);
> +	INIT_LIST_HEAD(&nfc->chips);
> +	init_completion(&nfc->event);
> +	nfc->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, nfc);
> +	nfc->csnum =3D -1;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nfc->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(nfc->base))
> +		return PTR_ERR(nfc->base);
> +	nfc->dma =3D of_property_read_bool(pdev->dev.of_node,
> +					 "arasan,has-mdma");
> +	nfc->irq =3D platform_get_irq(pdev, 0);
> +	if (nfc->irq < 0) {
> +		dev_err(&pdev->dev, "platform_get_irq failed\n");
> +		return -ENXIO;
> +	}
> +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +	err =3D devm_request_irq(&pdev->dev, nfc->irq,
> anfc_irq_handler,
> +			       0, "arasannfc", nfc);
> +	if (err)
> +		return err;
> +	nfc->clk_sys =3D devm_clk_get(&pdev->dev, "sys");
> +	if (IS_ERR(nfc->clk_sys)) {
> +		dev_err(&pdev->dev, "sys clock not found.\n");
> +		return PTR_ERR(nfc->clk_sys);
> +	}
> +
> +	nfc->clk_flash =3D devm_clk_get(&pdev->dev, "flash");
> +	if (IS_ERR(nfc->clk_flash)) {
> +		dev_err(&pdev->dev, "flash clock not found.\n");
> +		return PTR_ERR(nfc->clk_flash);
> +	}
> +
> +	err =3D clk_prepare_enable(nfc->clk_sys);
> +	if (err) {
> +		dev_err(&pdev->dev, "Unable to enable sys clock.\n");
> +		return err;
> +	}
> +
> +	err =3D clk_prepare_enable(nfc->clk_flash);
> +	if (err) {
> +		dev_err(&pdev->dev, "Unable to enable flash
> clock.\n");
> +		goto clk_dis_sys;
> +	}
> +
> +	for_each_available_child_of_node(np, child) {
> +		anand_chip =3D devm_kzalloc(&pdev->dev,
> sizeof(*anand_chip),
> +					  GFP_KERNEL);
> +		if (!anand_chip) {
> +			of_node_put(child);
> +			err =3D -ENOMEM;
> +			goto nandchip_clean_up;
> +		}
> +
> +		err =3D anfc_nand_chip_init(nfc, anand_chip, child);
> +		if (err) {
> +			devm_kfree(&pdev->dev, anand_chip);
> +			continue;
> +		}
> +
> +		list_add_tail(&anand_chip->node, &nfc->chips);
> +	}
> +
> +	return 0;
> +
> +nandchip_clean_up:
> +	list_for_each_entry(anand_chip, &nfc->chips, node)
> +		nand_release(nand_to_mtd(&anand_chip->chip));
> +	clk_disable_unprepare(nfc->clk_flash);
> +clk_dis_sys:
> +	clk_disable_unprepare(nfc->clk_sys);
> +
> +	return err;
> +}
> +
> +static int anfc_remove(struct platform_device *pdev)
> +{
> +	struct anfc *nfc =3D platform_get_drvdata(pdev);
> +	struct anfc_nand_chip *anand_chip;
> +
> +	list_for_each_entry(anand_chip, &nfc->chips, node)
> +		nand_release(nand_to_mtd(&anand_chip->chip));
> +
> +	clk_disable_unprepare(nfc->clk_sys);
> +	clk_disable_unprepare(nfc->clk_flash);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id anfc_ids[] =3D {
> +	{ .compatible =3D "arasan,nfc-v3p10" },
> +	{ .compatible =3D "xlnx,zynqmp-nand" },
> +	{  }
> +};
> +MODULE_DEVICE_TABLE(of, anfc_ids);
> +
> +static struct platform_driver anfc_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.of_match_table =3D anfc_ids,
> +	},
> +	.probe =3D anfc_probe,
> +	.remove =3D anfc_remove,
> +};
> +module_platform_driver(anfc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Xilinx, Inc");
> +MODULE_DESCRIPTION("Arasan NAND Flash Controller Driver");



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
