Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJwb6-0003ik-Iq
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 04:34:39 +0000
Message-ID: <55B7063F.9090102@codeaurora.org>
Date: Tue, 28 Jul 2015 10:04:07 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, agross@codeaurora.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v2 2/5] mtd: nand: Qualcomm NAND controller driver
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-3-git-send-email-architt@codeaurora.org>
 <55B2DDA3.40306@codeaurora.org>
In-Reply-To: <55B2DDA3.40306@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 07/25/2015 06:21 AM, Stephen Boyd wrote:
> On 07/21/2015 03:34 AM, Archit Taneja wrote:
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 5b2806a..31951fc 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -538,4 +538,11 @@ config MTD_NAND_HISI504
>>   	help
>>   	  Enables support for NAND controller on Hisilicon SoC Hip04.
>>
>> +config MTD_NAND_QCOM
>> +	tristate "Support for NAND on QCOM SoCs"
>> +	depends on ARCH_QCOM && QCOM_ADM
>
> This is sort of annoying that the menu won't show up unless the ADM
> driver is also enabled (which would be in a completely different area of
> the configurator). Perhaps drop that requirement because it isn't
> required to build?

That makes sense. I'll drop the QCOM_ADM requirement.

>
>> +	help
>> +	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
>> +	  controller. This controller is found on IPQ806x SoC.
>> +
>>   endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
>> new file mode 100644
>> index 0000000..51c284c
>> --- /dev/null
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -0,0 +1,2019 @@
>> +/*
>> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/slab.h>
>> +#include <linux/interrupt.h>
>
> Where is this used?

It isn't. I'll remove it.

>
>> +#include <linux/bitops.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_mtd.h>
>> +#include <linux/delay.h>
>> +
> [..]
>> +/*
>> + * the NAND controller performs reads/writes with ECC in 516 byte chunks.
>> + * the driver calls the chunks 'step' or 'codeword' interchangeably
>> + */
>> +#define NANDC_STEP_SIZE			512
>> +
>> +/*
>> + * the largest page size we support is 8K, this will have 16 steps/codewords
>> + * of 512 bytes each
>> + */
>> +#define	MAX_NUM_STEPS			(SZ_8K / NANDC_STEP_SIZE)
>> +
>> +/* we read at most 3 registers per codeword scan */
>> +#define MAX_REG_RD			(3 * MAX_NUM_STEPS)
>> +
>> +/* ECC modes */
>> +#define ECC_NONE	BIT(0)
>> +#define ECC_RS_4BIT	BIT(1)
>> +#define	ECC_BCH_4BIT	BIT(2)
>> +#define	ECC_BCH_8BIT	BIT(3)
>> +
>> +struct desc_info {
>> +	struct list_head list;
>> +
>> +	enum dma_transfer_direction dir;
>> +	struct scatterlist sgl;
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +};
>> +
>> +/*
>> + * holds the current register values that we want to write. acts as a contiguous
>> + * chunk of memory which we use to write the controller registers through DMA.
>> + */
>> +struct nandc_regs {
>> +	u32 cmd;
>> +	u32 addr0;
>> +	u32 addr1;
>> +	u32 chip_sel;
>> +	u32 exec;
>> +
>> +	u32 cfg0;
>> +	u32 cfg1;
>> +	u32 ecc_bch_cfg;
>> +
>> +	u32 clrflashstatus;
>> +	u32 clrreadstatus;
>> +
>> +	u32 cmd1;
>> +	u32 vld;
>> +
>> +	u32 orig_cmd1;
>> +	u32 orig_vld;
>> +
>> +	u32 ecc_buf_cfg;
>> +};
>> +
>> +/*
>> + * @cmd_crci:			ADM DMA CRCI for command flow control
>> + * @data_crci:			ADM DMA CRCI for data flow control
>> + * @list:			DMA descriptor list (list of desc_infos)
>> + * @dma_done:			completion param to denote end of last
>> + *				descriptor in the list
>> + * @data_buffer:		our local DMA buffer for page read/writes,
>> + *				used when we can't use the buffer provided
>> + *				by upper layers directly
>> + * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
>> + * @reg_read_buf:		buffer for reading register data via DMA
>> + * @reg_read_pos:		marker for data read in reg_read_buf
>> + * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
>> + *				ecc/non-ecc mode for the current nand flash
>> + *				device
>> + * @regs:			a contiguous chunk of memory for DMA register
>> + *				writes
>> + * @ecc_strength:		4 bit or 8 bit ecc, received via DT
>> + * @bus_width:			8 bit or 16 bit NAND bus width, received via DT
>> + * @ecc_modes:			supported ECC modes by the current controller,
>> + *				initialized via DT match data
>> + * @cw_size:			the number of bytes in a single step/codeword
>> + *				of a page, consisting of all data, ecc, spare
>> + *				and reserved bytes
>> + * @cw_data:			the number of bytes within a codeword protected
>> + *				by ECC
>> + * @bch_enabled:		flag to tell whether BCH or RS ECC mode is used
>> + * @status:			value to be returned if NAND_CMD_STATUS command
>> + *				is executed
>> + */
>> +struct qcom_nandc_data {
>> +	struct platform_device *pdev;
>> +	struct device *dev;
>> +
>> +	void __iomem *base;
>> +	struct resource *res;
>> +
>> +	struct clk *core_clk;
>> +	struct clk *aon_clk;
>> +
>> +	/* DMA stuff */
>> +	struct dma_chan *chan;
>> +	struct dma_slave_config	slave_conf;
>> +	unsigned int cmd_crci;
>> +	unsigned int data_crci;
>> +	struct list_head list;
>> +	struct completion dma_done;
>> +
>> +	/* MTD stuff */
>> +	struct nand_chip chip;
>> +	struct mtd_info mtd;
>> +
>> +	/* local data buffer and markers */
>> +	u8		*data_buffer;
>> +	int		buf_size;
>> +	int		buf_count;
>> +	int		buf_start;
>> +
>> +	/* local buffer to read back registers */
>> +	u32 *reg_read_buf;
>> +	dma_addr_t reg_read_paddr;
>
> Is this used?

No, it isn't. It's a leftover from when I used dma_alloc_coherent for
this buffer. Will remove it.

>
>> +	int reg_read_pos;
>> +
>> +	/* required configs */
>> +	u32 cfg0, cfg1;
>> +	u32 cfg0_raw, cfg1_raw;
>> +	u32 ecc_buf_cfg;
>> +	u32 ecc_bch_cfg;
>> +	u32 clrflashstatus;
>> +	u32 clrreadstatus;
>> +	u32 sflashc_burst_cfg;
>> +	u32 cmd1, vld;
>> +
>> +	/* register state */
>> +	struct nandc_regs *regs;
>> +
>> +	/* things we get from DT */
>> +	int ecc_strength;
>> +	int bus_width;
>> +
>> +	u32 ecc_modes;
>> +
>> +	/* misc params */
>> +	int cw_size;
>> +	int cw_data;
>> +	bool use_ecc;
>> +	bool bch_enabled;
>> +	u8 status;
>> +	int last_command;
>> +};
>> +
>> +static inline unsigned int nandc_read(struct qcom_nandc_data *this, int offset)
>> +{
>> +	return ioread32(this->base + offset);
>> +}
>> +
>> +static inline void nandc_write(struct qcom_nandc_data *this, int offset,
>> +		unsigned int val)
>> +{
>> +	iowrite32(val, this->base + offset);
>> +}
>
> Perhaps these should take and return u32s to match the signature of
> ioread32/iowrite32

I'll fix this.

>
>> +
>> +/* helper to configure address register values */
>> +static void set_address(struct qcom_nandc_data *this, u16 column, int page)
>> +{
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nandc_regs *regs = this->regs;
>> +
>> +	if (chip->options & NAND_BUSWIDTH_16)
>> +		column >>= 1;
>> +
>> +	regs->addr0 = page << 16 | column;
>> +	regs->addr1 = page >> 16 & 0xff;
>> +}
>> +
>> +/*
>> + * update_rw_regs:	set up read/write register values, these will be
>> + *			written to the NAND controller registers via DMA
>> + *
>> + * @num_cw:		number of steps for the read/write operation
>> + * @read:		read or write operation
>> + */
>> +static void update_rw_regs(struct qcom_nandc_data *this, int num_cw, bool read)
>> +{
>> +	struct nandc_regs *regs = this->regs;
>> +
>> +	if (this->use_ecc) {
>> +		if (read)
>> +			regs->cmd = PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
>> +		else
>> +			regs->cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
>> +
>> +		regs->cfg0 = (this->cfg0 & ~(7U << CW_PER_PAGE)) |
>> +				(num_cw - 1) << CW_PER_PAGE;
>> +
>> +		regs->cfg1 = this->cfg1;
>> +		regs->ecc_bch_cfg = this->ecc_bch_cfg;
>> +	} else {
>> +		if (read)
>> +			regs->cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
>> +		else
>> +			regs->cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
>> +
>> +		regs->cfg0 = (this->cfg0_raw & ~(7U << CW_PER_PAGE)) |
>> +				(num_cw - 1) << CW_PER_PAGE;
>> +
>> +		regs->cfg1 = this->cfg1_raw;
>> +		regs->ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
>> +	}
>
> These two arms are almost exactly the same, except regs->cmd has
> PAGE_READ_WITH_ECC vs PAGE_READ and regs->ecc_bch_cfg is different. It
> should be possible to push the use_ecc case down into the two places
> that need it and reduce lines.

cfg0 and cfg1 are set differently too, they need to be set to cfg0_raw
and cfg1_raw when use_ecc isn't set.

The only one line that I can save is the extra common PROGRAM_PAGE
assignment that's same irrespective of use_ecc. I'll do that.

>
>> +
>> +	regs->ecc_buf_cfg = this->ecc_buf_cfg;
>> +	regs->clrflashstatus = this->clrflashstatus;
>> +	regs->clrreadstatus = this->clrreadstatus;
>> +	regs->exec = 1;
>> +}
>> +
>> +/*
>> + * write_reg_dma:	prepares a descriptor to write a given number of
>> + *			contiguous registers
>> + *
>> + * @first:		offset of the first register in the contiguous block
>> + * @reg:		starting address containing the reg values to write
>> + * @num_regs:		number of registers to write
>> + * @flow_control:	flow control enabled/disabled
>> + */
>> +static int write_reg_dma(struct qcom_nandc_data *this, int first, u32 *reg,
>> +			 int num_regs, bool flow_control)
>> +{
>> +	struct desc_info *desc;
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	struct scatterlist *sgl;
>> +	int size;
>> +	int r;
>> +
>> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	list_add_tail(&desc->list, &this->list);
>> +
>> +	sgl = &desc->sgl;
>> +
>> +	size = num_regs * sizeof(u32);
>> +
>> +	sg_init_one(sgl, reg, size);
>> +
>> +	desc->dir = DMA_MEM_TO_DEV;
>> +
>> +	dma_map_sg(this->dev, sgl, 1, desc->dir);
>> +
>> +	this->slave_conf.device_fc = flow_control ? 1 : 0;
>> +	this->slave_conf.dst_addr = this->res->start + first;
>> +	this->slave_conf.dst_maxburst = 16;
>> +	this->slave_conf.slave_id = this->cmd_crci;
>> +
>> +	r = dmaengine_slave_config(this->chan, &this->slave_conf);
>> +	if (r) {
>> +		dev_err(this->dev, "failed to configure dma channel\n");
>> +		goto err;
>> +	}
>> +
>> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
>> +	if (!dma_desc) {
>> +		dev_err(this->dev, "failed to prepare register write desc\n");
>> +		r = PTR_ERR(dma_desc);
>
> PTR_ERR(NULL) doesn't make sense. It would be nice if the DMA engine
> APIs were documented so we knew if it returned NULL or an error pointer
> on failure.

Yes, this is wrong. I have to fix this habit of mixing error pointer and 
NULL return values. Will fix it.

>
>> +		goto err;
>> +	}
>> +
>> +	desc->dma_desc = dma_desc;
>> +
>> +	return 0;
>> +err:
>> +	kfree(desc);
>> +
>> +	return r;
>> +}
>> +
>> +/*
>
> BTW, this isn't kernel doc. That would need two asterisks.

I didn't intend them to be a part of the kernel doc. I kept a kernel
doc like format at a few places since it was legible.

>
>> + * read_reg_dma:	prepares a descriptor to read a given number of
>> + *			contiguous registers to the reg_read_buf pointer
>> + *
>> + * @first:		offset of the first register in the contiguous block
>> + * @num_regs:		number of registers to read
>> + * @flow_control:	flow control enabled/disabled
>> + */
>> +static int read_reg_dma(struct qcom_nandc_data *this, int first, int num_regs,
>> +			bool flow_control)
>> +{
>> +	struct desc_info *desc;
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	struct scatterlist *sgl;
>> +	int size;
>> +	int r;
>> +
>> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	list_add_tail(&desc->list, &this->list);
>> +
>> +	sgl = &desc->sgl;
>> +
>> +	size = num_regs * sizeof(u32);
>> +
>> +	sg_init_one(sgl, this->reg_read_buf + this->reg_read_pos, size);
>> +
>> +	desc->dir = DMA_DEV_TO_MEM;
>> +
>> +	dma_map_sg(this->dev, sgl, 1, desc->dir);
>> +
>> +	this->slave_conf.device_fc = flow_control ? 1 : 0;
>
> device_fc is a bool, so why the 1 : 0 trick? flow_control is already bool.

I'll fix this.

>
>> +	this->slave_conf.src_addr = this->res->start + first;
>> +	this->slave_conf.src_maxburst = 16;
>> +	this->slave_conf.slave_id = this->data_crci;
>> +
>> +	r = dmaengine_slave_config(this->chan, &this->slave_conf);
>> +	if (r) {
>> +		dev_err(this->dev, "failed to configure dma channel\n");
>> +		goto err;
>> +	}
>> +
>> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
>> +	if (!dma_desc) {
>> +		dev_err(this->dev, "failed to prepare register read desc\n");
>> +		r = PTR_ERR(dma_desc);
>
> Same problem here for PTR_ERR. Would be nice to figure out a way to
> consolidate these DMA functions. They're only subtly different.

I'll try this out.

>
>> +		goto err;
>> +	}
>> +
>> +	desc->dma_desc = dma_desc;
>> +
>> +	this->reg_read_pos += num_regs;
>> +
>> +	return 0;
>> +err:
>> +	kfree(desc);
>> +
>> +	return r;
>> +}
>> +
> [..]
>> +
>> +/*
>> + * write_data_dma:	prepares a DMA descriptor to transfer data from
>> + *			'vaddr' to the controller's internal buffer
>> + *
>> + * @reg_off:		offset within the controller's data buffer
>> + * @vaddr:		virtual address of the buffer we want to read from
>> + * @size:		DMA transaction size in bytes
>> + */
>> +static int write_data_dma(struct qcom_nandc_data *this, int reg_off, u8 *vaddr,
>
> const u8 *vaddr?
>
>> +			  int size)
>> +{
>> +	struct desc_info *desc;
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	struct scatterlist *sgl;
>> +	int r;
>> +
>> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	list_add_tail(&desc->list, &this->list);
>> +
>> +	sgl = &desc->sgl;
>> +
>> +	sg_init_one(sgl, vaddr, size);
>> +
>> +	desc->dir = DMA_MEM_TO_DEV;
>> +
>> +	r = dma_map_sg(this->dev, sgl, 1, desc->dir);
>> +	if (r == 0)
>> +		goto err;
>
> Should we return an error in this case? Looks like return 0.

dma_map_sg returns the number of sg entries successfully mapped. In
this case, it should be 1.

>
>> +
>> +	this->slave_conf.device_fc = 0;
>> +	this->slave_conf.dst_addr = this->res->start + reg_off;
>> +	this->slave_conf.dst_maxburst = 16;
>
> Is there any reason why slave_conf can't be on the stack? Otherwise it's
> odd that it's overwritten a few times before we submit the descriptors,
> so it must be copied by the dmaengine provider, but that isn't clear at
> all from the code. If it isn't copied, perhaps it should be part of the
> desc_info structure. If it is copied I wonder why it isn't const in the
> function signature.

The dmaengine drivers either memcpy slave_config in their
device_config() dmaengine op, or populate their local members reading
params in the passed slave_config.

I'll move slave_conf to stack. As you said, the config argument
in dmaengine_slave_config should ideally use const.

>
>> +
>> +	r = dmaengine_slave_config(this->chan, &this->slave_conf);
>> +	if (r) {
>> +		dev_err(this->dev, "failed to configure dma channel\n");
>> +		goto err;
>> +	}
>> +
>> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
>> +	if (!dma_desc) {
>> +		dev_err(this->dev, "failed to prepare data write desc\n");
>> +		r = PTR_ERR(dma_desc);
>> +		goto err;
>> +	}
>> +
>> +	desc->dma_desc = dma_desc;
>> +
>> +	return 0;
>> +err:
>> +	kfree(desc);
>> +
>> +	return r;
>> +}
>> +
>> +/*
>> + * helper to prepare dma descriptors to configure registers needed for reading a
>> + * codeword/step in a page
>> + */
>> +static void config_cw_read(struct qcom_nandc_data *this)
>> +{
>> +	struct nandc_regs *regs = this->regs;
>> +
>> +	write_reg_dma(this, NAND_FLASH_CMD, &regs->cmd, 3, true);
>
> Maybe it would be better to have a case statement inside
> {write,read}_reg_dma() that looked at the second argument and matched it
> up with an offset in regs. Then this could be
>
>      write_reg_dma(this, NAND_FLASH_CMD, 3, true);

That's a good idea. However, we have at least one programming seqeunce 
(in nandc_param) where we need to write two different values to the same 
register. In such a case, we need two different locations to store the 
two values.

I can split up the programming sequence into two parts such that we 
won't write to the same register twice. But doing this for the sake of 
reducing an argument to write_reg_dma seems a bit unnecessary.

>
> and we wouldn't have to worry about having the wrong argument for
> parameter 2 and parameter 3. It may even be that we always read the same
> number of registers too? In which case we could move parameter 4 into
> the case statement too?

Parameter 4 can vary for the same starting register. It won't be 
possible to move that.

The last parameter (flow_control) is actually limited to a few 
registers, I will move that into the function.

>
>> +	write_reg_dma(this, NAND_DEV0_CFG0, &regs->cfg0, 3, false);
>> +	write_reg_dma(this, NAND_EBI2_ECC_BUF_CFG, &regs->ecc_buf_cfg,
>> +		1, false);
>> +
>> +	write_reg_dma(this, NAND_EXEC_CMD, &regs->exec, 1, false);
>> +
>> +	read_reg_dma(this, NAND_FLASH_STATUS, 2, true);
>> +	read_reg_dma(this, NAND_ERASED_CW_DETECT_STATUS, 1, false);
>> +}
>> +
> [...]
>> +/* sets up descriptors for NAND_CMD_RESET */
>> +static int reset(struct qcom_nandc_data *this)
>> +{
>> +	struct nandc_regs *regs = this->regs;
>> +
>> +	regs->cmd = RESET_DEVICE;
>> +	regs->exec = 1;
>> +
>> +	write_reg_dma(this, NAND_FLASH_CMD, &regs->cmd, 1, true);
>> +	write_reg_dma(this, NAND_EXEC_CMD, &regs->exec, 1, false);
>> +
>> +	read_reg_dma(this, NAND_FLASH_STATUS, 1, true);
>> +
>> +	return 0;
>> +}
>> +
>> +/* helpers to submit/free our list of dma descriptors */
>> +static void dma_callback(void *param)
>> +{
>> +	struct qcom_nandc_data *this = (struct qcom_nandc_data *) param;
>
> Useless cast.

Will fix it.

>
>> +	struct completion *c = &this->dma_done;
>> +
>> +	complete(c);
>> +}
>> +
>> +static int submit_descs(struct qcom_nandc_data *this)
>> +{
>> +	struct completion *c = &this->dma_done;
>> +	struct desc_info *desc;
>> +	int r;
>> +
>> +	init_completion(c);
>> +
>> +	list_for_each_entry(desc, &this->list, list) {
>> +		/*
>> +		 * we add a callback the last descriptor in our list to notify
>
> to the last?

Yes. I'll fix this.

>
>> +		 * completion of command
>> +		 */
>> +		if (list_is_last(&desc->list, &this->list)) {
>> +			desc->dma_desc->callback = dma_callback;
>> +			desc->dma_desc->callback_param = this;
>> +		}
>> +
>> +		dmaengine_submit(desc->dma_desc);
>> +	}
>> +
>> +	dma_async_issue_pending(this->chan);
>> +
>> +	r = wait_for_completion_timeout(c, msecs_to_jiffies(500));
>> +	if (!r)
>> +		return -EINVAL;
>
> Why not -ETIMEDOUT?

I'll replace this with -ETIMEDOUT

>
>> +
>> +	return 0;
>> +}
>> +
> [...]
>> +
>> +/*
>> + * when using RS ECC, the NAND controller flags an error when reading an
>> + * erased page. however, there are special characters at certain offsets when
>> + * we read the erased page. we check here if the page is really empty. if so,
>> + * we replace the magic characters with 0xffs
>> + */
>> +static bool empty_page_fixup(struct qcom_nandc_data *this, u8 *data_buf)
>> +{
>> +	struct mtd_info *mtd = &this->mtd;
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int cwperpage = ecc->steps;
>> +	int i;
>> +
>> +	/* if BCH is enabled, HW will take care of detecting erased pages */
>> +	if (this->bch_enabled || !this->use_ecc)
>> +		return false;
>> +
>> +	for (i = 0; i < cwperpage; i++) {
>> +		u8 *empty1, *empty2;
>> +		u32 flash_status = this->reg_read_buf[3 * i];
>> +
>> +		/*
>> +		 * an erased page flags an error in NAND_FLASH_STATUS, check if
>> +		 * the page is erased by looking for 0x54s at offsets 3 and 175
>> +		 * from the beginning of each codeword
>> +		 */
>> +		if (flash_status & FS_OP_ERR) {
>> +			empty1 = &data_buf[3 + i * this->cw_data];
>> +			empty2 = &data_buf[175 + i * this->cw_data];
>> +
>> +			/*
>> +			 * the error wasn't because of an erased page, bail out
>> +			 * and let someone else do the error checking
>> +			 */
>> +			if (!((*empty1 == 0x54 && *empty2 == 0xff) ||
>> +					(*empty1 == 0xff && *empty2 == 0x54)))
>
> Why are we using pointers? Just use u8 empty1, empty2 = data_buf[...] ?

Yes. Not sure why I did this.
>
>> +				return false;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < mtd->writesize && (data_buf[i] == 0xff ||
>> +		(i % this->cw_data == 3 || i % this->cw_data == 175)); i++) {
>> +	}
>
> This might be clearer like so:
>
>      for (i = 0; i < mtd->writesize; i++) {
>          if (i % this->cw_data == 3 || i % this->cw_data == 175);
>              continue;
>          if (data_buf[i] != 0xff)
>              return false;
>      }
>
> and then drop the if after the loop. Actually since we're checking the
> whole page it may be better to do this:
>
> +
> +	/*
> +	 * the whole page is 0xffs besides the magic offsets, we replace the
> +	 * 0x54s with 0xffs
> +	 */
> +	for (i = 0; i < cwperpage; i++) {
> +		data_buf[3 + i * this->cw_data] = 0xff;
> +		data_buf[175 + i * this->cw_data] = 0xff;
> +	}
> +
>
>
> and then
>
>      return memchr_inv(data_buf, 0xff, mtd->writesize) ? false : true ;
>
> the memchr_inv() is optimized to find the bad characters 8 bytes at a time.

That's a good idea. Although, if memchr_inv doesn't report that the
buffer comprises entirely of 0xffs, we will need to revert the magic 
offsets back to their original values, since in that case, 0x54 could 
have been valid data.

I guess it'll still be faster than the linear check. I'll try to change it.

>
>> +
>> +	if (i < mtd->writesize)
>> +		return false;
>> +
>> +	/*
>> +	 * the whole page is 0xffs besides the magic offsets, we replace the
>> +	 * 0x54s with 0xffs
>> +	 */
>> +	for (i = 0; i < cwperpage; i++) {
>> +		data_buf[3 + i * this->cw_data] = 0xff;
>> +		data_buf[175 + i * this->cw_data] = 0xff;
>> +	}
>> +
>> +	/*
>> +	 * tell the caller that the page was empty and is fixed up, so that
>> +	 * parse_read_errors() doesn't think it's and error
>> +	 */
>> +	return true;
>> +}
>> +
>> +/*
>> + * reads back status registers set by the controller to notify page read
>> + * errors. this is equivalent to what 'ecc->correct()' would do.
>> + */
>> +static int parse_read_errors(struct qcom_nandc_data *this, bool erased_page)
>> +{
>> +	struct mtd_info *mtd = &this->mtd;
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int cwperpage = ecc->steps;
>> +	unsigned int max_bitflips = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < cwperpage; i++) {
>> +		int stat;
>> +		u32 flash_status = this->reg_read_buf[3 * i];
>> +		u32 buffer_status = this->reg_read_buf[3 * i + 1];
>> +		u32 erased_cw_status = this->reg_read_buf[3 * i + 2];
>
> struct stats {
>      u32 flash;
>      u32 buffer;
>      u32 erased_cw;
> };
>
> struct stats *buf = (struct stat *)this->reg_read_buf;
>
> for (i = 0; i < cwperpage; i++, buf++) {
>      int stat;
>      if (buf->flash & (FS_OP_ERR | FS_MPU_ERR))
>
> ?

This does look neat. I'll switch to this.

>
> Also, is the buffer little endian? If so, that should be a __le32 flash,
> __le32 buffer, etc. up there and then le32_to_cpu().

It is. I'll update.

>
>> +
>> +		if (flash_status & (FS_OP_ERR | FS_MPU_ERR)) {
>> +
>> +			/* ignore erased codeword errors */
>> +			if (this->bch_enabled) {
>> +				if ((erased_cw_status & ERASED_CW) == ERASED_CW)
>> +					continue;
>> +			} else if (erased_page) {
>> +				continue;
>> +			}
>> +
>> +			if (buffer_status & BS_UNCORRECTABLE_BIT) {
>> +				mtd->ecc_stats.failed++;
>> +				continue;
>> +			}
>> +		}
>> +
>> +		stat = buffer_status & BS_CORRECTABLE_ERR_MSK;
>> +		mtd->ecc_stats.corrected += stat;
>> +
>> +		max_bitflips = max_t(unsigned int, max_bitflips, stat);
>> +	}
>> +
>> +	return max_bitflips;
>> +}
>> +
>> +/*
>> + * helper to perform the actual page read operation, used by ecc->read_page()
>> + * and ecc->read_oob()
>> + */
>> +static int read_page_low(struct qcom_nandc_data *this, u8 *data_buf,
>> +			 u8 *oob_buf)
>> +{
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int i, r;
>> +
>> +	/* queue cmd descs for each codeword */
>> +	for (i = 0; i < ecc->steps; i++) {
>> +		int data_size, oob_size;
>> +
>> +		if (i == (ecc->steps - 1)) {
>> +			data_size = ecc->size - ((ecc->steps - 1) << 2);
>> +			oob_size = (ecc->steps << 2) + ecc->bytes;
>> +		} else {
>> +			data_size = this->cw_data;
>> +			oob_size = ecc->bytes;
>> +		}
>> +
>> +		config_cw_read(this);
>> +
>> +		if (data_buf)
>> +			read_data_dma(this, FLASH_BUF_ACC, data_buf, data_size);
>> +
>> +		if (oob_buf)
>> +			read_data_dma(this, FLASH_BUF_ACC + data_size, oob_buf,
>> +					oob_size);
>> +
>> +		if (data_buf)
>> +			data_buf += data_size;
>> +		if (oob_buf)
>> +			oob_buf += oob_size;
>> +	}
>> +
>> +	r = submit_descs(this);
>> +	if (r)
>> +		dev_err(this->dev, "failure to read page/oob\n");
>> +
>> +	free_descs(this);
>> +
>> +	return r;
>> +}
>> +
>> +/*
>> + * a helper that copies the last step/codeword of a page (containing free oob)
>> + * into our local buffer
>> + */
>> +static int copy_last_cw(struct qcom_nandc_data *this, bool use_ecc, int page)
>> +{
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int size;
>> +	int r;
>> +
>> +	clear_read_regs(this);
>> +
>> +	size = use_ecc ? this->cw_data : this->cw_size;
>> +
>> +	/* prepare a clean read buffer */
>> +	memset(this->data_buffer, 0xff, size);
>> +
>> +	this->use_ecc = use_ecc;
>> +	set_address(this, this->cw_size * (ecc->steps - 1), page);
>> +	update_rw_regs(this, 1, true);
>> +
>> +	config_cw_read(this);
>> +
>> +	read_data_dma(this, FLASH_BUF_ACC, this->data_buffer, size);
>> +
>> +	r = submit_descs(this);
>> +	if (r)
>> +		dev_err(this->dev, "failed to copy last codeword\n");
>> +
>> +	free_descs(this);
>> +
>> +	return r;
>> +}
>> +
>> +/* implements ecc->read_page() */
>> +static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>> +				uint8_t *buf, int oob_required, int page)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	u8 *data_buf, *oob_buf = NULL;
>> +	bool direct_dma, erased_page;
>> +	int r;
>> +
>> +	/*
>> +	 * first try to map the upper buffer directly, else, use our own buf
>> +	 * and memcpy to upper buf
>> +	 */
>> +	if (virt_addr_valid(buf) && !object_is_on_stack(buf)) {
>> +		direct_dma = true;
>> +		data_buf = buf;
>> +	} else {
>> +		direct_dma = false;
>> +		data_buf = this->data_buffer;
>> +		memset(data_buf, 0xff, mtd->writesize + mtd->oobsize);
>> +	}
>> +
>> +	oob_buf = oob_required ? chip->oob_poi : NULL;
>> +
>> +	r = read_page_low(this, data_buf, oob_buf);
>> +	if (r) {
>> +		dev_err(this->dev, "failure to read page\n");
>> +		goto err;
>
> return r?
>
>> +	}
>> +
>> +	erased_page = empty_page_fixup(this, data_buf);
>> +
>> +	if (!direct_dma)
>> +		memcpy(buf, this->data_buffer, mtd->writesize);
>> +
>> +	r = parse_read_errors(this, erased_page);
>> +err:
>> +	return r;
>
> and then return parse_read_errors()?

Will do this.

>
>> +}
>> +
>> +/* implements ecc->read_oob() */
>> +static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>> +			       int page)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int r;
>> +
>> +	clear_read_regs(this);
>> +
>> +	this->use_ecc = true;
>> +	set_address(this, 0, page);
>> +	update_rw_regs(this, ecc->steps, true);
>> +
>> +	r = read_page_low(this, NULL, chip->oob_poi);
>> +	if (r)
>> +		dev_err(this->dev, "failure to read oob\n");
>> +
>> +	return r;
>> +}
>> +
>> +/* implements ecc->read_oob_raw(), used to read the bad block marker flag */
>> +static int qcom_nandc_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
>> +					int page)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	uint8_t *oob = chip->oob_poi;
>> +	int start, length;
>> +	int r;
>> +
>> +	/*
>> +	 * configure registers for a raw page read, the address is set to the
>> +	 * beginning of the last codeword, we don't care about reading ecc
>> +	 * portion of oob, just the free stuff
>> +	 */
>> +	r = copy_last_cw(this, false, page);
>> +	if (r)
>> +		return r;
>> +
>> +	/*
>> +	 * reading raw oob has 2 parts, first the bad block byte, then the
>> +	 * actual free oob region. perform a memcpy in two steps
>> +	 */
>> +	start = mtd->writesize - (this->cw_size * (ecc->steps - 1));
>> +	length = chip->options & NAND_BUSWIDTH_16 ? 2 : 1;
>> +
>> +	memcpy(oob, this->data_buffer + start, length);
>> +
>> +	oob += length;
>> +
>> +	start = this->cw_data - (ecc->steps << 2) + 1;
>> +	length = ecc->steps << 2;
>> +
>> +	memcpy(oob, this->data_buffer + start, length);
>> +
>> +	return 0;
>> +}
>> +
>> +/* implements ecc->write_page() */
>> +static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>> +				 const uint8_t *buf, int oob_required)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	u8 *data_buf, *oob_buf;
>> +	bool direct_dma;
>> +	int i, r = 0;
>> +
>> +	clear_read_regs(this);
>> +
>> +	/*
>> +	 * first try to map the upper buffer directly, else, memcpy upper
>> +	 * buffer to our local buffer
>> +	 */
>> +	direct_dma = virt_addr_valid(buf) && !object_is_on_stack((void *) buf);
>
> We should change object_is_on_stack() to take a const pointer.

Yeah. That makes it two funcs. This and dmaengine_slave_config.

>
> Are we guaranteed that this is called within the same context as where
> the buffer is passed to this function? Otherwise this stack check isn't
> going to work because object_is_on_stack() will silently fail.

These are funcs are finally tied to mtd ops. I think in normal operation
it'll be the same context. I'll still cross check. The aim of the check
is to prevent a memcpy of the buffer to/from the layer above. A false
negative will result in a slower read/write operation.

>
>> +
>> +	if (!direct_dma) {
>> +		memcpy(this->data_buffer, buf, mtd->writesize
>> );
>> +		data_buf = this->data_buffer;
>> +	} else {
>> +		data_buf = (u8 *) buf;
>
> Shouldn't need to cast away const...

Right. I'll remove this.

>
>> +	}
>> +
>> +	oob_buf = chip->oob_poi;
>> +
>> +	this->use_ecc = true;
>> +	update_rw_regs(this, ecc->steps, false);
>> +
>> +	for (i = 0; i < ecc->steps; i++) {
>> +		int data_size, oob_size;
>> +
>> +		if (i == (ecc->steps - 1)) {
>> +			data_size = ecc->size - ((ecc->steps - 1) << 2);
>> +			oob_size = (ecc->steps << 2) + ecc->bytes;
>> +		} else {
>> +			data_size = this->cw_data;
>> +			oob_size = ecc->bytes;
>> +		}
>> +
>> +		config_cw_write_pre(this);
>> +		write_data_dma(this, FLASH_BUF_ACC, data_buf, data_size);
>> +
>> +		/*
>> +		 * we don't really need to write anything to oob for the
>> +		 * first n - 1 codewords since these oob regions just
>> +		 * contain ecc that's written by the controller itself
>> +		 */
>> +		if (i == (ecc->steps - 1))
>> +			write_data_dma(this, FLASH_BUF_ACC + data_size,
>> +					oob_buf, oob_size);
>> +		config_cw_write_post(this);
>> +
>> +		data_buf += data_size;
>> +		oob_buf += oob_size;
>> +	}
>> +
>> +	r = submit_descs(this);
>> +	if (r)
>> +		dev_err(this->dev, "failure to write page\n");
>> +
>> +	free_descs(this);
>> +
>> +	return r;
>> +}
>> +
>> +/*
>> + * implements ecc->write_oob()
>> + *
>> + * the NAND controller cannot write only data or only oob within a codeword,
>> + * since ecc is calculated for the combined codeword. we first copy the
>> + * entire contents for the last codeword(data + oob), replace the old oob
>> + * with the new one in chip->oob_poi, and then write the entire codeword.
>> + * this read-copy-write operation results in a slight perormance loss.
>> + */
>> +static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>> +				int page)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	uint8_t *oob = chip->oob_poi;
>> +	int free_boff;
>> +	int data_size, oob_size;
>> +	int r, status = 0;
>> +
>> +	r = copy_last_cw(this, true, page);
>> +	if (r)
>> +		return r;
>> +
>> +	clear_read_regs(this);
>> +
>> +	/* calculate the data and oob size for the last codeword/step */
>> +	data_size = ecc->size - ((ecc->steps - 1) << 2);
>> +	oob_size = (ecc->steps << 2) + ecc->bytes;
>> +
>> +	/*
>> +	 * the location of spare data in the oob buffer, we could also use
>> +	 * ecc->layout.oobfree here
>> +	 */
>> +	free_boff = ecc->bytes * (ecc->steps - 1);
>> +
>> +	/* override new oob content to last codeword */
>> +	memcpy(this->data_buffer + data_size, oob + free_boff, oob_size);
>> +
>> +	this->use_ecc = true;
>> +	set_address(this, this->cw_size * (ecc->steps - 1), page);
>> +	update_rw_regs(this, 1, false);
>> +
>> +	config_cw_write_pre(this);
>> +	write_data_dma(this, FLASH_BUF_ACC, this->data_buffer,
>> +		data_size + oob_size);
>> +	config_cw_write_post(this);
>> +
>> +	r = submit_descs(this);
>> +	if (r)
>> +		dev_err(this->dev, "failure to write oob\n");
>> +
>> +	free_descs(this);
>> +
>> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>> +
>> +	status = chip->waitfunc(mtd, chip);
>
> Should we wait if the submission failed?

That's a good point. We don't need to call waitfunc if dma
itself failed. Will fix it.

>
>> +
>> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
>> +}
>> +
>> +/* implements ecc->write_oob_raw(), used to write bad block marker flag */
>> +static int qcom_nandc_write_oob_raw(struct mtd_info *mtd,
>> +				    struct nand_chip *chip, int page)
>> +{
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	uint8_t *oob = chip->oob_poi;
>> +	int start, length;
>> +	int r, status = 0;
>> +
>> +	r = copy_last_cw(this, false, page);
>> +	if (r)
>> +		return r;
>> +
>> +	clear_read_regs(this);
>> +
>> +	/*
>> +	 * writing raw oob has 2 parts, first the bad block region, then the
>> +	 * actual free region
>> +	 */
>> +	start = mtd->writesize - (this->cw_size * (ecc->steps - 1));
>> +	length = chip->options & NAND_BUSWIDTH_16 ? 2 : 1;
>> +
>> +	memcpy(this->data_buffer + start, oob, length);
>> +
>> +	oob += length;
>> +
>> +	start = this->cw_data - (ecc->steps << 2) + 1;
>> +	length = ecc->steps << 2;
>> +
>> +	memcpy(this->data_buffer + start, oob, length);
>> +
>> +	/* prepare write */
>> +	this->use_ecc = false;
>> +	set_address(this, this->cw_size * (ecc->steps - 1), page);
>> +	update_rw_regs(this, 1, false);
>> +
>> +	config_cw_write_pre(this);
>> +	write_data_dma(this, FLASH_BUF_ACC, this->data_buffer, this->cw_size);
>> +	config_cw_write_post(this);
>> +
>> +	r = submit_descs(this);
>> +	if (r)
>> +		dev_err(this->dev, "failure to write updated oob\n");
>> +
>> +	free_descs(this);
>> +
>> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>> +
>> +	status = chip->waitfunc(mtd, chip);
>
> Ditto.
>
>> +
>> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
>> +}
>> +
>> +/*
>> + * the three functions below implement chip->read_byte(), chip->read_buf()
>> + * and chip->write_buf() respectively. these aren't used for
>> + * reading/writing page data, they are used for smaller data like reading
>> + * id, status etc
>> + */
>> +static uint8_t qcom_nandc_read_byte(struct mtd_info *mtd)
>> +{
>> +	struct nand_chip *chip = mtd->priv;
>> +	struct qcom_nandc_data *this = chip->priv;
>> +	uint8_t *buf = (uint8_t *) this->data_buffer;
>
> isn't it already uint8_t?

Yes.

>
>> +	uint8_t ret = 0x0;
>> +
>> +	if (this->last_command == NAND_CMD_STATUS) {
>> +		ret = this->status;
>> +
>> +		this->status = NAND_STATUS_READY | NAND_STATUS_WP;
>> +
>> +		return ret;
>> +	}
>> +
>> +	if (this->buf_start < this->buf_count)
>> +		ret = buf[this->buf_start++];
>> +
>> +	return ret;
>> +}
>> +
> [...]
>> +
>> +static int qcom_nandc_alloc(struct qcom_nandc_data *this)
>> +{
>> +	int r;
>> +
>> +	r = dma_set_coherent_mask(this->dev, DMA_BIT_MASK(32));
>> +	if (r) {
>> +		dev_err(this->dev, "failed to set DMA mask\n");
>> +		return r;
>> +	}
>> +
>> +	/*
>> +	 * we don't know the page size of the NAND chip yet, set the buffer size
>> +	 * to 512 bytes for now, that's sufficient for reading ID or ONFI params
>> +	 */
>> +	this->buf_size = SZ_512;
>> +
>> +	this->data_buffer = devm_kzalloc(this->dev, this->buf_size, GFP_KERNEL);
>> +	if (!this->data_buffer)
>> +		return -ENOMEM;
>> +
>> +	this->regs = devm_kzalloc(this->dev, sizeof(struct nandc_regs),
>
> sizeof(*this->regs)?
>
>> +			GFP_KERNEL);
>> +	if (!this->regs)
>> +		return -ENOMEM;
>> +
>> +	this->reg_read_buf = devm_kzalloc(this->dev, MAX_REG_RD * sizeof(u32),
>> +				GFP_KERNEL);
>
> devm_kcalloc() and sizeof(*this->reg_read_buf) ?

Sure.

>
>> +	if (!this->reg_read_buf)
>> +		return -ENOMEM;
>> +
>> +	INIT_LIST_HEAD(&this->list);
>> +
>> +	this->chan = dma_request_slave_channel(this->dev, "rxtx");
>> +	if (!this->chan) {
>> +		dev_err(this->dev, "failed to request slave channel\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_nandc_unalloc(struct qcom_nandc_data *this)
>> +{
>> +	dma_release_channel(this->chan);
>> +}
>> +
>> +static int qcom_nandc_init(struct qcom_nandc_data *this)
>> +{
>> +	struct mtd_info *mtd = &this->mtd;
>> +	struct nand_chip *chip = &this->chip;
>> +	struct mtd_part_parser_data ppdata = {};
>> +	int r;
>> +
>> +	mtd->priv = chip;
>> +	mtd->name = "qcom-nandc";
>> +	mtd->owner = THIS_MODULE;
>> +
>> +	chip->priv = this;
>> +
>> +	chip->cmdfunc		= qcom_nandc_command;
>> +	chip->select_chip	= qcom_nandc_select_chip;
>> +	chip->read_byte		= qcom_nandc_read_byte;
>> +	chip->read_buf		= qcom_nandc_read_buf;
>> +	chip->write_buf		= qcom_nandc_write_buf;
>> +
>> +	chip->options |= NAND_NO_SUBPAGE_WRITE;
>> +	chip->bbt_options = NAND_BBT_ACCESS_BBM_RAW | NAND_BBT_USE_FLASH;
>> +
>> +	if (this->bus_width == 16)
>> +		chip->options |= NAND_BUSWIDTH_16;
>> +
>> +	qcom_nandc_pre_init(this);
>> +
>> +	r = nand_scan_ident(mtd, 1, NULL);
>> +	if (r)
>> +		return r;
>> +
>> +	r = qcom_nandc_ecc_init(this);
>> +	if (r)
>> +		return r;
>> +
>> +	qcom_nandc_hw_post_init(this);
>> +
>> +	r = nand_scan_tail(mtd);
>> +	if (r)
>> +		return r;
>> +
>> +
>
> Weird double newline here.
>
>> +	ppdata.of_node = this->dev->of_node;
>> +	r = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>> +	if (r)
>> +		return r;
>> +
>> +	return 0;
>
> Could be simplified to return mtd_device_parse_register(...).
>
>> +}
>> +
> [..]
>> +
>> +static int qcom_nandc_remove(struct platform_device *pdev)
>> +{
>> +	struct qcom_nandc_data *this;
>> +
>> +	this = platform_get_drvdata(pdev);
>> +	if (!this)
>> +		return -ENODEV;
>
> This seems impossible, so why check for it?

Will fix this.

>
>> +
>> +	qcom_nandc_unalloc(this);
>> +
>> +	clk_disable_unprepare(this->aon_clk);
>> +	clk_disable_unprepare(this->core_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver qcom_nandc_driver = {
>> +	.driver = {
>> +		.name = "qcom-nandc",
>> +		.of_match_table = qcom_nandc_of_match,
>> +	},
>> +	.probe   = qcom_nandc_probe,
>> +	.remove  = qcom_nandc_remove,
>> +};
>> +module_platform_driver(qcom_nandc_driver);
>> +
>> +MODULE_AUTHOR("Archit Taneja <architt@codeaurora.org>");
>> +MODULE_DESCRIPTION("Qualcomm NAND Controller driver");
>> +MODULE_LICENSE("GPL");
>
> This should say GPL v2 explicitly.

I'll update this.

Thanks for the thorough review!

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
