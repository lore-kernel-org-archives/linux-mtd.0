Return-Path: <SRS0=cSwW=6C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F8EC352BE
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0634F21BE5
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAJwkpK3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0634F21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DgED4/Idg/TBi8YBybwdZa50w3ukt7nv/0s/i0GvKAw=; b=OAJwkpK3yWNRnI
	yXmnq/23d/GP6UKk8RkTTbD9eDmyf5ktFPpB/icuhNWllRIdF+7nK0z4krao3XkJ/fye9D/2NzTAP
	Mz+nkxiidBAevfob2ZcZ9bmoZL7qpuVHSATk3ZEZCkl69/Tk+psA7siJlAq/pfwQtBowovIvdVYd9
	8E3BLy/9EAa11aN066SXBRToTClt+UrzvuIrYExeLCVttnVUPZeJdcTdLdfdAGlTTs0a0YqWbDAVj
	f9cW+1832KiL+u4wXlzUvq7W9HBX5XLjzX7IkW/WZ247gwTzUb/pWluXLdn41SkRUdVkco9HhROVF
	5Q6KoHrFsxCivpGuKJuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPtTt-0002Fy-6j; Sat, 18 Apr 2020 19:50:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPtTc-0000bO-Kl
 for linux-mtd@lists.infradead.org; Sat, 18 Apr 2020 19:50:10 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1DF4B2A0592;
 Sat, 18 Apr 2020 20:50:04 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: rawnand: Propage CS selection to sub operations
Date: Sat, 18 Apr 2020 21:49:58 +0200
Message-Id: <20200418194959.1017197-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_125008_824727_4FF41FB0 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some controller using the instruction parse infrastructure might need
to know which CS a specific sub-operation is targeting. Let's propagate
this information.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c24e5e2ba130..fa9ac18e97a1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2176,6 +2176,7 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_operation *op, bool check_only)
 {
 	struct nand_op_parser_ctx ctx = {
+		.subop.cs = op->cs,
 		.subop.instrs = op->instrs,
 		.instrs = op->instrs,
 		.ninstrs = op->ninstrs,
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 1e76196f9829..8e8d1a61e2fb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -694,6 +694,7 @@ struct nand_op_instr {
 
 /**
  * struct nand_subop - a sub operation
+ * @cs: the CS line to select for this NAND sub-operation
  * @instrs: array of instructions
  * @ninstrs: length of the @instrs array
  * @first_instr_start_off: offset to start from for the first instruction
@@ -709,6 +710,7 @@ struct nand_op_instr {
  * controller driver.
  */
 struct nand_subop {
+	unsigned int cs;
 	const struct nand_op_instr *instrs;
 	unsigned int ninstrs;
 	unsigned int first_instr_start_off;
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
