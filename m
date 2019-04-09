Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E5CC10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC7E720857
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="afreWuwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC7E720857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D46z90gqOni5mm1ar55oVaNgGQHU8BPp0kgjdwD4M10=; b=afreWuwvgYeU0b
	lGa3QxV8QtF6HMmEXN1LoQoPRO28iwJ00Mp57GXw6i4rXMTOMvnA1Txr9h/4mEOFJ5v7YEP2AsHvz
	/Bx+m7G2lWDLz7aRLB4a6om0wWdvOfi3c0c0zvGxeTrAxS8MlhYpdmDGHUn9qoNE6X4WMSMI9DRq6
	8Dru0d7Y5s5qX2yKRpOaE9/N31Jt0FsC7ZbLwvBdZ+EmBIJznMxTaURzwoJw1Y9hsYj7bK8q/bONY
	iZMS741AQVmzak4oOwnZz6r4Nz3U2wVOtzoXs84LK9u/caa+DzjPTUyc9iRzbGApP+cWEyuSix8Ti
	2UXCo131XPkH8nLNYvGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDp1z-0001Ap-Sn; Tue, 09 Apr 2019 11:35:11 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp1V-00089f-LP
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:34:47 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001ON-Ms; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001bf-GH; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/14] mtd: rawnand: fsmc: Use nand_op_trace for operation
 tracing
Date: Tue,  9 Apr 2019 13:34:09 +0200
Message-Id: <20190409113421.3037-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409113421.3037-1-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_043442_464263_F4661346 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
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
