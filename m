Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8CCCA481
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 01:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+vKcIrwkmg0U7sKX3J2FkAGYEs5WRR72oiMyzU6IwE=; b=AKm6yqSBfjHO0j
	febX/P6BSFt9tNaCAg/t8KTX8adPmt6+J03IIC8y9vsgii74lBHn9UAtCbW8XyNohIwDBauQWgNpg
	8E5GzOTfgVPaQx9aDEnynNmUBRYXbRBainxqCD9e8DVlmRf5C7WhDu+KQRFtVbYz6ZjMoIgOqbczi
	0LnEoW3zFQlCiTrwUoiWDF9dZze4rgupSOrfGWHqDMMcljOuF+S+1umTMxjFoYja9DrG3CpVTloqx
	Q+URp5HLlmWcgWOESVS++uL0p7iuBg5QS8PE2vHjWH2HuLyOkidLQwr4TciZML0n7EEcOzPLmI53m
	DgRoNBB0NSlpqHRMD1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOL-00ByOx-Ki; Wed, 15 Jun 2022 01:00:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOH-00ByM7-Fn
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 01:00:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id i81-20020a1c3b54000000b0039c76434147so285588wma.1
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 18:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Hg5uRFStx3WS0kTKnxQCOQKCrzVsjeN7435gZhvinI=;
        b=TuGiKHWsdqE5qoMksWCE7et9bkykyGuNrqLTDoDvBo2X45m2ExOUukLStTvjN3WpI6
         5bFBA1qJAW7e2h71q88pb2IeO9a9XyZ27oL4LrTkCT0a2csit7nNUZ73SO+xs2uWgKrv
         7lFtIYOWk54ovUXRKAIo73qYRubH0WgLyz8QgAugFVnIPDbgn2r099N6wDkMcuQqQkLv
         jwXP38XVSYSQaQBN5WJxqUEnjlcXp/QpfSJyUZSXWaIAoNBWkmXfkCKBumdqTxifbpnZ
         hshzJ7kiNgIxSII6cnKo8dn5g/6IWdEklgg2vv6poghoH1D5CGBEzGwNfBsMx54VHa1P
         PaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Hg5uRFStx3WS0kTKnxQCOQKCrzVsjeN7435gZhvinI=;
        b=cNMSOl7f8cWozeLS5a7UUNb8PoSb+eV9lXV9agy64s1Aw0/0o+WoNLTVMash3jpkIJ
         IKn9Hknq89k05Ij+Z/5F8LHOjVtrJI4kiKSCADOZts7cr0p1KZI9mxUTgsUsu8IA2AlB
         3NqTxRV58OOFkpAW3gzS78htJkGj71y4e6D17LLKclsjxmkpV1pBgns0mZTFepc2GQe8
         YJ/OwjAQIH+AnG7se4Le3C7Q5Bl0DYo+vsnGbo5+dH705838ehzKiTUu0VnahM+3aWZ/
         +czF8jqNFzGW0chxJcl7nVNW11l8YzHUW1ZIPHKReRLEuNE+Pd9tWG4DCKyDIK07tByT
         9rzQ==
X-Gm-Message-State: AOAM530FMY1Jq8osmzOQgupKno6SbRTwudUsFFQCfN2ycXjJZbEKXyi4
	wfKNndYhTSSPUC6qCaqQ8uk=
X-Google-Smtp-Source: ABdhPJxIZFFPi1d0J2SQkKqrfzLF3FEe3HyApFazV18Din98fNplIpfzD2oZwwaKhWQnHz6yCdTVIw==
X-Received: by 2002:a05:600c:294a:b0:39c:4df5:f825 with SMTP id n10-20020a05600c294a00b0039c4df5f825mr6978769wmd.55.1655254810377;
        Tue, 14 Jun 2022 18:00:10 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d698a000000b0021020517639sm12890265wru.102.2022.06.14.18.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 18:00:06 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v7 1/3] mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
Date: Wed, 15 Jun 2022 02:06:10 +0200
Message-Id: <20220615000612.3119-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615000612.3119-1-ansuelsmth@gmail.com>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_180013_571732_D8F904A4 
X-CRM114-Status: GOOD (  24.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reorder structs in nandc driver to save holes.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 107 +++++++++++++++++-------------
 1 file changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1a77542c6d67..f2990d721733 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -238,6 +238,9 @@ nandc_set_reg(chip, reg,			\
  * @bam_ce - the array of BAM command elements
  * @cmd_sgl - sgl for NAND BAM command pipe
  * @data_sgl - sgl for NAND BAM consumer/producer pipe
+ * @last_data_desc - last DMA desc in data channel (tx/rx).
+ * @last_cmd_desc - last DMA desc in command channel.
+ * @txn_done - completion for NAND transfer.
  * @bam_ce_pos - the index in bam_ce which is available for next sgl
  * @bam_ce_start - the index in bam_ce which marks the start position ce
  *		   for current sgl. It will be used for size calculation
@@ -250,14 +253,14 @@ nandc_set_reg(chip, reg,			\
  * @rx_sgl_start - start index in data sgl for rx.
  * @wait_second_completion - wait for second DMA desc completion before making
  *			     the NAND transfer completion.
- * @txn_done - completion for NAND transfer.
- * @last_data_desc - last DMA desc in data channel (tx/rx).
- * @last_cmd_desc - last DMA desc in command channel.
  */
 struct bam_transaction {
 	struct bam_cmd_element *bam_ce;
 	struct scatterlist *cmd_sgl;
 	struct scatterlist *data_sgl;
+	struct dma_async_tx_descriptor *last_data_desc;
+	struct dma_async_tx_descriptor *last_cmd_desc;
+	struct completion txn_done;
 	u32 bam_ce_pos;
 	u32 bam_ce_start;
 	u32 cmd_sgl_pos;
@@ -267,25 +270,23 @@ struct bam_transaction {
 	u32 rx_sgl_pos;
 	u32 rx_sgl_start;
 	bool wait_second_completion;
-	struct completion txn_done;
-	struct dma_async_tx_descriptor *last_data_desc;
-	struct dma_async_tx_descriptor *last_cmd_desc;
 };
 
 /*
  * This data type corresponds to the nand dma descriptor
+ * @dma_desc - low level DMA engine descriptor
  * @list - list for desc_info
- * @dir - DMA transfer direction
+ *
  * @adm_sgl - sgl which will be used for single sgl dma descriptor. Only used by
  *	      ADM
  * @bam_sgl - sgl which will be used for dma descriptor. Only used by BAM
  * @sgl_cnt - number of SGL in bam_sgl. Only used by BAM
- * @dma_desc - low level DMA engine descriptor
+ * @dir - DMA transfer direction
  */
 struct desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
 	struct list_head node;
 
-	enum dma_data_direction dir;
 	union {
 		struct scatterlist adm_sgl;
 		struct {
@@ -293,7 +294,7 @@ struct desc_info {
 			int sgl_cnt;
 		};
 	};
-	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
 };
 
 /*
@@ -337,52 +338,64 @@ struct nandc_regs {
 /*
  * NAND controller data struct
  *
- * @controller:			base controller structure
- * @host_list:			list containing all the chips attached to the
- *				controller
  * @dev:			parent device
+ *
  * @base:			MMIO base
- * @base_phys:			physical base address of controller registers
- * @base_dma:			dma base address of controller registers
+ *
  * @core_clk:			controller clock
  * @aon_clk:			another controller clock
  *
+ * @regs:			a contiguous chunk of memory for DMA register
+ *				writes. contains the register values to be
+ *				written to controller
+ *
+ * @props:			properties of current NAND controller,
+ *				initialized via DT match data
+ *
+ * @controller:			base controller structure
+ * @host_list:			list containing all the chips attached to the
+ *				controller
+ *
  * @chan:			dma channel
  * @cmd_crci:			ADM DMA CRCI for command flow control
  * @data_crci:			ADM DMA CRCI for data flow control
+ *
  * @desc_list:			DMA descriptor list (list of desc_infos)
  *
  * @data_buffer:		our local DMA buffer for page read/writes,
  *				used when we can't use the buffer provided
  *				by upper layers directly
- * @buf_size/count/start:	markers for chip->legacy.read_buf/write_buf
- *				functions
  * @reg_read_buf:		local buffer for reading back registers via DMA
+ *
+ * @base_phys:			physical base address of controller registers
+ * @base_dma:			dma base address of controller registers
  * @reg_read_dma:		contains dma address for register read buffer
- * @reg_read_pos:		marker for data read in reg_read_buf
  *
- * @regs:			a contiguous chunk of memory for DMA register
- *				writes. contains the register values to be
- *				written to controller
- * @cmd1/vld:			some fixed controller register values
- * @props:			properties of current NAND controller,
- *				initialized via DT match data
+ * @buf_size/count/start:	markers for chip->legacy.read_buf/write_buf
+ *				functions
  * @max_cwperpage:		maximum QPIC codewords required. calculated
  *				from all connected NAND devices pagesize
+ *
+ * @reg_read_pos:		marker for data read in reg_read_buf
+ *
+ * @cmd1/vld:			some fixed controller register values
  */
 struct qcom_nand_controller {
-	struct nand_controller controller;
-	struct list_head host_list;
-
 	struct device *dev;
 
 	void __iomem *base;
-	phys_addr_t base_phys;
-	dma_addr_t base_dma;
 
 	struct clk *core_clk;
 	struct clk *aon_clk;
 
+	struct nandc_regs *regs;
+	struct bam_transaction *bam_txn;
+
+	const struct qcom_nandc_props *props;
+
+	struct nand_controller controller;
+	struct list_head host_list;
+
 	union {
 		/* will be used only by QPIC for BAM DMA */
 		struct {
@@ -400,22 +413,22 @@ struct qcom_nand_controller {
 	};
 
 	struct list_head desc_list;
-	struct bam_transaction *bam_txn;
 
 	u8		*data_buffer;
+	__le32		*reg_read_buf;
+
+	phys_addr_t base_phys;
+	dma_addr_t base_dma;
+	dma_addr_t reg_read_dma;
+
 	int		buf_size;
 	int		buf_count;
 	int		buf_start;
 	unsigned int	max_cwperpage;
 
-	__le32 *reg_read_buf;
-	dma_addr_t reg_read_dma;
 	int reg_read_pos;
 
-	struct nandc_regs *regs;
-
 	u32 cmd1, vld;
-	const struct qcom_nandc_props *props;
 };
 
 /*
@@ -431,19 +444,21 @@ struct qcom_nand_controller {
  *				and reserved bytes
  * @cw_data:			the number of bytes within a codeword protected
  *				by ECC
- * @use_ecc:			request the controller to use ECC for the
- *				upcoming read/write
- * @bch_enabled:		flag to tell whether BCH ECC mode is used
  * @ecc_bytes_hw:		ECC bytes used by controller hardware for this
  *				chip
- * @status:			value to be returned if NAND_CMD_STATUS command
- *				is executed
+ *
  * @last_command:		keeps track of last command on this chip. used
  *				for reading correct status
  *
  * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
  *				ecc/non-ecc mode for the current nand flash
  *				device
+ *
+ * @status:			value to be returned if NAND_CMD_STATUS command
+ *				is executed
+ * @use_ecc:			request the controller to use ECC for the
+ *				upcoming read/write
+ * @bch_enabled:		flag to tell whether BCH ECC mode is used
  */
 struct qcom_nand_host {
 	struct nand_chip chip;
@@ -452,12 +467,10 @@ struct qcom_nand_host {
 	int cs;
 	int cw_size;
 	int cw_data;
-	bool use_ecc;
-	bool bch_enabled;
 	int ecc_bytes_hw;
 	int spare_bytes;
 	int bbm_size;
-	u8 status;
+
 	int last_command;
 
 	u32 cfg0, cfg1;
@@ -466,23 +479,27 @@ struct qcom_nand_host {
 	u32 ecc_bch_cfg;
 	u32 clrflashstatus;
 	u32 clrreadstatus;
+
+	u8 status;
+	bool use_ecc;
+	bool bch_enabled;
 };
 
 /*
  * This data type corresponds to the NAND controller properties which varies
  * among different NAND controllers.
  * @ecc_modes - ecc mode for NAND
+ * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
  * @qpic_v2 - flag to indicate QPIC IP version 2
- * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
+	u32 dev_cmd_reg_start;
 	bool is_bam;
 	bool is_qpic;
 	bool qpic_v2;
-	u32 dev_cmd_reg_start;
 };
 
 /* Frees the BAM transaction memory */
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
