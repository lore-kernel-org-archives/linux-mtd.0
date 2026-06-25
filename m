Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC3ACDB479
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2026 00:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lt3nasssiKMoO2pODmBZ9nW+GhrQsRk8D4uJkGacYRY=; b=WsIxfgomsBQUSD
	4LGGdUv2np0PGqYllvTp/cB8pz8o+OLzLtslEpT8S2zaHrr2Bej6ywNJqgiaIOpXmDm4Df0b4JDLH
	JqDlFdkKLUhXSncrypI2MrKaKALWjduUjkqQ0puIGkpXR7ydwuTN7n3Ja1BD3MqLy3gaDWhLZnB+b
	jupGRvS7MagKhasdcShICELPthZkCoVUIQcHY9npFVW4AzC1SKg3/w+69bpoE4aUpFOVb3Xc/3eD2
	l7s0OTwy/rXKgukF4GxD9gXY//kNXkIG/Uh0141Oaqdb0GhQ/Ny+uakbuvoU+0IHMJ93CK6bhdyl4
	omiIo2hujKUITFfO8ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY66-00000008TiG-3xTj;
	Thu, 25 Jun 2026 00:37:38 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcY63-00000008Thi-3gxB;
	Thu, 25 Jun 2026 00:37:37 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAC3k5pMeDxqN+nCFQ--.4432S2;
	Thu, 25 Jun 2026 08:37:32 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: pengpeng@iscas.ac.cn,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH] mtd: rawnand: mtk: return errors when reset does not idle
Date: Thu, 25 Jun 2026 08:37:30 +0800
Message-ID: <20260625003730.35025-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3k5pMeDxqN+nCFQ--.4432S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1xuFyDtr18uFyUAr17Awb_yoW5uFWkpF
	WrJa47JF4UJF4xuw4kAFs5AFy3A3yft343GrWFg34I93WYvryj9a4rtF109rZxKFW8GFy3
	Zrs2qasxuF43Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_173736_300430_BB3AE522 
X-CRM114-Status: GOOD (  14.72  )
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

mtk_nfc_hw_reset() waits for the NFI master to become idle after forcing a
reset, but it only logs a warning when the wait times out.  Probe-time
hardware init and later exec_op() calls then continue as if the reset had
completed.

Make the reset helper return the poll error and propagate it through both
initial hardware setup and NAND operation execution.  Keep the final reset
writes so status registers affected by the NFI master are still forced
back to the reset state before the error is returned.

This is marked RFC because the existing code only warns about the idle
timeout and then performs the final reset writes.  Maintainer feedback is
needed on whether this timeout should be treated as fatal or as a
recoverable reset condition on affected hardware.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/raw/mtk_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102..059b8070f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -255,7 +255,7 @@ static inline u8 nfi_readb(struct mtk_nfc *nfc, u32 reg)
 	return readb_relaxed(nfc->regs + reg);
 }
 
-static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
+static int mtk_nfc_hw_reset(struct mtk_nfc *nfc)
 {
 	struct device *dev = nfc->dev;
 	u32 val;
@@ -269,12 +269,14 @@ static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
 				 !(val & MASTER_STA_MASK), 50,
 				 MTK_RESET_TIMEOUT);
 	if (ret)
-		dev_warn(dev, "master active in reset [0x%x] = 0x%x\n",
-			 NFI_MASTER_STA, val);
+		dev_err(dev, "master active in reset [0x%x] = 0x%x\n",
+			NFI_MASTER_STA, val);
 
 	/* ensure any status register affected by the NFI master is reset */
 	nfi_writel(nfc, CON_FIFO_FLUSH | CON_NFI_RST, NFI_CON);
 	nfi_writew(nfc, STAR_DE, NFI_STRDATA);
+
+	return ret;
 }
 
 static int mtk_nfc_send_command(struct mtk_nfc *nfc, u8 command)
@@ -517,7 +519,10 @@ static int mtk_nfc_exec_op(struct nand_chip *chip,
 	if (check_only)
 		return 0;
 
-	mtk_nfc_hw_reset(nfc);
+	ret = mtk_nfc_hw_reset(nfc);
+	if (ret)
+		return ret;
+
 	nfi_writew(nfc, CNFG_OP_CUST, NFI_CNFG);
 	mtk_nfc_select_target(chip, op->cs);
 
@@ -1084,8 +1089,10 @@ static int mtk_nfc_read_oob_std(struct nand_chip *chip, int page)
 	return mtk_nfc_read_page_raw(chip, NULL, 1, page);
 }
 
-static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
+static int mtk_nfc_hw_init(struct mtk_nfc *nfc)
 {
+	int ret;
+
 	/*
 	 * CNRNB: nand ready/busy register
 	 * -------------------------------
@@ -1095,10 +1102,14 @@ static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
 	nfi_writew(nfc, 0xf1, NFI_CNRNB);
 	nfi_writel(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
 
-	mtk_nfc_hw_reset(nfc);
+	ret = mtk_nfc_hw_reset(nfc);
+	if (ret)
+		return ret;
 
 	nfi_readl(nfc, NFI_INTR_STA);
 	nfi_writel(nfc, 0, NFI_INTR_EN);
+
+	return 0;
 }
 
 static irqreturn_t mtk_nfc_irq(int irq, void *id)
@@ -1411,7 +1422,9 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
 
-	mtk_nfc_hw_init(nfc);
+	ret = mtk_nfc_hw_init(nfc);
+	if (ret)
+		return ret;
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
