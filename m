Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A9606A684
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bqw+epXh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnukaH4i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7o/oTWLxPV4I18RCnReoZvwFVj5olJeV5AXRo4xvGHQ=; b=Bqw+epXhmOMo4Qw4+WCtN+7yG5
	LiJHon1dBHRAavz2A7fnkgr0tCCutEnnuF0m+r2L3StdZBF5uHCodh1Wb7eQAdKpIuKGUqAZg6GZa
	L84i8hSLswnXgc0a1wucz7HkBwdcKgRFgn81tNlkfKVc2Km28vK10wmIoi6I1sxgkWxhBvZomUfyh
	JcNRMu91v06gR+n2rb9Ncas1P0MBXnCaHPkQWdfR8WdtXR1/wdPjOK+D7CIn3R8/zTaWgWyYDXPk/
	9qqiu6+SkX+SlDDtjOEOogHAK9YTnBohhgJGMaiVfab68jnNHS42pFofAGn5jt9dcSVgw44xc0p4o
	9OTh4rWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZgd-0000000GbxK-345c;
	Sat, 21 Nov 2026 01:14:40 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZda-0000000GZfX-1RD4
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:53 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-53c156ba662so884594b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223489; x=1795828289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eYZ3HbDY5x5zovptu6rAgNNSCJghwXhmaa/sCZVI9o=;
        b=HnukaH4iXfItItfjQfuDkJ9nICyIfLXMCohisQ0jHAjhOcOqpXZ61tFvAnYSd3TuHA
         1lTEtfeKRnjkKuOnodvNxVwXk2S4jN1JdkLf7LDwe/AuDfE2Gx8TJLuNBXIHB0suxYym
         6JzvuSFyorlEOlahvsWsnzFxR2ydwzextnricUDyG/6EVZ8DBSQ5hmakAmGPCLjXMIGZ
         KROVTW/h48RluipmCzdmMt3ZzW0Lkhs7lS4iVn9c6lS/JoQUPwUyIAJoKP4NmX+0kFar
         AbhzvRPV5xb/vmSd7HKFi5sOUmybYni7/dmufrGYrrIKd03LfeAK8ilB8xZwAos/oiJ7
         6iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223489; x=1795828289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eYZ3HbDY5x5zovptu6rAgNNSCJghwXhmaa/sCZVI9o=;
        b=2y/ua5FPRucyHfHnPMRx2C0QG4hbTSFv4LVUGpuusFT82qBxhB4F5nKypf1ccEm0ps
         Lx0E9tgoHaOd8Bc4eP+zYj+RpqqkYDGPwf2mJ/B3nMdyLFnkSN+PbPEfR85IqQFNbomi
         4AFiD0is0k9u6CR6K/dMgce/ouSz3JjSoyH6t5Ty0n14mSluhduWo1Sq0cnK5NOTUSyn
         ilg0h6ezIpfGPQQXZU064VGCbg+Ron8PkIC+zfUsSAbpoutugG2JzgsClam4Bb9cWyBR
         i8CgTh4hwR1v2TuOIR9P79mjZSL0PtKKu73SuLDa9LtiEY9GbAyDC3h15o27Hl8DoBcv
         7TvQ==
X-Forwarded-Encrypted: i=1; AL+hErHztaAxt0u0mXgsstJg7TZoDxru0g4So3k/svLxjcW7otzVDMZjC6930MWKAywsKhd9ThePIRW/aMU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/B4Hhv6XEy9ivi//UBB4lrI/90wqToe6iLzdQKWzON6I7HShvc
	+W95ac3SGFY4AevFkylqRQSFY1/SjE+yxkFRZoMfzqNMzNqfPYYtH7ft
X-Gm-Gg: AYBFou1SUjL3fzxYsROo+OOJ0tOoIyyfKDUo777tJYOhxxSA6kg+G7EeWgvamn7TU47
	SIFQnEPAsLN5b8fgED7hBLTWeSl89V6++O+T7CgFSTFJFEbNlWZRxr+Dx6ZZLyD5lMxIjweqh6+
	dOkWPI7iBsH97Mfky108cFjt5Aihbch21xSSlE4Ms2r0+73vbccfBafeAO5zDelLRWboPTSmBwz
	B72enKMr/xRol4w97qrRKRfgQUzIKDM+lrVwM24dO+5kZYr0Z3kWd/cWE9BQdkaBwbt0R5q6IsN
	N5R6vA4lO8YvVgdKExRLIv4w5sRw4VUz/ccs/tCDrCkFgrt6LuU4EGu42/S1UCjO7gCvWjAKZTs
	t2tn2QhPmozyh9xd02GLv1CHndTeVwsWB2nUx0DFz0UvpHal58MA4vRCq2WZ2zneI0xABtyZmaT
	GlfBrFjfmnVB9dZzhCXeVqfhG7k7PMbZkJBwkx6SNF2zkvqsamuk/OhDBhmo7uAhECDbu7cWKbQ
	G3uX5WU/MdLM9TnwAiCo8P17+nJE8y1akgKNsXlp/A6PcihNgWsYQAnamIFA4XTnd9Z7mugXdTG
	fe4cRNu5BT7y1x60pGMqXlyR9g7XrAqi7NM1tEOVOsDvorEcUMr5nxJ9ftGEIk5NbXO1z8oJTjI
	YsXxXusy4YLurloa3ZIcxEWubEwAyCxO68c6dnNF9y5ktXRoQtAJymwQU79gzqx3Py/28aqTK0Q
	npovJ4j6VrTcKX3g0plUgGX/7TmXdsVrGmLRPsWKQeabNH+vRmlP6L
X-Received: by 2002:a05:6808:4f1f:b0:4bc:fbd4:2a43 with SMTP id 5614622812f47-57a0bb6eea6mr5839190b6e.41.1795223489248;
        Fri, 20 Nov 2026 17:11:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:47 -0700
Subject: [PATCH v11 24/26] mtd: rawnand: sunxi: reset the H616 data path
 after DMA aborts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-24-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171130_736745_28B61289 
X-CRM114-Status: GOOD (  25.49  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Resetting an active H616 MDMA read with NFC_CTL.RESET can leave the first
1 KiB of the next read displaced. Both raw and ECC reads are affected,
including reads for which ECC reports success. Reissuing the NAND read
command and restoring the visible controller configuration do not correct
the internal data-path state. The DMA read error path can therefore return
incorrect data when it retries through PIO.

Pulse the controller's exclusive AHB reset after stopping an H616 DMA
operation. Drain interrupts before resetting the registers and clear the
pending events before accepting another command. The next operation
selects its chip and restores the page layout and timings; reads retry
from a fresh whole-page setup, while interrupted writes return an error.

Require the AHB reset at probe and exercise it before accepting
transfers. An H616 device tree that omits the named reset will no longer
probe, including for PIO reads and writes. Perform the AHB reset before
releasing the DMA mapping. This relies on the H616 CCU reset callback,
which asserts and deasserts the reset through register updates and
returns success. The reset handle pins the provider module, and the CCU
driver suppresses sysfs unbinding.

If recovery fails, return the reset error without retrying the read in
PIO. Leave the IRQ disabled and reject subsequent NAND commands before
accessing the registers. Error propagation is not a substitute for
stopping DMA if the supported reset provider contract is violated.

Select the stronger recovery through H616 capability data, leaving older
controllers' abort sequences unchanged.

Fixes: 5ee37db34637 ("mtd: rawnand: sunxi: add H616 MBUS DMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 98 ++++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index abea2ab0cc42..a722636f2e15 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -318,6 +318,7 @@ struct sunxi_nfc_user_data_layout {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @needs_bus_reset:	Aborted DMA needs an AHB reset to restore data ordering
  * @layout: protected user-data layout for the controller
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
@@ -346,6 +347,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool needs_bus_reset;
 	const struct sunxi_nfc_user_data_layout *layout;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
@@ -389,6 +391,7 @@ struct sunxi_nfc_caps {
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
  * @mdma_desc_dma: DMA address of @mdma_desc
+ * @recovery_failed: reject further operations after unsuccessful recovery
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -409,6 +412,7 @@ struct sunxi_nfc {
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
 	dma_addr_t mdma_desc_dma;
+	bool recovery_failed;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -621,16 +625,50 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 				     struct scatterlist *sg)
 {
 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
+	/* Do not access controller registers after failed recovery. */
+	if (nfc->recovery_failed)
+		return;
+
 	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
+static int sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 {
-	if (nfc->use_mdma)
-		sunxi_nfc_rst(nfc);
-	else
-		dmaengine_terminate_all(nfc->dmac);
+	int ret;
+
+	if (!nfc->caps->needs_bus_reset) {
+		if (nfc->use_mdma)
+			sunxi_nfc_rst(nfc);
+		else
+			dmaengine_terminate_all(nfc->dmac);
+		return 0;
+	}
+
+	/* Drain the handler before resetting its registers. */
+	disable_irq(nfc->irq);
+	writel(0, nfc->regs + NFC_REG_INT);
+	readl(nfc->regs + NFC_REG_INT);
+
+	/* A soft reset alone can leave the first subsequent read displaced. */
+	sunxi_nfc_rst(nfc);
+	ret = reset_control_reset(nfc->reset);
+	if (ret)
+		goto failed;
+
+	writel(0, nfc->regs + NFC_REG_INT);
+	writel(NFC_INT_MASK, nfc->regs + NFC_REG_ST);
+	readl(nfc->regs + NFC_REG_INT);
+	enable_irq(nfc->irq);
+
+	/* The next operation selects the chip and restores its timing and layout. */
+	return 0;
+
+failed:
+	/* Keep the IRQ disabled and reject commands after failed recovery. */
+	nfc->recovery_failed = true;
+	dev_err(nfc->dev, "NAND controller recovery failed: %d\n", ret);
+	return ret;
 }
 
 static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
@@ -642,6 +680,9 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	u32 ctl;
 	int ret;
 
+	if (nfc->recovery_failed)
+		return -EIO;
+
 	if (cs >= sunxi_nand->nsels)
 		return -EINVAL;
 
@@ -1464,8 +1505,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+	if (ret) {
+		int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+		if (abort_ret) {
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
+			return abort_ret;
+		}
+	}
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1514,7 +1561,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	return ret;
 
 err_stats:
-	/* The caller retries the whole read in PIO mode. */
+	/* A PIO retry must not count completed DMA batches twice. */
 	mtd->ecc_stats.corrected = corrected;
 	mtd->ecc_stats.failed = failed;
 	return ret;
@@ -1648,6 +1695,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, u8 *buf,
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 					  int oob_required, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -1656,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
-	if (ret >= 0)
+	if (ret >= 0 || nfc->recovery_failed)
 		return ret;
 
 	/* Fallback to PIO mode */
@@ -1677,6 +1725,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	int first_step = data_offs / nand->ecc.size;
 	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
@@ -1686,7 +1735,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
-	if (ret >= 0)
+	if (ret >= 0 || nfc->recovery_failed)
 		return ret;
 
 	/* Fallback to PIO mode */
@@ -1828,9 +1877,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		else
 			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 		if (ret) {
-			sunxi_nfc_dma_op_abort(nfc);
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
 			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-			return ret;
+			return abort_ret ?: ret;
 		}
 
 		/* exec_op() restores the page's spare base during column changes. */
@@ -1856,8 +1906,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		       nfc->regs + NFC_REG_CMD);
 
 		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-		if (ret)
-			sunxi_nfc_dma_op_abort(nfc);
+		if (ret) {
+			int abort_ret = sunxi_nfc_dma_op_abort(nfc);
+
+			if (abort_ret) {
+				sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+				return abort_ret;
+			}
+		}
 
 		sunxi_nfc_randomizer_disable(nand);
 		sunxi_nfc_hw_ecc_disable(nand);
@@ -2794,11 +2850,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		}
 	}
 
-	nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
+	if (nfc->caps->needs_bus_reset)
+		nfc->reset = devm_reset_control_get_exclusive(dev, "ahb");
+	else
+		nfc->reset = devm_reset_control_get_optional_exclusive(dev, "ahb");
 	if (IS_ERR(nfc->reset))
-		return PTR_ERR(nfc->reset);
+		return dev_err_probe(dev, PTR_ERR(nfc->reset), "failed to get AHB reset\n");
 
-	ret = reset_control_deassert(nfc->reset);
+	/* Exercise the recovery reset operation before accepting DMA transfers. */
+	if (nfc->caps->needs_bus_reset)
+		ret = reset_control_reset(nfc->reset);
+	else
+		ret = reset_control_deassert(nfc->reset);
 	if (ret) {
 		dev_err(dev, "reset err %d\n", ret);
 		return ret;
@@ -2908,6 +2971,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,
+	.needs_bus_reset = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_H6_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_H6_USER_DATA,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
