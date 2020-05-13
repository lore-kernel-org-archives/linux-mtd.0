Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED63C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2767720659
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cC/WirqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2767720659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jcf98VlbKiWKQ+TT/8Cy/E0ygLfkMFb0ql6h5mApKv0=; b=cC/WirqZ9yHO1j
	L4kKiGXxy1CZP7BAWFicjpNbxnwRX5TmZGdtb1bbaWbPxR9VURuaJCepjKesy3VBO+tXSy8NhuSn9
	xAjgcjSeQ8nL/shV1dO+8QH64y3co7SqqILGhxZyRozryY8UeeC+yZLuQp0YcRRz/QriYvRj7WSAB
	P4OJ1FBg62cFRh8y0tVhsd5aVpevvrdg0kOwnmB1w2Gz1zVFEnfDk6w5SganU0y/cAbEyrUVUjOJZ
	zMPEfBqnebkcEnYOU5D4+LJoQuldmWQ9nI+CtJS65+bsDNqAjjlwopfC+uPiQ0gLRur6kw1rOWP47
	rta7Yer6WbBiRmBC3K6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYv64-0001Ne-EO; Wed, 13 May 2020 17:23:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYv5t-0001BJ-Sn
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 17:22:59 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 70DAB2A200F;
 Wed, 13 May 2020 18:22:56 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/4] mtd: rawnand: davinci: Stop using
 nand_chip.legacy.IO_ADDR_{R, W}
Date: Wed, 13 May 2020 19:22:46 +0200
Message-Id: <20200513172248.141402-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513172248.141402-1-boris.brezillon@collabora.com>
References: <20200513172248.141402-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_102258_068420_1169AE22 
X-CRM114-Status: GOOD (  13.26  )
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

We can use info->current_cs directly instead of doing this weird
IO_ADDR_{R,W} re-assignment dance.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Changes in v2:
* Add T-b/R-b
---
 drivers/mtd/nand/raw/davinci_nand.c | 36 ++++++++++++-----------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 0312c632d86a..779f708c791f 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -91,18 +91,13 @@ static void nand_davinci_hwcontrol(struct nand_chip *nand, int cmd,
 	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(nand));
 	void __iomem			*addr = info->current_cs;
 
-	/* Did the control lines change? */
-	if (ctrl & NAND_CTRL_CHANGE) {
-		if ((ctrl & NAND_CTRL_CLE) == NAND_CTRL_CLE)
-			addr += info->mask_cle;
-		else if ((ctrl & NAND_CTRL_ALE) == NAND_CTRL_ALE)
-			addr += info->mask_ale;
-
-		nand->legacy.IO_ADDR_W = addr;
-	}
+	if (ctrl & NAND_CTRL_CLE)
+		addr += info->mask_cle;
+	else if (ctrl & NAND_CTRL_ALE)
+		addr += info->mask_ale;
 
 	if (cmd != NAND_CMD_NONE)
-		iowrite8(cmd, nand->legacy.IO_ADDR_W);
+		iowrite8(cmd, addr);
 }
 
 static void nand_davinci_select_chip(struct nand_chip *nand, int chip)
@@ -114,9 +109,6 @@ static void nand_davinci_select_chip(struct nand_chip *nand, int chip)
 	/* maybe kick in a second chipselect */
 	if (chip > 0)
 		info->current_cs += info->mask_chipsel;
-
-	info->chip.legacy.IO_ADDR_W = info->current_cs;
-	info->chip.legacy.IO_ADDR_R = info->chip.legacy.IO_ADDR_W;
 }
 
 /*----------------------------------------------------------------------*/
@@ -425,23 +417,27 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 static void nand_davinci_read_buf(struct nand_chip *chip, uint8_t *buf,
 				  int len)
 {
+	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
+
 	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
-		ioread32_rep(chip->legacy.IO_ADDR_R, buf, len >> 2);
+		ioread32_rep(info->current_cs, buf, len >> 2);
 	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
-		ioread16_rep(chip->legacy.IO_ADDR_R, buf, len >> 1);
+		ioread16_rep(info->current_cs, buf, len >> 1);
 	else
-		ioread8_rep(chip->legacy.IO_ADDR_R, buf, len);
+		ioread8_rep(info->current_cs, buf, len);
 }
 
 static void nand_davinci_write_buf(struct nand_chip *chip, const uint8_t *buf,
 				   int len)
 {
+	struct davinci_nand_info *info = to_davinci_nand(nand_to_mtd(chip));
+
 	if ((0x03 & ((uintptr_t)buf)) == 0 && (0x03 & len) == 0)
-		iowrite32_rep(chip->legacy.IO_ADDR_R, buf, len >> 2);
+		iowrite32_rep(info->current_cs, buf, len >> 2);
 	else if ((0x01 & ((uintptr_t)buf)) == 0 && (0x01 & len) == 0)
-		iowrite16_rep(chip->legacy.IO_ADDR_R, buf, len >> 1);
+		iowrite16_rep(info->current_cs, buf, len >> 1);
 	else
-		iowrite8_rep(chip->legacy.IO_ADDR_R, buf, len);
+		iowrite8_rep(info->current_cs, buf, len);
 }
 
 /*
@@ -747,8 +743,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	mtd->dev.parent		= &pdev->dev;
 	nand_set_flash_node(&info->chip, pdev->dev.of_node);
 
-	info->chip.legacy.IO_ADDR_R	= vaddr;
-	info->chip.legacy.IO_ADDR_W	= vaddr;
 	info->chip.legacy.chip_delay	= 0;
 	info->chip.legacy.select_chip	= nand_davinci_select_chip;
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
