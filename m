Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED9BC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 13:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E500E20651
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 13:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2mYrMmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E500E20651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nChqBfk5zSGHp/cj4BJdn635Hqb+tvpdzwBW4HuFAOE=; b=F2mYrMmA7PQIeU
	wC3BOwhH6i6PWG9bCrkv4JGl4a0eh9CpWO4wQDG68vqsiDG7g/Jm2rumwJxfXuy7QqJ5ZraPGL0iT
	a2VjWMTYNnnly39Jxd9AQGyoIe71zmyUtUJeClMo1nH2GL5sF/pDSjjzJdcn2VosLE39MMf1hoeyZ
	K/ZWLJQZKi1F5pWbdUEngkJLwrHWH5CndryxDNneO8QPEVDzITX9qH/o60tNr2SVaElS3SO05dI4J
	ODLos+swQXoyRAU0yb/+y2+DMcZRH2Q8xQBU1pXyMldA7xPykXpaIMnpOwAubeoCGs0dpk88woLtr
	4/zccMUGyOn12TRyQh6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9s13-0003ld-RW; Fri, 29 Mar 2019 13:57:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9s10-0003kY-Rb
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 13:57:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9C472756D2;
 Fri, 29 Mar 2019 13:57:42 +0000 (GMT)
Date: Fri, 29 Mar 2019 14:57:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: nand_op_parser_exec_op should use longest pattern
Message-ID: <20190329145739.448f3e23@collabora.com>
In-Reply-To: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
References: <20190329133513.bj55sb373q4vo6yv@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_065751_162750_3BC4C63F 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: linux-mtd@lists.infradead.org, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 14:35:13 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Hi All,
> 
> I just played with the new exec_op interface for the first time and
> together with Boris we found a problem in the pattern table parser.
> 
> The vf610 driver uses this pattern table:
> 
> static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
> 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> 		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> 	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> 		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
> 	);
> 
> It has two patterns, one supposed for writing and one for reading. All elements
> are optional. Now with a typical page read we'll get this:
> 
> [   33.932464] nand:     ->CMD      [0x00]
> [   33.936338] nand:     ->ADDR     [5 cyc: 00 00 00 0a 00]
> [   33.941755] nand:     ->CMD      [0x30]
> [   33.945628] nand:     ->WAITRDY  [max 1 ms]
> [   33.949909] nand:       DATA_IN  [2176 B]
> 
> Only the first four elements are executed in one go, the fifth is
> exectuted separately. This is because the pattern table parser finds
> that the first pattern (supposed for writing) already matches for the
> first four elements and then uses it instead of realizing that the
> second pattern matches the whole operation.
> 
> I have no fix for this, just wanted to let you know. It turned out that
> in my case for the GPMI nand driver I probably won't need any pattern
> table.

This is a completely untested fix, just in case someone has time to
test/debug it.

--->8---
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ddd396e93e32..e0ba9f0b1fdc 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2165,30 +2165,38 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
        unsigned int i;
 
        while (ctx.subop.instrs < op->instrs + op->ninstrs) {
-               int ret;
+               const struct nand_op_parser_pattern *pattern;
+               struct nand_op_parser_ctx best_ctx;
+               int ret, best_pattern = -1;
 
                for (i = 0; i < parser->npatterns; i++) {
-                       const struct nand_op_parser_pattern *pattern;
+                       struct nand_op_parser_ctx test_ctx = ctx;
 
-                       pattern = &parser->patterns[i];
-                       if (!nand_op_parser_match_pat(pattern, &ctx))
+                       if (!nand_op_parser_match_pat(pattern, &test_ctx))
                                continue;
 
-                       nand_op_parser_trace(&ctx);
+                       if (best_pattern >= 0 &&
+                           (test_ctx.subop.ninstrs < best_ctx.subop.ninstrs ||
+                            (test_ctx.subop.ninstrs == best_ctx.subop.ninstrs &&
+                             test_ctx.last_instr_end_off <= best_ctx.last_instr_end_off)))
+                               continue;
 
-                       if (check_only)
-                               break;
+                       best_pattern = i;
+                       best_ctx = test_ctx;
+               }
 
+               if (best_pattern < 0) {
+                       pr_debug("->exec_op() parser: pattern not found!\n");
+                       return -ENOTSUPP;
+               }
+
+               ctx = best_ctx;
+               nand_op_parser_trace(&ctx);
+
+               if (!check_only) {
                        ret = pattern->exec(chip, &ctx.subop);
                        if (ret)
                                return ret;
-
-                       break;
-               }
-
-               if (i == parser->npatterns) {
-                       pr_debug("->exec_op() parser: pattern not found!\n");
-                       return -ENOTSUPP;
                }
 
                /*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
