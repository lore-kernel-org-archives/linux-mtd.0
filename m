Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB26AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/XCcUUbovsSyWNGsI9Q8SWADbebxHpjMFE7A92qcWs=; b=EQU8d14FkOG+X1
	EOqVUtTchXuL1jd1KPFRX8nMx2fqjRyrsBrh3Ywpqwkf4gUru+b/n57ZIUn/yg75bNHp6hd/3b6qU
	+oC0n1uP0+RdXUEPeGDGW3h87ncyl8SCslMUHW3Mp5yojWWADOr+GOvw2WbyTP/2hXM8t/z9XdFJv
	KDYiigr5aXlbpHm3LJGKDFDNaFD3flDFI3wvky5GWDX2e4ZZcoCkSmmVc/OCu1hHW+rWLvEAKPPbO
	Cjhw8n+F/jjpCeHlQaDteGrpdyL6jrCiWoKwrXTzrZGn5Ee/pU65qRtudSwWGGRCMW4Kgh/3mTahm
	v8j5BD6tuswlc6RLShtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4Sh-004RYq-Tn; Mon, 21 Feb 2022 08:54:27 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4R7-004Qdz-Q3
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:52:53 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F3853223ED;
 Mon, 21 Feb 2022 09:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M6UwjGFgGoOTMo2mov0gAB3NTo1luIHUwJ/R+oMONc=;
 b=kJsKiEENMNg339YEBZQHvexT0fW+i8z/0eKjRR1oDRw4945utgPgvo/xKkcaCk/Vq34ATT
 r/PQKxjStMt8IKBUCnFT7Q/cReL8aRPBgIYG9qM0aLiNnFSq9DqNRruNhaW2n8eIFxwB9q
 IrE50syyNKWOSIbNmqhqmJCHCBzUg64=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 02/32] mtd: spi-nor: catalyst: unify function names
Date: Mon, 21 Feb 2022 09:52:06 +0100
Message-Id: <20220221085236.1452024-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005250_090575_8357ECE9 
X-CRM114-Status: GOOD (  12.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/catalyst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
index ae4d67e01bb3..6d310815fb12 100644
--- a/drivers/mtd/spi-nor/catalyst.c
+++ b/drivers/mtd/spi-nor/catalyst.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info catalyst_parts[] = {
+static const struct flash_info catalyst_nor_parts[] = {
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(16, 8, 16, 1) },
 	{ "cat25c03", CAT25_INFO(32, 8, 16, 2) },
@@ -19,6 +19,6 @@ static const struct flash_info catalyst_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_catalyst = {
 	.name = "catalyst",
-	.parts = catalyst_parts,
-	.nparts = ARRAY_SIZE(catalyst_parts),
+	.parts = catalyst_nor_parts,
+	.nparts = ARRAY_SIZE(catalyst_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
