Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1B5C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0lVkmG2iy1pOx+17w0sLfL3IOEC/o0zHqv91zIcnv4=; b=zod/+zs8jiSNnJ
	pkNDPKePunvEF/y/rtDImImu9ECcMcSdMVrLCv43rFZv5A2tWmdT36wtwEt2C7sM41VBYbAWBijKw
	TUXR0ByUb40c3Sya7cDt58F7aj0tBzt1Rwn8iKT7zVKfyIrZKbOLIitXliSNzafP+EuNO5vSfd0vN
	WzQDqvmw7VWELlFGZH6F4QpPpkGc6b1FELY+SAadmPxv//zbe1RQSvbO3P9Z8jVqDUB1Qud4j7/n8
	nP0UklU/JsVPFRKseXQhwWCfv4cUn34ZYIPxl9EezpCq2SbD00KF/vkusX1ZWSSIxwlLqIUAHTyQC
	jwfKBQxaVVaYDrJSe0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z6W-006jX0-OE; Sat, 01 Jan 2022 07:47:05 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z3Q-006iYY-Ln
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017hbZq085695;
 Sat, 1 Jan 2022 01:43:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023017;
 bh=XmjPZM2rZqYnsVHChW+Tn5KFo+fPfd+N03181Y67YVY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=L0m0J1DuXeBxEnFqe7ClongEw9IIMXbur2Dd+KDd9yYbeNpMymKFYBr6xJ/Pa25rt
 S9efwKLn1SVqaJcdtwUkFuiNBwjKCCZJdkhGl+dp23qgBM5pQl20PlP9ikPwLfzIcz
 qZdt0e3/4E8Ua0FduK62OqpitFmIxD/j26GZpDU4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017hbLM089881
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:43:37 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:43:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:43:36 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwc033162;
 Sat, 1 Jan 2022 01:43:31 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 07/17] mtd: spinand: Switch from op macros usage to
 'ctrl_ops' in the core
Date: Sat, 1 Jan 2022 13:12:40 +0530
Message-ID: <20220101074250.14443-8-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234352_818879_362E791B 
X-CRM114-Status: GOOD (  11.56  )
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

Make use of the ctrl_ops struct, to introduce the usage of templates
in non-page read/write operations as well. These templates are
initialized at the probe time or at SPI modes switches.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4a75eb06bb52..30e90527ee3c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -22,9 +22,11 @@
 
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
-						      spinand->scratchbuf);
 	int ret;
+	struct spi_mem_op op = spinand->ctrl_ops->ops.get_feature;
+
+	op.data.buf.out = spinand->scratchbuf;
+	memset(&op.addr.val, reg, op.addr.nbytes);
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
@@ -36,10 +38,12 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 
 static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.set_feature;
+
+	op.data.buf.out = spinand->scratchbuf;
+	memset(&op.addr.val, reg, op.addr.nbytes);
+	memset(spinand->scratchbuf, val, op.data.nbytes);
 
-	*spinand->scratchbuf = val;
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -341,7 +345,7 @@ static void spinand_ondie_ecc_save_status(struct nand_device *nand, u8 status)
 
 static int spinand_write_enable_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.write_enable;
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -351,7 +355,9 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PAGE_READ_OP(row);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.page_read;
+
+	op.addr.val = row;
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -475,7 +481,9 @@ static int spinand_program_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PROG_EXEC_OP(row);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.program_execute;
+
+	op.addr.val = row;
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -485,7 +493,9 @@ static int spinand_erase_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, pos);
-	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.block_erase;
+
+	op.addr.val = row;
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -495,11 +505,13 @@ static int spinand_wait(struct spinand_device *spinand,
 			unsigned long poll_delay_us,
 			u8 *s)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = spinand->ctrl_ops->ops.get_feature;
 	u8 status;
 	int ret;
 
+	op.data.buf.out = spinand->scratchbuf;
+	memset(&op.addr.val, REG_STATUS, op.addr.nbytes);
+
 	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
 				  initial_delay_us,
 				  poll_delay_us,
@@ -542,7 +554,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 
 static int spinand_reset_op(struct spinand_device *spinand)
 {
-	struct spi_mem_op op = SPINAND_RESET_OP;
+	struct spi_mem_op op = spinand->ctrl_ops->ops.reset;
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
