Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CD9C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:09:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C929660295
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C929660295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R6wwoFJTmHO8xseMSR+dc3mAf/AP17AJjeKxXgbrz+M=; b=e1pTvgpad5hpNc7YV4RVebMgR
	rk0qXUS9hznNUoHr99BdrdZ0uuGT5vjLmTAzh9lMl7gOwta6Mn/DBs5lu+/t+JmJsdWv/YGegVy3d
	7wBPeix5wGwGE/7YsNlrBcDq5Es6YRX2tXUJMG8alaruYbyIv6n+KTEQxUSEpf63oZdJYFg3tCgIf
	/9gL+xzHzMu2sfLvmikT/oZOACI14nj72n7+BQz1FWKPKZ2V+WDgmvj/LQBCzTpxIsQS0VLmTp/TV
	GMJIKmh/9e2C7zk8rE7WSM5uFt0wWyvWnOvWLTMISz/V85uzFtW9XhdSOMWc/QjB7pU4dM0uc5++M
	EoV9uurPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWrs-0069L8-Ul; Wed, 03 Mar 2021 19:09:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT2Y-005Hl4-4d
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=1IXW7qDR4UYVjnwKqc5JZkTEM9nloS17Jy1x92Jj1eg=; b=f+lLvRE6FcAynQQQCsdYvQDcTY
 m0UFCIqkc2R/Xt9ym9brC3cPnH7TsY+b5XQ2tPF1wBwv8rjyghJhwS0XLU1MEwEbNWTMxb2noNVJw
 8DlAYf+oAfO0KsCOTt4wW52R2hzlje5sStvlLKc59GbJXOxGyeaIxGwKV2wh1uK7hFcypDEv7xmos
 dFx3n8UMWKNSrLQ2eoLQ6yu5yAXOoOGWBYOajNP7j2U1Yb+aNZk6gG0u+075s2G2X2Y6enVcSafTS
 vqkwcvUfOp5FIPTCuhFa2mcv/TlNVGODeYNybjHqFJL6XV4KZ4FYdbGWNzNkOmtpynMD5i7i9wCwf
 0eDghOMQ==;
Received: from mars.blocktrron.ovh ([2001:41d0:401:3000::cbd]
 helo=mail.blocktrron.ovh)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHO8U-0023tn-RJ
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 09:49:44 +0000
Received: from localhost.localdomain
 (p200300e53f06820029112db9632db604.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f06:8200:2911:2db9:632d:b604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id E38CD2346A;
 Wed,  3 Mar 2021 10:49:07 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
Date: Wed,  3 Mar 2021 10:48:33 +0100
Message-Id: <20210303094833.139221-2-mail@david-bauer.net>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303094833.139221-1-mail@david-bauer.net>
References: <20210303094833.139221-1-mail@david-bauer.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_094944_224805_AE4D3334 
X-CRM114-Status: GOOD (  12.03  )
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

Macronix SPI-NOR chips with 128 or more 64k blocks have 4 block
protection bits in their status register. Add the corresponding
flag in order to clear these bits when unloking the flash.

Otherwise, the flash might not be writable depending on the state the
bootloader left the flash in.

Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/macronix.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2d39dd32a64e..4f9fa8b8d57f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -50,8 +50,8 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_4BIT_BP) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, SPI_NOR_4BIT_BP) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -60,36 +60,41 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_4BIT_BP)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
-			      SECT_4K | SPI_NOR_4B_OPCODES) },
+			      SECT_4K | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, SPI_NOR_4BIT_BP) },
 	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_4BIT_BP) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_4BIT_BP) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4BIT_BP) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_4BIT_BP) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
