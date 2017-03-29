Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ct9vP-00089j-T6
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 09:29:58 +0000
Date: Wed, 29 Mar 2017 11:29:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jan Glauber <jglauber@cavium.com>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [RFC PATCH 2/2] nand: cavium: Nand flash controller for Cavium
 ARM64 SOCs
Message-ID: <20170329112932.267b3059@bbrezillon>
In-Reply-To: <20170327160524.29019-3-jglauber@cavium.com>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-3-jglauber@cavium.com>
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

Hi Jan,

This is a preliminary review, I might come up with additional comments
later on.

On Mon, 27 Mar 2017 18:05:24 +0200
Jan Glauber <jglauber@cavium.com> wrote:

> Add a driver for the nand flash controller as found on Cavium's
> ARM64 SOCs.
> 
> The nand flash controller can support up to 8 chips and is presented
> as a PCI device. It uses a DMA engine to transfer data between the nand
> and L2/DRAM and a programmable command queue to issue multiple
> nand flash commands together.
> 
> Signed-off-by: Jan Glauber <jglauber@cavium.com>
> ---
>  drivers/mtd/nand/Kconfig       |    6 +
>  drivers/mtd/nand/Makefile      |    1 +
>  drivers/mtd/nand/cavium_nand.c | 1160 ++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/cavium_nand.h |  231 ++++++++
>  4 files changed, 1398 insertions(+)
>  create mode 100644 drivers/mtd/nand/cavium_nand.c
>  create mode 100644 drivers/mtd/nand/cavium_nand.h
> 

[...]

> +
> +/* default parameters used for probing chips */
> +static int default_onfi_timing = 0;
> +static int default_width = 1; /* 8 bit */
> +static int default_page_size = 2048;
> +static struct ndf_set_tm_par_cmd default_timing_parms;

Hm, I don't think this is a good idea to have default parameters. The
NAND core should provide anything you need in term of NAND chip
detection, so selection the timings, bus width and page size should not
be a problem.

> +
> +/*
> + * Get the number of bits required to encode the column bits. This
> + * does not include bits required for the OOB area.
> + */
> +static int ndf_get_column_bits(struct nand_chip *nand)
> +{
> +	int page_size;
> +
> +	if (!nand)
> +		page_size = default_page_size;
> +	else
> +		page_size = nand->onfi_params.byte_per_page;
> +	return get_bitmask_order(page_size - 1);
> +}

Please drop this helper, the page size is already exposed in
mtd->writesize.

> +
> +irqreturn_t cvm_nfc_isr(int irq, void *dev_id)
> +{
> +	struct cvm_nfc *tn = dev_id;
> +
> +	wake_up(&tn->controller.wq);
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * Read a single byte from the temporary buffer. Used after READID
> + * to get the NAND information and for STATUS.
> + */
> +static u8 cvm_nand_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> +
> +	if (tn->use_status)
> +		return *tn->stat;
> +
> +	if (tn->buf.data_index < tn->buf.data_len)
> +		return tn->buf.dmabuf[tn->buf.data_index++];
> +	else
> +		dev_err(tn->dev, "No data to read\n");
> +
> +	return 0xff;
> +}
> +
> +/*
> + * Read a number of pending bytes from the temporary buffer. Used
> + * to get page and OOB data.
> + */
> +static void cvm_nand_read_buf(struct mtd_info *mtd, u8 *buf, int len)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> +
> +	if (len > tn->buf.data_len - tn->buf.data_index) {
> +		dev_err(tn->dev, "Not enough data for read of %d bytes\n", len);
> +		return;
> +	}
> +
> +	memcpy(buf, tn->buf.dmabuf + tn->buf.data_index, len);
> +	tn->buf.data_index += len;
> +}
> +
> +static void cvm_nand_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> +
> +	memcpy(tn->buf.dmabuf + tn->buf.data_len, buf, len);
> +	tn->buf.data_len += len;
> +}

It seems that cvm_nand_read/write_byte/buf() are returning data that
have already been retrieved (problably during the ->cmdfunc() phase).

That's not how it's supposed to work. The core is expecting the data
transfer to be done when ->read/write_buf() is called. Doing that in
->cmdfunc() is risky, because when you're there you have no clue about
how much bytes the core expect.

[...]

> +static int cvm_nand_set_features(struct mtd_info *mtd,
> +				      struct nand_chip *chip, int feature_addr,
> +				      u8 *subfeature_para)

Do you really need you own implementation of ->set_feature()?

> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> +	int rc;
> +
> +	rc = ndf_build_pre_cmd(tn, NAND_CMD_SET_FEATURES, 1, feature_addr, 0);
> +	if (rc)
> +		return rc;
> +
> +	memcpy(tn->buf.dmabuf, subfeature_para, 4);
> +	memset(tn->buf.dmabuf + 4, 0, 4);
> +
> +	rc = ndf_queue_cmd_write(tn, 8);
> +	if (rc)
> +		return rc;
> +
> +	ndf_setup_dma(tn, 0, tn->buf.dmaaddr, 8);
> +
> +	rc = ndf_wait_for_busy_done(tn);
> +	if (rc)
> +		return rc;
> +
> +	rc = ndf_build_post_cmd(tn);
> +	if (rc)
> +		return rc;
> +	return 0;
> +}
> +

[...]

> +
> +/*
> + * Read a page from NAND. If the buffer has room, the out of band
> + * data will be included.
> + */
> +int ndf_page_read(struct cvm_nfc *tn, u64 addr, int len)
> +{
> +	int rc;
> +
> +	memset(tn->buf.dmabuf, 0xff, len);
> +	rc = ndf_read(tn, NAND_CMD_READ0, 4, addr, NAND_CMD_READSTART, len);
> +	if (rc)
> +		return rc;
> +
> +	return rc;
> +}
> +
> +/* Erase a NAND block */
> +static int ndf_block_erase(struct cvm_nfc *tn, u64 addr)

Ditto.

> +{
> +	struct nand_chip *nand = tn->controller.active;
> +	int row, rc;
> +
> +	row = addr >> ndf_get_column_bits(nand);
> +	rc = ndf_build_pre_cmd(tn, NAND_CMD_ERASE1, 2, row, NAND_CMD_ERASE2);
> +	if (rc)
> +		return rc;
> +
> +	/* Wait for R_B to signal erase is complete  */
> +        rc = ndf_wait_for_busy_done(tn);
> +        if (rc)
> +                return rc;
> +
> +        rc = ndf_build_post_cmd(tn);
> +        if (rc)
> +                return rc;

Use tabs and not spaces for indentation (you can run checkpatch to
identify these coding style issues).

> +
> +        /* Wait until the command queue is idle */
> +	return ndf_wait_idle(tn);
> +}
> +

[...]


> +
> +static void cvm_nand_cmdfunc(struct mtd_info *mtd, unsigned int command,
> +				  int column, int page_addr)

Did you try implementing ->cmd_ctrl() instead of ->cmdfunc(). Your
controller seems to be highly configurable and, at first glance, I think
you can simplify the driver by implementing ->cmd_ctrl() and relying on
the default ->cmdfunc() implementation.

> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct cvm_nand_chip *cvm_nand = to_cvm_nand(nand);
> +	struct cvm_nfc *tn = to_cvm_nfc(nand->controller);
> +	int rc;
> +
> +	tn->selected_chip = cvm_nand->cs;
> +	if (tn->selected_chip < 0 || tn->selected_chip >= NAND_MAX_CHIPS) {
> +		dev_err(tn->dev, "invalid chip select\n");
> +		return;
> +	}
> +
> +	tn->use_status = false;
> +	cvm_nand->oob_access = false;
> +
> +	switch (command) {
> +	case NAND_CMD_READID:
> +		tn->buf.data_index = 0;
> +		memset(tn->buf.dmabuf, 0xff, 8);
> +		rc = ndf_read(tn, command, 1, column, 0, 8);
> +		if (rc < 0)
> +			dev_err(tn->dev, "READID failed with %d\n", rc);
> +		else
> +			tn->buf.data_len = rc;
> +		break;
> +
> +	case NAND_CMD_READOOB:
> +		cvm_nand->oob_access = true;
> +		tn->buf.data_index = 0;
> +		tn->buf.data_len = ndf_page_read(tn,
> +				(page_addr << nand->page_shift) + 0x800,
> +				mtd->oobsize);
> +
> +		if (tn->buf.data_len < mtd->oobsize) {
> +			dev_err(tn->dev, "READOOB failed with %d\n",
> +				tn->buf.data_len);
> +			tn->buf.data_len = 0;
> +		}
> +		break;
> +
> +	case NAND_CMD_READ0:
> +		tn->buf.data_index = 0;
> +		tn->buf.data_len = ndf_page_read(tn,
> +				column + (page_addr << nand->page_shift),
> +				(1 << nand->page_shift) + mtd->oobsize);
> +		if (tn->buf.data_len < (1 << nand->page_shift) + mtd->oobsize) {
> +			dev_err(tn->dev, "READ0 failed with %d\n",
> +				tn->buf.data_len);
> +			tn->buf.data_len = 0;
> +		}
> +		break;
> +
> +	case NAND_CMD_STATUS:
> +		tn->use_status = true;
> +		memset(tn->stat, 0xff, 8);
> +		rc = ndf_read(tn, command, 0, 0, 0, 8);
> +		if (rc < 0)
> +			dev_err(tn->dev, "STATUS failed with %d\n", rc);
> +		break;
> +
> +	case NAND_CMD_RESET:
> +		tn->buf.data_index = 0;
> +		tn->buf.data_len = 0;
> +		memset(tn->buf.dmabuf, 0xff, tn->buf.dmabuflen);
> +		rc = cvm_nand_reset(tn);
> +		if (rc < 0)
> +			dev_err(tn->dev, "RESET failed with %d\n", rc);
> +                break;
> +
> +	case NAND_CMD_PARAM:
> +		tn->buf.data_index = column;
> +		memset(tn->buf.dmabuf, 0xff, tn->buf.dmabuflen);
> +		rc = ndf_read(tn, command, 1, 0, 0, 2048);
> +		if (rc < 0)
> +			dev_err(tn->dev, "PARAM failed with %d\n", rc);
> +		else
> +			tn->buf.data_len = rc;
> +                break;
> +
> +	case NAND_CMD_RNDOUT:
> +		tn->buf.data_index = column;
> +		break;
> +
> +	case NAND_CMD_ERASE1:
> +		if (ndf_block_erase(tn, page_addr << nand->page_shift))
> +			dev_err(tn->dev, "ERASE1 failed\n");
> +		break;
> +
> +	case NAND_CMD_ERASE2:
> +		/* We do all erase processing in the first command, so ignore
> +		 * this one.
> +		 */
> +		break;
> +
> +	case NAND_CMD_SEQIN:
> +		if (column == mtd->writesize)
> +			cvm_nand->oob_access = true;
> +		tn->buf.data_index = column;
> +		tn->buf.data_len = column;
> +		cvm_nand->selected_page = page_addr;
> +		break;
> +
> +	case NAND_CMD_PAGEPROG:
> +		rc = ndf_page_write(tn,
> +			cvm_nand->selected_page << nand->page_shift);
> +		if (rc)
> +			dev_err(tn->dev, "PAGEPROG failed with %d\n", rc);
> +		break;
> +
> +	default:
> +		WARN_ON_ONCE(1);
> +		dev_err(tn->dev, "unhandled nand cmd: %x\n", command);
> +	}
> +}
> +
> +static int cvm_nfc_chip_init_timings(struct cvm_nand_chip *chip,
> +					   struct device_node *np)
> +{
> +	const struct nand_sdr_timings *timings;
> +	int ret, mode;
> +
> +	mode = onfi_get_async_timing_mode(&chip->nand);
> +	if (mode == ONFI_TIMING_MODE_UNKNOWN) {
> +		mode = chip->nand.onfi_timing_mode_default;
> +	} else {
> +		u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
> +
> +		mode = fls(mode) - 1;
> +		if (mode < 0)
> +			mode = 0;
> +
> +		feature[0] = mode;
> +		ret = chip->nand.onfi_set_features(&chip->nand.mtd, &chip->nand,
> +						ONFI_FEATURE_ADDR_TIMING_MODE,
> +						feature);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	timings = onfi_async_timing_mode_to_sdr_timings(mode);
> +	if (IS_ERR(timings))
> +		return PTR_ERR(timings);
> +
> +	return cvm_nfc_chip_set_timings(chip, timings);
> +}


Please have a look at the ->setup_data_interface() hook [1] instead of
initializing the timings at probe/init time.

[...]

> diff --git a/drivers/mtd/nand/cavium_nand.h b/drivers/mtd/nand/cavium_nand.h
> new file mode 100644
> index 0000000..7030c57
> --- /dev/null
> +++ b/drivers/mtd/nand/cavium_nand.h
> @@ -0,0 +1,231 @@
> +#ifndef _CAVIUM_NAND_H
> +#define _CAVIUM_NAND_H
> +
> +#include <linux/bitops.h>
> +
> +/*
> + * The NDF_CMD queue takes commands between 16 - 128 bit.
> + * All commands must be 16 bit aligned and are little endian.
> + * WAIT_STATUS commands must be 64 bit aligned.
> + * Commands are selected by the 4 bit opcode.
> + *
> + * Available Commands:
> + *
> + * 16 Bit:
> + *   NOP
> + *   WAIT
> + *   BUS_ACQ, BUS_REL
> + *   CHIP_EN, CHIP_DIS
> + *
> + * 32 Bit:
> + *   CLE_CMD
> + *   RD_CMD, RD_EDO_CMD
> + *   WR_CMD
> + *
> + * 64 Bit:
> + *   SET_TM_PAR
> + *
> + * 96 Bit:
> + *   ALE_CMD
> + *
> + * 128 Bit:
> + *   WAIT_STATUS, WAIT_STATUS_ALE
> + */
> +
> +/* NDF Register offsets */
> +#define NDF_CMD			0x0
> +#define NDF_MISC		0x8
> +#define NDF_ECC_CNT		0x10
> +#define NDF_DRBELL		0x30
> +#define NDF_ST_REG		0x38	/* status */
> +#define NDF_INT			0x40
> +#define NDF_INT_W1S		0x48
> +#define NDF_DMA_CFG		0x50
> +#define NDF_DMA_ADR		0x58
> +#define NDF_INT_ENA_W1C		0x60
> +#define NDF_INT_ENA_W1S		0x68
> +
> +/* NDF command opcodes */
> +#define NDF_OP_NOP		0x0
> +#define NDF_OP_SET_TM_PAR	0x1
> +#define NDF_OP_WAIT		0x2
> +#define NDF_OP_CHIP_EN_DIS	0x3
> +#define NDF_OP_CLE_CMD		0x4
> +#define NDF_OP_ALE_CMD		0x5
> +#define NDF_OP_WR_CMD		0x8
> +#define NDF_OP_RD_CMD		0x9
> +#define NDF_OP_RD_EDO_CMD	0xa
> +#define NDF_OP_WAIT_STATUS	0xb	/* same opcode for WAIT_STATUS_ALE */
> +#define NDF_OP_BUS_ACQ_REL	0xf
> +
> +#define NDF_BUS_ACQUIRE		1
> +#define NDF_BUS_RELEASE		0
> +
> +struct ndf_nop_cmd {
> +	u16 opcode	: 4;
> +	u16 nop		: 12;
> +};
> +
> +struct ndf_wait_cmd {
> +	u16 opcode	: 4;
> +	u16 r_b		: 1;	/* wait for one cycle or PBUS_WAIT deassert */
> +	u16		: 3;
> +	u16 wlen	: 3;	/* timing parameter select */
> +	u16		: 5;
> +};
> +
> +struct ndf_bus_cmd {
> +	u16 opcode	: 4;
> +	u16 direction	: 4;	/* 1 = acquire, 0 = release */
> +	u16		: 8;
> +};
> +
> +struct ndf_chip_cmd {
> +	u16 opcode	: 4;
> +	u16 chip	: 3;	/* select chip, 0 = disable */
> +	u16 enable	: 1;	/* 1 = enable, 0 = disable */
> +	u16 bus_width	: 2;	/* 10 = 16 bit, 01 = 8 bit */
> +	u16		: 6;
> +};
> +
> +struct ndf_cle_cmd {
> +	u32 opcode	: 4;
> +	u32		: 4;
> +	u32 cmd_data	: 8;	/* command sent to the PBUS AD pins */
> +	u32 clen1	: 3;	/* time between PBUS CLE and WE asserts */
> +	u32 clen2	: 3;	/* time WE remains asserted */
> +	u32 clen3	: 3;	/* time between WE deassert and CLE */
> +	u32		: 7;
> +};
> +
> +/* RD_EDO_CMD uses the same layout as RD_CMD */
> +struct ndf_rd_cmd {
> +	u32 opcode	: 4;
> +	u32 data	: 16;	/* data bytes */
> +	u32 rlen1	: 3;
> +	u32 rlen2	: 3;
> +	u32 rlen3	: 3;
> +	u32 rlen4	: 3;
> +};
> +
> +struct ndf_wr_cmd {
> +	u32 opcode	: 4;
> +	u32 data	: 16;	/* data bytes */
> +	u32		: 4;
> +	u32 wlen1	: 3;
> +	u32 wlen2	: 3;
> +	u32		: 3;
> +};
> +
> +struct ndf_set_tm_par_cmd {
> +	u64 opcode	: 4;
> +	u64 tim_mult	: 4;	/* multiplier for the seven paramters */
> +	u64 tm_par1	: 8;	/* --> Following are the 7 timing parameters that */
> +	u64 tm_par2	: 8;	/*     specify the number of coprocessor cycles.  */
> +	u64 tm_par3	: 8;	/*     A value of zero means one cycle.		  */
> +	u64 tm_par4	: 8;	/*     All values are scaled by tim_mult	  */
> +	u64 tm_par5	: 8;	/*     using tim_par * (2 ^ tim_mult).		  */
> +	u64 tm_par6	: 8;
> +	u64 tm_par7	: 8;
> +};
> +
> +struct ndf_ale_cmd {
> +	u32 opcode	: 4;
> +	u32		: 4;
> +	u32 adr_byte_num: 4;	/* number of address bytes to be sent */
> +	u32		: 4;
> +	u32 alen1	: 3;
> +	u32 alen2	: 3;
> +	u32 alen3	: 3;
> +	u32 alen4	: 3;
> +	u32		: 4;
> +	u8 adr_byt1;
> +	u8 adr_byt2;
> +	u8 adr_byt3;
> +	u8 adr_byt4;
> +	u8 adr_byt5;
> +	u8 adr_byt6;
> +	u8 adr_byt7;
> +	u8 adr_byt8;
> +};
> +
> +struct ndf_wait_status_cmd {
> +	u32 opcode	: 4;
> +	u32		: 4;
> +	u32 data	: 8;	/* data */
> +	u32 clen1	: 3;
> +	u32 clen2	: 3;
> +	u32 clen3	: 3;
> +	u32		: 8;
> +	u32 ale_ind	: 8;	/* set to 5 to select WAIT_STATUS_ALE command */
> +	u32 adr_byte_num: 4;	/* ALE only: number of address bytes to be sent */
> +	u32		: 4;
> +	u32 alen1	: 3;	/* ALE only */
> +	u32 alen2	: 3;	/* ALE only */
> +	u32 alen3	: 3;	/* ALE only */
> +	u32 alen4	: 3;	/* ALE only */
> +	u32		: 4;
> +	u8 adr_byt[4];		/* ALE only */
> +	u32 nine	: 4;	/* set to 9 */
> +	u32 and_mask	: 8;
> +	u32 comp_byte	: 8;
> +	u32 rlen1	: 3;
> +	u32 rlen2	: 3;
> +	u32 rlen3	: 3;
> +	u32 rlen4	: 3;
> +};
> +
> +union ndf_cmd {
> +	u64 val[2];
> +	union {
> +		struct ndf_nop_cmd		nop;
> +		struct ndf_wait_cmd		wait;
> +		struct ndf_bus_cmd		bus_acq_rel;
> +		struct ndf_chip_cmd		chip_en_dis;
> +		struct ndf_cle_cmd		cle_cmd;
> +		struct ndf_rd_cmd		rd_cmd;
> +		struct ndf_wr_cmd		wr_cmd;
> +		struct ndf_set_tm_par_cmd	set_tm_par;
> +		struct ndf_ale_cmd		ale_cmd;
> +		struct ndf_wait_status_cmd	wait_status;
> +	} u;
> +};

I need some time to process all these information, but your controller
seems to be a complex/highly-configurable beast. That's really
interesting :-).
I'll come up with more comments/question after reviewing more carefully
the command creation logic.

Thanks,

Boris

[1]http://lxr.free-electrons.com/source/include/linux/mtd/nand.h#L854
