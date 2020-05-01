Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE0AC47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7392071C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 10:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f6RlwVqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7392071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtrZVd2DK2Kw2HutdMqrbsML+LjhFB3+80Xr9t29AF8=; b=f6RlwVqIZOTDa5
	dQm71wQfZFzX+UL1iyMXl4zibOgTJvG7ElPwU+sEdcbHbncqaRm9r/WBcgspzNs6ty89GkjYWuBiN
	zJY6yaac8tsM/sYaijBDqRRZMYPDQrY2d3Zmx9pn5GIUpcZ993QJEEVHSeAR9qUnu3Y/98wRMR3Zv
	fuBR6nc4ey/AnAKwnh6rsUh/ltyYTF2/UTR4Ro7vdmaA6iaTSP7Q2jxPJfurEQWp3xeRpDHGW83EN
	ZmoGgsrAFonGBy5kZZ25TrHEYET+AINCVyTZ7wlq9Qq/0fY3q6NqKE6YOtESynoZD4VzYOUqdQXHx
	BPWveMVbFxpvzrHF6+/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUSat-0000ty-6d; Fri, 01 May 2020 10:08:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUSZz-0008Pd-UG
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 10:07:38 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A36BF2A2DC9;
 Fri,  1 May 2020 11:07:34 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/5] mtd: rawnand: davinci: Get rid of the legacy interface
 implementation
Date: Fri,  1 May 2020 12:07:28 +0200
Message-Id: <20200501100729.1237040-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501100729.1237040-1-boris.brezillon@collabora.com>
References: <20200501100729.1237040-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_030736_098531_FEC7A91D 
X-CRM114-Status: GOOD (  13.03  )
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
---
 drivers/mtd/nand/raw/davinci_nand.c | 54 -----------------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 296047884c6a..c629e1a6ed71 100644
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
@@ -440,17 +408,6 @@ static void nand_davinci_write_buf(struct nand_chip *chip, const uint8_t *buf,
 		iowrite8_rep(info->current_cs, buf, len);
 }
 
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
 /*----------------------------------------------------------------------*/
 
 /* An ECC layout for using 4-bit ECC with small-page flash, storing
@@ -813,9 +770,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	mtd->dev.parent		= &pdev->dev;
 	nand_set_flash_node(&info->chip, pdev->dev.of_node);
 
-	info->chip.legacy.chip_delay	= 0;
-	info->chip.legacy.select_chip	= nand_davinci_select_chip;
-
 	/* options such as NAND_BBT_USE_FLASH */
 	info->chip.bbt_options	= pdata->bbt_options;
 	/* options such as 16-bit widths */
@@ -832,14 +786,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
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
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
