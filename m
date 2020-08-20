Return-Path: <SRS0=ooLN=B6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC13C433E3
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F153207DE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qUwsXAsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F153207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fRLj42WJ0xlU2gl5HlMheJF+VBVLp5f+2I31WZJkNlI=; b=qUwsXAsaf7+fqzdK3ZwEYfjC0
	X/+QMPQ9FQQd7GIFit4IrbiwjrYb4BAR7a7BE8HHxbDqauA54fK4j8vTgTDb2Z4LxbNerwHWILnKK
	c3PrwgHI48ipFFx1rtwXjCeBQpTLXbksdBoWQbDhx8Nvc1SSJqgzV0L2nreGxeYCR4I3zJjGqX3eQ
	tsp5yz+exw7uBW+Vzv9k4qg/YaBUBcWtSe4MOXIJtgXuBUtEuVEI1u1tp89lU67rQ28wTIcBRM8Ec
	Z2kOI8mrjV9bVijmJwE+s9yO2gcx8++w78SjGfn0qthoBB+aUrVaVVkVPFxN7jN4/6PAZx8Uo3FNT
	uDsNnG+XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8nod-0002eH-Oh; Thu, 20 Aug 2020 16:53:27 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8noa-0002dA-4B
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2020 16:53:25 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BXW1b2FFZzKmgr;
 Thu, 20 Aug 2020 18:53:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id jqVW5lnZ7sQy; Thu, 20 Aug 2020 18:53:20 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Subject: [PATCH v2 1/3] mtd: spinand: gigadevice: Only one dummy byte in QUADIO
Date: Thu, 20 Aug 2020 18:51:19 +0200
Message-Id: <20200820165121.3192-2-hauke@hauke-m.de>
In-Reply-To: <20200820165121.3192-1-hauke@hauke-m.de>
References: <20200820165121.3192-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.33 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4A07266D
X-Rspamd-UID: 66c47a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_125324_283198_ABACA67E 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: linux-mtd@lists.infradead.org, gch981213@gmail.com, vigneshr@ti.com,
 wigyori@uid0.hu, Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The datasheet only lists one dummy byte in the 0xEH operation for the
following chips:
* GD5F1GQ4xExxG
* GD5F1GQ4xFxxG
* GD5F1GQ4UAYIG
* GD5F4GQ4UAYIG

Fixes: c93c613214ac ("mtd: spinand: add support for GigaDevice GD5FxGQ4xA")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/spi/gigadevice.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index d219c970042a..679d3c43e15a 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -21,7 +21,7 @@
 #define GD5FXGQ4UXFXXG_STATUS_ECC_UNCOR_ERROR	(7 << 4)
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
-		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
@@ -29,7 +29,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_f,
-		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
