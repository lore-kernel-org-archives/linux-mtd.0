Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B59606EE82
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uc8riiL2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=S5c+vq+U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L4CCTi7I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SKScN8UVpk181/fT2ctO6zLyNou6dltNqubdRRld+OA=; b=Uc8riiL2PqUHWlzidkZ4A2JsE/
	dQU0OKotM0DI6oS0wyXhSgSDQ8Ig+ft8wV6y8DyCOc2m35fWckgorenKalkv8xO19YFaRKrRcgyqx
	sirvfBgz1JgJKdpxvd9opTVqBJwB3UoAsATXjaZTrqAelBeg2JXFkZFHacgGNEh3Bt+noUdJ/LoFg
	0vkljWnf6DUfKWzHuats7Ef72CwfwvWuWspf4speJsoudo4yTyGMW/8owC1EkZmdIQkOTBg2nTWLr
	xINTiSfQcmC+PXaAa77Cf5GqCvtjksnTURal+oFHu7LwGgOuDJfgtB62K+y5e4hbG24AN61G0gJ2S
	N81/sL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gX-0000000AFrq-2BZT;
	Thu, 05 Nov 2026 18:59:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d6-0000000ADah-2AwR
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=; b=S5c+vq+Uh0K7g2WcqcKq8ZikK2
	YGCj0vLvXAyZuXElD83x/KChVFwiJ+bDhfZ30Q31nzwmZMbwkgD4PqprrrAUJnGmGIZyHJBf3WVG5
	AayQGIXM+FTbSTjieUcZMqU9nuFpzuzGbqBnfb2ycDFRZQoxj5TLQyK8FcDmst56ndly017Dclmxr
	PzJHQSDq4Sntt+9JH54zdWdUhKlsPAm2oXbprC5WqBC6EByBZ5uIrsXXPR8bTj2ftVMgfpkobGwUv
	Bip44kSICbPvRxsFeda3KEeW9A/T8lb6c/9vY1q+LsQoJ5IJQxUbYn2I1sIzKpQoEkAqBh5dpGit3
	5S6mlmWQ==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d3-00000003R57-3UIl
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:07 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-7143451981fso1504535eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904964; x=1794509764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=L4CCTi7ITMYonnX1KvSxOJpUK8tkLNZ5xtyVjJhEfbKDBbJSfoX8D2Ay0UDrNrgVvC
         gDgp85uo0jbTTjkpcUdOQowHgtbax4i9RdGVpWWDx1ErIu4yrwZOAthS5P4ujSogTWem
         ziHme0g/GcGzmXh2bVZd9CvwBLJTgREbZsjqLXqmF5sFrifPvoc7MP7yFK43qPoZxVo4
         WpreYFuDMU6/Im+TC3pBYi5jZIpvSBNfjGFZhCI8K3xshNU7HPUSd15GrRQdTpIfd2xF
         86XOV2qxhs1s3lOX5JSlIkkMEbDn68QqOnHdZ1eaEF8FfXyKdTsVbq8dzcb7TuGn95oI
         ClXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904964; x=1794509764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VfFDNUuLZDxL4knEKt4xHIe8trG1WlypP2b2NwnIZI=;
        b=j2u60+SGJ7FNK15UGKz9qa/W/wsspfYf07ckU47/kaVKrXkm6WsTu0UzZKlNiPqA19
         kwtzeiaD4xdFQ7wsPEpDjLpM6LoFtswKJYDQt1myN6Ba+7bYddQimUgZqdVnErseY1ZU
         WavI5XIR33MCaOuG4U9wtmnOBZcJUn27ECkvN58GGqsueg1U2gmlbWr/RwQnnWm1QUqJ
         jmE1tN01CJDsSMuVHNo5IYigd828Tbz3kB061YAPcnzwj4GqBbaM5ICjJEyJV/UoNA6X
         MA8ZlD6tFe1EomqPZuNyyjFTZ1Kva4TfqQ3RbxhZaRASIDYiofzulzac8dlilsgSfoTZ
         bXDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpTVhCr8U8ViRvWZiEfCjefDD5GRoI1sP3I9KVRehFWj3cHeY87te5w1k86m9D+HByjWZ6Xh2kpgs=@lists.infradead.org
X-Gm-Message-State: APuU4Z9V1tmkd/ZkwFpbelogezkaw9iVrbcvDaRFCgR1/Eo5JiZYgv3s
	onAJ8lz6hU96O1CSiNBQrHbBFHwdwnh5r/iYreI2S9BxCGgaFCiKH0c6
X-Gm-Gg: AYBFou2wvhG2KzBE0C8r5Efg+eZ7DOBnHmCS6W5rx9ePjqkRWCHmuPsyhTGqq0PfTWm
	pNUE4PI6YAf3FjkeotHnMpc8d6pwSDvyyshIy08u+xPRukvdLFSiOx8r9yjY7YfY1tC+P63z/rB
	fbdW1sfu3DbzVXWh3GuD69bW6sx02XcuCvFm/ds3bJXGOetaKWNlCSra21Y+S5qI9t5QBUwhJ9R
	w+HQxur7ovnSO8OZno4LkUCtuLB9biBndzBCcmAo6bSBxJ0JqfLa8Kyt6HAAB7bxykSZpKUngEu
	d6qSqwvH3VDiTD06yfm7s0Id6fFY5HPoc/qy82cELHRwsfUASKTFWI1axher1heotTzm8RmolPd
	z4zce6VnxiM/5+4J8oLb53lfaB5Eu1lqvpHtCyZNx3cz2nZy7f+V7Se/yEZ/+Ps18uhYvc7h8/M
	Z9ahQ+90PeTByNuJ+JYq2XwAu1cSsZA4eCsuXv4Sp6+RtaEc8TbG+Psu6hPL2EZnZrUd2+NuNbr
	WANAxAhTLItZSZikH4SS1kxQE1NY6Yn7LLMlvHXqMhsX/aJI/26V1N4OIOcnTP84hekh2sqd3of
	hzDerIFnITxJXcMaZeq5PD5qvx1eTuZ4O+uh6oXhJyanPEJ03EFttWb5LNmTCbvRzGMPoEfiao/
	7AipoBPqxXzb0CdAQCeY3805NMpKQ7noAToRJ48XA7Yj5j0PC54tyqlAJuvRXrWzh5y0lUi9CVQ
	tBzZqLFxWbSWZjQxgX9fjHCw8MM6u0cBDal7lSVgxBtpYQjgUZdkY9
X-Received: by 2002:a05:6820:4481:b0:703:10f3:89e4 with SMTP id 006d021491bc7-716e78a0258mr317119eaf.42.1793904963622;
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:37 -0700
Subject: [PATCH v10 21/26] mtd: rawnand: sunxi: reset the H616 data path
 after DMA aborts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-21-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185605_909914_1627F453 
X-CRM114-Status: GOOD (  24.92  )
X-Spam-Score: 0.1 (/)
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

Require the AHB reset at probe and exercise the same reset operation before
accepting transfers. Perform the AHB reset before releasing the DMA
mapping. This relies on the H616 CCU reset callback, which asserts
and deasserts the reset through register updates and returns success. The
reset handle pins the provider module, and the CCU driver suppresses sysfs
unbinding.

Propagate unexpected reset errors, leave the IRQ disabled and reject
subsequent commands. Avoid register access after failed recovery. Error
propagation is not a substitute for stopping DMA if the supported reset
provider contract is violated.

Select the stronger recovery through H616 capability data, leaving older
controllers' abort sequences unchanged.

Fixes: 5ee37db34637 ("mtd: rawnand: sunxi: add H616 MBUS DMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 90 +++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e1306d14ab3a..e8286dc360ac 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -335,6 +335,7 @@ struct sunxi_nfc_mdma_desc {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @needs_bus_reset:	Aborted DMA needs an AHB reset to restore data ordering
  * @legacy_max_strength:If the maximize strength function was off by 2 bytes
  *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
@@ -368,6 +369,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool needs_bus_reset;
 	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
@@ -412,6 +414,7 @@ struct sunxi_nfc_caps {
  * @use_mdma: use an internal MBUS DMA backend
  * @mdma_desc: H6-style MBUS DMA descriptor
  * @mdma_desc_dma: DMA address of @mdma_desc
+ * @recovery_failed: reject further operations after unsuccessful recovery
  * @caps: NAND Controller capabilities
  */
 struct sunxi_nfc {
@@ -432,6 +435,7 @@ struct sunxi_nfc {
 	bool use_mdma;
 	struct sunxi_nfc_mdma_desc *mdma_desc;
 	dma_addr_t mdma_desc_dma;
+	bool recovery_failed;
 	const struct sunxi_nfc_caps *caps;
 };
 
@@ -644,16 +648,50 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
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
@@ -665,6 +703,9 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	u32 ctl;
 	int ret;
 
+	if (nfc->recovery_failed)
+		return -EIO;
+
 	if (cs >= sunxi_nand->nsels)
 		return -EINVAL;
 
@@ -1496,8 +1537,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1874,9 +1921,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
@@ -1902,8 +1950,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
@@ -2904,11 +2958,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
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
@@ -3021,6 +3082,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
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
