Return-Path: <SRS0=yo9c=MP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A8BC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 14:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A937360EBC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 14:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A937360EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2s2cTzpuRMQsZMF2eM3kkAtjOW+H/waqeePbKahQxg=; b=439Vf7dwAlyv2I
	vd9jRzOptes9DcpVDwGwOIKnkD8uAYzF+kw7aBPny4SJDu4Cch020fSR1rS1C1KmwYnLelYSUB/iw
	FDtLhetd+LHKfm8uDXLKzbEvouOyf5wOsy9R8zqOoQQ8wykHkwv1QgJGp11Yt92oFmlOjwW869v0Y
	28lPNwMFn2nHfx7ePoRRT9KK4EAExn+g5ZPXICHtmmA2w/Ri9CW275wj5s+ifZq/GgbFOPO6cIIHy
	+faBXG9+PPrpybOkEG3SmP1gazi2nXWjqgNquWSo68S0B2fL+DKhfkc4iIfeL3PJQu+MFolXy2FJG
	HFdd9ta1n8eknI/k5VCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6vvX-004yvh-Ct; Fri, 23 Jul 2021 14:13:23 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6vvC-004yny-Tl
 for linux-mtd@lists.infradead.org; Fri, 23 Jul 2021 14:13:05 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GWWVz2JnWzQjxW;
 Fri, 23 Jul 2021 16:12:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1627049576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IlNNWIuPIFZ2ft2hWxJq0qQfBxRbAlJ8NwZS2eJlnDE=;
 b=k5cP30+msoKv9dvmBYYMoZG1vv/tp1eUxk5OUBwF9lKpsDF1hgIldxHg+P+fv/5S4iX61T
 Vj3geTs/KVStNEehcOW9lBwo4XfRdjZxLwykLJB2hOsAN9WSgiJ8fSbM9E4Rx6bf4H/6/a
 ebd0KCbwDj0oBM6eVwBKKZQic4DY7AM98+3fMWIDCjGkjPSTuVaUmkHUR7ZaxP7K7oeVdn
 cSPcH/lM+9KXxEq4gxte/AjYB5TwR4vrQc6Lg3Ufc3X24OiUWH1ACrXWsNtxOCRRN/flzf
 r4k8kL4bKXRel5tCSvqHj2W0z3CSWdJaJXjz4oJe8shSdYpluwxmKIK4bSa8Cg==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id RfxLoGFA1yYl; Fri, 23 Jul 2021 16:12:52 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v3] mtd: spi-nor: esmt: Use correct name of f25l32qa
Date: Fri, 23 Jul 2021 23:12:32 +0900
Message-Id: <20210723141232.15659-1-mans0n@gorani.run>
In-Reply-To: <20210719152037.33317-1-mans0n@gorani.run>
References: <20210719152037.33317-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9D06218B0
X-Rspamd-UID: 7825b7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_071303_189278_1BFECDC5 
X-CRM114-Status: GOOD (  13.42  )
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

The flash ID of F25L32QA is 0x8c4016, whereas that of F25L32QA(2S) is
0x8c4116. F25L32QA(2S) is the newer version of F25L32QA and its BPn bits
are non-volatile, unlike its older version.

Datasheet: https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA.pdf
Datasheet: https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA_1(2S).pdf
Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Reviewed-by: Michael Walle <michael@walle.cc>
---
v3:
* replaced "(2s)" with "-2s"

v2:
* revised tags in the commit message

v1:
At first I was going to send a new support patch of F25L16PA(2S),
but before that, I wanted to make sure if "(2s)" suffix is okay or unnecessary.
---
 drivers/mtd/spi-nor/esmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index cfc9218c1053..364de711b80e 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -12,8 +12,8 @@ static const struct flash_info esmt_parts[] = {
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
 			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l32qa-2s", INFO(0x8c4116, 0, 64 * 1024, 64,
+			      SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
 			   SECT_4K | SPI_NOR_HAS_LOCK) },
 };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
