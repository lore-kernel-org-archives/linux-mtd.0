Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF5FC55199
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0475A20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOg5l8Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0475A20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyyTEUGblRoYolhYCp7k66slt0vIigOsk273n273wUs=; b=gOg5l8Bs8ai6oR
	zdp0hC7HoodXjAGqkYv9ccAq86TDp8eteiQcYnx361KFKYHWWzCLTnL+IlemRuK3o/CuZsbnjHbAe
	J0uNQLWXu431p1bUDCnD6+yNqKhVWJKqZNzS5CeJzzHRSzz86d4iedzitk7QV/7pX3GtfNg9omy5N
	vbCOXP0iQPLEze/mz0e7IT+c9Z4ybKxdXhLqL3UJ0ELVCqX3peWxtnYYX7fi3cJZApNIc3fWQaPh1
	1RcKs4OAYGeLKrDg4NGuvDXe1Kx/DbaQzBC+CyRYWKvwj6003El4xGhhUkOZAavc6pz+XrTsb5Ofa
	OYAN6QBe/4+TFoNdoRQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz5L-0004YX-DB; Mon, 27 Apr 2020 08:25:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0L-0006BE-Ui
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2027E2A07FC;
 Mon, 27 Apr 2020 09:20:40 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 13/17] mtd: rawnand: cafe: Add exec_op() support
Date: Mon, 27 Apr 2020 10:20:23 +0200
Message-Id: <20200427082028.394719-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012042_249255_A7AFD735 
X-CRM114-Status: GOOD (  16.69  )
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

Implementing exec_op() will help us get rid of the legacy interface and
should make drivers much cleaner too.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 137 ++++++++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index edf65197604b..ada9c8b06a41 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -21,7 +21,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 
 #define CAFE_NAND_CTRL1				0x00
 #define CAFE_NAND_CTRL1_HAS_CMD			BIT(31)
@@ -774,9 +774,144 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
 }
 
+static int cafe_nand_exec_subop(struct nand_chip *chip,
+				const struct nand_subop *subop)
+{
+	struct cafe_priv *cafe = nand_get_controller_data(chip);
+	u32 ctrl1 = 0, ctrl2 = cafe->ctl2, addr1 = 0, addr2 = 0;
+	const struct nand_op_instr *data_instr = NULL;
+	u32 status, wait = CAFE_NAND_IRQ_CMD_DONE;
+	bool waitrdy = false;
+	unsigned int i, j;
+	int ret;
+
+	if (WARN_ON(subop->cs > 1))
+		return -EINVAL;
+
+	cafe->datalen = 0;
+	ctrl1 |= CAFE_FIELD_PREP(NAND_CTRL1, CE, subop->cs);
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			if (WARN_ON((ctrl1 & CAFE_NAND_CTRL1_HAS_CMD) &&
+				    (ctrl2 & CAFE_NAND_CTRL2_HAS_CMD2)))
+				return -EINVAL;
+
+			if (!(ctrl1 & CAFE_NAND_CTRL1_HAS_CMD))
+				ctrl1 |= CAFE_NAND_CTRL1_HAS_CMD |
+					 CAFE_FIELD_PREP(NAND_CTRL1, CMD,
+							 instr->ctx.cmd.opcode);
+			else
+				ctrl2 |= CAFE_NAND_CTRL2_HAS_CMD2 |
+					 CAFE_FIELD_PREP(NAND_CTRL2, CMD2,
+							 instr->ctx.cmd.opcode);
+			break;
+
+		case NAND_OP_ADDR_INSTR:
+			if (WARN_ON(instr->ctx.addr.naddrs > 5 ||
+				    !instr->ctx.addr.naddrs))
+				return -EINVAL;
+
+			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
+				u32 addr = instr->ctx.addr.addrs[j];
+
+				if (j < 2)
+					addr1 |= addr << (8 * j);
+				else
+					addr2 |= addr << (8 * (j - 2));
+			}
+
+			ctrl1 |= CAFE_NAND_CTRL1_HAS_ADDR |
+				 CAFE_FIELD_PREP(NAND_CTRL1, NUM_ADDR_CYC,
+						 instr->ctx.addr.naddrs - 1);
+			cafe_writel(cafe, addr1, NAND_ADDR1);
+			if (instr->ctx.addr.naddrs > 2)
+				cafe_writel(cafe, addr2, NAND_ADDR2);
+			break;
+
+		case NAND_OP_DATA_IN_INSTR:
+			data_instr = instr;
+			ctrl1 |= CAFE_NAND_CTRL1_HAS_DATA_IN;
+			break;
+
+		case NAND_OP_DATA_OUT_INSTR:
+			data_instr = instr;
+			ctrl1 |= CAFE_NAND_CTRL1_HAS_DATA_OUT;
+			cafe_write_buf(chip, instr->ctx.data.buf.out,
+				       instr->ctx.data.len);
+			break;
+
+		case NAND_OP_WAITRDY_INSTR:
+			wait |= CAFE_NAND_IRQ_FLASH_RDY;
+			waitrdy = true;
+			break;
+		}
+	}
+
+	if (data_instr)
+		cafe_writel(cafe, data_instr->ctx.data.len, NAND_DATA_LEN);
+
+	if (cafe->usedma && data_instr) {
+		u32 dmactrl = CAFE_NAND_DMA_CTRL_ENABLE |
+			      CAFE_NAND_DMA_CTRL_RESERVED;
+
+		wait |= CAFE_NAND_IRQ_DMA_DONE;
+		dmactrl |= CAFE_FIELD_PREP(NAND_DMA_CTRL, DATA_LEN,
+					   data_instr->ctx.data.len);
+		if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN)
+			dmactrl |= CAFE_NAND_DMA_CTRL_DATA_IN;
+
+		cafe_writel(cafe, dmactrl, NAND_DMA_CTRL);
+	}
+
+	/* Clear the pending interrupts before starting the operation. */
+	cafe_writel(cafe, wait, NAND_IRQ);
+
+	cafe_writel(cafe, ctrl2, NAND_CTRL2);
+	cafe_writel(cafe, ctrl1, NAND_CTRL1);
+
+	ret = readl_poll_timeout(cafe->mmio + CAFE_NAND_IRQ, status,
+				 (status & wait) == wait, 1, USEC_PER_SEC);
+	if (ret)
+		return ret;
+
+	if (ctrl1 & CAFE_NAND_DMA_CTRL_DATA_IN)
+		cafe_read_buf(chip, data_instr->ctx.data.buf.in,
+			      data_instr->ctx.data.len);
+
+	return 0;
+}
+
+static const struct nand_op_parser cafe_nand_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(cafe_nand_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 2112)),
+	NAND_OP_PARSER_PATTERN(cafe_nand_exec_subop,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 2112),
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true))
+);
+
+static int cafe_nand_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	return nand_op_parser_exec_op(chip, &cafe_nand_op_parser, op,
+				      check_only);
+}
+
 static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.attach_chip = cafe_nand_attach_chip,
 	.detach_chip = cafe_nand_detach_chip,
+	.exec_op = cafe_nand_exec_op,
 };
 
 static void cafe_nand_init(struct cafe_priv *cafe)
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
