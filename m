Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fR15V-00074S-Dk
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 20:00:53 +0000
Date: Thu, 7 Jun 2018 21:59:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <wmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.com>, <honghui.zhang@mediatek.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v9 4/4] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Message-ID: <20180607215949.58e2d15d@xps13>
In-Reply-To: <1528271382-21690-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1528271382-21690-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

Hi Naga,

This is a partial review, enough for this version, see below.

On Wed, 6 Jun 2018 13:19:42 +0530, Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:

> Add driver for arm pl353 static memory controller nand interface with

s/nand/NAND/

> HW ECC support. This controller is used in xilinx zynq soc for interfacing

s/HW/hardware/

> the nand flash memory.
>=20
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v9:
>  - Addressed the below comments given by Miquel
>  - instead of using pl353_nand_write32, use directly writel_relaxed
>  - Fixed check patch warnings
>  - Renamed write_buf/read_buf to write_data_op/read_data_op
>  - use BIT macro instead of 1 << nr
>  - Use NAND_ROW_ADDR_3 flag
>  - Use nand_wait_ready()
>  - Removed swecc functions
>  - Use address cycles as per size, instead of reading it from Parameter p=
age
>  - Instead of writing too many patterns, use optional property
> Changes in v8:
>  - Added exec_op() implementation
>  - Fixed the below v7 review comments
>  - removed mtd_info from pl353_nand_info struct
>  - Corrected ecc layout offsets
>  - Added on-die ecc support
> Changes in v7:
>  - Currently not implemented the memclk rate adjustments. I will
>    look into this later and once the basic driver is accepted.
>  - Fixed GPL licence ident
> Changes in v6:
>  - Fixed the checkpatch.pl reported warnings
>  - Using the address cycles information from the onfi param page
>    earlier it is hardcoded to 5 in driver
> Changes in v5:
>  - Configure the nand timing parameters as per the onfi spec
> Changes in v4:
>  - Updated the driver to sync with pl353_smc driver APIs
> Changes in v3:
>  - implemented the proper error codes
>  - further breakdown this patch to multiple sets
>  - added the controller and driver details to Documentation section
>  - updated the licenece to GPLv2
>  - reorganized the pl353_nand_ecc_init function
> Changes in v2:
>  - use "depends on" rather than "select" option in kconfig
>  - remove unused variable parts
>  - remove dummy helper and use writel_relaxed directly
> ---
>=20
>  drivers/mtd/nand/raw/Kconfig      |    7 +
>  drivers/mtd/nand/raw/Makefile     |    3 +
>  drivers/mtd/nand/raw/pl353_nand.c | 1236 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1246 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/pl353_nand.c
>=20
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 6871ff0..1c5d528 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -530,4 +530,11 @@ config MTD_NAND_MTK
>  	  Enables support for NAND controller on MTK SoCs.
>  	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
> =20
> +config MTD_NAND_PL353
> +	tristate "ARM Pl353 NAND flash driver"
> +	depends on MTD_NAND && ARM
> +	depends on PL353_SMC
> +	help
> +	  Enables support for PrimeCell Static Memory Controller PL353.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 165b7ef..6855a0d 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -56,7 +56,9 @@ obj-$(CONFIG_MTD_NAND_HISI504)	        +=3D hisi504_nan=
d.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+=3D brcmnand/
>  obj-$(CONFIG_MTD_NAND_QCOM)		+=3D qcom_nandc.o
>  obj-$(CONFIG_MTD_NAND_MTK)		+=3D mtk_ecc.o mtk_nand.o
> +obj-$(CONFIG_MTD_NAND_PL353)		+=3D pl353_nand.o
> =20
> +CFLAGS_{nand_base.o} :=3D -DDEBUG

Nope :)

>  nand-objs :=3D nand_base.o nand_bbt.o nand_timings.o nand_ids.o
>  nand-objs +=3D nand_amd.o
>  nand-objs +=3D nand_hynix.o
> @@ -64,3 +66,4 @@ nand-objs +=3D nand_macronix.o
>  nand-objs +=3D nand_micron.o
>  nand-objs +=3D nand_samsung.o
>  nand-objs +=3D nand_toshiba.o
> +

Extra space here

> diff --git a/drivers/mtd/nand/raw/pl353_nand.c b/drivers/mtd/nand/raw/pl3=
53_nand.c
> new file mode 100644
> index 0000000..a880eade
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/pl353_nand.c
> @@ -0,0 +1,1236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ARM PL353 NAND flash controller driver
> + *
> + * Copyright (C) 2017 Xilinx, Inc
> + * Author: Punnaiah chowdary kalluri <punnaiah@xilinx.com>
> + * Author: Naga Sureshkumar Relli <nagasure@xilinx.com>
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/platform_data/pl353-smc.h>
> +
> +#define PL353_NAND_DRIVER_NAME "pl353-nand"
> +
> +/* NAND flash driver defines */
> +#define PL353_NAND_CMD_PHASE	1	/* End command valid in command phase */
> +#define PL353_NAND_DATA_PHASE	2	/* End command valid in data phase */
> +#define PL353_NAND_ECC_SIZE	512	/* Size of data for ECC operation */
> +
> +/* Flash memory controller operating parameters */
> +
> +#define PL353_NAND_ECC_CONFIG	(BIT(4)  |	/* ECC read at end of page */ \
> +				 (0 << 5))	/* No Jumping */
> +
> +/* AXI Address definitions */
> +#define START_CMD_SHIFT		3
> +#define END_CMD_SHIFT		11
> +#define END_CMD_VALID_SHIFT	20
> +#define ADDR_CYCLES_SHIFT	21
> +#define CLEAR_CS_SHIFT		21
> +#define ECC_LAST_SHIFT		10
> +#define COMMAND_PHASE		(0 << 19)
> +#define DATA_PHASE		BIT(19)
> +
> +#define PL353_NAND_ECC_LAST	BIT(ECC_LAST_SHIFT)	/* Set ECC_Last */
> +#define PL353_NAND_CLEAR_CS	BIT(CLEAR_CS_SHIFT)	/* Clear chip select */
> +
> +#define ONDIE_ECC_FEATURE_ADDR	0x90
> +#define PL353_NAND_ECC_BUSY_TIMEOUT	(1 * HZ)
> +#define PL353_NAND_DEV_BUSY_TIMEOUT	(1 * HZ)
> +#define PL353_NAND_LAST_TRANSFER_LENGTH	4
> +
> +struct pl353_nfc_op {
> +	u32 cmnds[4];
> +	u32 thirdrow;
> +	u32 type;
> +	u32 end_cmd;
> +	u32 addrs;
> +	bool wait;
> +	u32 len;
> +	u32 naddrs;
> +	unsigned int data_instr_idx;
> +	const struct nand_op_instr *data_instr;
> +	unsigned int rdy_timeout_ms;
> +	unsigned int rdy_delay_ns;
> +	unsigned int data_delay_ns;
> +	unsigned int cle_ale_delay_ns;
> +	u32 addr5;
> +	u32 addr6;
> +};
> +
> +/**
> + * struct pl353_nand_info - Defines the NAND flash driver instance
> + * @chip:		NAND chip information structure
> + * @nand_base:		Virtual address of the NAND flash device
> + * @end_cmd_pending:	End command is pending
> + * @end_cmd:		End command
> + * @row_addr_cycles:	Row address cycles
> + * @col_addr_cycles:	Column address cycles
> + * @address:		Page address
> + * @cmd_pending:	More command is needed
> + */
> +struct pl353_nand_info {
> +	struct nand_chip chip;
> +	void __iomem *nand_base;
> +	unsigned long end_cmd_pending;
> +	unsigned long end_cmd;
> +	u8 addr_cycles;
> +	u32 address;
> +	u32 cmd_pending;
> +	struct completion complete;
> +};
> +
> +static int pl353_ecc_ooblayout16_ecc(struct mtd_info *mtd, int section,
> +				     struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section >=3D chip->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D (section * chip->ecc.bytes);
> +	oobregion->length =3D chip->ecc.bytes;
> +
> +	return 0;
> +}
> +
> +static int pl353_ecc_ooblayout16_free(struct mtd_info *mtd, int section,
> +				      struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section >=3D chip->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D (section * chip->ecc.bytes) + 8;
> +	oobregion->length =3D 8;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops pl353_ecc_ooblayout16_ops =3D {
> +	.ecc =3D pl353_ecc_ooblayout16_ecc,
> +	.free =3D pl353_ecc_ooblayout16_free,
> +};
> +
> +static int pl353_ecc_ooblayout64_ecc(struct mtd_info *mtd, int section,
> +				     struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section >=3D chip->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D (section * chip->ecc.bytes) + 52;
> +	oobregion->length =3D chip->ecc.bytes;
> +
> +	return 0;
> +}
> +
> +static int pl353_ecc_ooblayout64_free(struct mtd_info *mtd, int section,
> +				      struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	if (section >=3D chip->ecc.steps)
> +		return -ERANGE;
> +
> +	oobregion->offset =3D (section * chip->ecc.bytes) + 2;
> +	oobregion->length =3D 50;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops pl353_ecc_ooblayout64_ops =3D {
> +	.ecc =3D pl353_ecc_ooblayout64_ecc,
> +	.free =3D pl353_ecc_ooblayout64_free,
> +};
> +
> +/* Generic flash bbt decriptors */
> +static u8 bbt_pattern[] =3D { 'B', 'b', 't', '0' };
> +static u8 mirror_pattern[] =3D { '1', 't', 'b', 'B' };
> +
> +static struct nand_bbt_descr bbt_main_descr =3D {
> +	.options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> +		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> +	.offs =3D 4,
> +	.len =3D 4,
> +	.veroffs =3D 20,
> +	.maxblocks =3D 4,
> +	.pattern =3D bbt_pattern
> +};
> +
> +static struct nand_bbt_descr bbt_mirror_descr =3D {
> +	.options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> +		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> +	.offs =3D 4,
> +	.len =3D 4,
> +	.veroffs =3D 20,
> +	.maxblocks =3D 4,
> +	.pattern =3D mirror_pattern
> +};
> +
> +/**
> + * pl353_nand_read_data_op - read chip data into buffer
> + * @chip:	Pointer to the NAND chip info structure
> + * @in:		Pointer to the buffer to store read data
> + * @len:	Number of bytes to read
> + * Return:	Always return zero
> + */
> +static int pl353_nand_read_data_op(struct nand_chip *chip,
> +				   u8 *in,
> +				   unsigned int len)
> +{
> +	int i;
> +
> +	if (IS_ALIGNED((uint32_t)in, sizeof(uint32_t)) &&
> +	    IS_ALIGNED(len, sizeof(uint32_t))) {
> +		u32 *ptr =3D (u32 *)in;
> +
> +		len /=3D 4;
> +		for (i =3D 0; i < len; i++)
> +			ptr[i] =3D readl(chip->IO_ADDR_R);
> +	} else {
> +		for (i =3D 0; i < len; i++)
> +			in[i] =3D readb(chip->IO_ADDR_R);

I'm not sure you need these IO_ADDR_R/W. Better not to use them in a
new driver.

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_write_buf - write buffer to chip
> + * @mtd:	Pointer to the mtd info structure
> + * @buf:	Pointer to the buffer to store write data
> + * @len:	Number of bytes to write
> + */
> +static void pl353_nand_write_data_op(struct mtd_info *mtd, const u8 *buf,
> +				     int len)
> +{
> +	int i;
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +
> +	if (IS_ALIGNED((uint32_t)buf, sizeof(uint32_t)) &&
> +	    IS_ALIGNED(len, sizeof(uint32_t))) {
> +		u32 *ptr =3D (u32 *)buf;
> +
> +		len /=3D 4;
> +		for (i =3D 0; i < len; i++)
> +			writel(ptr[i], chip->IO_ADDR_W);
> +	} else {
> +		for (i =3D 0; i < len; i++)
> +			writeb(buf[i], chip->IO_ADDR_W);
> +	}
> +}
> +
> +/**
> + * pl353_nand_calculate_hwecc - Calculate Hardware ECC
> + * @mtd:	Pointer to the mtd_info structure
> + * @data:	Pointer to the page data
> + * @ecc:	Pointer to the ECC buffer where ECC data needs to be stored
> + *
> + * This function retrieves the Hardware ECC data from the controller and=
 returns
> + * ECC data back to the MTD subsystem.
> + *
> + * Return:	0 on success or error value on failure
> + */
> +static int pl353_nand_calculate_hwecc(struct mtd_info *mtd,
> +				      const u8 *data, u8 *ecc)
> +{
> +	u32 ecc_value, ecc_status;
> +	u8 ecc_reg, ecc_byte;
> +	unsigned long timeout =3D jiffies + PL353_NAND_ECC_BUSY_TIMEOUT;
> +	/* Wait till the ECC operation is complete or timeout */
> +	do {
> +		if (pl353_smc_ecc_is_busy())
> +			cpu_relax();
> +		else
> +			break;
> +	} while (!time_after_eq(jiffies, timeout));
> +
> +	if (time_after_eq(jiffies, timeout)) {
> +		pr_err("%s timed out\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	for (ecc_reg =3D 0; ecc_reg < 4; ecc_reg++) {

So here you hardcode the fact that there are 5 'blocks'. This is NAND
chip dependent, right?

> +		/* Read ECC value for each block */
> +		ecc_value =3D pl353_smc_get_ecc_val(ecc_reg);
> +		ecc_status =3D (ecc_value >> 24) & 0xFF;

Please define all these values.

Make ecc_status a byte if you always need it to be 8-bit. Then you can
drop the & 0xFF.
=20
> +		/* ECC value valid */
> +		if (ecc_status & 0x40) {

Please define this 0x40

> +			for (ecc_byte =3D 0; ecc_byte < 3; ecc_byte++) {
> +				/* Copy ECC bytes to MTD buffer */
> +				*ecc =3D ~ecc_value & 0xFF;

This is not a copy, you invert the bytes, I don't really know why.
Perhaps a comment would be appreciated.

> +				ecc_value =3D ecc_value >> 8;
> +				ecc++;
> +			}
> +		} else {
> +			pr_warn("%s status failed\n", __func__);
> +			return -1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +/**
> + * onehot - onehot function
> + * @value:	Value to check for onehot
> + *
> + * This function checks whether a value is onehot or not.
> + * onehot is if and only if onebit is set.
> + *
> + * Return:	1 if it is onehot else 0
> + */
> +static int onehot(unsigned short value)

Why not returning a boolean?
> +{
> +	return (value & (value - 1)) =3D=3D 0;
> +}
> +
> +/**
> + * pl353_nand_correct_data - ECC correction function
> + * @mtd:	Pointer to the mtd_info structure
> + * @buf:	Pointer to the page data
> + * @read_ecc:	Pointer to the ECC value read from spare data area
> + * @calc_ecc:	Pointer to the calculated ECC value
> + *
> + * This function corrects the ECC single bit errors & detects 2-bit erro=
rs.
> + *
> + * Return:	0 if no ECC errors found
> + *		1 if single bit error found and corrected.
> + *		-1 if multiple ECC errors found.

"multiple uncorrectable ECC errors"

> + */
> +static int pl353_nand_correct_data(struct mtd_info *mtd, unsigned char *=
buf,
> +				   unsigned char *read_ecc,
> +				   unsigned char *calc_ecc)
> +{
> +	unsigned char bit_addr;
> +	unsigned int byte_addr;
> +	unsigned short ecc_odd, ecc_even, read_ecc_lower, read_ecc_upper;
> +	unsigned short calc_ecc_lower, calc_ecc_upper;
> +
> +	read_ecc_lower =3D (read_ecc[0] | (read_ecc[1] << 8)) & 0xfff;
> +	read_ecc_upper =3D ((read_ecc[1] >> 4) | (read_ecc[2] << 4)) & 0xfff;
> +
> +	calc_ecc_lower =3D (calc_ecc[0] | (calc_ecc[1] << 8)) & 0xfff;
> +	calc_ecc_upper =3D ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) & 0xfff;
> +
> +	ecc_odd =3D read_ecc_lower ^ calc_ecc_lower;
> +	ecc_even =3D read_ecc_upper ^ calc_ecc_upper;
> +
> +	/* no error */
> +	if (ecc_odd =3D=3D 0 && ecc_even =3D=3D 0)

you can use "!ecc_odd && !ecc_even"

> +		return 0;
> +
> +	if (ecc_odd =3D=3D (~ecc_even & 0xfff)) {
> +		/* bits [11:3] of error code is byte offset */
> +		byte_addr =3D (ecc_odd >> 3) & 0x1ff;
> +		/* bits [2:0] of error code is bit offset */
> +		bit_addr =3D ecc_odd & 0x7;
> +		/* Toggling error bit */
> +		buf[byte_addr] ^=3D (BIT(bit_addr));
> +		return 1;
> +	}
> +	/* one error in parity */
> +	if (onehot(ecc_odd | ecc_even) =3D=3D 1)
> +		return 1;
> +
> +	/* Uncorrectable error */
> +	return -1;
> +}
> +
> +static int pl353_dev_timeout(struct mtd_info *mtd, struct nand_chip *chi=
p)
> +{
> +	unsigned long timeout =3D jiffies + PL353_NAND_DEV_BUSY_TIMEOUT;
> +
> +	do {
> +		if (chip->dev_ready(mtd))
> +			break;
> +		cpu_relax();
> +	} while (!time_after_eq(jiffies, timeout));
> +
> +	if (time_after_eq(jiffies, timeout)) {
> +		pr_err("%s timed out\n", __func__);
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pl353_prepare_cmd(struct mtd_info *mtd, struct nand_chip *ch=
ip,
> +			      int page, int column, int start_cmd, int end_cmd,
> +			      bool read)
> +{
> +	unsigned long data_phase_addr;
> +	u32 end_cmd_valid =3D 0;
> +	void __iomem *cmd_addr;
> +	unsigned long cmd_phase_addr =3D 0, cmd_data =3D 0;
> +
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +
> +	end_cmd_valid =3D read ? 1 : 0;
> +
> +	cmd_phase_addr =3D (unsigned long __force)xnand->nand_base +
> +			 ((xnand->addr_cycles
> +			 << ADDR_CYCLES_SHIFT) |
> +			 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> +			 (COMMAND_PHASE) |
> +			 (end_cmd << END_CMD_SHIFT) |
> +			 (start_cmd << START_CMD_SHIFT));
> +	cmd_addr =3D (void __iomem * __force)cmd_phase_addr;
> +
> +	/* Get the data phase address */
> +	data_phase_addr =3D (unsigned long __force)xnand->nand_base +
> +			  ((0x0 << CLEAR_CS_SHIFT) |
> +			  (0 << END_CMD_VALID_SHIFT) |
> +			  (DATA_PHASE) |
> +			  (end_cmd << END_CMD_SHIFT) |
> +			  (0x0 << ECC_LAST_SHIFT));
> +
> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +	chip->IO_ADDR_W =3D chip->IO_ADDR_R;
> +	if (chip->options & NAND_BUSWIDTH_16)
> +		column /=3D 2;
> +	cmd_data =3D column;
> +	if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> +		cmd_data |=3D page << 16;
> +		/* Another address cycle for devices > 128MiB */
> +		if (chip->options & NAND_ROW_ADDR_3) {
> +			writel_relaxed(cmd_data, cmd_addr);
> +			cmd_data =3D (page >> 16);
> +		}
> +	} else {
> +		cmd_data |=3D page << 8;
> +	}
> +
> +	writel_relaxed(cmd_data, cmd_addr);
> +}
> +
> +/**
> + * pl353_nand_read_oob - [REPLACEABLE] the most common OOB data read fun=
ction
> + * @mtd:	Pointer to the mtd info structure
> + * @chip:	Pointer to the NAND chip info structure
> + * @page:	Page number to read
> + *
> + * Return:	Always return zero
> + */
> +static int pl353_nand_read_oob(struct mtd_info *mtd, struct nand_chip *c=
hip,
> +			       int page)
> +{
> +	unsigned long data_phase_addr;
> +	u8 *p;
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +
> +	chip->pagebuf =3D -1;
> +	if (mtd->writesize < PL353_NAND_ECC_SIZE)
> +		return 0;
> +
> +	pl353_prepare_cmd(mtd, chip, page, mtd->writesize, NAND_CMD_READ0,
> +			  NAND_CMD_READSTART, 1);
> +
> +	ndelay(100);
> +	pl353_dev_timeout(mtd, chip);
> +
> +	p =3D chip->oob_poi;
> +	pl353_nand_read_data_op(chip, p,
> +				(mtd->oobsize -
> +				PL353_NAND_LAST_TRANSFER_LENGTH));
> +	p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +	pl353_nand_read_data_op(chip, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_write_oob - [REPLACEABLE] the most common OOB data write f=
unction
> + * @mtd:	Pointer to the mtd info structure
> + * @chip:	Pointer to the NAND chip info structure
> + * @page:	Page number to write
> + *
> + * Return:	Zero on success and EIO on failure
> + */
> +static int pl353_nand_write_oob(struct mtd_info *mtd, struct nand_chip *=
chip,
> +				int page)
> +{
> +	const u8 *buf =3D chip->oob_poi;
> +	unsigned long data_phase_addr;
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +	u32 addrcycles =3D 0;
> +
> +	chip->pagebuf =3D -1;
> +	addrcycles =3D xnand->addr_cycles;
> +	pl353_prepare_cmd(mtd, chip, page, mtd->writesize, NAND_CMD_SEQIN,
> +			  NAND_CMD_PAGEPROG, 0);
> +	ndelay(100);
> +	pl353_nand_write_data_op(mtd, buf,
> +				 (mtd->oobsize -
> +				 PL353_NAND_LAST_TRANSFER_LENGTH));
> +	buf +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +	data_phase_addr +=3D nand_offset;

What you do here is unclear and suspect...

> +	chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +	pl353_nand_write_data_op(mtd, buf, PL353_NAND_LAST_TRANSFER_LENGTH);
> +	nand_wait_ready(mtd);
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_read_page_raw - [Intern] read raw page data without ecc
> + * @mtd:		Pointer to the mtd info structure
> + * @chip:		Pointer to the NAND chip info structure
> + * @buf:		Pointer to the data buffer
> + * @oob_required:	Caller requires OOB data read to chip->oob_poi
> + * @page:		Page number to read
> + *
> + * Return:	Always return zero
> + */
> +static int pl353_nand_read_page_raw(struct mtd_info *mtd,
> +				    struct nand_chip *chip,
> +				    u8 *buf, int oob_required, int page)
> +{
> +	unsigned long data_phase_addr;
> +	u8 *p;
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +
> +	pl353_nand_read_data_op(chip, buf, mtd->writesize);
> +	p =3D chip->oob_poi;
> +	pl353_nand_read_data_op(chip, p,
> +				(mtd->oobsize -
> +				PL353_NAND_LAST_TRANSFER_LENGTH));
> +	p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +	pl353_nand_read_data_op(chip, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_write_page_raw - [Intern] raw page write function
> + * @mtd:		Pointer to the mtd info structure
> + * @chip:		Pointer to the NAND chip info structure
> + * @buf:		Pointer to the data buffer
> + * @oob_required:	Caller requires OOB data read to chip->oob_poi
> + * @page:		Page number to write
> + *
> + * Return:	Always return zero
> + */
> +static int pl353_nand_write_page_raw(struct mtd_info *mtd,
> +				     struct nand_chip *chip,
> +				     const u8 *buf, int oob_required,
> +				     int page)
> +{
> +	unsigned long data_phase_addr;
> +	u8 *p;
> +
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +
> +	pl353_nand_write_data_op(mtd, buf, mtd->writesize);
> +	p =3D chip->oob_poi;
> +	pl353_nand_write_data_op(mtd, p,
> +				 (mtd->oobsize -
> +				 PL353_NAND_LAST_TRANSFER_LENGTH));
> +	p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +
> +	pl353_nand_write_data_op(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +	ndelay(100);
> +	nand_wait_ready(mtd);
> +	return 0;
> +}
> +
> +/**
> + * nand_write_page_hwecc - Hardware ECC based page write function
> + * @mtd:		Pointer to the mtd info structure
> + * @chip:		Pointer to the NAND chip info structure
> + * @buf:		Pointer to the data buffer
> + * @oob_required:	Caller requires OOB data read to chip->oob_poi
> + * @page:		Page number to write
> + *
> + * This functions writes data and hardware generated ECC values in to th=
e page.
> + *
> + * Return:	Always return zero
> + */
> +static int pl353_nand_write_page_hwecc(struct mtd_info *mtd,
> +				       struct nand_chip *chip,
> +				       const u8 *buf, int oob_required,
> +				       int page)
> +{
> +	int eccsize =3D chip->ecc.size;
> +	int eccsteps =3D chip->ecc.steps;
> +	u8 *ecc_calc =3D chip->ecc.calc_buf;
> +	u8 *oob_ptr;
> +	const u8 *p =3D buf;
> +	u32 ret;
> +	unsigned long data_phase_addr;
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +
> +	pl353_prepare_cmd(mtd, chip, page, 0, NAND_CMD_SEQIN,
> +			  NAND_CMD_PAGEPROG, 0);
> +	ndelay(100);
> +	for ( ; (eccsteps - 1); eccsteps--) {
> +		pl353_nand_write_data_op(mtd, p, eccsize);
> +		p +=3D eccsize;
> +	}
> +	pl353_nand_write_data_op(mtd, p,
> +				 (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH));
> +	p +=3D (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	/* Set ECC Last bit to 1 */
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_ECC_LAST;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +	pl353_nand_write_data_op(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	p =3D buf;
> +	chip->ecc.calculate(mtd, p, &ecc_calc[0]);
> +
> +	/* Wait for ECC to be calculated and read the error values */
> +	ret =3D mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi,
> +					 0, chip->ecc.total);
> +	if (ret)
> +		return ret;

Space

> +	/* Clear ECC last bit */
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr &=3D ~PL353_NAND_ECC_LAST;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +
> +	/* Write the spare area with ECC bytes */
> +	oob_ptr =3D chip->oob_poi;
> +	pl353_nand_write_data_op(mtd, oob_ptr,
> +				 (mtd->oobsize -
> +				 PL353_NAND_LAST_TRANSFER_LENGTH));
> +
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +	oob_ptr +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +	pl353_nand_write_data_op(mtd, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	/*
> +	 * Apply this short delay always to ensure that we do wait tWB in any
> +	 * case on any machine.
> +	 */
> +	ndelay(100);
> +	nand_wait_ready(mtd);
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_read_page_hwecc - Hardware ECC based page read function
> + * @mtd:		Pointer to the mtd info structure
> + * @chip:		Pointer to the NAND chip info structure
> + * @buf:		Pointer to the buffer to store read data
> + * @oob_required:	Caller requires OOB data read to chip->oob_poi
> + * @page:		Page number to read
> + *
> + * This functions reads data and checks the data integrity by comparing =
hardware
> + * generated ECC values and read ECC values from spare area.
> + *
> + * Return:	0 always and updates ECC operation status in to MTD structure
> + */
> +static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
> +				      struct nand_chip *chip,
> +				      u8 *buf, int oob_required, int page)
> +{
> +	int i, stat, eccsize =3D chip->ecc.size;
> +	int eccbytes =3D chip->ecc.bytes;
> +	int eccsteps =3D chip->ecc.steps;
> +	u8 *p =3D buf;
> +	u8 *ecc_calc =3D chip->ecc.calc_buf;
> +	u8 *ecc =3D chip->ecc.code_buf;
> +	unsigned int max_bitflips =3D 0;
> +	u8 *oob_ptr;
> +	u32 ret;
> +	unsigned long data_phase_addr;
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	unsigned long nand_offset =3D (unsigned long __force)xnand->nand_base;
> +
> +	pl353_prepare_cmd(mtd, chip, page, 0, NAND_CMD_READ0,
> +			  NAND_CMD_READSTART, 1);
> +	ndelay(100);
> +	pl353_dev_timeout(mtd, chip);
> +
> +	for ( ; (eccsteps - 1); eccsteps--) {
> +		pl353_nand_read_data_op(chip, p, eccsize);
> +		p +=3D eccsize;
> +	}
> +	pl353_nand_read_data_op(chip, p,
> +				(eccsize - PL353_NAND_LAST_TRANSFER_LENGTH));
> +	p +=3D (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	/* Set ECC Last bit to 1 */
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_ECC_LAST;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +	pl353_nand_read_data_op(chip, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	/* Read the calculated ECC value */
> +	p =3D buf;
> +	chip->ecc.calculate(mtd, p, &ecc_calc[0]);
> +
> +	/* Clear ECC last bit */
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr &=3D ~PL353_NAND_ECC_LAST;
> +	data_phase_addr +=3D nand_offset;
> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +	/* Read the stored ECC value */
> +	oob_ptr =3D chip->oob_poi;
> +	pl353_nand_read_data_op(chip, oob_ptr,
> +				(mtd->oobsize -
> +				PL353_NAND_LAST_TRANSFER_LENGTH));
> +
> +	/* de-assert chip select */
> +	data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +	data_phase_addr -=3D nand_offset;
> +	data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +	data_phase_addr +=3D nand_offset;

Ok, now I am convinced this is not the right way. Please forget about
chip->IO_ADDR_*.

> +	chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +	oob_ptr +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +	pl353_nand_read_data_op(chip, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +	ret =3D mtd_ooblayout_get_eccbytes(mtd, ecc, chip->oob_poi, 0,
> +					 chip->ecc.total);
> +	if (ret)
> +		return ret;
> +
> +	eccsteps =3D chip->ecc.steps;
> +	p =3D buf;
> +
> +	/* Check ECC error for all blocks and correct if it is correctable */
> +	for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize) {
> +		stat =3D chip->ecc.correct(mtd, p, &ecc[i], &ecc_calc[i]);
> +		if (stat < 0) {
> +			mtd->ecc_stats.failed++;
> +		} else {
> +			mtd->ecc_stats.corrected +=3D stat;
> +			max_bitflips =3D max_t(unsigned int, max_bitflips, stat);
> +		}
> +	}
> +
> +	return max_bitflips;
> +}
> +
> +/**
> + * pl353_nand_select_chip - Select the flash device
> + * @mtd:	Pointer to the mtd info structure
> + * @chip:	Pointer to the NAND chip info structure
> + *
> + * This function is empty as the NAND controller handles chip select line
> + * internally based on the chip address passed in command and data phase.
> + */
> +static void pl353_nand_select_chip(struct mtd_info *mtd, int chip)
> +{
> +}
> +
> +/* NAND framework ->exec_op() hooks and related helpers */
> +static void pl353_nfc_parse_instructions(struct nand_chip *chip,
> +					 const struct nand_subop *subop,
> +					 struct pl353_nfc_op *nfc_op)
> +{
> +	const struct nand_op_instr *instr =3D NULL;
> +	unsigned int op_id, offset, naddrs;
> +	int i, len;
> +	const u8 *addrs;
> +
> +	memset(nfc_op, 0, sizeof(struct pl353_nfc_op));
> +	for (op_id =3D 0; op_id < subop->ninstrs; op_id++) {
> +		nfc_op->len =3D nand_subop_get_data_len(subop, op_id);
> +		len =3D nand_subop_get_data_len(subop, op_id);
> +		instr =3D &subop->instrs[op_id];
> +		if (subop->ninstrs =3D=3D 1)
> +			nfc_op->cmnds[0] =3D -1;
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			nfc_op->type =3D NAND_OP_CMD_INSTR;
> +			if (op_id)
> +				nfc_op->cmnds[1] =3D instr->ctx.cmd.opcode;
> +			else
> +				nfc_op->cmnds[0] =3D instr->ctx.cmd.opcode;
> +			nfc_op->cle_ale_delay_ns =3D instr->delay_ns;
> +			break;
> +
> +		case NAND_OP_ADDR_INSTR:
> +			offset =3D nand_subop_get_addr_start_off(subop, op_id);
> +			naddrs =3D nand_subop_get_num_addr_cyc(subop, op_id);
> +			addrs =3D &instr->ctx.addr.addrs[offset];
> +			nfc_op->addrs =3D instr->ctx.addr.addrs[offset];
> +			for (i =3D 0; i < min_t(unsigned int, 4, naddrs); i++) {
> +				nfc_op->addrs |=3D instr->ctx.addr.addrs[i] <<
> +						 (8 * i);
> +			}
> +
> +			if (naddrs >=3D 5)
> +				nfc_op->addr5 =3D addrs[4];
> +			if (naddrs >=3D 6)
> +				nfc_op->addr6 =3D addrs[5];
> +			nfc_op->naddrs =3D nand_subop_get_num_addr_cyc(subop,
> +								     op_id);
> +			nfc_op->cle_ale_delay_ns =3D instr->delay_ns;
> +			break;
> +
> +		case NAND_OP_DATA_IN_INSTR:
> +			nfc_op->data_instr =3D instr;
> +			nfc_op->type =3D NAND_OP_DATA_IN_INSTR;
> +			nfc_op->data_instr_idx =3D op_id;
> +			nfc_op->data_delay_ns =3D instr->delay_ns;
> +			break;
> +
> +		case NAND_OP_DATA_OUT_INSTR:
> +			nfc_op->data_instr =3D instr;
> +			nfc_op->type =3D NAND_OP_DATA_IN_INSTR;
> +			nfc_op->data_instr_idx =3D op_id;
> +			nfc_op->data_delay_ns =3D instr->delay_ns;
> +			break;
> +
> +		case NAND_OP_WAITRDY_INSTR:
> +			nfc_op->rdy_timeout_ms =3D instr->ctx.waitrdy.timeout_ms;
> +			nfc_op->rdy_delay_ns =3D instr->delay_ns;
> +			nfc_op->wait =3D true;
> +			break;
> +		}
> +	}
> +}
> +
> +static void cond_delay(unsigned int ns)
> +{
> +	if (!ns)
> +		return;
> +
> +	if (ns < 10000)
> +		ndelay(ns);
> +	else
> +		udelay(DIV_ROUND_UP(ns, 1000));
> +}
> +
> +/**
> + * pl353_nand_cmd_function - Send command to NAND device
> + * @chip:	Pointer to the NAND chip info structure
> + * @subop:	Pointer to array of instructions
> + * Return:	Always return zero
> + */
> +static int pl353_nand_cmd_function(struct nand_chip *chip,
> +				   const struct nand_subop *subop)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	const struct nand_op_instr *instr;
> +	struct pl353_nfc_op nfc_op =3D {};
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +	void __iomem *cmd_addr;
> +	unsigned long cmd_data =3D 0, end_cmd_valid =3D 0;
> +	unsigned long cmd_phase_addr, data_phase_addr, end_cmd;
> +	unsigned int op_id, len, offset;
> +	bool reading;
> +
> +	pl353_nfc_parse_instructions(chip, subop, &nfc_op);
> +	instr =3D nfc_op.data_instr;
> +	op_id =3D nfc_op.data_instr_idx;
> +	len =3D nand_subop_get_data_len(subop, op_id);
> +	offset =3D nand_subop_get_data_start_off(subop, op_id);
> +
> +	if (nfc_op.cmnds[0] !=3D -1) {
> +		pl353_smc_clr_nand_int();
> +		/* Get the command phase address */
> +		if (nfc_op.cmnds[1] !=3D 0) {
> +			if (nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN)
> +				end_cmd_valid =3D 0;
> +			else
> +				end_cmd_valid =3D 1;
> +			end_cmd =3D nfc_op.cmnds[1];
> +		}  else {
> +			end_cmd =3D 0x0;
> +		}
> +		cmd_phase_addr =3D (unsigned long __force)xnand->nand_base +
> +				 ((nfc_op.naddrs << ADDR_CYCLES_SHIFT) |
> +				 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> +				 (COMMAND_PHASE) |
> +				 (end_cmd << END_CMD_SHIFT) |
> +				 (nfc_op.cmnds[0] << START_CMD_SHIFT));
> +
> +		cmd_addr =3D (void __iomem * __force)cmd_phase_addr;
> +		/* Get the data phase address */
> +		end_cmd_valid =3D 0;
> +
> +		data_phase_addr =3D (unsigned long __force)xnand->nand_base +
> +				  ((0x0 << CLEAR_CS_SHIFT) |
> +				  (end_cmd_valid << END_CMD_VALID_SHIFT) |
> +				  (DATA_PHASE) |
> +				  (end_cmd << END_CMD_SHIFT) |
> +				  (0x0 << ECC_LAST_SHIFT));
> +		chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +		chip->IO_ADDR_W =3D chip->IO_ADDR_R;
> +		/* Command phase AXI Read & Write */
> +		if (nfc_op.naddrs >=3D 5) {
> +			if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> +				cmd_data =3D nfc_op.addrs;
> +				/* Another address cycle for devices > 128MiB */
> +				if (chip->options & NAND_ROW_ADDR_3) {
> +					writel_relaxed(cmd_data, cmd_addr);
> +					cmd_data =3D nfc_op.addr5;
> +					if (nfc_op.naddrs >=3D 6)
> +						cmd_data |=3D (nfc_op.addr6 << 8);
> +				}
> +			}
> +		}  else {
> +			if (nfc_op.addrs !=3D -1) {
> +				int column =3D nfc_op.addrs;
> +				/*
> +				 * Change read/write column, read id etc
> +				 * Adjust columns for 16 bit bus width
> +				 */
> +				if ((chip->options & NAND_BUSWIDTH_16) &&
> +				    (nfc_op.cmnds[0] =3D=3D NAND_CMD_READ0 ||
> +					nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN ||
> +					nfc_op.cmnds[0] =3D=3D NAND_CMD_RNDOUT ||
> +					nfc_op.cmnds[0] =3D=3D NAND_CMD_RNDIN)) {
> +					column >>=3D 1;
> +				}
> +				cmd_data =3D column;
> +			}
> +		}
> +		writel_relaxed(cmd_data, cmd_addr);
> +	ndelay(100);
> +	}
> +
> +	cond_delay(nfc_op.cle_ale_delay_ns);
> +	if (!nfc_op.data_instr)
> +		return 0;
> +
> +	reading =3D (nfc_op.data_instr->type =3D=3D NAND_OP_DATA_IN_INSTR);
> +	udelay(1000);

What is this delay ?

> +
> +	if (!reading) {
> +		cond_delay(nfc_op.rdy_delay_ns);
> +
> +		if (nfc_op.cmnds[0] =3D=3D NAND_CMD_SEQIN &&
> +		    nfc_op.cmnds[1] =3D=3D NAND_CMD_PAGEPROG) {
> +			pl353_nand_write_page_raw(mtd, chip,
> +						  instr->ctx.data.buf.out, 0,
> +						  nfc_op.addrs);
> +		} else {
> +			pl353_nand_write_data_op(mtd, instr->ctx.data.buf.out,
> +						 len);
> +		}
> +	}
> +
> +	else if (reading) {
> +		cond_delay(nfc_op.rdy_delay_ns);
> +		pl353_nand_read_data_op(chip, instr->ctx.data.buf.in, len);
> +	}
> +	cond_delay(nfc_op.data_delay_ns);
> +
> +	return 0;
> +}
> +
> +static const struct nand_op_parser pl353_nfc_op_parser =3D NAND_OP_PARSER
> +	(NAND_OP_PARSER_PATTERN
> +		(pl353_nand_cmd_function,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 7),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 2048)),
> +	NAND_OP_PARSER_PATTERN
> +		(pl353_nand_cmd_function,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, 7),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 2048)),
> +	NAND_OP_PARSER_PATTERN
> +		(pl353_nand_cmd_function,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 7),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN
> +		(pl353_nand_cmd_function,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, 8),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 2048),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +	NAND_OP_PARSER_PATTERN
> +		(pl353_nand_cmd_function,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false)),
> +	);
> +
> +static int pl353_nfc_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)
> +{
> +	return nand_op_parser_exec_op(chip, &pl353_nfc_op_parser,
> +					      op, check_only);
> +}
> +
> +/**
> + * pl353_nand_device_ready - Check device ready/busy line
> + * @mtd:	Pointer to the mtd_info structure
> + *
> + * Return:	0 on busy or 1 on ready state
> + */
> +static int pl353_nand_device_ready(struct mtd_info *mtd)
> +{
> +	if (pl353_smc_get_nand_int_status_raw()) {
> +		pl353_smc_clr_nand_int();

A clear is really needed here?

> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_ecc_init - Initialize the ecc information as per the ecc m=
ode
> + * @mtd:	Pointer to the mtd_info structure
> + * @ecc:	Pointer to ECC control structure
> + * @ecc_mode:	ondie ecc status
> + *
> + * This function initializes the ecc block and functional pointers as pe=
r the
> + * ecc mode
> + */
> +static void pl353_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ct=
rl *ecc,
> +				int ecc_mode)
> +{
> +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> +	struct pl353_nand_info *xnand =3D
> +		container_of(chip, struct pl353_nand_info, chip);
> +
> +
> +	if (ecc_mode =3D=3D NAND_ECC_ON_DIE) {
> +		pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_BYPASS);
> +		/*
> +		 * On-Die ECC spare bytes offset 8 is used for ECC codes
> +		 * Use the BBT pattern descriptors
> +		 */
> +		chip->bbt_td =3D &bbt_main_descr;
> +		chip->bbt_md =3D &bbt_mirror_descr;
> +		bitmap_set(chip->parameters.get_feature_list,
> +			   ONFI_FEATURE_ON_DIE_ECC, ONFI_FEATURE_ON_DIE_ECC_EN);
> +		bitmap_set(chip->parameters.set_feature_list,
> +			   ONFI_FEATURE_ON_DIE_ECC, ONFI_FEATURE_ON_DIE_ECC_EN);
> +	} else {
> +		ecc->read_oob =3D pl353_nand_read_oob;
> +		ecc->write_oob =3D pl353_nand_write_oob;
> +
> +		ecc->mode =3D NAND_ECC_HW;
> +		/* Hardware ECC generates 3 bytes ECC code for each 512 bytes */
> +		ecc->bytes =3D 3;
> +		ecc->strength =3D 1;
> +		ecc->calculate =3D pl353_nand_calculate_hwecc;

I'm not sure you need this calculate()...

> +		ecc->correct =3D pl353_nand_correct_data;
> +		ecc->hwctl =3D NULL;

You can drop the line.

> +		ecc->read_page =3D pl353_nand_read_page_hwecc;
> +		ecc->size =3D PL353_NAND_ECC_SIZE;
> +		ecc->write_page =3D pl353_nand_write_page_hwecc;
> +		pl353_smc_set_ecc_pg_size(mtd->writesize);
> +		switch (mtd->writesize) {
> +		case SZ_512:
> +		case SZ_1K:
> +		case SZ_2K:
> +			pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_APB);
> +			break;
> +		default:
> +			/*
> +			 * The software ECC routines won't work with the
> +			 * SMC controller
> +			 */
> +			ecc->calculate =3D nand_calculate_ecc;
> +			ecc->correct =3D nand_correct_data;
> +			ecc->size =3D 256;
> +			break;
> +		}
> +		if (mtd->writesize <=3D SZ_512)
> +			xnand->addr_cycles =3D 1;
> +		else
> +			xnand->addr_cycles =3D 2;
> +
> +		if (chip->options & NAND_ROW_ADDR_3)
> +			xnand->addr_cycles +=3D 3;
> +		else
> +			xnand->addr_cycles +=3D 2;
> +
> +		if (mtd->oobsize =3D=3D 16)
> +			mtd_set_ooblayout(mtd, &pl353_ecc_ooblayout16_ops);
> +		else if (mtd->oobsize =3D=3D 64)
> +			mtd_set_ooblayout(mtd, &pl353_ecc_ooblayout64_ops);

else?

> +	}
> +}
> +
> +/**
> + * pl353_nand_probe - Probe method for the NAND driver
> + * @pdev:	Pointer to the platform_device structure
> + *
> + * This function initializes the driver data structures and the hardware.
> + *
> + * Return:	0 on success or error value on failure
> + */
> +static int pl353_nand_probe(struct platform_device *pdev)
> +{
> +	struct pl353_nand_info *xnand;

xnand is a strange name, more and more because its a bout NAND
controller data, not NAND chip.

> +	struct mtd_info *mtd;
> +	struct nand_chip *nand_chip;

This one you can call it just "nand" or "chip".

> +	struct resource *res;
> +
> +	xnand =3D devm_kzalloc(&pdev->dev, sizeof(*xnand), GFP_KERNEL);
> +	if (!xnand)
> +		return -ENOMEM;
> +
> +	/* Map physical address of NAND flash */
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	xnand->nand_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(xnand->nand_base))
> +		return PTR_ERR(xnand->nand_base);
> +
> +	nand_chip =3D &xnand->chip;
> +	mtd =3D nand_to_mtd(nand_chip);
> +	nand_chip->exec_op =3D pl353_nfc_exec_op;
> +	nand_set_controller_data(nand_chip, xnand);
> +	mtd->priv =3D nand_chip;
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->name =3D PL353_NAND_DRIVER_NAME;

A label property in the DT might overwrite this value.

> +	nand_set_flash_node(nand_chip, pdev->dev.of_node);
> +
> +	/* Set address of NAND IO lines */
> +	nand_chip->IO_ADDR_R =3D xnand->nand_base;
> +	nand_chip->IO_ADDR_W =3D xnand->nand_base;
> +	/* Set the driver entry points for MTD */
> +	nand_chip->dev_ready =3D pl353_nand_device_ready;
> +	nand_chip->select_chip =3D pl353_nand_select_chip;
> +	/* If we don't set this delay driver sets 20us by default */
> +	nand_chip->chip_delay =3D 30;

And why 30 is better?

I suppose you mean the core, not the driver. The driver is this file.

> +
> +	/* Set the device option and flash width */
> +	nand_chip->options =3D NAND_BUSWIDTH_AUTO;
> +	nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
> +	platform_set_drvdata(pdev, xnand);
> +
> +	/* first scan to find the device and get the page size */
> +	if (nand_scan_ident(mtd, 1, NULL)) {
> +		dev_err(&pdev->dev, "nand_scan_ident for NAND failed\n");
> +		return -ENXIO;
> +	}
> +	pl353_nand_ecc_init(mtd, &nand_chip->ecc, nand_chip->ecc.mode);
> +	if (nand_chip->options & NAND_BUSWIDTH_16)
> +		pl353_smc_set_buswidth(PL353_SMC_MEM_WIDTH_16);
> +	/* second phase scan */
> +	if (nand_scan_tail(mtd)) {
> +		dev_err(&pdev->dev, "nand_scan_tail for NAND failed\n");
> +		return -ENXIO;
> +	}
> +
> +	mtd_device_register(mtd, NULL, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * pl353_nand_remove - Remove method for the NAND driver
> + * @pdev:	Pointer to the platform_device structure
> + *
> + * This function is called if the driver module is being unloaded. It fr=
ees all
> + * resources allocated to the device.
> + *
> + * Return:	0 on success or error value on failure
> + */
> +static int pl353_nand_remove(struct platform_device *pdev)
> +{
> +	struct pl353_nand_info *xnand =3D platform_get_drvdata(pdev);
> +	struct mtd_info *mtd =3D nand_to_mtd(&xnand->chip);
> +
> +	/* Release resources, unregister device */
> +	nand_release(mtd);
> +
> +	return 0;
> +}
> +
> +/* Match table for device tree binding */
> +static const struct of_device_id pl353_nand_of_match[] =3D {
> +	{ .compatible =3D "arm,pl353-nand-r2p1" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, pl353_nand_of_match);
> +
> +/*
> + * pl353_nand_driver - This structure defines the NAND subsystem platfor=
m driver
> + */
> +static struct platform_driver pl353_nand_driver =3D {
> +	.probe		=3D pl353_nand_probe,
> +	.remove		=3D pl353_nand_remove,
> +	.driver		=3D {
> +		.name	=3D PL353_NAND_DRIVER_NAME,
> +		.of_match_table =3D pl353_nand_of_match,
> +	},
> +};
> +
> +module_platform_driver(pl353_nand_driver);
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_ALIAS("platform:" PL353_NAND_DRIVER_NAME);
> +MODULE_DESCRIPTION("ARM PL353 NAND Flash Driver");
> +MODULE_LICENSE("GPL");

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
