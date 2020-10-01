Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA86C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 12:29:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC90F2087D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 12:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKEduul6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="WAg5gdMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC90F2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+SH8TQDMy2sBdTvmhsxgxE3MVPZzlSuISuyRuLAItcM=; b=AKEduul6Su2xG+y9AwicQqYDQx
	CAf0keApSGpr8vaq2iyqciRL0FUn1bUKCWhs8bK0xL/DJn7GtHyQHklxRjXLBQiR/TQO9WPeScSld
	meA25PcjEX70/rGuEPqU8YZSJHKAc0otNUgqeKMkq3fB7UqmikLy9b8rDaKSi9wZyL33C1xQ9docz
	eBpz9FULdSav0tPOTicBk1qbOJL0fC72k/N6H/bLNVuW0yyloHwTXtT9JVdOYqG49Cp3pXNLCQBse
	1Dlx7+cDMvrDoE5L9y5upasB0Z9GRFqWWtYNWU+n+3BbYoOtqrN3lZK8snGGGEqpThIlwST1O0xwu
	+oQu/4HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNxhU-0002VY-Fc; Thu, 01 Oct 2020 12:28:44 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNxhO-0002TT-MT; Thu, 01 Oct 2020 12:28:39 +0000
Received: from mwalle01.sab.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5566922F99;
 Thu,  1 Oct 2020 14:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601555315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=viPXrJRwIsd3yzupxdMg7ZEfo+F2Ox8lrp/S9wSB59w=;
 b=WAg5gdMj1otwxrTTvUBbnrbqILqTBVKK/6oVIODcH7yRKx6Kpr8aHvJT6pzo4fsd34ZtZ+
 FnvVZpe+bL8HeuuXIZhuIfMRs4kg0hvc0XwOTeY53OoT50V2AzS1cAGKddgQFySFMBVs15
 iH/2jHF4UipwLPo7PvUAxRGv+FW2Yrs=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global SNOR_F_HAS_LOCK
Date: Thu,  1 Oct 2020 14:28:27 +0200
Message-Id: <20201001122828.23186-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_082838_835380_3A8AC299 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is considered bad for the following reasons:
 (1) We only support the block protection with BPn bits for write
     protection. Not all Atmel parts support this.
 (2) Newly added flash chip will automatically inherit the "has
     locking" support and thus needs to explicitly tested. Better
     be opt-in instead of opt-out.
 (3) There are already supported flashes which don't support the locking
	 scheme. So I assume this wasn't properly tested before adding that
	 chip; which enforces my previous argument that locking support should
	 be an opt-in.

Remove the global flag and add individual flags to all flashes
which supports BP locking. In particular the following flashes
don't support the BP scheme:
 - AT26F004
 - AT25SL321
 - AT45DB081D

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/atmel.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 3f5f21a473a6..49d392c6c8bc 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -10,37 +10,27 @@
 
 static const struct flash_info atmel_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
-	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
-	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
+	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
 
-	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
-	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
-	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
+	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
-	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
-	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
-	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
+	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
 };
 
-static void atmel_default_init(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_HAS_LOCK;
-}
-
-static const struct spi_nor_fixups atmel_fixups = {
-	.default_init = atmel_default_init,
-};
-
 const struct spi_nor_manufacturer spi_nor_atmel = {
 	.name = "atmel",
 	.parts = atmel_parts,
 	.nparts = ARRAY_SIZE(atmel_parts),
-	.fixups = &atmel_fixups,
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
