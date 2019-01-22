Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B489C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1993F20854
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKZN/J8/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="y5SmZsIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1993F20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mXAVPis0oInBbz5Q7xg956XnY2jW2iGT6j87QkhKRaw=; b=OKZN/J8/kZw/gpCxoxDx9dhw29
	d285a8IZswD2T7WzfSoXzPpcsH7UaV309Vq8a3K+QQklpZfXMPWcK2GbO2dYvRRwlVNjr61/IRuPH
	JKkoUby0D3MEE7xVhWMl8rhALHctmDtnXEHJJ0YHnaF37IVrxOuE3xI+STi2E2V0CyQhnhGl36DpD
	92UZBI6rtvyD/ai24q+5S0zTglpjcdN9qUpouiMCjfF4spV9kWpKsXhvr5rGZ2QuYjkEIbdWRrNY+
	T+PUYbB69cZZv1Qh3YOunUXBpyjVIKcHnzpM3FKhDagu5K16Q1I5l/TfZfa2Whnn63o9eqhHSf9wg
	fUtAcm5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glqia-00014R-N2; Tue, 22 Jan 2019 07:43:32 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glqiX-00013w-Io
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 07:43:31 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0M7h55W025355;
 Tue, 22 Jan 2019 16:43:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0M7h55W025355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548142988;
 bh=hSF0u/EvB47CoB40nefIbVyNFXS6grvYzPOkYHR2Q+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y5SmZsISzZLplMiSomjH9Yjc2eOX/fPfxjdr1RHgDWnCSgeR/iGTM0Q5hIWq79/Zr
 yyYY688gcSbKs16em+zc8mMhTSX4U8gY1vgHDqOdGP80S0n5iFNteoOhiMr24ks6Ca
 NXrfVdo5yZM7un63VqukLWhq+GNKUSTXd2k4CFDlaIKoenI6ZG+5hNC9ZiAQNVrtgW
 7v3bvb52wzFWiMOXISOwheYHZo63gOqtYM3Quy2AtBppNyLLeg65mE/qJT6Ul4u6tn
 OjasLIE9PR0+B/WFS33c5DmhqeG+xRnjEJfJLdw2m7DbV0pCd4P6eW8puYJyeAsXMi
 KLIrAa7JN6Y5Q==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
Date: Tue, 22 Jan 2019 16:42:55 +0900
Message-Id: <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_234329_975014_6A89A975 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Although drivers do not directly get access to the private data of
instruction patterns, let's use unnamed union field to be consistent
with nand_op_instr.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/nand_base.c | 12 ++++++------
 include/linux/mtd/rawnand.h      |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3b620cd..d29de69 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1995,24 +1995,24 @@ nand_op_parser_must_split_instr(const struct nand_op_parser_pattern_elem *pat,
 {
 	switch (pat->type) {
 	case NAND_OP_ADDR_INSTR:
-		if (!pat->ctx.addr.maxcycles)
+		if (!pat->addr.maxcycles)
 			break;
 
 		if (instr->addr.naddrs - *start_offset >
-		    pat->ctx.addr.maxcycles) {
-			*start_offset += pat->ctx.addr.maxcycles;
+		    pat->addr.maxcycles) {
+			*start_offset += pat->addr.maxcycles;
 			return true;
 		}
 		break;
 
 	case NAND_OP_DATA_IN_INSTR:
 	case NAND_OP_DATA_OUT_INSTR:
-		if (!pat->ctx.data.maxlen)
+		if (!pat->data.maxlen)
 			break;
 
 		if (instr->data.len - *start_offset >
-		    pat->ctx.data.maxlen) {
-			*start_offset += pat->ctx.data.maxlen;
+		    pat->data.maxlen) {
+			*start_offset += pat->data.maxlen;
 			return true;
 		}
 		break;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b606ed3..7abb605 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -741,7 +741,7 @@ struct nand_op_parser_pattern_elem {
 	union {
 		struct nand_op_parser_addr_constraints addr;
 		struct nand_op_parser_data_constraints data;
-	} ctx;
+	};
 };
 
 #define NAND_OP_PARSER_PAT_CMD_ELEM(_opt)			\
@@ -754,21 +754,21 @@ struct nand_op_parser_pattern_elem {
 	{							\
 		.type = NAND_OP_ADDR_INSTR,			\
 		.optional = _opt,				\
-		.ctx.addr.maxcycles = _maxcycles,		\
+		.addr.maxcycles = _maxcycles,			\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_IN_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_IN_INSTR,			\
 		.optional = _opt,				\
-		.ctx.data.maxlen = _maxlen,			\
+		.data.maxlen = _maxlen,				\
 	}
 
 #define NAND_OP_PARSER_PAT_DATA_OUT_ELEM(_opt, _maxlen)		\
 	{							\
 		.type = NAND_OP_DATA_OUT_INSTR,			\
 		.optional = _opt,				\
-		.ctx.data.maxlen = _maxlen,			\
+		.data.maxlen = _maxlen,				\
 	}
 
 #define NAND_OP_PARSER_PAT_WAITRDY_ELEM(_opt)			\
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
