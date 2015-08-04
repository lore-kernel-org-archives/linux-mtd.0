Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMdm6-0000hu-G3
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:05:08 +0000
Message-ID: <55C0D483.7020405@codeaurora.org>
Date: Tue, 04 Aug 2015 20:34:35 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, agross@codeaurora.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v3 2/5] mtd: nand: Qualcomm NAND controller driver
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1438578498-32254-3-git-send-email-architt@codeaurora.org>
 <20150803233852.GA20229@codeaurora.org>
In-Reply-To: <20150803233852.GA20229@codeaurora.org>
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


On 8/4/2015 5:08 AM, Stephen Boyd wrote:
> On 08/03, Archit Taneja wrote:
>> The Qualcomm NAND controller is found in SoCs like IPQ806x, MSM7xx,
>> MDM9x15 series.
>
> There are some checker errors and le32 usage is not correct:
>
> drivers/mtd/nand/qcom_nandc.c:383:13: warning: mixing different enum types
> drivers/mtd/nand/qcom_nandc.c:383:13:     int enum dma_transfer_direction  versus
> drivers/mtd/nand/qcom_nandc.c:383:13:     int enum dma_data_direction
> drivers/mtd/nand/qcom_nandc.c:741:17: warning: mixing different enum types
> drivers/mtd/nand/qcom_nandc.c:741:17:     int enum dma_transfer_direction  versus
> drivers/mtd/nand/qcom_nandc.c:741:17:     int enum dma_data_direction
> /
> drivers/mtd/nand/qcom_nandc.c:1828:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>
> You can find the le32 problems with
>
> 	make C=2 CF="-D__CHECK_ENDIAN__" drivers/mtd/nand/qcom_nandc.o
>
> Feel free to squash the following in:

Thanks for fixing these issues. I'll squash them in.

>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---8<----
>
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index e1f15766e63d..6cc1df1a6df0 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -173,7 +173,7 @@
>   struct desc_info {
>   	struct list_head list;
>
> -	enum dma_transfer_direction dir;
> +	enum dma_data_direction dir;
>   	struct scatterlist sgl;
>   	struct dma_async_tx_descriptor *dma_desc;
>   };
> @@ -264,7 +264,7 @@ struct qcom_nandc_data {
>   	int		buf_start;
>
>   	/* local buffer to read back registers */
> -	u32 *reg_read_buf;
> +	__le32 *reg_read_buf;
>   	int reg_read_pos;
>
>   	/* required configs */
> @@ -366,6 +366,7 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
>   	struct dma_async_tx_descriptor *dma_desc;
>   	struct scatterlist *sgl;
>   	struct dma_slave_config slave_conf;
> +	enum dma_transfer_direction dir_eng;
>   	int r;
>
>   	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> @@ -378,7 +379,13 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
>
>   	sg_init_one(sgl, vaddr, size);
>
> -	desc->dir = read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +	if (read) {
> +		dir_eng = DMA_DEV_TO_MEM;
> +		desc->dir = DMA_FROM_DEVICE;
> +	} else {
> +		dir_eng = DMA_MEM_TO_DEV;
> +		desc->dir = DMA_TO_DEVICE;
> +	}
>
>   	r = dma_map_sg(this->dev, sgl, 1, desc->dir);
>   	if (r == 0) {
> @@ -405,7 +412,7 @@ static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
>   		goto err;
>   	}
>
> -	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, dir_eng, 0);
>   	if (!dma_desc) {
>   		dev_err(this->dev, "failed to prepare desc\n");
>   		r = -EINVAL;
> @@ -775,7 +782,7 @@ static void parse_erase_write_errors(struct qcom_nandc_data *this, int command)
>   	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
>
>   	for (i = 0; i < num_cw; i++) {
> -		__le32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
> +		u32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
>
>   		if (flash_status & FS_MPU_ERR)
>   			this->status &= ~NAND_STATUS_WP;
> @@ -902,7 +909,7 @@ static bool empty_page_fixup(struct qcom_nandc_data *this, u8 *data_buf)
>
>   	for (i = 0; i < cwperpage; i++) {
>   		u8 *empty1, *empty2;
> -		__le32 flash_status = le32_to_cpu(this->reg_read_buf[3 * i]);
> +		u32 flash_status = le32_to_cpu(this->reg_read_buf[3 * i]);
>
>   		/*
>   		 * an erased page flags an error in NAND_FLASH_STATUS, check if
> @@ -968,37 +975,37 @@ static int parse_read_errors(struct qcom_nandc_data *this, bool erased_page)
>   	int cwperpage = ecc->steps;
>   	unsigned int max_bitflips = 0;
>   	int i;
> +	struct read_stats *buf;
>
> -	for (i = 0; i < cwperpage; i++) {
> -		int stat;
> -		struct read_stats *buf;
> -
> -		buf = (struct read_stats *) (this->reg_read_buf + 3 * i);
> +	buf = (struct read_stats *)this->reg_read_buf;
> +	for (i = 0; i < cwperpage; i++, buf++) {
> +		unsigned int stat;
> +		u32 flash, buffer, erased_cw;
>
> -		buf->flash = le32_to_cpu(buf->flash);
> -		buf->buffer = le32_to_cpu(buf->buffer);
> -		buf->erased_cw = le32_to_cpu(buf->erased_cw);
> +		flash = le32_to_cpu(buf->flash);
> +		buffer = le32_to_cpu(buf->buffer);
> +		erased_cw = le32_to_cpu(buf->erased_cw);
>
> -		if (buf->flash & (FS_OP_ERR | FS_MPU_ERR)) {
> +		if (flash & (FS_OP_ERR | FS_MPU_ERR)) {
>
>   			/* ignore erased codeword errors */
>   			if (this->bch_enabled) {
> -				if ((buf->erased_cw & ERASED_CW) == ERASED_CW)
> +				if ((erased_cw & ERASED_CW) == ERASED_CW)
>   					continue;
>   			} else if (erased_page) {
>   				continue;
>   			}
>
> -			if (buf->buffer & BS_UNCORRECTABLE_BIT) {
> +			if (buffer & BS_UNCORRECTABLE_BIT) {
>   				mtd->ecc_stats.failed++;
>   				continue;
>   			}
>   		}
>
> -		stat = buf->buffer & BS_CORRECTABLE_ERR_MSK;
> +		stat = buffer & BS_CORRECTABLE_ERR_MSK;
>   		mtd->ecc_stats.corrected += stat;
>
> -		max_bitflips = max_t(unsigned int, max_bitflips, stat);
> +		max_bitflips = max(max_bitflips, stat);
>   	}
>
>   	return max_bitflips;
> @@ -1825,7 +1832,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>
> -	this->ecc_modes = (u32) dev_data;
> +	this->ecc_modes = (unsigned long)dev_data;
>
>   	this->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	this->base = devm_ioremap_resource(&pdev->dev, this->res);
>
>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
>> new file mode 100644
>> index 0000000..e1f1576
>> --- /dev/null
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -0,0 +1,1913 @@
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
>
> I also wonder if this is little endian? It looks like some sort
> of in memory register map that we point DMA to so that it can
> write the values to the actual hardware registers?

Yes, that's what it's supposed to do. I kept it in the form above
so that updating the register map is as easy as assigning a new
value to the member.

I've tried to fix it for endianness in the diff below. I created
some funcs to not flood the driver with cpu_to_le32() calls. Does
it look okay?

--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -183,26 +183,26 @@ struct desc_info {
   * chunk of memory which we use to write the controller registers 
through DMA.
   */
  struct nandc_regs {
-	u32 cmd;
-	u32 addr0;
-	u32 addr1;
-	u32 chip_sel;
-	u32 exec;
-
-	u32 cfg0;
-	u32 cfg1;
-	u32 ecc_bch_cfg;
+	__le32 cmd;
+	__le32 addr0;
+	__le32 addr1;
+	__le32 chip_sel;
+	__le32 exec;

-	u32 clrflashstatus;
-	u32 clrreadstatus;
+	__le32 cfg0;
+	__le32 cfg1;
+	__le32 ecc_bch_cfg;

-	u32 cmd1;
-	u32 vld;
+	__le32 clrflashstatus;
+	__le32 clrreadstatus;

-	u32 orig_cmd1;
-	u32 orig_vld;
+	__le32 cmd1;
+	__le32 vld;

-	u32 ecc_buf_cfg;
+	__le32 orig_cmd1;
+	__le32 orig_vld;
+
+	__le32 ecc_buf_cfg;
  };

  /*
@@ -306,17 +306,65 @@ static inline void nandc_write(struct 
qcom_nandc_data *this, int offset,
  	iowrite32(val, this->base + offset);
  }

+static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
+{
+	switch (offset) {
+	case NAND_FLASH_CMD:
+		return &regs->cmd;
+	case NAND_ADDR0:
+		return &regs->addr0;
+	case NAND_ADDR1:
+		return &regs->addr1;
+	case NAND_FLASH_CHIP_SELECT:
+		return &regs->chip_sel;
+	case NAND_EXEC_CMD:
+		return &regs->exec;
+	case NAND_FLASH_STATUS:
+		return &regs->clrflashstatus;
+	case NAND_DEV0_CFG0:
+		return &regs->cfg0;
+	case NAND_DEV0_CFG1:
+		return &regs->cfg1;
+	case NAND_DEV0_ECC_CFG:
+		return &regs->ecc_bch_cfg;
+	case NAND_READ_STATUS:
+		return &regs->clrreadstatus;
+	case NAND_DEV_CMD1:
+		return &regs->cmd1;
+	case NAND_DEV_CMD1_RESTORE:
+		return &regs->orig_cmd1;
+	case NAND_DEV_CMD_VLD:
+		return &regs->vld;
+	case NAND_DEV_CMD_VLD_RESTORE:
+		return &regs->orig_vld;
+	case NAND_EBI2_ECC_BUF_CFG:
+		return &regs->ecc_buf_cfg;
+	default:
+		return NULL;
+	}
+}
+
+static void set_nandc_reg(struct qcom_nandc_data *this, int offset, u32 
val)
+{
+	struct nandc_regs *regs = this->regs;
+	__le32 *reg;
+
+	reg = offset_to_nandc_reg(regs, offset);
+
+	if (reg)
+		*reg = cpu_to_le32(val);
+}
+
  /* helper to configure address register values */
  static void set_address(struct qcom_nandc_data *this, u16 column, int 
page)
  {
  	struct nand_chip *chip = &this->chip;
-	struct nandc_regs *regs = this->regs;

  	if (chip->options & NAND_BUSWIDTH_16)
  		column >>= 1;

-	regs->addr0 = page << 16 | column;
-	regs->addr1 = page >> 16 & 0xff;
+	set_nandc_reg(this, NAND_ADDR0, page << 16 | column);
+	set_nandc_reg(this, NAND_ADDR1, page >> 16 & 0xff);
  }

  /*
@@ -328,35 +376,39 @@ static void set_address(struct qcom_nandc_data 
*this, u16 column, int page)
   */
  static void update_rw_regs(struct qcom_nandc_data *this, int num_cw, 
bool read)
  {
-	struct nandc_regs *regs = this->regs;
+	u32 cmd, cfg0, cfg1, ecc_bch_cfg;

  	if (read) {
  		if (this->use_ecc)
-			regs->cmd = PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
+			cmd = PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
  		else
-			regs->cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
+			cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
  	} else {
-			regs->cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
+			cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
  	}

  	if (this->use_ecc) {
-		regs->cfg0 = (this->cfg0 & ~(7U << CW_PER_PAGE)) |
+		cfg0 = (this->cfg0 & ~(7U << CW_PER_PAGE)) |
  				(num_cw - 1) << CW_PER_PAGE;

-		regs->cfg1 = this->cfg1;
-		regs->ecc_bch_cfg = this->ecc_bch_cfg;
+		cfg1 = this->cfg1;
+		ecc_bch_cfg = this->ecc_bch_cfg;
  	} else {
-		regs->cfg0 = (this->cfg0_raw & ~(7U << CW_PER_PAGE)) |
+		cfg0 = (this->cfg0_raw & ~(7U << CW_PER_PAGE)) |
  				(num_cw - 1) << CW_PER_PAGE;

-		regs->cfg1 = this->cfg1_raw;
-		regs->ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
+		cfg1 = this->cfg1_raw;
+		ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
  	}

-	regs->ecc_buf_cfg = this->ecc_buf_cfg;
-	regs->clrflashstatus = this->clrflashstatus;
-	regs->clrreadstatus = this->clrreadstatus;
-	regs->exec = 1;
+	set_nandc_reg(this, NAND_FLASH_CMD, cmd);
+	set_nandc_reg(this, NAND_DEV0_CFG0, cfg0);
+	set_nandc_reg(this, NAND_DEV0_CFG1, cfg1);
+	set_nandc_reg(this, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
+	set_nandc_reg(this, NAND_EBI2_ECC_BUF_CFG, this->ecc_buf_cfg);
+	set_nandc_reg(this, NAND_FLASH_STATUS, this->clrflashstatus);
+	set_nandc_reg(this, NAND_READ_STATUS, this->clrreadstatus);
+	set_nandc_reg(this, NAND_EXEC_CMD, 1);
  }

  static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int 
reg_off,
@@ -465,44 +517,16 @@ static int write_reg_dma(struct qcom_nandc_data 
*this, int first, int num_regs)
  	void *vaddr;
  	int size;

-	switch (first) {
-	case NAND_FLASH_CMD:
-		vaddr = &regs->cmd;
+	vaddr = offset_to_nandc_reg(regs, first);
+
+	if (first == NAND_FLASH_CMD)
  		flow_control = true;
-		break;
-	case NAND_EXEC_CMD:
-		vaddr = &regs->exec;
-		break;
-	case NAND_FLASH_STATUS:
-		vaddr = &regs->clrflashstatus;
-		break;
-	case NAND_DEV0_CFG0:
-		vaddr = &regs->cfg0;
-		break;
-	case NAND_READ_STATUS:
-		vaddr = &regs->clrreadstatus;
-		break;
-	case NAND_DEV_CMD1:
-		vaddr = &regs->cmd1;
-		break;
-	case NAND_DEV_CMD1_RESTORE:
+
+	if (first == NAND_DEV_CMD1_RESTORE)
  		first = NAND_DEV_CMD1;
-		vaddr = &regs->orig_cmd1;
-		break;
-	case NAND_DEV_CMD_VLD:
-		vaddr = &regs->vld;
-		break;
-	case NAND_DEV_CMD_VLD_RESTORE:
+
+	if (first == NAND_DEV_CMD_VLD_RESTORE)
  		first = NAND_DEV_CMD_VLD;
-		vaddr = &regs->orig_vld;
-		break;
-	case NAND_EBI2_ECC_BUF_CFG:
-		vaddr = &regs->ecc_buf_cfg;
-		break;
-	default:
-		dev_err(this->dev, "invalid starting register\n");
-		return -EINVAL;
-	}

  	size = num_regs * sizeof(u32);

@@ -582,42 +606,40 @@ static void config_cw_write_post(struct 
qcom_nandc_data *this)
  /* sets up descriptors for NAND_CMD_PARAM */
  static int nandc_param(struct qcom_nandc_data *this)
  {
-	struct nandc_regs *regs = this->regs;
-
  	/*
  	 * NAND_CMD_PARAM is called before we know much about the FLASH chip
  	 * in use. we configure the controller to perform a raw read of 512
  	 * bytes to read onfi params
  	 */
-	regs->cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
-	regs->addr0 = 0;
-	regs->addr1 = 0;
-	regs->cfg0 =  0 << CW_PER_PAGE
-			| 512 << UD_SIZE_BYTES
-			| 5 << NUM_ADDR_CYCLES
-			| 0 << SPARE_SIZE_BYTES;
-
-	regs->cfg1 =  7 << NAND_RECOVERY_CYCLES
-			| 0 << CS_ACTIVE_BSY
-			| 17 << BAD_BLOCK_BYTE_NUM
-			| 1 << BAD_BLOCK_IN_SPARE_AREA
-			| 2 << WR_RD_BSY_GAP
-			| 0 << WIDE_FLASH
-			| 1 << DEV0_CFG1_ECC_DISABLE;
-
-	regs->ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
+	set_nandc_reg(this, NAND_FLASH_CMD, PAGE_READ | PAGE_ACC | LAST_PAGE);
+	set_nandc_reg(this, NAND_ADDR0, 0);
+	set_nandc_reg(this, NAND_ADDR1, 0);
+	set_nandc_reg(this, NAND_DEV0_CFG0, 0 << CW_PER_PAGE
+					| 512 << UD_SIZE_BYTES
+					| 5 << NUM_ADDR_CYCLES
+					| 0 << SPARE_SIZE_BYTES);
+	set_nandc_reg(this, NAND_DEV0_CFG1, 7 << NAND_RECOVERY_CYCLES
+					| 0 << CS_ACTIVE_BSY
+					| 17 << BAD_BLOCK_BYTE_NUM
+					| 1 << BAD_BLOCK_IN_SPARE_AREA
+					| 2 << WR_RD_BSY_GAP
+					| 0 << WIDE_FLASH
+					| 1 << DEV0_CFG1_ECC_DISABLE);
+	set_nandc_reg(this, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);

-	/* configure CMD1 and VLD for ONFI param probing */
-	regs->vld = (this->vld & ~(1 << READ_START_VLD))
-			| 0 << READ_START_VLD;

-	regs->cmd1 = (this->cmd1 & ~(0xFF << READ_ADDR))
-			| NAND_CMD_PARAM << READ_ADDR;
+	/* configure CMD1 and VLD for ONFI param probing */
+	set_nandc_reg(this, NAND_DEV_CMD_VLD,
+				(this->vld & ~(1 << READ_START_VLD))
+				| 0 << READ_START_VLD);
+	set_nandc_reg(this, NAND_DEV_CMD1,
+				(this->cmd1 & ~(0xFF << READ_ADDR))
+				| NAND_CMD_PARAM << READ_ADDR);

-	regs->exec = 1;
+	set_nandc_reg(this, NAND_EXEC_CMD, 1);

-	regs->orig_cmd1 = this->cmd1;
-	regs->orig_vld = this->vld;
+	set_nandc_reg(this, NAND_DEV_CMD1_RESTORE, this->cmd1);
+	set_nandc_reg(this, NAND_DEV_CMD_VLD_RESTORE, this->vld);

  	write_reg_dma(this, NAND_DEV_CMD_VLD, 1);
  	write_reg_dma(this, NAND_DEV_CMD1, 1);
@@ -639,16 +661,15 @@ static int nandc_param(struct qcom_nandc_data *this)
  /* sets up descriptors for NAND_CMD_ERASE1 */
  static int erase_block(struct qcom_nandc_data *this, int page_addr)
  {
-	struct nandc_regs *regs = this->regs;
-
-	regs->cmd = BLOCK_ERASE | PAGE_ACC | LAST_PAGE;
-	regs->addr0 = page_addr;
-	regs->addr1 = 0;
-	regs->cfg0 = this->cfg0_raw & ~(7 << CW_PER_PAGE);
-	regs->cfg1 = this->cfg1_raw;
-	regs->exec = 1;
-	regs->clrflashstatus = this->clrflashstatus;
-	regs->clrreadstatus = this->clrreadstatus;
+	set_nandc_reg(this, NAND_FLASH_CMD, BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
+	set_nandc_reg(this, NAND_ADDR0, page_addr);
+	set_nandc_reg(this, NAND_ADDR1, 0);
+	set_nandc_reg(this, NAND_DEV0_CFG0,
+				this->cfg0_raw & ~(7 << CW_PER_PAGE));
+	set_nandc_reg(this, NAND_DEV0_CFG1, this->cfg1_raw);
+	set_nandc_reg(this, NAND_EXEC_CMD, 1);
+	set_nandc_reg(this, NAND_FLASH_STATUS, this->clrflashstatus);
+	set_nandc_reg(this, NAND_READ_STATUS, this->clrreadstatus);

  	write_reg_dma(this, NAND_FLASH_CMD, 3);
  	write_reg_dma(this, NAND_DEV0_CFG0, 2);
@@ -665,16 +686,14 @@ static int erase_block(struct qcom_nandc_data 
*this, int page_addr)
  /* sets up descriptors for NAND_CMD_READID */
  static int read_id(struct qcom_nandc_data *this, int column)
  {
-	struct nandc_regs *regs = this->regs;
-
  	if (column == -1)
  		return 0;

-	regs->cmd = FETCH_ID;
-	regs->addr0 = column;
-	regs->addr1 = 0;
-	regs->chip_sel = DM_EN;
-	regs->exec = 1;
+	set_nandc_reg(this, NAND_FLASH_CMD, FETCH_ID);
+	set_nandc_reg(this, NAND_ADDR0, column);
+	set_nandc_reg(this, NAND_ADDR1, 0);
+	set_nandc_reg(this, NAND_FLASH_CHIP_SELECT, DM_EN);
+	set_nandc_reg(this, NAND_EXEC_CMD, 1);

  	write_reg_dma(this, NAND_FLASH_CMD, 4);
  	write_reg_dma(this, NAND_EXEC_CMD, 1);
@@ -687,10 +706,8 @@ static int read_id(struct qcom_nandc_data *this, 
int column)
  /* sets up descriptors for NAND_CMD_RESET */
  static int reset(struct qcom_nandc_data *this)
  {
-	struct nandc_regs *regs = this->regs;
-
-	regs->cmd = RESET_DEVICE;
-	regs->exec = 1;
+	set_nandc_reg(this, NAND_FLASH_CMD, RESET_DEVICE);
+	set_nandc_reg(this, NAND_EXEC_CMD, 1);

  	write_reg_dma(this, NAND_FLASH_CMD, 1);
  	write_reg_dma(this, NAND_EXEC_CMD, 1);

>
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
> [...]
>> +
>> +static int prep_dma_desc(struct qcom_nandc_data *this, bool read, int reg_off,
>> +			 const void *vaddr, int size, bool flow_control)
>> +{
>> +	struct desc_info *desc;
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	struct scatterlist *sgl;
>> +	struct dma_slave_config slave_conf;
>> +	int r;
>> +
>> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	list_add_tail(&desc->list, &this->list);
>
> Should we move this list add to at least after the dma_map_sg()?
> It looks like on the error path (which is only checked sometimes)
> we always call dma_unmap_sg() and so this may have not been
> mapped in the first place.

The error path isn't checked by the callers of this func, so, it's
best to keep it later as you suggested.

>
>> +
>> +	sgl = &desc->sgl;
>> +
>> +	sg_init_one(sgl, vaddr, size);
>> +
>> +	desc->dir = read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
>> +
>> +	r = dma_map_sg(this->dev, sgl, 1, desc->dir);
>> +	if (r == 0) {
>> +		r = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	memset(&slave_conf, 0x00, sizeof(slave_conf));
>> +
>> +	slave_conf.device_fc = flow_control;
>> +	if (read) {
>> +		slave_conf.src_maxburst = 16;
>> +		slave_conf.src_addr = this->res->start + reg_off;
>> +		slave_conf.slave_id = this->data_crci;
>> +	} else {
>> +		slave_conf.dst_maxburst = 16;
>> +		slave_conf.dst_addr = this->res->start + reg_off;
>> +		slave_conf.slave_id = this->cmd_crci;
>> +	}
>> +
>> +	r = dmaengine_slave_config(this->chan, &slave_conf);
>> +	if (r) {
>> +		dev_err(this->dev, "failed to configure dma channel\n");
>> +		goto err;
>> +	}
>> +
>> +	dma_desc = dmaengine_prep_slave_sg(this->chan, sgl, 1, desc->dir, 0);
>> +	if (!dma_desc) {
>> +		dev_err(this->dev, "failed to prepare desc\n");
>> +		r = -EINVAL;
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
> [...]
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
>> +		 * we add a callback to the last descriptor in our list to
>> +		 * notify completion of command
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
>> +		return -ETIMEDOUT;
>
> Any reason this can't all be done with dma_sync_wait()? The
> timeout is a little different (5 seconds instead of .5 seconds)
> but otherwise it looks like we could keep track of the last
> cookie we got from dmaengine_submit() and then call
> dma_sync_wait() with that:
>
> 	list_for_each_entry(desc, &this->list, list)
> 		cookie = dmaengine_submit(desc->dma_desc);
> 	
> 	if (dma_sync_wait(this->chan, cookie) != DMA_COMPLETE)
> 		return -ETIMEDOUT;

I didn't know about this function, will give it a try.

>
>> +
>> +	return 0;
>> +}
>> +
> [...]
>> +
>> +/*
>> + * this is called after NAND_CMD_PAGEPROG and NAND_CMD_ERASE1 to set our
>> + * privately maintained status byte, this status byte can be read after
>> + * NAND_CMD_STATUS is called
>> + */
>> +static void parse_erase_write_errors(struct qcom_nandc_data *this, int command)
>> +{
>> +	struct nand_chip *chip = &this->chip;
>> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>> +	int num_cw;
>> +	int i;
>> +
>> +	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
>> +
>> +	for (i = 0; i < num_cw; i++) {
>> +		__le32 flash_status = le32_to_cpu(this->reg_read_buf[i]);
>
> So this doesn't need the i * 3 thing? If it does, perhaps
> reg_read_buf needs to be of type struct read_stats instead.

We just read back one register per codeword here, so we can't do
the read_stats thing as before. I could read back the extra registers
and discrading them, but I'd I'll leave that for later.

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
