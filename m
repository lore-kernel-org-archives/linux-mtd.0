Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aL7lq-0006Ga-C2
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2016 11:14:52 +0000
Subject: Re: [PATCH v6 2/3] mtd: nand: Qualcomm NAND controller driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1451971501-18160-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-1-git-send-email-architt@codeaurora.org>
 <1453110634-25995-3-git-send-email-architt@codeaurora.org>
 <20160118120110.07da7469@bbrezillon>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 cernekee@gmail.com, sboyd@codeaurora.org, andy.gross@linaro.org,
 dehrenberg@google.com, linux-arm-msm@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <569CC90D.8060602@codeaurora.org>
Date: Mon, 18 Jan 2016 16:44:21 +0530
MIME-Version: 1.0
In-Reply-To: <20160118120110.07da7469@bbrezillon>
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

Hi Boris,

On 01/18/2016 04:31 PM, Boris Brezillon wrote:
> Hi Archit,
>
> I noticed a few things I didn't report in my previous review (sorry
> about that), and there's two comments from my previous review you didn't
> address (maybe you have a good reason :)).

That's totally okay. Sorry about missing out on some of the comments. I
focused on incorporating nand_check_erased_ecc_chunk in the correct way,
and forgot about the other comments. I'll address them in v7.

Comments below.

>
> On Mon, 18 Jan 2016 15:20:33 +0530
> Archit Taneja <architt@codeaurora.org> wrote:
>
>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
>> MDM9x15 series.
>>
>> It exists as a sub block inside the IPs EBI2 (External Bus Interface 2)
>> and QPIC (Qualcomm Parallel Interface Controller). These IPs provide a
>> broader interface for external slow peripheral devices such as LCD and
>> NAND/NOR flash memory or SRAM like interfaces.
>>
>> We add support for the NAND controller found within EBI2. For the SoCs
>> of our interest, we only use the NAND controller within EBI2. Therefore,
>> it's safe for us to assume that the NAND controller is a standalone block
>> within the SoC.
>>
>> The controller supports 512B, 2kB, 4kB and 8kB page 8-bit and 16-bit NAND
>> flash devices. It contains a HW ECC block that supports BCH ECC (4, 8 and
>> 16 bit correction/step) and RS ECC(4 bit correction/step) that covers main
>> and spare data. The controller contains an internal 512 byte page buffer
>> to which we read/write via DMA. The EBI2 type NAND controller uses ADM DMA
>> for register read/write and data transfers. The controller performs page
>> reads and writes at a codeword/step level of 512 bytes. It can support up
>> to 2 external chips of different configurations.
>>
>> The driver prepares register read and write configuration descriptors for
>> each codeword, followed by data descriptors to read or write data from the
>> controller's internal buffer. It uses a single ADM DMA channel that we get
>> via dmaengine API. The controller requires 2 ADM CRCIs for command and
>> data flow control. These are passed via DT.
>>
>> The ecc layout used by the controller is syndrome like, but we can't use
>> the standard syndrome ecc ops because of several reasons. First, the amount
>> of data bytes covered by ecc isn't same in each step. Second, writing to
>> free oob space requires us writing to the entire step in which the oob
>> lies. This forces us to create our own ecc ops.
>>
>> One more difference is how the controller accesses the bad block marker.
>> The controller ignores reading the marker when ECC is enabled. ECC needs
>> to be explicity disabled to read or write to the bad block marker. The
>> nand_bbt helpers library hence can't access BBMs for the controller.
>> For now, we skip the creation of BBT and populate chip->block_bad and
>> chip->block_markbad helpers instead.
>>
>> Reviewed-by: Andy Gross <agross@codeaurora.org>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>> v6:
>>    - Fix up erased page parsing. Use nand_check_erased_ecc_chunk to
>>      return corrected bitflips in an erased page.
>>    - Fix whitespace issues
>>    - Update compatible tring to something more specific
>>
>> v5:
>>    - split chip/controller structs
>>    - simplify layout by considering reserved bytes as part of ECC
>>    - create ecc layouts automatically
>>    - implement block_bad and block_markbad chip ops instead of
>>    - read_oob_raw/write_oob_raw ecc ops to access BBMs.
>>    - Add NAND_SKIP_BBTSCAN flag until we get badblockbits support.
>>    - misc clean ups
>>
>> v4:
>>    - Shrink submit_descs
>>    - add desc list node at the end of dma_prep_desc
>>    - Endianness and warning fixes
>>    - Add Stephen's Signed-off since he provided a patch to fix
>>      endianness problems
>>
>> v3:
>>    - Refactor dma functions for maximum reuse
>>    - Use dma_slave_confing on stack
>>    - optimize and clean upempty_page_fixup using memchr_inv
>>    - ensure portability with dma register reads using le32_* funcs
>>    - use NAND_USE_BOUNCE_BUFFER instead of doing it ourselves
>>    - fix handling of return values of dmaengine funcs
>>    - constify wherever possible
>>    - Remove dependency on ADM DMA in Kconfig
>>    - Misc fixes and clean ups
>>
>> v2:
>>    - Use new BBT flag that allows us to read BBM in raw mode
>>    - reduce memcpy-s in the driver
>>    - some refactor and clean ups because of above changes
>>
>>   drivers/mtd/nand/Kconfig      |    7 +
>>   drivers/mtd/nand/Makefile     |    1 +
>>   drivers/mtd/nand/qcom_nandc.c | 2013 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2021 insertions(+)
>>   create mode 100644 drivers/mtd/nand/qcom_nandc.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 95b8d2b..2fccdfb 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -546,4 +546,11 @@ config MTD_NAND_HISI504
>>   	help
>>   	  Enables support for NAND controller on Hisilicon SoC Hip04.
>>
>> +config MTD_NAND_QCOM
>> +	tristate "Support for NAND on QCOM SoCs"
>> +	depends on ARCH_QCOM
>> +	help
>> +	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
>> +	  controller. This controller is found on IPQ806x SoC.
>> +
>>   endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index 2c7f014..9450cdc 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -55,5 +55,6 @@ obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
>>   obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
>>   obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
>>   obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
>> +obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
>>
>>   nand-objs := nand_base.o nand_bbt.o nand_timings.o
>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
>> new file mode 100644
>> index 0000000..cc1e7fa
>> --- /dev/null
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>
> [...]
>
>> +/*
>> + * NAND controller data struct
>> + *
>> + * @controller:			base controller structure
>> + * @host_list:			list containing all the chips attached to the
>> + *				controller
>> + * @dev:			parent device
>> + * @res:			resource pointer for platform device (used to
>> + *				retrieve the physical addresses of registers
>> + *				for DMA)
>> + * @base:			MMIO base
>> + * @core_clk:			controller clock
>> + * @aon_clk:			another controller clock
>> + *
>> + * @chan:			dma channel
>> + * @cmd_crci:			ADM DMA CRCI for command flow control
>> + * @data_crci:			ADM DMA CRCI for data flow control
>> + * @desc_list:			DMA descriptor list (list of desc_infos)
>> + *
>> + * @data_buffer:		our local DMA buffer for page read/writes,
>> + *				used when we can't use the buffer provided
>> + *				by upper layers directly
>> + * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
>> + * @reg_read_buf:		local buffer for reading back registers via DMA
>> + * @reg_read_pos:		marker for data read in reg_read_buf
>> + *
>> + * @regs:			a contiguous chunk of memory for DMA register
>> + *				writes. contains the register values to be
>> + *				written to controller
>> + * @cmd1/vld:			some fixed controller register values
>> + * @ecc_modes:			supported ECC modes by the current controller,
>> + *				initialized via DT match data
>> + */
>> +struct qcom_nand_controller {
>> +	struct nand_hw_control controller;
>> +	struct list_head host_list;
>> +
>> +	struct device *dev;
>> +
>> +	struct resource *res;
>
> Hm, ->res is only used to get the physical address for your DMA
> operations, so maybe you should replace it by:
>
> 	dma_addr_t base_dma;
>
> and initialize it to phys_to_dma(dev, (phys_addr_t)res->start) in your
> probe function.

That's a good suggestion, I'll use this.

>
>> +	void __iomem *base;
>> +
>> +	struct clk *core_clk;
>> +	struct clk *aon_clk;
>> +
>> +	struct dma_chan *chan;
>> +	unsigned int cmd_crci;
>> +	unsigned int data_crci;
>> +	struct list_head desc_list;
>> +
>> +	u8		*data_buffer;
>> +	int		buf_size;
>> +	int		buf_count;
>> +	int		buf_start;
>> +
>> +	__le32 *reg_read_buf;
>> +	int reg_read_pos;
>> +
>> +	struct nandc_regs *regs;
>> +
>> +	u32 cmd1, vld;
>> +	u32 ecc_modes;
>> +};
>> +
>> +/*
>> + * NAND chip structure
>> + *
>> + * @nandc:			nand controller to which the chip is connected
>> + *
>> + * @chip:			base NAND chip structure
>> + * @node:			list node to add itself to host_list in
>> + *				qcom_nand_controller
>> + *
>> + * @cs:				chip select value for this chip
>> + * @cw_size:			the number of bytes in a single step/codeword
>> + *				of a page, consisting of all data, ecc, spare
>> + *				and reserved bytes
>> + * @cw_data:			the number of bytes within a codeword protected
>> + *				by ECC
>> + * @use_ecc:			request the controller to use ECC for the
>> + *				upcoming read/write
>> + * @bch_enabled:		flag to tell whether BCH ECC mode is used
>> + * @ecc_bytes_hw:		ECC bytes used by controller hardware for this
>> + *				chip
>> + * @status:			value to be returned if NAND_CMD_STATUS command
>> + *				is executed
>> + * @last_command:		keeps track of last command on this chip. used
>> + *				for reading correct status
>> + *
>> + * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
>> + *				ecc/non-ecc mode for the current nand flash
>> + *				device
>> + */
>> +struct qcom_nand_host {
>> +	struct qcom_nand_controller *nandc;
>
> You don't need this field, it can be extracted from chip->controller:
>
> struct qcom_nand_controller *
> get_qcom_nand_controller(struct nand_chip *chip)
> {
> 	return container_of(chip->controller,
> 			    struct qcom_nand_controller,
> 			    controller);
> }

Right. I'll use this.

>
>> +
>> +	struct nand_chip chip;
>> +	struct list_head node;
>> +
>> +	int cs;
>> +	int cw_size;
>> +	int cw_data;
>> +	bool use_ecc;
>> +	bool bch_enabled;
>> +	int ecc_bytes_hw;
>> +	u8 status;
>> +	int last_command;
>> +
>> +	u32 cfg0, cfg1;
>> +	u32 cfg0_raw, cfg1_raw;
>> +	u32 ecc_buf_cfg;
>> +	u32 ecc_bch_cfg;
>> +	u32 clrflashstatus;
>> +	u32 clrreadstatus;
>> +};
>
> [...]
>
>> +static int qcom_nand_host_setup(struct qcom_nand_host *host)
>> +{
>> +	struct qcom_nand_controller *nandc = host->nandc;
>> +	struct nand_chip *chip = &host->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int cwperpage, spare_bytes, bbm_size, bad_block_byte;
>> +	bool wide_bus;
>> +	int ecc_mode = 1;
>> +
>> +	/*
>> +	 * the controller requires each step consists of 512 bytes of data.
>> +	 * bail out if DT has populated a wrong step size.
>> +	 */
>> +	if (ecc->size != NANDC_STEP_SIZE) {
>> +		dev_err(nandc->dev, "invalid ecc size\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	wide_bus = chip->options & NAND_BUSWIDTH_16 ? true : false;
>> +
>> +	if (ecc->strength >= 8) {
>> +		/* 8 bit ECC defaults to BCH ECC on all platforms */
>> +		host->bch_enabled = true;
>> +		ecc_mode = 1;
>> +
>> +		if (wide_bus) {
>> +			host->ecc_bytes_hw = 14;
>> +			spare_bytes = 0;
>> +			bbm_size = 2;
>> +		} else {
>> +			host->ecc_bytes_hw = 13;
>> +			spare_bytes = 2;
>> +			bbm_size = 1;
>> +		}
>> +	} else {
>> +		/*
>> +		 * if the controller supports BCH for 4 bit ECC, the controller
>> +		 * uses lesser bytes for ECC. If RS is used, the ECC bytes is
>> +		 * always 10 bytes
>> +		 */
>> +		if (nandc->ecc_modes & ECC_BCH_4BIT) {
>> +			/* BCH */
>> +			host->bch_enabled = true;
>> +			ecc_mode = 0;
>> +
>> +			if (wide_bus) {
>> +				host->ecc_bytes_hw = 8;
>> +				spare_bytes = 2;
>> +				bbm_size = 2;
>> +			} else {
>> +				host->ecc_bytes_hw = 7;
>> +				spare_bytes = 4;
>> +				bbm_size = 1;
>> +			}
>> +		} else {
>> +			/* RS */
>> +			host->ecc_bytes_hw = 10;
>> +
>> +			if (wide_bus) {
>> +				spare_bytes = 0;
>> +				bbm_size = 2;
>> +			} else {
>> +				spare_bytes = 1;
>> +				bbm_size = 1;
>> +			}
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * we consider ecc->bytes as the sum of all the non-data content in a
>> +	 * step. It gives us a clean representation of the oob area (even if
>> +	 * all the bytes aren't used for ECC).It is always 16 bytes for 8 bit
>> +	 * ECC and 12 bytes for 4 bit ECC
>> +	 */
>> +	ecc->bytes = host->ecc_bytes_hw + spare_bytes + bbm_size;
>
> You're still not checking if (ecc->bytes * nsteps) can fit in the OOB
> area...

Sorry about this. Will incorporate in v7.

>
>> +
>> +	ecc->read_page		= qcom_nandc_read_page;
>> +	ecc->read_oob		= qcom_nandc_read_oob;
>> +	ecc->write_page		= qcom_nandc_write_page;
>> +	ecc->write_oob		= qcom_nandc_write_oob;
>> +
>> +	ecc->mode = NAND_ECC_HW;
>> +
>> +	ecc->layout = qcom_nand_create_layout(host);
>> +	if (!ecc->layout)
>> +		return -ENOMEM;
>> +
>> +	cwperpage = mtd->writesize / ecc->size;
>> +
>> +	/*
>> +	 * DATA_UD_BYTES varies based on whether the read/write command protects
>> +	 * spare data with ECC too. We protect spare data by default, so we set
>> +	 * it to main + spare data, which are 512 and 4 bytes respectively.
>> +	 */
>> +	host->cw_data = 516;
>> +
>> +	/*
>> +	 * total bytes in a step, either 528 bytes for 4 bit ECC, or 532 bytes
>> +	 * for 8 bit ECC
>> +	 */
>> +	host->cw_size = host->cw_data + ecc->bytes;
>> +
>> +	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
>> +
>> +	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
>> +				| host->cw_data << UD_SIZE_BYTES
>> +				| 0 << DISABLE_STATUS_AFTER_WRITE
>> +				| 5 << NUM_ADDR_CYCLES
>> +				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
>> +				| 0 << STATUS_BFR_READ
>> +				| 1 << SET_RD_MODE_AFTER_STATUS
>> +				| spare_bytes << SPARE_SIZE_BYTES;
>> +
>> +	host->cfg1 = 7 << NAND_RECOVERY_CYCLES
>> +				| 0 <<  CS_ACTIVE_BSY
>> +				| bad_block_byte << BAD_BLOCK_BYTE_NUM
>> +				| 0 << BAD_BLOCK_IN_SPARE_AREA
>> +				| 2 << WR_RD_BSY_GAP
>> +				| wide_bus << WIDE_FLASH
>> +				| host->bch_enabled << ENABLE_BCH_ECC;
>> +
>> +	host->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
>> +				| host->cw_size << UD_SIZE_BYTES
>> +				| 5 << NUM_ADDR_CYCLES
>> +				| 0 << SPARE_SIZE_BYTES;
>> +
>> +	host->cfg1_raw = 7 << NAND_RECOVERY_CYCLES
>> +				| 0 << CS_ACTIVE_BSY
>> +				| 17 << BAD_BLOCK_BYTE_NUM
>> +				| 1 << BAD_BLOCK_IN_SPARE_AREA
>> +				| 2 << WR_RD_BSY_GAP
>> +				| wide_bus << WIDE_FLASH
>> +				| 1 << DEV0_CFG1_ECC_DISABLE;
>> +
>> +	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
>> +				| 0 << ECC_SW_RESET
>> +				| host->cw_data << ECC_NUM_DATA_BYTES
>> +				| 1 << ECC_FORCE_CLK_OPEN
>> +				| ecc_mode << ECC_MODE
>> +				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
>> +
>> +	host->ecc_buf_cfg = 0x203 << NUM_STEPS;
>> +
>> +	host->clrflashstatus = FS_READY_BSY_N;
>> +	host->clrreadstatus = 0xc0;
>> +
>> +	dev_dbg(nandc->dev,
>> +		"cfg0 %x cfg1 %x ecc_buf_cfg %x ecc_bch cfg %x cw_size %d cw_data %d strength %d parity_bytes %d steps %d\n",
>> +		host->cfg0, host->cfg1, host->ecc_buf_cfg, host->ecc_bch_cfg,
>> +		host->cw_size, host->cw_data, ecc->strength, ecc->bytes,
>> +		cwperpage);
>> +
>> +	return 0;
>> +}
>
> [...]
>
>> +static int qcom_nandc_probe(struct platform_device *pdev)
>> +{
>> +	struct qcom_nand_controller *nandc;
>> +	const void *dev_data;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *dn = dev->of_node, *child;
>> +	int ret;
>> +
>> +	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
>> +	if (!nandc)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, nandc);
>> +	nandc->dev = dev;
>> +
>> +	dev_data = of_device_get_match_data(dev);
>> +	if (!dev_data) {
>> +		dev_err(&pdev->dev, "failed to get device data\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	nandc->ecc_modes = (unsigned long) dev_data;
>> +
>> +	nandc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	nandc->base = devm_ioremap_resource(dev, nandc->res);
>> +	if (IS_ERR(nandc->base))
>> +		return PTR_ERR(nandc->base);
>> +
>> +	nandc->core_clk = devm_clk_get(dev, "core");
>> +	if (IS_ERR(nandc->core_clk))
>> +		return PTR_ERR(nandc->core_clk);
>> +
>> +	nandc->aon_clk = devm_clk_get(dev, "aon");
>> +	if (IS_ERR(nandc->aon_clk))
>> +		return PTR_ERR(nandc->aon_clk);
>> +
>> +	ret = qcom_nandc_parse_dt(pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = qcom_nandc_alloc(nandc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(nandc->core_clk);
>> +	if (ret)
>> +		goto err_core_clk;
>> +
>> +	ret = clk_prepare_enable(nandc->aon_clk);
>> +	if (ret)
>> +		goto err_aon_clk;
>> +
>> +	ret = qcom_nandc_setup(nandc);
>> +	if (ret)
>> +		goto err_setup;
>> +
>> +	for_each_available_child_of_node(dn, child) {
>> +		if (of_device_is_compatible(child, "qcom,nandcs")) {
>> +			struct qcom_nand_host *host;
>> +
>> +			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +			if (!host) {
>> +				of_node_put(child);
>> +				ret = -ENOMEM;
>> +				goto err_setup;
>> +			}
>> +
>> +			host->nandc = nandc;
>> +			ret = qcom_nand_host_init(host, child);
>> +			if (ret) {
>> +				devm_kfree(dev, host);
>> +				continue;
>> +			}
>> +
>> +			list_add_tail(&host->node, &nandc->host_list);
>> +		}
>> +	}
>> +
>> +	if (list_empty(&nandc->host_list)) {
>> +		ret = -ENODEV;
>> +		goto err_setup;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_setup:
>
> ... and here, you're not unregistering the NAND devices:
>
> 	list_for_each_entry(host, &nandc->host_list, node)
> 		nand_release(nand_to_mtd(&host->chip));

This too.

Please let me know if you can see any other issues. I'll try to
incorporate them in v7 too.

Thanks again for the review!

Archit

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
