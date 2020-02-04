Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB1EC35247
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 02:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF472082E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 02:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXAbUTqS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF472082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IJXjFvwAbtkHLBqBbMDxJjl3vWUFqpT0ml7yaqCpyzM=; b=AXA
	bUTqSbc8pESiPD3T3//U9cXu4jgYlVIYkaJG6KvqRlLLhR2lchA6n1Iw14LOFHqoOLRt+BKKwZmXd
	QwZKLqO5Frb47/zqtWbuvckvuSZiAsbnMq3edpnAPf1bOqHzRoGYZ3ckMFozl5lGWyicPgGZIeuKa
	7ziUYass81gfLEZbVaeA/Ox+MmN6XzfqsChvMRrRnGaYLYTpTGrngUcoR2UlGWoP0IY+FBiDnvjMz
	F6nFSWL1x9k/FzqF4xILqesjYGBxR/6y7hblWFAQxj3GGq3O+BfE5Kww5UeXkEaVo3k6acKxELJOp
	slB8StK4vHtB2BIEUPV1MNgLDfhMIMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iynvA-0007zb-T8; Tue, 04 Feb 2020 02:26:36 +0000
Received: from mo-csw1116.securemx.jp ([210.130.202.158]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iynv7-0007z2-8R
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 02:26:35 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 0142QEjX025013;
 Tue, 4 Feb 2020 11:26:14 +0900
X-Iguazu-Qid: 2wHH7JlGcNxSmOpG1Q
X-Iguazu-QSIG: v=2; s=0; t=1580783174; q=2wHH7JlGcNxSmOpG1Q;
 m=NNGISSgBWmspy5FTh8p2hYNr1NBYTFInzixMIb7InI4=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1113) id 0142QDo0022522;
 Tue, 4 Feb 2020 11:26:13 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 0142QD0b027265;
 Tue, 4 Feb 2020 11:26:13 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 0142QCc5003277;
 Tue, 4 Feb 2020 11:26:12 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH] mtd: nand: Add comment about Kioxia ID
Date: Tue,  4 Feb 2020 11:26:03 +0900
X-TSB-HOP: ON
Message-Id: <1580783163-5601-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_182633_576184_E14DB72B 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a comment above NAND_MFR_TOSHIBA and SPINAND_MFR_TOSHIBA definitions
that Toshiba and Kioxia ID are the same.

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
---
 drivers/mtd/nand/raw/internals.h | 1 +
 drivers/mtd/nand/spi/toshiba.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index cba6fe7..2918376b 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -30,6 +30,7 @@
 #define NAND_MFR_SAMSUNG	0xec
 #define NAND_MFR_SANDISK	0x45
 #define NAND_MFR_STMICRO	0x20
+/* Toshiba and Kioxia ID are the same. */
 #define NAND_MFR_TOSHIBA	0x98
 #define NAND_MFR_WINBOND	0xef
 
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 0db5ee4..a92ecc8 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+/* Toshiba and Kioxia ID are the same. */
 #define SPINAND_MFR_TOSHIBA		0x98
 #define TOSH_STATUS_ECC_HAS_BITFLIPS_T	(3 << 4)
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
