Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMPK7-0005sO-Md
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 23:39:17 +0000
Date: Mon, 3 Aug 2015 16:38:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, computersforpeace@gmail.com,
 linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20150803233852.GA20229@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-3-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438578498-32254-3-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/03, Archit Taneja wrote:
> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
> MDM9x15 series.

There are some checker errors and le32 usage is not correct:

drivers/mtd/nand/qcom_nandc.c:383:13: warning: mixing different enum types
drivers/mtd/nand/qcom_nandc.c:383:13:     int enum dma_transfer_direction  versus
drivers/mtd/nand/qcom_nandc.c:383:13:     int enum dma_data_direction
drivers/mtd/nand/qcom_nandc.c:741:17: warning: mixing different enum types
drivers/mtd/nand/qcom_nandc.c:741:17:     int enum dma_transfer_direction  versus
drivers/mtd/nand/qcom_nandc.c:741:17:     int enum dma_data_direction
/
drivers/mtd/nand/qcom_nandc.c:1828:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

You can find the le32 problems with

	make C=2 CF="-D__CHECK_ENDIAN__" drivers/mtd/nand/qcom_nandc.o

Feel free to squash the following in:

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---8<----

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index e1f15766e63d..6cc1df1a6df0 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -173,7 +173,7 @@
 struct desc_info {
 	struct list_head list;
 
-	enum dma_transfer_direction dir;
+	enum dma_data_direction dir;
 	struct scatterlist sgl;
 	struct dma_async_tx_descriptor *dma_desc;
 };
@@ -264,7 +264,7 @@ struct qcom_nandc_data {
 	int		buf_start;
 
 	/* local buffer to read back registers */
-	u32 *reg_read_buf;
+	__le32 *reg_read_buf;
 	int reg_read_pos;
 
 	/* required configs */
@@ -366,6 +366,7 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
 	struct dma_async_tx_descriptor *dma_desc;
 	struct scatterlist *sgl;
 	struct dma_slave_config slave_conf;
+	enum dma_transfer_direction dir_eng;
 	int r;
 
 	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
@@ -378,7 +379,13 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
 
 	sg_init_one(sgl, vaddr, size);
 
-	desc->dir = read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+	if (read) {
+		dir_eng = DMA_DEV_TO_MEM;
+		desc->dir = DMA_FROM_DEVICE;
+	} else {
+		dir_eng = DMA_MEM_TO_DEV;
+		desc->dir = DMA_TO_DEVICE;
+	}
 
 	r = dma_map_sg(this->dev, sgl, 1, desc->dir);
 	if (r == 0) {
@@ -405,7 +412,7 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
 		goto err;
 	}
 
-	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
+	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, dir_eng, 0);
 	if (!dma_desc) {
 		dev_err(this->dev, "failed to prepare desc\n");
 		r = -EINVAL;
@@ -775,7 +782,7 @@ static void parse_erase_write_errors(struct qcom_nandc_data *this, int command)
 	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
 
 	for (i = 0; i < num_cw; i++) {
-		__le32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
+		u32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
 
 		if (flash_status & FS_MPU_ERR)
 			this->status &= ~NAND_STATUS_WP;
@@ -902,7 +909,7 @@ static bool empty_page_fixup(struct qcom_nandc_data *this, u8 *data_buf)
 
 	for (i = 0; i < cwperpage; i++) {
 		u8 *empty1, *empty2;
-		__le32 flash_status = le32_to_cpu(this->reg_read_buf[3 * i]);
+		u32 flash_status = le32_to_cpu(this->reg_read_buf[3 * i]);
 
 		/*
 		 * an erased page flags an error in NAND_FLASH_STATUS, check if
@@ -968,37 +975,37 @@ static int parse_read_errors(struct qcom_nandc_data *this, bool erased_page)
 	int cwperpage = ecc->steps;
 	unsigned int max_bitflips = 0;
 	int i;
+	struct read_stats *buf;
 
-	for (i = 0; i < cwperpage; i++) {
-		int stat;
-		struct read_stats *buf;
-
-		buf = (struct read_stats *) (this->reg_read_buf + 3 * i);
+	buf = (struct read_stats *)this->reg_read_buf;
+	for (i = 0; i < cwperpage; i++, buf++) {
+		unsigned int stat;
+		u32 flash, buffer, erased_cw;
 
-		buf->flash = le32_to_cpu(buf->flash);
-		buf->buffer = le32_to_cpu(buf->buffer);
-		buf->erased_cw = le32_to_cpu(buf->erased_cw);
+		flash = le32_to_cpu(buf->flash);
+		buffer = le32_to_cpu(buf->buffer);
+		erased_cw = le32_to_cpu(buf->erased_cw);
 
-		if (buf->flash & (FS_OP_ERR | FS_MPU_ERR)) {
+		if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
 
 			/* ignore erased codeword errors */
 			if (this->bch_enabled) {
-				if ((buf->erased_cw & ERASED_CW) == ERASED_CW)
+				if ((erased_cw & ERASED_CW) == ERASED_CW)
 					continue;
 			} else if (erased_page) {
 				continue;
 			}
 
-			if (buf->buffer & BS_UNCORRECTABLE_BIT) {
+			if (buffer & BS_UNCORRECTABLE_BIT) {
 				mtd->ecc_stats.failed++;
 				continue;
 			}
 		}
 
-		stat = buf->buffer & BS_CORRECTABLE_ERR_MSK;
+		stat = buffer & BS_CORRECTABLE_ERR_MSK;
 		mtd->ecc_stats.corrected += stat;
 
-		max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		max_bitflips = max(max_bitflips, stat);
 	}
 
 	return max_bitflips;
@@ -1825,7 +1832,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	this->ecc_modes = (u32) dev_data;
+	this->ecc_modes = (unsigned long)dev_data;
 
 	this->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	this->base = devm_ioremap_resource(&pdev->dev, this->res);

> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> new file mode 100644
> index 0000000..e1f1576
> --- /dev/null
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -0,0 +1,1913 @@
> +struct qcom_nandc_data {
> +	struct platform_device *pdev;
> +	struct device *dev;
> +
> +	void __iomem *base;
> +	struct resource *res;
> +
> +	struct clk *core_clk;
> +	struct clk *aon_clk;
> +
> +	/* DMA stuff */
> +	struct dma_chan *chan;
> +	struct dma_slave_config	slave_conf;
> +	unsigned int cmd_crci;
> +	unsigned int data_crci;
> +	struct list_head list;
> +	struct completion dma_done;
> +
> +	/* MTD stuff */
> +	struct nand_chip chip;
> +	struct mtd_info mtd;
> +
> +	/* local data buffer and markers */
> +	u8		*data_buffer;
> +	int		buf_size;
> +	int		buf_count;
> +	int		buf_start;
> +
> +	/* local buffer to read back registers */
> +	u32 *reg_read_buf;
> +	int reg_read_pos;
> +
> +	/* required configs */
> +	u32 cfg0, cfg1;
> +	u32 cfg0_raw, cfg1_raw;
> +	u32 ecc_buf_cfg;
> +	u32 ecc_bch_cfg;
> +	u32 clrflashstatus;
> +	u32 clrreadstatus;
> +	u32 sflashc_burst_cfg;
> +	u32 cmd1, vld;
> +
> +	/* register state */
> +	struct nandc_regs *regs;

I also wonder if this is little endian? It looks like some sort
of in memory register map that we point DMA to so that it can
write the values to the actual hardware registers?

> +
> +	/* things we get from DT */
> +	int ecc_strength;
> +	int bus_width;
> +
> +	u32 ecc_modes;
> +
> +	/* misc params */
> +	int cw_size;
> +	int cw_data;
> +	bool use_ecc;
> +	bool bch_enabled;
> +	u8 status;
> +	int last_command;
> +};
[...]
> +
> +static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
> +			 const void *vaddr, int size, bool flow_control)
> +{
> +	struct desc_info *desc;
> +	struct dma_async_tx_descriptor *dma_desc;
> +	struct scatterlist *sgl;
> +	struct dma_slave_config slave_conf;
> +	int r;
> +
> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	list_add_tail(&desc->list, &this->list);

Should we move this list add to at least after the dma_map_sg()?
It looks like on the error path (which is only checked sometimes)
we always call dma_unmap_sg() and so this may have not been
mapped in the first place.

> +
> +	sgl = &desc->sgl;
> +
> +	sg_init_one(sgl, vaddr, size);
> +
> +	desc->dir = read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +
> +	r = dma_map_sg(this->dev, sgl, 1, desc->dir);
> +	if (r == 0) {
> +		r = -ENOMEM;
> +		goto err;
> +	}
> +
> +	memset(&slave_conf, 0x00, sizeof(slave_conf));
> +
> +	slave_conf.device_fc = flow_control;
> +	if (read) {
> +		slave_conf.src_maxburst = 16;
> +		slave_conf.src_addr = this->res->start + reg_off;
> +		slave_conf.slave_id = this->data_crci;
> +	} else {
> +		slave_conf.dst_maxburst = 16;
> +		slave_conf.dst_addr = this->res->start + reg_off;
> +		slave_conf.slave_id = this->cmd_crci;
> +	}
> +
> +	r = dmaengine_slave_config(this->chan, &slave_conf);
> +	if (r) {
> +		dev_err(this->dev, "failed to configure dma channel\n");
> +		goto err;
> +	}
> +
> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
> +	if (!dma_desc) {
> +		dev_err(this->dev, "failed to prepare desc\n");
> +		r = -EINVAL;
> +		goto err;
> +	}
> +
> +	desc->dma_desc = dma_desc;
> +
> +	return 0;
> +err:
> +	kfree(desc);
> +
> +	return r;
> +}
[...]
> +
> +static int submit_descs(struct qcom_nandc_data *this)
> +{
> +	struct completion *c = &this->dma_done;
> +	struct desc_info *desc;
> +	int r;
> +
> +	init_completion(c);
> +
> +	list_for_each_entry(desc, &this->list, list) {
> +		/*
> +		 * we add a callback to the last descriptor in our list to
> +		 * notify completion of command
> +		 */
> +		if (list_is_last(&desc->list, &this->list)) {
> +			desc->dma_desc->callback = dma_callback;
> +			desc->dma_desc->callback_param = this;
> +		}
> +
> +		dmaengine_submit(desc->dma_desc);
> +	}
> +
> +	dma_async_issue_pending(this->chan);
> +
> +	r = wait_for_completion_timeout(c, msecs_to_jiffies(500));
> +	if (!r)
> +		return -ETIMEDOUT;

Any reason this can't all be done with dma_sync_wait()? The
timeout is a little different (5 seconds instead of .5 seconds)
but otherwise it looks like we could keep track of the last
cookie we got from dmaengine_submit() and then call
dma_sync_wait() with that:

	list_for_each_entry(desc, &this->list, list)
		cookie = dmaengine_submit(desc->dma_desc);
	
	if (dma_sync_wait(this->chan, cookie) != DMA_COMPLETE)
		return -ETIMEDOUT;

> +
> +	return 0;
> +}
> +
[...]
> +
> +/*
> + * this is called after NAND_CMD_PAGEPROG and NAND_CMD_ERASE1 to set our
> + * privately maintained status byte, this status byte can be read after
> + * NAND_CMD_STATUS is called
> + */
> +static void parse_erase_write_errors(struct qcom_nandc_data *this, int command)
> +{
> +	struct nand_chip *chip = &this->chip;
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	int num_cw;
> +	int i;
> +
> +	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
> +
> +	for (i = 0; i < num_cw; i++) {
> +		__le32 flash_status = le32_to_cpu(this->reg_read_buf[i]);

So this doesn't need the i * 3 thing? If it does, perhaps
reg_read_buf needs to be of type struct read_stats instead.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
