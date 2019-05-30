Return-Path: <SRS0=l9qW=T6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95533C28CC0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63EC1261B8
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2019 21:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnHw0GW/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Na05WTbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63EC1261B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+ybWK4DCkhk9U2YHxdR3EM2VttWql455Jjl30ZsGMYA=; b=GnHw0GW/GmpZ/OesBD/Llrdtio
	05jQ2mN9w8VxNXQW12F4GhOvzzHbXnIBwsUY4l59Ao5LsOtNnPDs6kax+EWVhu/m/VKaytB+9eITH
	p8ALeuPeYw0zjuKD2WCgImPCj1VZeTVJ+WDWZWht7rONNNzN0grz6sM+loQdo0RcGJvo6YBmnCfLM
	rv2cuEn//fFn9odx4L1N/PTCaL8npi2Fi0vOqRoEioaCeNh/1HBhV0PDCiDCFzdzbNrtFpS6PR+Zo
	EKp63oNQdpCOiCLI87sjrYQOeSy9dNPjcri9K5TFpHUoiO6H2kz1X735xjRNiEPOg0zw3sIaem7Co
	WwY7DfHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWSUE-0003Sc-6y; Thu, 30 May 2019 21:21:22 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWSUB-0003Nf-HB
 for linux-mtd@lists.infradead.org; Thu, 30 May 2019 21:21:21 +0000
Received: by mail-ed1-x541.google.com with SMTP id y15so5160786edo.8
 for <linux-mtd@lists.infradead.org>; Thu, 30 May 2019 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=doIN73qoxEAhanza5GxdbSOYZQ8yzsT8VbpSFVXMRKo=;
 b=Na05WTbburdeIzLk8lZXQGmQi2KyCV850nl+uvRei+4g2tVD05HZ4W6lQL/EA9vQ6C
 EK0hLpYWxz4IRVVcNdFyPS77UlSoPCSnBxFaS9fasgUtWzF1zZCbiSsFhEzIY6n6ZiNl
 Eb8XxVre0az3muSMBXpQHb0Z1Aq65T7qHrtjklCJ/KnwZpjaEoFz89mxQeTP76PdBJFy
 RervTaCOG/Lz2A2qsBT67fKoxY/PWVlRVdOxeNdqtlhLN6tsQrivuskQLPJXS8qYIFeb
 Ls7pY9b9hm0yZbEnI92wa3/RIgw1foX92UMasAlisUSTCh8L0u3kOtHMSdCqAN5LrHUC
 8Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=doIN73qoxEAhanza5GxdbSOYZQ8yzsT8VbpSFVXMRKo=;
 b=Bt/0adiCtkINvC7yFYRbdZRJrrhbquqJGnMHE5C37wGimeCPiamyu+u2N8+qVUd++y
 uRhzrsjzmnf0RVShvDq7JvGhyI8vpLCkD5Y2btjJrX7wyvkSSrUuiJ5aZWa3uPCbucaG
 6Zr6McrPeUgXT/Hufvxbh53aV8PA+jA8geUWAW2VY19KFcmMbsarWgBeoF1+5aQAhWIX
 OKt/Clyu1x5otvU3YSrrUSnJdGoNVhCkS2r0DLtwIAePdHh/FK2X9/mVLgvtY3mC+9fX
 MLEePHLPzzCr4u7xEqQIS2cwIx38G1uNpELZ6gzis4iyZvn2S4mENZUOKk/wW/5f6Rqb
 oSeA==
X-Gm-Message-State: APjAAAXgQgYTZghVszclBjW99ALigRlrR596C8EVCWO+h34hNYstEZKP
 VGGSp8ZFPRvGTpsf/sTR2WBK67Gp
X-Google-Smtp-Source: APXvYqyl9f50kyZTktpnwAxwR9mkPiTo6qe70Ybd3W9BiEUUKydljzpbthY71amBhM6pIQ6x6vBkUA==
X-Received: by 2002:a50:ce06:: with SMTP id y6mr7262339edi.160.1559251277367; 
 Thu, 30 May 2019 14:21:17 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id h25sm597082ejz.10.2019.05.30.14.21.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 14:21:16 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: nand: raw: brcmnand: Add support for v7.3 controller
Date: Thu, 30 May 2019 17:20:36 -0400
Message-Id: <1559251257-12383-2-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
References: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_142119_588789_8168B203 
X-CRM114-Status: GOOD (  16.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change adds support for brcm NAND v7.3 controller. This controller
uses a newer version of flash_dma engine and change mostly implements
these differences.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 102 ++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 77b7850..544088f 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -92,6 +92,12 @@ struct brcm_nand_dma_desc {
 #define FLASH_DMA_ECC_ERROR	(1 << 8)
 #define FLASH_DMA_CORR_ERROR	(1 << 9)
 
+/* Bitfields for DMA_MODE */
+#define FLASH_DMA_MODE_STOP_ON_ERROR	BIT(1) /* stop in Uncorr ECC error */
+#define FLASH_DMA_MODE_MODE		BIT(0) /* link list */
+#define FLASH_DMA_MODE_MASK		(FLASH_DMA_MODE_STOP_ON_ERROR |	\
+						FLASH_DMA_MODE_MODE)
+
 /* 512B flash cache in the NAND controller HW */
 #define FC_SHIFT		9U
 #define FC_BYTES		512U
@@ -104,6 +110,51 @@ struct brcm_nand_dma_desc {
 #define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
 #define NAND_POLL_STATUS_TIMEOUT_MS	100
 
+/* flash_dma registers */
+enum flash_dma_reg {
+	FLASH_DMA_REVISION = 0,
+	FLASH_DMA_FIRST_DESC,
+	FLASH_DMA_FIRST_DESC_EXT,
+	FLASH_DMA_CTRL,
+	FLASH_DMA_MODE,
+	FLASH_DMA_STATUS,
+	FLASH_DMA_INTERRUPT_DESC,
+	FLASH_DMA_INTERRUPT_DESC_EXT,
+	FLASH_DMA_ERROR_STATUS,
+	FLASH_DMA_CURRENT_DESC,
+	FLASH_DMA_CURRENT_DESC_EXT,
+};
+
+/* flash_dma registers v1*/
+static const u16 flash_dma_regs_v1[] = {
+	[FLASH_DMA_REVISION]		= 0x00,
+	[FLASH_DMA_FIRST_DESC]		= 0x04,
+	[FLASH_DMA_FIRST_DESC_EXT]	= 0x08,
+	[FLASH_DMA_CTRL]		= 0x0c,
+	[FLASH_DMA_MODE]		= 0x10,
+	[FLASH_DMA_STATUS]		= 0x14,
+	[FLASH_DMA_INTERRUPT_DESC]	= 0x18,
+	[FLASH_DMA_INTERRUPT_DESC_EXT]	= 0x1c,
+	[FLASH_DMA_ERROR_STATUS]	= 0x20,
+	[FLASH_DMA_CURRENT_DESC]	= 0x24,
+	[FLASH_DMA_CURRENT_DESC_EXT]	= 0x28,
+};
+
+/* flash_dma registers v4 */
+static const u16 flash_dma_regs_v4[] = {
+	[FLASH_DMA_REVISION]		= 0x00,
+	[FLASH_DMA_FIRST_DESC]		= 0x08,
+	[FLASH_DMA_FIRST_DESC_EXT]	= 0x0c,
+	[FLASH_DMA_CTRL]		= 0x10,
+	[FLASH_DMA_MODE]		= 0x14,
+	[FLASH_DMA_STATUS]		= 0x18,
+	[FLASH_DMA_INTERRUPT_DESC]	= 0x20,
+	[FLASH_DMA_INTERRUPT_DESC_EXT]	= 0x24,
+	[FLASH_DMA_ERROR_STATUS]	= 0x28,
+	[FLASH_DMA_CURRENT_DESC]	= 0x30,
+	[FLASH_DMA_CURRENT_DESC_EXT]	= 0x34,
+};
+
 /* Controller feature flags */
 enum {
 	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
@@ -136,6 +187,8 @@ struct brcmnand_controller {
 	/* List of NAND hosts (one for each chip-select) */
 	struct list_head host_list;
 
+	/* flash_dma reg */
+	const u16		*flash_dma_offsets;
 	struct brcm_nand_dma_desc *dma_desc;
 	dma_addr_t		dma_pa;
 
@@ -470,7 +523,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	/* Register offsets */
 	if (ctrl->nand_version >= 0x0702)
 		ctrl->reg_offsets = brcmnand_regs_v72;
-	else if (ctrl->nand_version >= 0x0701)
+	else if (ctrl->nand_version == 0x0701)
 		ctrl->reg_offsets = brcmnand_regs_v71;
 	else if (ctrl->nand_version >= 0x0600)
 		ctrl->reg_offsets = brcmnand_regs_v60;
@@ -515,7 +568,7 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	}
 
 	/* Maximum spare area sector size (per 512B) */
-	if (ctrl->nand_version >= 0x0702)
+	if (ctrl->nand_version == 0x0702)
 		ctrl->max_oob = 128;
 	else if (ctrl->nand_version >= 0x0600)
 		ctrl->max_oob = 64;
@@ -546,6 +599,15 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	return 0;
 }
 
+static void brcmnand_flash_dma_revision_init(struct brcmnand_controller *ctrl)
+{
+	/* flash_dma register offsets */
+	if (ctrl->nand_version >= 0x0703)
+		ctrl->flash_dma_offsets = flash_dma_regs_v4;
+	else
+		ctrl->flash_dma_offsets = flash_dma_regs_v1;
+}
+
 static inline u32 brcmnand_read_reg(struct brcmnand_controller *ctrl,
 		enum brcmnand_reg reg)
 {
@@ -668,7 +730,7 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 	enum brcmnand_reg reg = BRCMNAND_CORR_THRESHOLD;
 	int cs = host->cs;
 
-	if (ctrl->nand_version >= 0x0702)
+	if (ctrl->nand_version == 0x0702)
 		bits = 7;
 	else if (ctrl->nand_version >= 0x0600)
 		bits = 6;
@@ -722,7 +784,7 @@ enum {
 
 static inline u32 brcmnand_spare_area_mask(struct brcmnand_controller *ctrl)
 {
-	if (ctrl->nand_version >= 0x0702)
+	if (ctrl->nand_version == 0x0702)
 		return GENMASK(7, 0);
 	else if (ctrl->nand_version >= 0x0600)
 		return GENMASK(6, 0);
@@ -852,20 +914,6 @@ static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
  * Flash DMA
  ***********************************************************************/
 
-enum flash_dma_reg {
-	FLASH_DMA_REVISION		= 0x00,
-	FLASH_DMA_FIRST_DESC		= 0x04,
-	FLASH_DMA_FIRST_DESC_EXT	= 0x08,
-	FLASH_DMA_CTRL			= 0x0c,
-	FLASH_DMA_MODE			= 0x10,
-	FLASH_DMA_STATUS		= 0x14,
-	FLASH_DMA_INTERRUPT_DESC	= 0x18,
-	FLASH_DMA_INTERRUPT_DESC_EXT	= 0x1c,
-	FLASH_DMA_ERROR_STATUS		= 0x20,
-	FLASH_DMA_CURRENT_DESC		= 0x24,
-	FLASH_DMA_CURRENT_DESC_EXT	= 0x28,
-};
-
 static inline bool has_flash_dma(struct brcmnand_controller *ctrl)
 {
 	return ctrl->flash_dma_base;
@@ -877,14 +925,19 @@ static inline bool flash_dma_buf_ok(const void *buf)
 		likely(IS_ALIGNED((uintptr_t)buf, 4));
 }
 
-static inline void flash_dma_writel(struct brcmnand_controller *ctrl, u8 offs,
-				    u32 val)
+static inline void flash_dma_writel(struct brcmnand_controller *ctrl,
+				    enum flash_dma_reg dma_reg, u32 val)
 {
+	u16 offs = ctrl->flash_dma_offsets[dma_reg];
+
 	brcmnand_writel(val, ctrl->flash_dma_base + offs);
 }
 
-static inline u32 flash_dma_readl(struct brcmnand_controller *ctrl, u8 offs)
+static inline u32 flash_dma_readl(struct brcmnand_controller *ctrl,
+				  enum flash_dma_reg dma_reg)
 {
+	u16 offs = ctrl->flash_dma_offsets[dma_reg];
+
 	return brcmnand_readl(ctrl->flash_dma_base + offs);
 }
 
@@ -2427,6 +2480,7 @@ static int brcmnand_resume(struct device *dev)
 	{ .compatible = "brcm,brcmnand-v7.0" },
 	{ .compatible = "brcm,brcmnand-v7.1" },
 	{ .compatible = "brcm,brcmnand-v7.2" },
+	{ .compatible = "brcm,brcmnand-v7.3" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, brcmnand_of_match);
@@ -2513,7 +2567,11 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			goto err;
 		}
 
-		flash_dma_writel(ctrl, FLASH_DMA_MODE, 1); /* linked-list */
+		/* initialize the dma version */
+		brcmnand_flash_dma_revision_init(ctrl);
+
+		/* linked-list and stop on error */
+		flash_dma_writel(ctrl, FLASH_DMA_MODE, FLASH_DMA_MODE_MASK);
 		flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
 
 		/* Allocate descriptor(s) */
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
