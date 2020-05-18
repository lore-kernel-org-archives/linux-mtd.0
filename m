Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F48C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095C0207E8
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CgQTtYBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095C0207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHUE9sPUjbXtFboLk+37tjqaEvH1roPAvkUcHf+MZeQ=; b=CgQTtYBwUpzjTE
	UCSFS4TGhoot59pNB9EtbjI9ywyUBVC33vIQg7IsTW3NujECBwLGkKNsMbiP94gSw47iRfmU0w5pl
	3Yi5sdZ6GQP99h24yrnomlzhCJ42W/mhhAOkQskrJB+BwWrZWbT06ITG5+453E8EQxgMfUYsjrQbS
	OHYclIiyjF8/wu+iKkNdLNGOby5Q3onMV++RbA4UbIK1YJyMFmDT1V6Jc6NM78njommlfcShs1VMD
	02sh3z7WkQGaqBhU9SH+kyeMq4JdaEYpXFW1X6MhJYNU1YsTvrieWZ9PTgNZtcyGUy/QQsUazZpy8
	LqkfQlMbYpFwDtk925/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaieB-0007GV-Rb; Mon, 18 May 2020 16:29:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaidA-0006Go-21
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:28:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B62E22A0EDD;
 Mon, 18 May 2020 17:28:42 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org
Subject: [PATCH v2 4/8] mtd: rawnand: bcm47xx: Demistify a few more things
Date: Mon, 18 May 2020 18:28:33 +0200
Message-Id: <20200518162837.304471-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092844_354421_5D521B69 
X-CRM114-Status: GOOD (  16.48  )
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

There were a few places where raw hex values were used instead of the
register/field definitions. Let's replace them by proper definitions.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Fix the commit message
* Fix a typo in a comment
* Add R-b
---
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 34 +++++++++++++++----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 591775173034..543fcff6e4d2 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -25,12 +25,29 @@
 #define NCTL_CMD1W			0x00080000
 #define NCTL_READ			0x00100000
 #define NCTL_WRITE			0x00200000
+/* When the SPECADDR is set CMD1 is interpreted as a single ADDR cycle */
 #define NCTL_SPECADDR			0x01000000
 #define NCTL_READY			0x04000000
 #define NCTL_ERR			0x08000000
+/*
+ * Number of DATA cycles to issue when NCTL_{READ,WRITE} is set. The minimum
+ * value is 1 and the maximum value is 4. Those bytes are then stored in the
+ * BCMA_CC_NFLASH_DATA register.
+ */
+#define NCTL_DATA_CYCLES(x)		((((x) - 1) & 0x3) << 28)
+/*
+ * The CS pin seems to be asserted even if NCTL_CSA is not set. All this bit
+ * seems to encode is whether the CS line should stay asserted after the
+ * operation has been executed. In other words, you should only set it if you
+ * intend to do more operations on the NAND bus.
+ */
 #define NCTL_CSA			0x40000000
 #define NCTL_START			0x80000000
 
+#define CONF_MAGIC_BIT			0x00000002
+#define CONF_COL_BYTES(x)		(((x) - 1) << 4)
+#define CONF_ROW_BYTES(x)		(((x) - 1) << 6)
+
 /**************************************************
  * Various helpers
  **************************************************/
@@ -118,7 +135,7 @@ static void bcm47xxnflash_ops_bcm4706_read(struct mtd_info *mtd, uint8_t *buf,
 
 		/* Eventually read some data :) */
 		for (i = 0; i < toread; i += 4, dest++) {
-			ctlcode = NCTL_CSA | 0x30000000 | NCTL_READ;
+			ctlcode = NCTL_CSA | NCTL_DATA_CYCLES(4) | NCTL_READ;
 			if (i == toread - 4) /* Last read goes without that */
 				ctlcode &= ~NCTL_CSA;
 			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
@@ -150,7 +167,7 @@ static void bcm47xxnflash_ops_bcm4706_write(struct mtd_info *mtd,
 	for (i = 0; i < len; i += 4, data++) {
 		bcma_cc_write32(cc, BCMA_CC_NFLASH_DATA, *data);
 
-		ctlcode = NCTL_CSA | 0x30000000 | NCTL_WRITE;
+		ctlcode = NCTL_CSA | NCTL_DATA_CYCLES(4) | NCTL_WRITE;
 		if (i == len - 4) /* Last read goes without that */
 			ctlcode &= ~NCTL_CSA;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode)) {
@@ -229,7 +246,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct nand_chip *nand_chip,
 		nand_wait_ready(nand_chip);
 		break;
 	case NAND_CMD_READID:
-		ctlcode = NCTL_CSA | 0x01000000 | NCTL_CMD1W | NCTL_CMD0;
+		ctlcode = NCTL_CSA | NCTL_SPECADDR | NCTL_CMD1W | NCTL_CMD0;
 		ctlcode |= NAND_CMD_READID;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, ctlcode)) {
 			pr_err("READID error\n");
@@ -242,7 +259,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct nand_chip *nand_chip,
 		 * to perform, so cache everything.
 		 */
 		for (i = 0; i < ARRAY_SIZE(b47n->id_data); i++) {
-			ctlcode = NCTL_CSA | NCTL_READ;
+			ctlcode = NCTL_CSA | NCTL_READ | NCTL_DATA_CYCLES(1);
 			if (i == ARRAY_SIZE(b47n->id_data) - 1)
 				ctlcode &= ~NCTL_CSA;
 			if (bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc,
@@ -285,7 +302,7 @@ static void bcm47xxnflash_ops_bcm4706_cmdfunc(struct nand_chip *nand_chip,
 				b47n->curr_page_addr);
 
 		/* Prepare to write */
-		ctlcode = 0x40000000 | NCTL_ROW | NCTL_COL | NCTL_CMD0;
+		ctlcode = NCTL_CSA | NCTL_ROW | NCTL_COL | NCTL_CMD0;
 		ctlcode |= NAND_CMD_SEQIN;
 		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, ctlcode))
 			pr_err("SEQIN failed\n");
@@ -320,7 +337,9 @@ static u8 bcm47xxnflash_ops_bcm4706_read_byte(struct nand_chip *nand_chip)
 		}
 		return b47n->id_data[b47n->curr_column++];
 	case NAND_CMD_STATUS:
-		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc, NCTL_READ))
+		if (bcm47xxnflash_ops_bcm4706_ctl_cmd(cc,
+						      NCTL_READ |
+						      NCTL_DATA_CYCLES(1)))
 			return 0;
 		return bcma_cc_read32(cc, BCMA_CC_NFLASH_DATA) & 0xff;
 	case NAND_CMD_READOOB:
@@ -439,7 +458,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	row_bits = tbits - col_bits + 1;
 	row_bsize = (row_bits + 7) / 8;
 
-	val = ((row_bsize - 1) << 6) | ((col_size - 1) << 4) | 2;
+	val = CONF_ROW_BYTES(row_bsize) | CONF_COL_BYTES(col_size) |
+	      CONF_MAGIC_BIT;
 	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF, val);
 
 exit:
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
