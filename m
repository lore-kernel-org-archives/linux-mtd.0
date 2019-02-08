Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E04C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18B62147C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hAxydVHf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="XUv/j8h0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18B62147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tsUtuURdtHwwYGDrwT/9nefEig539DP9pzKTSdx0qRw=; b=hAxydVHfEjmn9ChiriYyeNxcNp
	05Gs+eT+qB4ZrzjM4BwESuubxrkgb81sakkeaSDQZc/9FPsvW1FHs5A6OgE0B2RRO+PylKHMIYcaP
	qVjTML4tx9k6wmVitnE/l6Vej81t+x4jkqP7LT0BwIN0I6BRJFtJ6cY4iUzoILp0YNRAXWHoYoeXF
	9qSMKyUryZS9Q7WAUrDow6wo3gYE+GOH103qmM1dg+H2NilwG6nkPFUoknUqp7/xZMP9cW14VlB4x
	9CX5+VanjuMzcGDLH1lXMFs4Svmew+9bJPLcNu4BrMx31QRb1Yz/cnvNNudA3GgRdImqCgsUNNAWE
	FdnWxV9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1EJ-0006nu-5a; Fri, 08 Feb 2019 08:09:47 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs1Dt-0006P3-Tq
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 08:09:26 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x188902D007241;
 Fri, 8 Feb 2019 17:09:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x188902D007241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549613345;
 bh=UecdNgxlZSCrcUEpr8T6/vLz+DofOS/3xs4XQt8ynaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUv/j8h0UwTUE4rDIKtLEM3IJ4SkKX2XSW1RLNylZQpC/PzeLFLQA7RdbnJqeRJCP
 vyY03BhFcxaE04oU2fLzHzgUchVr/Dkh62SGJ0KZMhkS+2jZ8stkbGUC5rZneHP+E4
 4mdFGJu57MOAbOVotvMSNI/TxVkA9P+jjAgVwmd2/m3/HQrtRptLPbfyD1YfOqq2q3
 NqD51CZRYfdOWamF4sQVALZivsWJ6hAJpn8Cb7QU+OM1Q6+0ETGmWVKXDM/ZCy6qxx
 54cBxTICezVxmcawNAaGtFlmx6dcBkhKoE19dmnBoA9kOvpI/xiiQdJKjI0GHLmNU4
 brkuEdfXOKLmg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 04/11] mtd: rawnand: denali: switch over to ->exec_op() from
 legacy hooks
Date: Fri,  8 Feb 2019 17:08:48 +0900
Message-Id: <1549613335-30319-5-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_000922_392622_B830053E 
X-CRM114-Status: GOOD (  16.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement ->exec_op().

Remove the deprecated select_chip(), read_byte(), write_byte(),
cmd_ctrl(), and waitfunc().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 234 +++++++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 108 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index a2fe2ff..bd7df25 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -206,85 +206,11 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 	return denali->irq_status;
 }
 
-static void denali_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
+static void denali_select_target(struct nand_chip *chip, int cs)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
-	int i;
-
-	for (i = 0; i < len; i++)
-		buf[i] = denali->host_read(denali, addr);
-}
-
-static void denali_write_buf(struct nand_chip *chip, const uint8_t *buf,
-			     int len)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
-	int i;
-
-	for (i = 0; i < len; i++)
-		denali->host_write(denali, addr, buf[i]);
-}
-
-static void denali_read_buf16(struct nand_chip *chip, uint8_t *buf, int len)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
-	uint16_t *buf16 = (uint16_t *)buf;
-	int i;
-
-	for (i = 0; i < len / 2; i++)
-		buf16[i] = denali->host_read(denali, addr);
-}
-
-static void denali_write_buf16(struct nand_chip *chip, const uint8_t *buf,
-			       int len)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	u32 addr = DENALI_MAP11_DATA | DENALI_BANK(denali);
-	const uint16_t *buf16 = (const uint16_t *)buf;
-	int i;
-
-	for (i = 0; i < len / 2; i++)
-		denali->host_write(denali, addr, buf16[i]);
-}
-
-static uint8_t denali_read_byte(struct nand_chip *chip)
-{
-	uint8_t byte;
-
-	denali_read_buf(chip, &byte, 1);
-
-	return byte;
-}
-
-static void denali_write_byte(struct nand_chip *chip, uint8_t byte)
-{
-	denali_write_buf(chip, &byte, 1);
-}
-
-static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	uint32_t type;
-
-	if (ctrl & NAND_CLE)
-		type = DENALI_MAP11_CMD;
-	else if (ctrl & NAND_ALE)
-		type = DENALI_MAP11_ADDR;
-	else
-		return;
-
-	/*
-	 * Some commands are followed by chip->legacy.waitfunc.
-	 * irq_status must be cleared here to catch the R/B# interrupt later.
-	 */
-	if (ctrl & NAND_CTRL_CHANGE)
-		denali_reset_irq(denali);
+	struct denali_nand_info *denali = to_denali(chip);
 
-	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
+	denali->active_bank = cs;
 }
 
 static int denali_check_erased_page(struct nand_chip *chip,
@@ -596,6 +522,8 @@ static int denali_data_xfer(struct nand_chip *chip, void *buf, size_t size,
 {
 	struct denali_nand_info *denali = to_denali(chip);
 
+	denali_select_target(chip, chip->cur_cs);
+
 	iowrite32(raw ? 0 : ECC_ENABLE__FLAG, denali->reg + ECC_ENABLE);
 	iowrite32(raw ? TRANSFER_SPARE_REG__FLAG : 0,
 		  denali->reg + TRANSFER_SPARE_REG);
@@ -856,24 +784,6 @@ static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
 				0, 1);
 }
 
-static void denali_select_chip(struct nand_chip *chip, int cs)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-
-	denali->active_bank = cs;
-}
-
-static int denali_waitfunc(struct nand_chip *chip)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-	uint32_t irq_status;
-
-	/* R/B# pin transitioned from low to high? */
-	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
-
-	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
-}
-
 static int denali_setup_data_interface(struct nand_chip *chip, int chipnr,
 				       const struct nand_data_interface *conf)
 {
@@ -1185,13 +1095,6 @@ static int denali_attach_chip(struct nand_chip *chip)
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-	if (chip->options & NAND_BUSWIDTH_16) {
-		chip->legacy.read_buf = denali_read_buf16;
-		chip->legacy.write_buf = denali_write_buf16;
-	} else {
-		chip->legacy.read_buf = denali_read_buf;
-		chip->legacy.write_buf = denali_write_buf;
-	}
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
@@ -1223,9 +1126,130 @@ static void denali_detach_chip(struct nand_chip *chip)
 	kfree(denali->buf);
 }
 
+static void denali_exec_in8(struct denali_nand_info *denali, u32 type,
+			    u8 *buf, unsigned int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = denali->host_read(denali, type | DENALI_BANK(denali));
+}
+
+static void denali_exec_in16(struct denali_nand_info *denali, u32 type,
+			     u8 *buf, unsigned int len)
+{
+	u32 data;
+	int i;
+
+	for (i = 0; i < len; i += 2) {
+		data = denali->host_read(denali, type | DENALI_BANK(denali));
+		/* bit 31:24 and 15:8 are used for DDR */
+		buf[i] = data >> 16;
+		buf[i + 1] = data;
+	}
+}
+
+static void denali_exec_out8(struct denali_nand_info *denali, u32 type,
+			     const u8 *buf, unsigned int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		denali->host_write(denali, type | DENALI_BANK(denali), buf[i]);
+}
+
+static void denali_exec_out16(struct denali_nand_info *denali, u32 type,
+			      const u8 *buf, unsigned int len)
+{
+	int i;
+
+	for (i = 0; i < len; i += 2)
+		denali->host_write(denali, type | DENALI_BANK(denali),
+				   buf[i + 1] << 16 | buf[i]);
+}
+
+static int denali_exec_waitrdy(struct denali_nand_info *denali)
+{
+	u32 irq_stat;
+
+	/* R/B# pin transitioned from low to high? */
+	irq_stat = denali_wait_for_irq(denali, INTR__INT_ACT);
+
+	/* Just in case nand_operation has multiple NAND_OP_WAITRDY_INSTR. */
+	denali_reset_irq(denali);
+
+	return irq_stat & INTR__INT_ACT ? 0 : -EIO;
+}
+
+static int denali_exec_instr(struct nand_chip *chip,
+			     const struct nand_op_instr *instr)
+{
+	struct denali_nand_info *denali = to_denali(chip);
+	bool width16 = chip->options & NAND_BUSWIDTH_16;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		denali_exec_out8(denali, DENALI_MAP11_CMD,
+				 &instr->ctx.cmd.opcode, 1);
+		return 0;
+	case NAND_OP_ADDR_INSTR:
+		denali_exec_out8(denali, DENALI_MAP11_ADDR,
+				 instr->ctx.addr.addrs,
+				 instr->ctx.addr.naddrs);
+		return 0;
+	case NAND_OP_DATA_IN_INSTR:
+		(!instr->ctx.data.force_8bit && width16 ?
+		 denali_exec_in16 :
+		 denali_exec_in8)(denali, DENALI_MAP11_DATA,
+				  instr->ctx.data.buf.in,
+				  instr->ctx.data.len);
+		return 0;
+	case NAND_OP_DATA_OUT_INSTR:
+		(!instr->ctx.data.force_8bit && width16 ?
+		 denali_exec_out16 :
+		 denali_exec_out8)(denali, DENALI_MAP11_DATA,
+				   instr->ctx.data.buf.out,
+				   instr->ctx.data.len);
+		return 0;
+	case NAND_OP_WAITRDY_INSTR:
+		return denali_exec_waitrdy(denali);
+	default:
+		WARN_ONCE(1, "unsupported NAND instruction type: %d\n",
+			  instr->type);
+
+		return -EINVAL;
+	}
+}
+
+static int denali_exec_op(struct nand_chip *chip,
+			  const struct nand_operation *op, bool check_only)
+{
+	int i, ret;
+
+	if (check_only)
+		return 0;
+
+	denali_select_target(chip, op->cs);
+
+	/*
+	 * Some commands contain NAND_OP_WAITRDY_INSTR.
+	 * irq must be cleared here to catch the R/B# interrupt there.
+	 */
+	denali_reset_irq(to_denali(chip));
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = denali_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct nand_controller_ops denali_controller_ops = {
 	.attach_chip = denali_attach_chip,
 	.detach_chip = denali_detach_chip,
+	.exec_op = denali_exec_op,
 	.setup_data_interface = denali_setup_data_interface,
 };
 
@@ -1260,12 +1284,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (!mtd->name)
 		mtd->name = "denali-nand";
 
-	chip->legacy.select_chip = denali_select_chip;
-	chip->legacy.read_byte = denali_read_byte;
-	chip->legacy.write_byte = denali_write_byte;
-	chip->legacy.cmd_ctrl = denali_cmd_ctrl;
-	chip->legacy.waitfunc = denali_waitfunc;
-
 	if (features & FEATURES__INDEX_ADDR) {
 		denali->host_read = denali_indexed_read;
 		denali->host_write = denali_indexed_write;
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
