Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3BCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50CE20657
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdacXiF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50CE20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiUiYZwzV8zPWBg0tNbDrMCkU5a/DaYbMmdnNeB5lk4=; b=tdacXiF71G4znq
	6gOh2qi9l80dtY1o64cM5Z0dTbF7awMc83rPDLkmPWr9kyC4AFclOmNRqPegRaeaiD1TXeoZoAD4U
	fvIHORAtJpXvafDPLiZ7sBDI9/QDRfSyipDDYBwopjiNX1rQPJzm0ePX/hB1Thnv9r4AbYioZcnZI
	Rd4Pul7D6cgYzGbi+aXxYR8vuyW2uO7Sbsg7mlADnCEy7t9G3kyGIvYXoaVaLuHRnsRbEoL18n/Rr
	80zWQsga3MfCVgGc1Gj8EFdIliDRusjc6Xai4CRkUWyJ0dcM0MCs8wlfE8Tl3rfhR8IJ8yPZADFJ3
	7LxayVt/pm/hAUKfPdow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaieY-0008V9-Mp; Mon, 18 May 2020 16:30:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaidB-0006I7-M4
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:28:47 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B2B5C2A0EF5;
 Mon, 18 May 2020 17:28:43 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org
Subject: [PATCH v2 7/8] mtd: rawnand: bcm47xx: Simplify the init() function
Date: Mon, 18 May 2020 18:28:36 +0200
Message-Id: <20200518162837.304471-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092845_873324_66E8A65D 
X-CRM114-Status: GOOD (  14.24  )
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

The row and column sizes are now set as part of the exec_op() procedure
and adjusted to match the requested number of address cycles. No need
to set them in the init() function since those values will be
overwritten anyway. As for the other sanity check that was done on the
chip size, I don't think it's really needed.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Add R-b
---
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 31 ++-----------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index b6c5db9acac9..e34a13b7f919 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -227,10 +227,6 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u16 clock;
 	u8 w0, w1, w2, w3, w4;
 
-	unsigned long chipsize; /* MiB */
-	u8 tbits, col_bits, col_size, row_bits, row_bsize;
-	u32 val;
-
 	nand_controller_init(&b47n->base);
 	b47n->base.ops = &bcm47xxnflash_ops;
 	b47n->nand_chip.controller = &b47n->base;
@@ -264,32 +260,9 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	err = nand_scan(&b47n->nand_chip, 1);
 	if (err) {
 		pr_err("Could not scan NAND flash: %d\n", err);
-		goto exit;
-	}
-
-	/* Configure FLASH */
-	chipsize = nanddev_target_size(&b47n->nand_chip.base) >> 20;
-	tbits = ffs(chipsize); /* find first bit set */
-	if (!tbits || tbits != fls(chipsize)) {
-		pr_err("Invalid flash size: 0x%lX\n", chipsize);
-		err = -ENOTSUPP;
-		goto exit;
-	}
-	tbits += 19; /* Broadcom increases *index* by 20, we increase *pos* */
-
-	col_bits = b47n->nand_chip.page_shift + 1;
-	col_size = (col_bits + 7) / 8;
-
-	row_bits = tbits - col_bits + 1;
-	row_bsize = (row_bits + 7) / 8;
-
-	val = CONF_ROW_BYTES(row_bsize) | CONF_COL_BYTES(col_size) |
-	      CONF_MAGIC_BIT;
-	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF, val);
-
-exit:
-	if (err)
 		bcma_cc_mask32(b47n->cc, BCMA_CC_4706_FLASHSCFG,
 			       ~BCMA_CC_4706_FLASHSCFG_NF1);
+	}
+
 	return err;
 }
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
