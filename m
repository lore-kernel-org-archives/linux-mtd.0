Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4458CC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BE9217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HTJ03C+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BE9217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D46z90gqOni5mm1ar55oVaNgGQHU8BPp0kgjdwD4M10=; b=HTJ03C+Pbb3bIE
	IdXMPP66aAd5hlZ6konnar1H9niR73+QSQ6xf3QpMwQjHuDtRJR1fi6HxW34UH8TBTsVjFjUa9wBC
	TZEE8vMtekR9vQuDQW1aVcugCy4k90siE6HSXw+92gdGc85x38vz7nEeMvEuqzh22HUF1QxyD5pd2
	XxA3SVmPvF6qgezLvdvrNRT/8wMWdCU1VzGTFxzyUfgs3RJfT/whXHsI7PPFxdXleNZv8FUPEtH+j
	/1+kA8ogXQawMYcmHfpD0Mllopm2PcwQ12nBWrYUPf4DFPn7VdwuxCo/6h51X8jyRlIbzE/re0b1z
	gtOjk7vbWcwg/Va218gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLlu-0001lD-Il; Fri, 05 Apr 2019 10:08:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlL-0000vi-Lq
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:08:00 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RK-TW; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008Ip-Gg; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/10] mtd: rawnand: fsmc: Use nand_op_trace for operation
 tracing
Date: Fri,  5 Apr 2019 12:07:32 +0200
Message-Id: <20190405100740.5074-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405100740.5074-1-s.hauer@pengutronix.de>
References: <20190405100740.5074-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_030756_650499_69ECF4AE 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace the different operation tracing functions with a call to
nand_op_trace.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 6c7ca41354be..a6964feeec77 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -613,28 +613,20 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 	for (op_id = 0; op_id < op->ninstrs; op_id++) {
 		instr = &op->instrs[op_id];
 
+		nand_op_trace("  ", instr);
+
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			pr_debug("  ->CMD      [0x%02x]\n",
-				 instr->ctx.cmd.opcode);
-
 			writeb_relaxed(instr->ctx.cmd.opcode, host->cmd_va);
 			break;
 
 		case NAND_OP_ADDR_INSTR:
-			pr_debug("  ->ADDR     [%d cyc]",
-				 instr->ctx.addr.naddrs);
-
 			for (i = 0; i < instr->ctx.addr.naddrs; i++)
 				writeb_relaxed(instr->ctx.addr.addrs[i],
 					       host->addr_va);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
-			pr_debug("  ->DATA_IN  [%d B%s]\n", instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
-				 ", force 8-bit" : "");
-
 			if (host->mode == USE_DMA_ACCESS)
 				fsmc_read_buf_dma(host, instr->ctx.data.buf.in,
 						  instr->ctx.data.len);
@@ -644,10 +636,6 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
-			pr_debug("  ->DATA_OUT [%d B%s]\n", instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
-				 ", force 8-bit" : "");
-
 			if (host->mode == USE_DMA_ACCESS)
 				fsmc_write_buf_dma(host,
 						   instr->ctx.data.buf.out,
@@ -658,9 +646,6 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-			pr_debug("  ->WAITRDY  [max %d ms]\n",
-				 instr->ctx.waitrdy.timeout_ms);
-
 			ret = nand_soft_waitrdy(chip,
 						instr->ctx.waitrdy.timeout_ms);
 			break;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
