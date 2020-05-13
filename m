Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF0CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CA22053B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXB8XbhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4CA22053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3qLFCq5BK/5R7R1iA+RLZGKcyHnRGk1BH8NKh64U78=; b=GXB8XbhGometD4
	6ELSjfPJm3CbdDWECUhTJUScekDXlq9No8MMzlXIixlYY2KaJebfimV2FgHeuYafyYPIM0GDv5mN9
	LJF8wjNLfU77+M4bx1E72i5k6trf1vHMKHpTVYNDschZvAppqaToOCtpiq0O2JjZdrr1BGy6nUnIH
	YrAxd0CMUl6SxAIALC7DEgPAFpqFCACFgP6kfwTGOs03RBSEnGe0zBhJVDNv/CXQVJpF6Acl9XpnT
	zHjIv+eUYTqHur4GnCy6YVYx7VRcR88N96yzRNf7NlYhr6ivZdlohgi94ttJxTwuSupfBEBzztn7N
	MjPuUYJhip3QSre/KteQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYv6j-00024j-Q3; Wed, 13 May 2020 17:23:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYv5u-0001Bg-L4
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 17:23:01 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 40A5B2A223A;
 Wed, 13 May 2020 18:22:57 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/4] mtd: rawnand: davinci: Get rid of the legacy interface
 implementation
Date: Wed, 13 May 2020 19:22:48 +0200
Message-Id: <20200513172248.141402-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513172248.141402-1-boris.brezillon@collabora.com>
References: <20200513172248.141402-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_102258_951853_82D53A5E 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that exec_op() is implemented we can get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Changes in v2:
* Add T-b/R-b
---
 drivers/mtd/nand/raw/davinci_nand.c | 91 -----------------------------
 1 file changed, 91 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 0eeb30c7fc4e..d8aa61a6928a 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -81,38 +81,6 @@ static inline void davinci_nand_writel(struct davinci_nand_info *info,
 
 /*----------------------------------------------------------------------*/
 
-/*
- * Access to hardware control lines:  ALE, CLE, secondary chipselect.
- */
-
-static void nand_davinci_hwcontrol(struct nand_chip *nand, int cmd,
-				   unsigned int ctrl)
-{
-	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(nand));
-	void __iomem			*addr = info->current_cs;
-
-	if (ctrl & NAND_CTRL_CLE)
-		addr += info->mask_cle;
-	else if (ctrl & NAND_CTRL_ALE)
-		addr += info->mask_ale;
-
-	if (cmd != NAND_CMD_NONE)
-		iowrite8(cmd, addr);
-}
-
-static void nand_davinci_select_chip(struct nand_chip *nand, int chip)
-{
-	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(nand));
-
-	info->current_cs = info->vaddr;
-
-	/* maybe kick in a second chipselect */
-	if (chip > 0)
-		info->current_cs += info->mask_chipsel;
-}
-
-/*----------------------------------------------------------------------*/
-
 /*
  * 1-bit hardware ECC ... context maintained for each core chipselect
  */
@@ -405,54 +373,6 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 
 /*----------------------------------------------------------------------*/
 
-/*
- * NOTE:  NAND boot requires ALE == EM_A[1], CLE == EM_A[2], so that's
- * how these chips are normally wired.  This translates to both 8 and 16
- * bit busses using ALE == BIT(3) in byte addresses, and CLE == BIT(4).
- *
- * For now we assume that configuration, or any other one which ignores
- * the two LSBs for NAND access ... so we can issue 32-bit reads/writes
- * and have that transparently morphed into multiple NAND operations.
- */
-static void nand_davinci_read_buf(struct nand_chip *chip, uint8_t *buf,
-				  int len)
-{
-	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
-
-	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
-		ioread32_rep(info->current_cs, buf, len >> 2);
-	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
-		ioread16_rep(info->current_cs, buf, len >> 1);
-	else
-		ioread8_rep(info->current_cs, buf, len);
-}
-
-static void nand_davinci_write_buf(struct nand_chip *chip, const uint8_t *buf,
-				   int len)
-{
-	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
-
-	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
-		iowrite32_rep(info->current_cs, buf, len >> 2);
-	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
-		iowrite16_rep(info->current_cs, buf, len >> 1);
-	else
-		iowrite8_rep(info->current_cs, buf, len);
-}
-
-/*
- * Check hardware register for wait status. Returns 1 if device is ready,
- * 0 if it is still busy.
- */
-static int nand_davinci_dev_ready(struct nand_chip *chip)
-{
-	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
-
-	return davinci_nand_readl(info, NANDFSR_OFFSET) & BIT(0);
-}
-
-/*----------------------------------------------------------------------*/
-
 /* An ECC layout for using 4-bit ECC with small-page flash, storing
  * ten ECC bytes plus the manufacturer's bad block marker byte, and
  * and not overlapping the default BBT markers.
@@ -843,9 +763,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	mtd->dev.parent		= &pdev->dev;
 	nand_set_flash_node(&info->chip, pdev->dev.of_node);
 
-	info->chip.legacy.chip_delay	= 0;
-	info->chip.legacy.select_chip	= nand_davinci_select_chip;
-
 	/* options such as NAND_BBT_USE_FLASH */
 	info->chip.bbt_options	= pdata->bbt_options;
 	/* options such as 16-bit widths */
@@ -862,14 +779,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->mask_ale		= pdata->mask_ale ? : MASK_ALE;
 	info->mask_cle		= pdata->mask_cle ? : MASK_CLE;
 
-	/* Set address of hardware control function */
-	info->chip.legacy.cmd_ctrl	= nand_davinci_hwcontrol;
-	info->chip.legacy.dev_ready	= nand_davinci_dev_ready;
-
-	/* Speed up buffer I/O */
-	info->chip.legacy.read_buf     = nand_davinci_read_buf;
-	info->chip.legacy.write_buf    = nand_davinci_write_buf;
-
 	/* Use board-specific ECC config */
 	info->chip.ecc.mode	= pdata->ecc_mode;
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
