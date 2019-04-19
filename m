Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCACC282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 07:48:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03C7420869
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 07:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1r3zOeH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="u1JZNp9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03C7420869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HU5dAcM2kcXA/BA2iE97wD+MCM4/9tkZrNhAUzux3Lo=; b=d1r3zOeH+hn85e
	NY18J7nhtCdP/FVsDVLa3Njlg2LzTBiGORbzyZwYIcHlI4tS4JG5JsmRTD7YsBATPrOpdS311t4/e
	S/GXR+QnWoDeUBdsSQpm/jYRWbTPb1eEklSD96+O6Qp2AID4doMGkl3FbejfA3nayjW+u9f5OjlGF
	NXE7479FdWpr8kMzUnelsnhQ89spQ5kiuSP9JES9fZwYJVmdBrluk4w+S75+CtEUJbzkb63q+6mzR
	v+iQODtavxcePOLageZHfjG60LR0oxZWFAIN4X7d5PsIwKChc2USUMv/lhvPwI0tgn+UFVUcIFkK3
	Wjv+MddN6ZvXNkxJ/Trg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHOFY-0007Uz-1O; Fri, 19 Apr 2019 07:47:56 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHOFQ-0007UR-6G
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2019 07:47:50 +0000
Received: from trochilidae.lan (unknown
 [IPv6:2a02:169:3465:0:6c69:2b1e:235b:318b])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 62BD35C07DC;
 Fri, 19 Apr 2019 09:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1555660063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=u3EApj181xT5tE6Oke1Xa8zBR+OQyGSCfDmnftxe6V8=;
 b=u1JZNp9QSY58FGjiUTfRBI0jXQH/Qwlwi6WQJpV4Tekc4XCea5CZXc/rTR4LqZFHudFS7B
 9+uovohZLYiIlIivc1Cs70LzHl+4oEqlUXftTMWqMHCN9v5qo0GcwnByvXG9Hqls12db77
 pLK+oSsiIO5MRyFLUTjlohwYivT3QAk=
From: Stefan Agner <stefan@agner.ch>
To: bbrezillon@kernel.org,
	miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: use longest matching pattern
Date: Fri, 19 Apr 2019 09:47:17 +0200
Message-Id: <20190419074717.22576-1-stefan@agner.ch>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_004749_120451_D1A81112 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: richard@nod.at, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 marek.vasut@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sometimes the exec_op parser does not choose the optimal pattern if
multiple patterns with optional elements are available. Since the stack
automatically splits operations in multiple exec_op calls, a non-optimal
pattern gets broken up into multiple calls. E.g. an OOB read using the
vf610 driver:
  nand: executing subop:
  nand:     ->CMD      [0x00]
  nand:     ->ADDR     [5 cyc: 00 08 ea 94 02]
  nand:     ->CMD      [0x30]
  nand:     ->WAITRDY  [max 200000 ms]
  nand:       DATA_IN  [64 B]
  nand: executing subop:
  nand:       CMD      [0x00]
  nand:       ADDR     [5 cyc: 00 08 ea 94 02]
  nand:       CMD      [0x30]
  nand:       WAITRDY  [max 200000 ms]
  nand:     ->DATA_IN  [64 B]

However, the vf610 driver has a pattern which can execute the complete
command in a single go...

This patch makes sure that the longest matching pattern is chosen
instead of the first (potentially only partial) match. With this
change the vf610 reads the OOB in a single exec_op call:
  nand: executing subop:
  nand:     ->CMD      [0x00]
  nand:     ->ADDR     [5 cyc: 00 08 c0 1d 00]
  nand:     ->CMD      [0x30]
  nand:     ->WAITRDY  [max 200000 ms]
  nand:     ->DATA_IN  [64 B]

Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/nand_base.c | 50 +++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ddd396e93e32..ebf219c05853 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2131,6 +2131,22 @@ static void nand_op_parser_trace(const struct nand_op_parser_ctx *ctx)
 }
 #endif
 
+static int nand_op_parser_cmp_ctx(const struct nand_op_parser_ctx *a,
+				  const struct nand_op_parser_ctx *b)
+{
+	if (a->subop.ninstrs < b->subop.ninstrs)
+		return -1;
+	else if (a->subop.ninstrs > b->subop.ninstrs)
+		return 1;
+
+	if (a->subop.last_instr_end_off < b->subop.last_instr_end_off)
+		return -1;
+	else if (a->subop.last_instr_end_off > b->subop.last_instr_end_off)
+		return 1;
+
+	return 0;
+}
+
 /**
  * nand_op_parser_exec_op - exec_op parser
  * @chip: the NAND chip
@@ -2165,32 +2181,40 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
 	unsigned int i;
 
 	while (ctx.subop.instrs < op->instrs + op->ninstrs) {
-		int ret;
+		const struct nand_op_parser_pattern *pattern;
+		struct nand_op_parser_ctx best_ctx;
+		int ret, best_pattern = -1;
 
 		for (i = 0; i < parser->npatterns; i++) {
-			const struct nand_op_parser_pattern *pattern;
+			struct nand_op_parser_ctx test_ctx = ctx;
 
 			pattern = &parser->patterns[i];
-			if (!nand_op_parser_match_pat(pattern, &ctx))
+			if (!nand_op_parser_match_pat(pattern, &test_ctx))
 				continue;
 
-			nand_op_parser_trace(&ctx);
-
-			if (check_only)
-				break;
-
-			ret = pattern->exec(chip, &ctx.subop);
-			if (ret)
-				return ret;
+			if (best_pattern >= 0 &&
+			    nand_op_parser_cmp_ctx(&test_ctx, &best_ctx) <= 0)
+				continue;
 
-			break;
+			best_pattern = i;
+			best_ctx = test_ctx;
 		}
 
-		if (i == parser->npatterns) {
+		if (best_pattern < 0) {
 			pr_debug("->exec_op() parser: pattern not found!\n");
 			return -ENOTSUPP;
 		}
 
+		ctx = best_ctx;
+		nand_op_parser_trace(&ctx);
+
+		if (!check_only) {
+			pattern = &parser->patterns[best_pattern];
+			ret = pattern->exec(chip, &ctx.subop);
+			if (ret)
+				return ret;
+		}
+
 		/*
 		 * Update the context structure by pointing to the start of the
 		 * next subop.
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
