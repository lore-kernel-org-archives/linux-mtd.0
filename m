Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F6BC10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 04:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FC520833
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 04:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKoBgywc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="BjmSUlQ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FC520833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bInPsXgkBzDCtlnk83xGb6fNGvkLtVWXkprHko3mt9o=; b=kKo
	BgywcfLlzsShCOKptQnidcV82+xWpf1SF2FnYq7iLKBDpEZh/50wxLO92LPoxr5W+JmGdDJDq9L/e
	9faE+ctDhW/SXNFcef+rnJyZ48vzKbtebhC5IV7TnQ4k+obcnwG9nvkSOH/d2LetCb4XNhL44ff3u
	Oqvys7m/4MSCAPx+gUTWazuPRDB+zyBs8VxdHmdppMbufmUBu+LdrIha0jYoN6FvnDmQ9zS2LMIcB
	82bxqUYfdY5zZfcyBeAr1alg1bo7GcywO2c2q3M9ZIN2oPlmJNnGRSl1rNIRyAmMyzO0ukUoDUl2+
	ca/4WgjpybFtsCHO/t9xSsySk+K7bqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDim3-00018N-SR; Tue, 09 Apr 2019 04:54:19 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDim0-00017R-OX
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 04:54:18 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x394rZ7R004013;
 Tue, 9 Apr 2019 13:53:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x394rZ7R004013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1554785615;
 bh=I8W+MlJxuYZkV0iAaLmXEewdBUE8cuF0yeIZtO9GjRc=;
 h=From:To:Cc:Subject:Date:From;
 b=BjmSUlQ9NPP3MBhFboUUGmsWWwy+tRdTNOFO6oXJHzfZs0n25IMZBn6RMJ+teCq26
 Tk4tr4g123wvcpjIlw9Y3IiAObLazt2Gj90fKALG7jTTZLtoZPNYZn5bdqL7kDU++h
 /9ne133HKo8X+wsgl5QsVtfeXucCQCfRZ2T83NntV8nkrQ3JJ6SO5Y5c3dZ0Bysc6p
 Sp5+IdzSdCpVRfXBv4VDm2wonqR7u26ndBIAVw9ExCCbDzJMICD++UUej58G+sPNxJ
 j05JXBN2m/C1WBjnR6AyNwMNpz6NmTuXa1zh3Fr43m3xy9O/ZL4N7M2oX3GqaSGJHZ
 eRkYwTZLGUyxg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: constify elements of NAND_OP_PARSER(_PATTERN)
Date: Tue,  9 Apr 2019 13:53:32 +0900
Message-Id: <20190409045332.5452-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_215417_147062_F84AB787 
X-CRM114-Status: GOOD (  10.50  )
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

Currently, drivers are able to constify a nand_op_parser array,
but not nand_op_parser_pattern and nand_op_parser_pattern_elem
since they are instantiated by using the NAND_OP_PARSER(_PATTERN).

Add 'const' to them in order to move more driver data from .data to
.rodata section.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/mtd/rawnand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b7445a44a814..ebde52088e4d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -805,7 +805,7 @@ struct nand_op_parser_pattern {
 #define NAND_OP_PARSER_PATTERN(_exec, ...)							\
 	{											\
 		.exec = _exec,									\
-		.elems = (struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ },		\
+		.elems = (const struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ },		\
 		.nelems = sizeof((struct nand_op_parser_pattern_elem[]) { __VA_ARGS__ }) /	\
 			  sizeof(struct nand_op_parser_pattern_elem),				\
 	}
@@ -831,7 +831,7 @@ struct nand_op_parser {
 
 #define NAND_OP_PARSER(...)									\
 	{											\
-		.patterns = (struct nand_op_parser_pattern[]) { __VA_ARGS__ },			\
+		.patterns = (const struct nand_op_parser_pattern[]) { __VA_ARGS__ },		\
 		.npatterns = sizeof((struct nand_op_parser_pattern[]) { __VA_ARGS__ }) /	\
 			     sizeof(struct nand_op_parser_pattern),				\
 	}
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
