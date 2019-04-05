Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB84C10F00
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDC1421850
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 10:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EYi98QF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDC1421850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugFWEf5KIT98kCQmlf0WfSJwaMVF2WhtkyKbDjqLzxU=; b=EYi98QF/brK8hK
	gXsAa2QUMsGVeHQmiWvOmkEW0uK/+4ZsmIGnSHrSdwNzw+Xn+UIk+YZaiOYwc20yDxBFKYwW5JOKr
	wg5I+cvL+VcKrciPY9vGzmjUgvcsav7ZTdtN/GmMykbFnnkW6oFBgbOhTldyFelTqXpjQd/IE1GIm
	iSI2O5/nLAIbN59/BA6RT3mJa7xTgwo8mMCPfS++iF899x++Vf5Zhbu2YQixjbxkyoSyjmMYFyhVZ
	Nd4GW0wB67wPvZpCSwziisRUfhi+f2h7psL570erBijNAQ/Bd3pAnXunICQUA3hSu9SWXOrgr4PR2
	hiwgBJ4w0i4BpHcxvmIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCLlk-0001YA-Vr; Fri, 05 Apr 2019 10:08:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCLlL-0000vg-Lc
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 10:08:00 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlB-0000RJ-TO; Fri, 05 Apr 2019 12:07:45 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hCLlA-0008Im-Fl; Fri, 05 Apr 2019 12:07:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/10] mtd: rawnand: export nand operation tracer
Date: Fri,  5 Apr 2019 12:07:31 +0200
Message-Id: <20190405100740.5074-2-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190405_030756_207648_85FDB5E8 
X-CRM114-Status: GOOD (  14.17  )
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

The nand core has a nand operation tracing function, but it can only
be used by drivers using the generic option parser from the nand core.
Export the tracing function as a static inline function in rawnand.h
so that drivers implementing exec_op directly do not have to write their
own operation tracing.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/nand_base.c | 30 +-------------------------
 include/linux/mtd/rawnand.h      | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ddd396e93e32..c224b70770c9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2090,35 +2090,7 @@ static void nand_op_parser_trace(const struct nand_op_parser_ctx *ctx)
 		if (instr == &ctx->subop.instrs[0])
 			prefix = "    ->";
 
-		switch (instr->type) {
-		case NAND_OP_CMD_INSTR:
-			pr_debug("%sCMD      [0x%02x]\n", prefix,
-				 instr->ctx.cmd.opcode);
-			break;
-		case NAND_OP_ADDR_INSTR:
-			pr_debug("%sADDR     [%d cyc: %*ph]\n", prefix,
-				 instr->ctx.addr.naddrs,
-				 instr->ctx.addr.naddrs < 64 ?
-				 instr->ctx.addr.naddrs : 64,
-				 instr->ctx.addr.addrs);
-			break;
-		case NAND_OP_DATA_IN_INSTR:
-			pr_debug("%sDATA_IN  [%d B%s]\n", prefix,
-				 instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
-				 ", force 8-bit" : "");
-			break;
-		case NAND_OP_DATA_OUT_INSTR:
-			pr_debug("%sDATA_OUT [%d B%s]\n", prefix,
-				 instr->ctx.data.len,
-				 instr->ctx.data.force_8bit ?
-				 ", force 8-bit" : "");
-			break;
-		case NAND_OP_WAITRDY_INSTR:
-			pr_debug("%sWAITRDY  [max %d ms]\n", prefix,
-				 instr->ctx.waitrdy.timeout_ms);
-			break;
-		}
+		nand_op_trace(prefix, instr);
 
 		if (instr == &ctx->subop.instrs[ctx->subop.ninstrs - 1])
 			prefix = "      ";
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b7445a44a814..f1557499b339 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -860,6 +860,43 @@ struct nand_operation {
 int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_op_parser *parser,
 			   const struct nand_operation *op, bool check_only);
+
+static inline void nand_op_trace(const char *prefix,
+				 const struct nand_op_instr *instr)
+{
+#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		pr_debug("%sCMD      [0x%02x]\n", prefix,
+			 instr->ctx.cmd.opcode);
+		break;
+	case NAND_OP_ADDR_INSTR:
+		pr_debug("%sADDR     [%d cyc: %*ph]\n", prefix,
+			 instr->ctx.addr.naddrs,
+			 instr->ctx.addr.naddrs < 64 ?
+			 instr->ctx.addr.naddrs : 64,
+			 instr->ctx.addr.addrs);
+		break;
+	case NAND_OP_DATA_IN_INSTR:
+		pr_debug("%sDATA_IN  [%d B%s]\n", prefix,
+			 instr->ctx.data.len,
+			 instr->ctx.data.force_8bit ?
+			 ", force 8-bit" : "");
+		break;
+	case NAND_OP_DATA_OUT_INSTR:
+		pr_debug("%sDATA_OUT [%d B%s]\n", prefix,
+			 instr->ctx.data.len,
+			 instr->ctx.data.force_8bit ?
+			 ", force 8-bit" : "");
+		break;
+	case NAND_OP_WAITRDY_INSTR:
+		pr_debug("%sWAITRDY  [max %d ms]\n", prefix,
+			 instr->ctx.waitrdy.timeout_ms);
+		break;
+	}
+#endif
+}
+
 /**
  * struct nand_controller_ops - Controller operations
  *
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
