Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44F7C4724C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E6220708
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfKsPuBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E6220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UMALc2ijc7khnK7VqA3PFPuPV5LS0LwFNNka4gd360=; b=UfKsPuBSwzrLPX
	izcYxJc80sApvzin62+4lcsZhk1ZcpbeKQcQh3RZYP4WUBfauNSDwQ5cIA+O+BTrCVjk6DregjwjG
	ZuY7/UQTJxq5q+LZcW1LCwBqq+QWl3k/XhbOxezhYUoj22HTuZVWjVEnCGKBQJqn/JzJfUnUtYTn8
	/nBAupFE9Ax7/WkrS2VwqlbLIsgoHT5Q6vtpAMKlp/vWarNkzqquu0qA9BBisPRwe0RokM2SR71XI
	NyOGLBG4td0GYSajN3QPgF/1bn6rbphfavYSmjOCd22/DV73iKndb0uRVq0io7V1yOWwakSm0Mh1r
	pm5+j02WVHqIsePrps4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWrD-0005Hz-AH; Fri, 01 May 2020 14:41:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWp6-0000r3-D1
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 14:39:31 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DD72D2A30CE;
 Fri,  1 May 2020 15:39:24 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd: rawnand: diskonchip: Implement exec_op()
Date: Fri,  1 May 2020 16:39:16 +0200
Message-Id: <20200501143917.1388957-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501143917.1388957-1-boris.brezillon@collabora.com>
References: <20200501143917.1388957-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073928_701123_8E430E08 
X-CRM114-Status: GOOD (  20.38  )
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

Implement exec_op() so we can later get rid of the legacy
implementation.

It's worth noting that the new implementation assert/deassert the CE
pin on each operation, which might not be necessary. We also dropped
the extra reset done at chip selection time on DOC2001plus. If it's
needed we really should do something smarter, because having a reset
everytime we access the chip is not that great perf-wise.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 219 +++++++++++++++++++++++++++---
 1 file changed, 199 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index b670b2a3d719..8adeb39905ac 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -355,25 +355,38 @@ static void doc2000_readbuf(struct nand_chip *this, u_char *buf, int len)
 	}
 }
 
+/*
+ * We need our own readid() here because it's called before the NAND chip
+ * has been initialized, and calling nand_op_readid() would lead to a NULL
+ * pointer exception when dereferencing the NAND timings.
+ */
+static void doc200x_readid(struct nand_chip *this, unsigned int cs, u8 *id)
+{
+	u8 addr = 0;
+	struct nand_op_instr instrs[] = {
+		NAND_OP_CMD(NAND_CMD_READID, 0),
+		NAND_OP_ADDR(1, &addr, 50),
+		NAND_OP_8BIT_DATA_IN(2, id, 0),
+	};
+
+	struct nand_operation op = NAND_OPERATION(cs, instrs);
+
+	if (!id)
+		op.ninstrs--;
+
+	this->controller->ops->exec_op(this, &op, false);
+}
+
 static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 	uint16_t ret;
+	u8 id[2];
 
-	doc200x_select_chip(this, nr);
-	doc200x_hwcontrol(this, NAND_CMD_READID,
-			  NAND_CTRL_CLE | NAND_CTRL_CHANGE);
-	doc200x_hwcontrol(this, 0, NAND_CTRL_ALE | NAND_CTRL_CHANGE);
-	doc200x_hwcontrol(this, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+	doc200x_readid(this, nr, id);
 
-	/* We can't use dev_ready here, but at least we wait for the
-	 * command to complete
-	 */
-	udelay(50);
-
-	ret = this->legacy.read_byte(this) << 8;
-	ret |= this->legacy.read_byte(this);
+	ret = ((u16)id[0] << 8) | id[1];
 
 	if (doc->ChipID == DOC_ChipID_Doc2k && try_dword && !nr) {
 		/* First chip probe. See if we get same results by 32-bit access */
@@ -383,13 +396,7 @@ static uint16_t __init doc200x_ident_chip(struct mtd_info *mtd, int nr)
 		} ident;
 		void __iomem *docptr = doc->virtadr;
 
-		doc200x_hwcontrol(this, NAND_CMD_READID,
-				  NAND_CTRL_CLE | NAND_CTRL_CHANGE);
-		doc200x_hwcontrol(this, 0, NAND_CTRL_ALE | NAND_CTRL_CHANGE);
-		doc200x_hwcontrol(this, NAND_CMD_NONE,
-				  NAND_NCE | NAND_CTRL_CHANGE);
-
-		udelay(50);
+		doc200x_readid(this, nr, NULL);
 
 		ident.dword = readl(docptr + DoC_2k_CDSN_IO);
 		if (((ident.byte[0] << 8) | ident.byte[1]) == ret) {
@@ -630,6 +637,166 @@ static void doc200x_hwcontrol(struct nand_chip *this, int cmd,
 	}
 }
 
+static void doc200x_write_control(struct doc_priv *doc, u8 value)
+{
+	WriteDOC(value, doc->virtadr, CDSNControl);
+	/* 11.4.3 -- 4 NOPs after CSDNControl write */
+	DoC_Delay(doc, 4);
+}
+
+static void doc200x_exec_instr(struct nand_chip *this,
+			       const struct nand_op_instr *instr)
+{
+	struct doc_priv *doc = nand_get_controller_data(this);
+	unsigned int i;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		doc200x_write_control(doc, CDSN_CTRL_CE | CDSN_CTRL_CLE);
+		doc2000_write_byte(this, instr->ctx.cmd.opcode);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		doc200x_write_control(doc, CDSN_CTRL_CE | CDSN_CTRL_ALE);
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			u8 addr = instr->ctx.addr.addrs[i];
+
+			if (DoC_is_2000(doc))
+				doc2000_write_byte(this, addr);
+			else
+				doc2001_write_byte(this, addr);
+		}
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		doc200x_write_control(doc, CDSN_CTRL_CE);
+		if (DoC_is_2000(doc))
+			doc2000_readbuf(this, instr->ctx.data.buf.in,
+					instr->ctx.data.len);
+		else
+			doc2001_readbuf(this, instr->ctx.data.buf.in,
+					instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		doc200x_write_control(doc, CDSN_CTRL_CE);
+		if (DoC_is_2000(doc))
+			doc2000_writebuf(this, instr->ctx.data.buf.out,
+					 instr->ctx.data.len);
+		else
+			doc2001_writebuf(this, instr->ctx.data.buf.out,
+					 instr->ctx.data.len);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		DoC_WaitReady(doc);
+		break;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+}
+
+static int doc200x_exec_op(struct nand_chip *this,
+			   const struct nand_operation *op,
+			   bool check_only)
+{
+	struct doc_priv *doc = nand_get_controller_data(this);
+	unsigned int i;
+
+	if (check_only)
+		return true;
+
+	doc->curchip = op->cs % doc->chips_per_floor;
+	doc->curfloor = op->cs / doc->chips_per_floor;
+
+	WriteDOC(doc->curfloor, doc->virtadr, FloorSelect);
+	WriteDOC(doc->curchip, doc->virtadr, CDSNDeviceSelect);
+
+	/* Assert CE pin */
+	doc200x_write_control(doc, CDSN_CTRL_CE);
+
+	for (i = 0; i < op->ninstrs; i++)
+		doc200x_exec_instr(this, &op->instrs[i]);
+
+	/* De-assert CE pin */
+	doc200x_write_control(doc, 0);
+
+	return 0;
+}
+
+static void doc2001plus_write_pipe_term(struct doc_priv *doc)
+{
+	WriteDOC(0x00, doc->virtadr, Mplus_WritePipeTerm);
+	WriteDOC(0x00, doc->virtadr, Mplus_WritePipeTerm);
+}
+
+static void doc2001plus_exec_instr(struct nand_chip *this,
+				   const struct nand_op_instr *instr)
+{
+	struct doc_priv *doc = nand_get_controller_data(this);
+	unsigned int i;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		WriteDOC(instr->ctx.cmd.opcode, doc->virtadr, Mplus_FlashCmd);
+		doc2001plus_write_pipe_term(doc);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			u8 addr = instr->ctx.addr.addrs[i];
+
+			WriteDOC(addr, doc->virtadr, Mplus_FlashAddress);
+		}
+		doc2001plus_write_pipe_term(doc);
+		/* deassert ALE */
+		WriteDOC(0, doc->virtadr, Mplus_FlashControl);
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		doc2001plus_readbuf(this, instr->ctx.data.buf.in,
+				    instr->ctx.data.len);
+		break;
+	case NAND_OP_DATA_OUT_INSTR:
+		doc2001plus_writebuf(this, instr->ctx.data.buf.out,
+				     instr->ctx.data.len);
+		doc2001plus_write_pipe_term(doc);
+		break;
+	case NAND_OP_WAITRDY_INSTR:
+		DoC_WaitReady(doc);
+		break;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+}
+
+static int doc2001plus_exec_op(struct nand_chip *this,
+			       const struct nand_operation *op,
+			       bool check_only)
+{
+	struct doc_priv *doc = nand_get_controller_data(this);
+	unsigned int i;
+
+	if (check_only)
+		return true;
+
+	doc->curchip = op->cs % doc->chips_per_floor;
+	doc->curfloor = op->cs / doc->chips_per_floor;
+
+	/* Assert ChipEnable and deassert WriteProtect */
+	WriteDOC(DOC_FLASH_CE, doc->virtadr, Mplus_FlashSelect);
+
+	for (i = 0; i < op->ninstrs; i++)
+		doc2001plus_exec_instr(this, &op->instrs[i]);
+
+	/* De-assert ChipEnable */
+	WriteDOC(0, doc->virtadr, Mplus_FlashSelect);
+
+	return 0;
+}
+
 static void doc2001plus_command(struct nand_chip *this, unsigned command,
 				int column, int page_addr)
 {
@@ -1390,6 +1557,14 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 	return 1;
 }
 
+static const struct nand_controller_ops doc200x_ops = {
+	.exec_op = doc200x_exec_op,
+};
+
+static const struct nand_controller_ops doc2001plus_ops = {
+	.exec_op = doc2001plus_exec_op,
+};
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1533,7 +1708,6 @@ static int __init doc_probe(unsigned long physadr)
 		goto fail;
 	}
 
-
 	/*
 	 * Allocate a RS codec instance
 	 *
@@ -1552,6 +1726,11 @@ static int __init doc_probe(unsigned long physadr)
 	}
 
 	nand_controller_init(&doc->base);
+	if (ChipID == DOC_ChipID_DocMilPlus16)
+		doc->base.ops = &doc2001plus_ops;
+	else
+		doc->base.ops = &doc200x_ops;
+
 	mtd			= nand_to_mtd(nand);
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
