Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80E9C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 05:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6F82147C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 05:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQU2hV07";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="WY37MVvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6F82147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Ctwl3qROHm3bKaXHeoyVBxBiN4rlPtR4skYBYhVSUo4=; b=lQU
	2hV07MLFoN/WHvSw9uspHL52oB/NRcog0QepVfzdqhyBziTbMnHf8XtaPB/nhqeiB83jGuVXx1GgS
	pk2phwmXt8NP3+KxavVpQshy8kPrRWd5oIMGtv9uL4aTsMXB07P9GkBOcP2a+ISYQRlTaCoWyZDg4
	iSghoDL8WnY0NdkRWfxzXDN6xwGqrJQ6ZR7Kw0329fzielkhFOjSSnC4eUZ5I8TEli1jzbV6vS9lV
	R7UhR5G/4uXjzwc6nfCE+B4972zyvPoxoQU2FRfQzt0S5SFdDYd+T7//l0tM60ObLTwo13gkwAk78
	R/RMNsRxqQt3ZCWzdDTXfW9UJxsXn9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grcTw-0005Yt-E4; Thu, 07 Feb 2019 05:44:16 +0000
Received: from forward100o.mail.yandex.net ([2a02:6b8:0:1a2d::600])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grcTs-0005YM-Aj
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 05:44:15 +0000
Received: from mxback17j.mail.yandex.net (mxback17j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::93])
 by forward100o.mail.yandex.net (Yandex) with ESMTP id 849964AC1245;
 Thu,  7 Feb 2019 08:44:04 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net
 [2a02:6b8:0:1a2d::28])
 by mxback17j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id x0YAZ7Nq4X-i4neRGSg;
 Thu, 07 Feb 2019 08:44:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1549518244; bh=zsvQw5Mogmx0MDcDc5fdigiUZVjJfWbwl23GkBinuU4=;
 h=From:To:Cc:Subject:Date:Message-Id;
 b=WY37MVvANbm3I13l6WG7nHEuGI2lu0MCMWjL+tuLaPFj7ccc2RCT1Zlq1bLLjq5EE
 IUNrg60PYlK7zsDiMZwzWMx52ezEoj/4luvCQxwo3yBzPwl2GBLXRc/3g7vlotZYP1
 e319vJFTB9/BY38i1xXmzn/CJX3l9rjSeAlmXo/4=
Authentication-Results: mxback17j.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 noQZNymWGT-i2HG39fY; Thu, 07 Feb 2019 08:44:02 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: "A. Celenk" <ahmet.celenk@procenne.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Date: Thu,  7 Feb 2019 08:43:54 +0300
Message-Id: <1549518234-15211-1-git-send-email-ahmet.celenk@procenne.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_214412_630075_CDAA235A 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ahmet Celenk <ahmet.celenk@procenne.com>, Marek Vasut <marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "Ahmet Celenk" <ahmet.celenk@procenne.com>

Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
the s25fl128s qspi memory, the single "s25fl128s" device entry must be
split into two to match the correct JEDEC ID's for each version. Solves
paging related issues of S25FL128SAGBHI210 chips.

Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
---
V3: Added missing SPI_NOR_DUAL_READ flags to new entries
V2: Removed the old s25fl128s entry

 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd..3cd9052 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1891,7 +1891,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
