Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D197C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3AepM6kt6YFJESzTGvIPkuG6VqqJSQfwpBSg1j2iEg=; b=H+uQH8YR9wc58V
	f0m/VEyEXn4RCXsrvd1B5ZOpc5f8+StcEnOqPYuwGP5HEN8dEf4JgvQCt0YoF5c/mzcBFSF5OkCsz
	wJOsuB0OYNeIjWsWIw0baHdEytFtdWz8Jewdbu9fTfbqY95sLaWqWIe2M4YvUJ646UbmailBFd2j9
	4oYnJoCioZi+9iSitLLS5exSAVGiH+LlcAoi1NtTdS2tlgRiRF9ZAW2vtqfbfQXakgxHaJVvfQAvU
	0deiZotbDYVBKprxBEz2X//nneUCqxVJ/dhV7bw1poPONqvKTlVlowbibCuBm9QCzmZOeuIOnr4hz
	YiIpXE+UratQoTnSRMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldl-00000002lfN-3JlB;
	Fri, 17 Jul 2026 16:42:21 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklde-00000002lVM-3zyH
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:16 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7eb4d8a21a8so3001133a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306533; x=1784911333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBmmy8W22qacqO6CsFuVEthSgchjWOCosdpbxtawDI0=;
        b=Z8rtwrYZsRTfCnNfgooUXJI1xLdZCqlG+P0veeN9f3A3GzcWJ2hvyfUUpRW102iMdp
         2BHgOgIvuCBHM0J2Z0A1Req+9Ahj7OGVMtgrtfkoxk1V1wFycOewm5+Gpv2CrXFxbVlI
         RIveK0KRRqzWS5xCBT+ivEkR5lg1sTdVOd8aEOcCnHQgd1Nq4whrQPsP2gutTXd0TFvZ
         GMdhdysXuHMeHqpcBg1PSn0358UmpOxQa1t6+h6ZontUUAFim6ltnTnd/ucCYvtt8Crc
         s/KhcxnTjdXJ/HEnu0oQ1357sy2F+IVrUgyMYVYSy3ZAF0UGpmiYtR98MRqqBjA4bTQN
         bAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306533; x=1784911333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBmmy8W22qacqO6CsFuVEthSgchjWOCosdpbxtawDI0=;
        b=COsb7iLDEs+yeqA3Lu+ueenTlqTIrIVv07HEDdss/+HxOWvHDvvxmDvPHvI4/2mt5K
         Whl7OXhge9DhNs0rPJkpBbRyHER0ObovR72+fKbNe9ezMqanRUmo0fnPCCb0+DVM7FQC
         JG93AZVA6NENyG7i0YnmkivK2oFFe1fFVa05CRHGCPx/pWUsJ6Jp1C8/kGAEqgEfQdVu
         c0ELWrFeNnULLPp7hdlGlzkZFWDcSWnmjMIIYvdiMeBPLC5xgaMm8xWGx/ps3F3wgtbm
         IJPhstakBJMrgwuKCxRbbSLkhI3C7jXEVzUG76FmHsydJxWEfH97Tbdc8kshEcSE4MHW
         ydqg==
X-Gm-Message-State: AOJu0Yz890/kPEsVKkqrBj0eHrVdfkFYpd/FBXtZrCa2hXjd81Pb4hLE
	DRjbJUe0vOZ3lbNv92AIQkxqCgCWr7sdt44dkXzVT8XFRvarYC3+NMrxWMf62f3VlEc=
X-Gm-Gg: AfdE7cmbf0NKHNZ0nzt5btdLokTK1KP4puW1m074RxCiX9N2oOqNNKmJnpL0Md7AoxR
	K3rMi8OC9qFezF9PAyKChNMOw0/DLMEwZR8o9i947HMoQ2EhJeD732Q7lqHC+vcg1X8/r+Ketje
	ClvA864i6kxlbZDqQAtfvDgCAqL2iXFm08fLp//nI9D/YVuuClRKHHReZ27GG+c5PFcgivHGHO/
	UmUgPHAreBLB54YpBAJdSCo/s3XYptmqdNeGrOYQp/usXLCY0l4bSh1qcoAWZCu5ZhgZx9/hRWE
	uwRNrPAV5Clk94k8LB7mrK0mtdkZfyPs0WUQGQg8dV07kJs4W0V1GKxLsAWqlCjgKuIGcoip8+p
	iM3yBYytPKr3yX6O8DLjX5RiFHoZfcdlNsltVwP8CTIP0LF0Y4VQR0QdgbpSQKnUbBGu5TyUaxB
	2PiNYIUJZnsF9TQ7C2j6r1euicw6PESZahPlQ4mqBs7haWpvWAYQitciSvoO7Y4049kbjELgaMq
	921+p4atMyItcge9Qpz2XQtGhMhGKTN5nGwQpzsQ5Bu+JhhNzuzN6fO8PiBmJBFgJMY36xYwOE=
X-Received: by 2002:a05:6830:4901:b0:7e6:f2ef:e231 with SMTP id 46e09a7af769-7ed9a7ca72emr1789456a34.2.1784306533242;
        Fri, 17 Jul 2026 09:42:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad9576a5sm1563536a34.9.2026.07.17.09.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
Date: Fri, 17 Jul 2026 10:41:58 -0600
Message-ID: <20260717164202.3099982-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094215_026829_0B355283 
X-CRM114-Status: GOOD (  26.42  )
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

The H616 NAND controller uses a descriptor-based internal MBUS DMA
engine instead of the direct address and count registers used by the
A23/A33 controller. Since the driver does not support these descriptors,
it currently attempts to request an external rxtx DMA channel and falls
back to PIO when none is provided.

Add a single-descriptor backend to the existing ECC page DMA paths.
Allocate the descriptor coherently, constrain data mappings to the
controller's 32-bit address range, program the H6-style data block mask,
and request an interrupt for both command and DMA completion. Keep the
existing external DMA and legacy MBUS DMA paths unchanged, and fall back
to PIO if the descriptor cannot be allocated.

With identical kernels except for this patch, running
flash_speed -d -b 1906 -c 100 /dev/mtd6 on an H616 board with 2 KiB-page
SLC NAND reported:

                         PIO          descriptor DMA
eraseblock write        3365 KiB/s       4192 KiB/s
eraseblock read         6454 KiB/s      16040 KiB/s
page write              3254 KiB/s       4021 KiB/s
page read               6419 KiB/s      15686 KiB/s

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Make descriptor layout and alignment explicit  (suggested by Miquel)
  - Track active internal MBUS DMA state consistently  (suggested by Miquel)
  - Clarify the block mask and completion bit names  (suggested by Miquel)
  - Let the 32-bit DMA mask constrain mappings  (suggested by Miquel)
  - Explain DMA descriptor endian conversion
  - Add flash_speed PIO/DMA results  (suggested by Miquel)
---
 drivers/mtd/nand/raw/sunxi_nand.c | 120 ++++++++++++++++++++++++++----
 1 file changed, 104 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..6e22d82a77ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -79,6 +79,12 @@
 #define NFC_REG_H6_MDMA_BUF_ADDR 0x0210
 #define NFC_REG_H6_MDMA_CNT	0x0214
 
+#define NFC_H6_MDMA_STA_DESC0_COMPLETE	BIT(0)
+
+#define NFC_MDMA_DESC_LAST	BIT(2)
+#define NFC_MDMA_DESC_FIRST	BIT(3)
+#define NFC_MDMA_DESC_SIZE_MASK	GENMASK(15, 0)
+
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
@@ -267,12 +273,19 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+struct sunxi_nfc_mdma_desc {
+	__le32 config;
+	__le32 size;
+	__le32 buf;
+	__le32 next;
+} __packed __aligned(4);
+
 /*
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
- * @has_mdma:		Use mbus dma mode, otherwise general dma
- *			through MBUS on A23/A33 needs extra configuration.
+ * @has_mdma:		Use A23/A33-style MBUS DMA registers
+ * @has_mdma_desc:	MBUS DMA uses H6-style descriptors
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
@@ -304,6 +317,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
+	bool has_mdma_desc;
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
@@ -346,6 +360,9 @@ struct sunxi_nfc_caps {
  *	   controller
  * @complete: a completion object used to wait for NAND controller events
  * @dmac: the DMA channel attached to the NAND controller
+ * @use_mdma: use an internal MBUS DMA backend
+ * @mdma_desc: H6-style MBUS DMA descriptor
+ * @mdma_desc_dma: DMA address of @mdma_desc
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -362,6 +379,9 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	bool use_mdma;
+	struct sunxi_nfc_mdma_desc *mdma_desc;
+	dma_addr_t mdma_desc_dma;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -466,7 +486,10 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 {
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
+	dma_addr_t buf_dma;
 	dma_cookie_t dmat;
+	int len = chunksize * nchunks;
+	u32 data_blocks = nchunks;
 	int ret;
 
 	if (ddir == DMA_FROM_DEVICE)
@@ -474,12 +497,21 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 	else
 		tdir = DMA_MEM_TO_DEV;
 
-	sg_init_one(sg, buf, nchunks * chunksize);
+	sg_init_one(sg, buf, len);
 	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
 	if (!ret)
 		return -ENOMEM;
 
-	if (!nfc->caps->has_mdma) {
+	buf_dma = sg_dma_address(sg);
+
+	if (nfc->mdma_desc &&
+	    (len > NFC_MDMA_DESC_SIZE_MASK || !IS_ALIGNED(len, 8) ||
+	     !IS_ALIGNED(buf_dma, 4))) {
+		ret = -EINVAL;
+		goto err_unmap_buf;
+	}
+
+	if (!nfc->use_mdma) {
 		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
 		if (!dmad) {
 			ret = -EINVAL;
@@ -489,14 +521,35 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
-	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
+
+	/* H6/H616 use one enable bit per ECC data block. */
+	if (nfc->caps->has_mdma_desc)
+		data_blocks = GENMASK(nchunks - 1, 0);
+	writel(data_blocks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
 
-	if (nfc->caps->has_mdma) {
+	if (nfc->use_mdma)
 		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
 		       nfc->regs + NFC_REG_CTL);
-		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
-		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
+
+	if (nfc->mdma_desc) {
+		struct sunxi_nfc_mdma_desc *desc = nfc->mdma_desc;
+
+		desc->config = cpu_to_le32(NFC_MDMA_DESC_FIRST |
+					   NFC_MDMA_DESC_LAST);
+		desc->size = cpu_to_le32(len);
+		/* Descriptor words are little-endian DMA memory, not MMIO. */
+		desc->buf = cpu_to_le32(buf_dma);
+		desc->next = cpu_to_le32(nfc->mdma_desc_dma);
+
+		writel(NFC_H6_MDMA_STA_DESC0_COMPLETE,
+		       nfc->regs + NFC_REG_H6_MDMA_STA);
+		dma_wmb();
+		writel(nfc->mdma_desc_dma,
+		       nfc->regs + NFC_REG_H6_MDMA_DLBA_REG);
+	} else if (nfc->caps->has_mdma) {
+		writel(len, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(buf_dma, nfc->regs + NFC_REG_MDMA_ADDR);
 	} else {
 		dmat = dmaengine_submit(dmad);
 
@@ -525,6 +578,14 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 	       nfc->regs + NFC_REG_CTL);
 }
 
+static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+{
+	if (nfc->use_mdma)
+		sunxi_nfc_rst(nfc);
+	else
+		dmaengine_terminate_all(nfc->dmac);
+}
+
 static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
@@ -1202,7 +1263,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (nfc->use_mdma)
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1211,8 +1272,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1613,7 +1674,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 	wait = NFC_CMD_INT_FLAG;
 
-	if (nfc->caps->has_mdma)
+	if (nfc->use_mdma)
 		wait |= NFC_DMA_INT_FLAG;
 	else
 		dma_async_issue_pending(nfc->dmac);
@@ -1623,8 +1684,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret && !nfc->caps->has_mdma)
-		dmaengine_terminate_all(nfc->dmac);
+	if (ret)
+		sunxi_nfc_dma_op_abort(nfc);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -2073,11 +2134,13 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->caps->has_mdma) {
+	if (nfc->dmac || nfc->use_mdma) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
 		nand->options |= NAND_USES_DMA;
+		if (nfc->mdma_desc)
+			nand->buf_align = 4;
 	} else {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage;
@@ -2426,8 +2489,32 @@ static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
 {
 	int ret;
 
-	if (nfc->caps->has_mdma)
+	if (nfc->caps->has_mdma_desc) {
+		ret = dma_set_mask_and_coherent(nfc->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_warn(nfc->dev,
+				 "failed to set MBUS DMA mask, using PIO: %d\n",
+				 ret);
+			return 0;
+		}
+
+		nfc->mdma_desc =
+			dmam_alloc_coherent(nfc->dev, sizeof(*nfc->mdma_desc),
+					    &nfc->mdma_desc_dma, GFP_KERNEL);
+		if (!nfc->mdma_desc) {
+			dev_warn(nfc->dev,
+				 "failed to allocate MBUS DMA descriptor, using PIO\n");
+			return 0;
+		}
+
+		nfc->use_mdma = true;
 		return 0;
+	}
+
+	if (nfc->caps->has_mdma) {
+		nfc->use_mdma = true;
+		return 0;
+	}
 
 	nfc->dmac = dma_request_chan(nfc->dev, "rxtx");
 	if (IS_ERR(nfc->dmac)) {
@@ -2620,6 +2707,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
