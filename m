Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FF9C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5756A20709
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tiCEWpC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5756A20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZGoODk14ADa+Q7CCwmI4oPxhb7Y4AGIqiFh+VOsJOw=; b=tiCEWpC7qMAOXP
	d4fZfeY/EsSAr8/qatU5Xvp7B8Lwb7jJ49mGYRVlHRqOvtXovITFt/A4q4CNexNlcU3bwgaho/qNm
	4CVDUcIli/gqNFzkEwtt/COYww3IjAxDs6Riueo4J5cLFHGknd//vJJXNqOVE/KsO68RURy0xaGyy
	PBC2t9TyICtCfKMnGCkJn83aG8QHPwGHN9Yu3LXP2lzSIwgas5MTK5QqLSrqnJILFADkBFJmENv5B
	akIXf0xhIroS4aWOOV2k93l9AXJOyKLj4ITYIFVyayxqXA+z+QsbE32Vb6V2vFyt0eKt3wAeSooW2
	lhtY66G7fuyzesXB91qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaif3-0001vI-0J; Mon, 18 May 2020 16:30:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaidB-0006I5-Jz
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:28:48 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 131EB2A0B14;
 Mon, 18 May 2020 17:28:43 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mips@vger.kernel.org
Subject: [PATCH v2 5/8] mtd: rawnand: bcm47xx: Implement the exec_op()
 interface
Date: Mon, 18 May 2020 18:28:34 +0200
Message-Id: <20200518162837.304471-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518162837.304471-1-boris.brezillon@collabora.com>
References: <20200518162837.304471-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092845_932373_77854759 
X-CRM114-Status: GOOD (  18.49  )
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

Implement the exec_op() interface so we can get rid of the convoluted
cmdfunc() implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
This is based on my understanding of how this controller works, and I
think it covers all the use cases covered by the custom cmdfunc()
implementation. I might be wrong of course, so it'd be great to have
someone test on real HW.

Changes in v2:
 * s/i/j/ in exec_cmd_addr()
 * Drop WARN_ON()s
---
 .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |   1 +
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 140 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
index 201b9baa52a0..00d0974b73cb 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
@@ -10,6 +10,7 @@
 #include <linux/mtd/rawnand.h>
 
 struct bcm47xxnflash {
+	struct nand_controller base;
 	struct bcma_drv_cc *cc;
 
 	struct nand_chip nand_chip;
diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 543fcff6e4d2..edf0c3d7b561 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -382,6 +382,143 @@ static void bcm47xxnflash_ops_bcm4706_write_buf(struct nand_chip *nand_chip,
 	pr_err("Invalid command for buf write: 0x%X\n", b47n->curr_command);
 }
 
+static int
+bcm47xxnflash_ops_bcm4706_exec_cmd_addr(struct nand_chip *chip,
+					const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	u32 nctl = 0, col = 0, row = 0, ncols = 0, nrows = 0;
+	unsigned int i, j;
+
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			if (WARN_ON_ONCE((nctl & NCTL_CMD0) &&
+					 (nctl & NCTL_CMD1W)))
+				return -EINVAL;
+			else if (nctl & NCTL_CMD0)
+				nctl |= NCTL_CMD1W |
+					((u32)instr->ctx.cmd.opcode << 8);
+			else
+				nctl |= NCTL_CMD0 | instr->ctx.cmd.opcode;
+			break;
+		case NAND_OP_ADDR_INSTR:
+			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
+				u32 addr = instr->ctx.addr.addrs[j];
+
+				if (j < 2) {
+					col |= addr << (j * 8);
+					nctl |= NCTL_COL;
+					ncols++;
+				} else {
+					row |= addr << ((j - 2) * 8);
+					nctl |= NCTL_ROW;
+					nrows++;
+				}
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* Keep the CS line asserted if there's something else to execute. */
+	if (!subop->is_last)
+		nctl |= NCTL_CSA;
+
+	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF,
+			CONF_MAGIC_BIT |
+			CONF_COL_BYTES(ncols) |
+			CONF_ROW_BYTES(nrows));
+	return bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, nctl);
+}
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_waitrdy(struct nand_chip *chip,
+				       const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned long timeout_jiffies = jiffies;
+
+	timeout_jiffies += msecs_to_jiffies(instr->ctx.waitrdy.timeout_ms) + 1;
+	do {
+		if (bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_CTL) & NCTL_READY)
+			return 0;
+
+		usleep_range(10, 100);
+	} while (time_before(jiffies, timeout_jiffies));
+
+	return -ETIMEDOUT;
+}
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_rw(struct nand_chip *chip,
+				  const struct nand_subop *subop)
+{
+	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < instr->ctx.data.len; i += 4) {
+		unsigned int nbytes = min_t(unsigned int,
+					    instr->ctx.data.len - i, 4);
+		u32 nctl, data;
+
+		nctl = NCTL_CSA | NCTL_DATA_CYCLES(nbytes);
+		if (instr->type == NAND_OP_DATA_IN_INSTR) {
+			nctl |= NCTL_READ;
+		} else {
+			nctl |= NCTL_WRITE;
+			memcpy(&data, instr->ctx.data.buf.in + i, nbytes);
+			bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_DATA, data);
+		}
+
+		if (i + nbytes < instr->ctx.data.len)
+			nctl |= NCTL_CSA;
+
+		ret = bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, nctl);
+		if (ret)
+			return ret;
+
+		if (instr->type == NAND_OP_DATA_IN_INSTR) {
+			data = bcma_cc_read32(b47n->cc, BCMA_CC_NFLASH_DATA);
+			memcpy(instr->ctx.data.buf.in + i, &data, nbytes);
+		}
+	}
+
+	return 0;
+}
+
+static const struct nand_op_parser bcm47xxnflash_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_cmd_addr,
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
+			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_waitrdy,
+			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_rw,
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0x200)),
+	NAND_OP_PARSER_PATTERN(bcm47xxnflash_ops_bcm4706_exec_rw,
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0x200)),
+);
+
+static int
+bcm47xxnflash_ops_bcm4706_exec_op(struct nand_chip *chip,
+				  const struct nand_operation *op,
+				  bool check_only)
+{
+	return nand_op_parser_exec_op(chip, &bcm47xxnflash_op_parser, op,
+				      check_only);
+}
+
+static const struct nand_controller_ops bcm47xxnflash_ops = {
+	.exec_op = bcm47xxnflash_ops_bcm4706_exec_op,
+};
+
 /**************************************************
  * Init
  **************************************************/
@@ -398,6 +535,9 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 	u8 tbits, col_bits, col_size, row_bits, row_bsize;
 	u32 val;
 
+	nand_controller_init(&b47n->base);
+	b47n->base.ops = &bcm47xxnflash_ops;
+	b47n->nand_chip.controller = &b47n->base;
 	nand_chip->legacy.select_chip = bcm47xxnflash_ops_bcm4706_select_chip;
 	nand_chip->legacy.cmd_ctrl = bcm47xxnflash_ops_bcm4706_cmd_ctrl;
 	nand_chip->legacy.dev_ready = bcm47xxnflash_ops_bcm4706_dev_ready;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
