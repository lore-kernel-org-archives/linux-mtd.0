Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5653C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53A16054F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B53A16054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2olV5yNriyl2bNU2R3X7/8TttFgBYJZ0120a8H+WVqU=; b=nq0TuaYg4o3MHY
	DaEYtUZEbsrj0FkjK9wiKS1QggPAtD6IdTHV9cZdkPov4bMqs0YQxzjQ2M4E30MWUYZ8r48v92DgV
	UfctNd9BKw75jzrSPMBEMo+al/AuO0+onqANnltxz4enqz6hlGLZlQm7RZkMWfmJNu/AIZBqEG9KQ
	mS7CPiGYS9bDhs/KH6GLYb2QWwRtHQ18jH0ojyeXVSjhenZ6s5JTgjepqjRVlf7tvCqUx6MP/Sr3l
	8fZN8UcIIMIAjoCfGDaBbUXeldDVDUTEqxOYnhgvd3qtJrIhPneHsLJkSQteFN0d/Zta8NAxetuHf
	POWntWGGQim9OtN0WURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2Cj-00AdYI-Bp; Mon, 11 Oct 2021 20:47:25 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2CB-00AdRW-8m
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:46:52 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkhNc070935;
 Mon, 11 Oct 2021 15:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985203;
 bh=CASUc+JvQlKfMHsjOUu+uMJGKuCWgnI+FiOL7ZWrJQo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=bU+vpQKS461/fk50n4GpL/J16aZYZ+9aHDE6pwvpsSuPxG+D/cN4xnSHUoNmOuUYF
 TcC6q+NjzlIXSuw9ZW3iYrkK2j8pJZ8xcHlmp4dqOZojnGzVmrb/kkwq7/KhM6VhQp
 7BTzltvEiBwmytCaxkTdI1WXgM0ZgGPbO2AFGnwg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKkhdE055206
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:43 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEh069811;
 Mon, 11 Oct 2021 15:46:38 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 03/14] mtd: spinand: Patch spi_mem_op for the SPI IO
 protocol using reg_proto
Date: Tue, 12 Oct 2021 02:16:08 +0530
Message-ID: <20211011204619.81893-4-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134651_424990_980EB5F0 
X-CRM114-Status: GOOD (  16.33  )
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

Currently, the op macros in spinand.h don't give the option to setup
any non-array access instructions for Dual/Quad/Octal DTR SPI bus.
Having a function that patches the op based on reg_proto would be
better than trying to write all the setup logic in op macros.

Create a spimem_patch_op() that would patch cmd, addr, dummy and data
phase of the spi_mem op, for the given spinand->reg_proto. And hence,
call the spimem_patch_op() before executing any spi_mem op.

Note: In this commit, spimem_patch_op() isn't called in the
read_reg_op(), write_reg_op() and wait() functions, as they need
modifications in address value and data nbytes when in Octal DTR mode.
This will be fixed in a later commit.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 49 +++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d82a3e6d9bb5..11746d858f87 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -20,6 +20,49 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
+/**
+ * spinand_patch_op() - Helper function to patch the spi_mem op based on the
+ *			spinand->reg_proto
+ * @spinand: the spinand device
+ * @op: the spi_mem op to patch
+ *
+ * Set up buswidth and dtr fields for cmd, addr, dummy and data phase. Also
+ * adjust cmd opcode and dummy nbytes. This function doesn't make any changes
+ * to addr val or data buf.
+ */
+static void spinand_patch_op(const struct spinand_device *spinand,
+			     struct spi_mem_op *op)
+{
+	u8 op_buswidth = SPINAND_PROTO_BUSWIDTH(spinand->reg_proto);
+	u8 op_is_dtr = SPINAND_PROTO_IS_DTR(spinand->reg_proto);
+
+	if (spinand->reg_proto == SPINAND_SINGLE_STR)
+		return;
+
+	op->cmd.buswidth = op_buswidth;
+	op->cmd.dtr = op_is_dtr;
+	if (spinand->reg_proto == SPINAND_OCTAL_DTR) {
+		op->cmd.opcode = (op->cmd.opcode << 8) | op->cmd.opcode;
+		op->cmd.nbytes = 2;
+	}
+
+	if (op->addr.nbytes) {
+		op->addr.buswidth = op_buswidth;
+		op->addr.dtr = op_is_dtr;
+	}
+
+	if (op->dummy.nbytes) {
+		op->dummy.buswidth = op_buswidth;
+		op->dummy.dtr = op_is_dtr;
+		op->dummy.nbytes <<= op_is_dtr;
+	}
+
+	if (op->data.nbytes) {
+		op->data.buswidth = op_buswidth;
+		op->data.dtr = op_is_dtr;
+	}
+}
+
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
@@ -343,6 +386,7 @@ static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
 
+	spinand_patch_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -353,6 +397,7 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
 	struct spi_mem_op op = SPINAND_PAGE_READ_OP(row);
 
+	spinand_patch_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -477,6 +522,7 @@ static int spinand_program_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
 	struct spi_mem_op op = SPINAND_PROG_EXEC_OP(row);
 
+	spinand_patch_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -487,6 +533,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
 	unsigned int row = nanddev_pos_to_row(nand, pos);
 	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
 
+	spinand_patch_op(spinand, &op);
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
@@ -533,6 +580,7 @@ static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
+	spinand_patch_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (!ret)
 		memcpy(buf, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
@@ -545,6 +593,7 @@ static int spinand_reset_op(struct spinand_device *spinand)
 	struct spi_mem_op op = SPINAND_RESET_OP;
 	int ret;
 
+	spinand_patch_op(spinand, &op);
 	ret = spi_mem_exec_op(spinand->spimem, &op);
 	if (ret)
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
