Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937D7EE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChKNIOE8rBGzBNpWPAIvhvGWesv2CeQw91KI7yEThvk=; b=Yxji8S+ajMwv4y
	Kta1SiAmL9Qq5rZ1+WhPFNlS+B1FrAZO2D/S4r2JQ6AX3ubodVB3tpjORYoMivsIQ5UswGrFE7cW7
	9F1+WtbDMGg1SghCvy+rizSrelYLA5TOlZ4bgnEVThyhGJcYZbNCsOZ6c3du5KmcoufsgD/A2bfDX
	1mGawUQO4GlMDMWdwzCoXW+cgqLm3whcmv0uhgA225umHqyw9+hJLFcx4QuYf4Xf/mCQv+761ViBC
	o1Ch/Y1Mwbss5hVMx3Z/SxbRwRhtSAhlFXImmSlzss1fzw4OBNMk3i2QvdgdJ63s6rIY6Q8vy1peQ
	IhJpKobCu2pVqLCOhTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYZP-00DUMu-0v;
	Fri, 08 Sep 2023 10:18:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYj-00DTwX-2h
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7/vpxHx7MGJHfFhcc/Chfsmox/3o12z41l1jmYBXCm0=; b=HjmjUB7FnGaosxDItdnRinJKMO
	5s6CvqPQJ1U5p1dWv6C9EWBxD+I6EHf/8JgbCMmXTusXNFnFAlPru7gDLjuHrgzk67/jeb3/gjiVq
	2M6MkZask8LkVpEnrDnI4hsUZUKBGLJe7pqWRnbM/ZuSWZIOwYlwl8YwUNjG+VIAvXonTqcD1OK4Y
	cwVryNvBHwxRzXR7p6RF5eXyQ7J3C1vprCKaXCKFDQxFyawP7V62oE9XInzFFtiwY7bZuNrpLgqgV
	/f7RY9pGk5euJeU+0KUM3UMm9XyTMzfnxD2idzQeJtl6hus35j5FSxjn2XOIVpyEltpC1/gWSqZgS
	pL9P9xXA==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qeYYf-00H93y-1f
	for linux-mtd@lists.infradead.org; Fri, 08 Sep 2023 10:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE860B8203E;
	Fri,  8 Sep 2023 10:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6974C433BF;
	Fri,  8 Sep 2023 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168263;
	bh=S2VGpvolKhnaojGSg3lKj4d7SDdm9iFqv4jQmZl9diQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rljR+NeDzKvqVJhWIUqgREyBNz8GEeuIFpZ5Qs+A1oI69XDjM97hSAsp/1gJ8pnoF
	 Cjfnxag1hBd+JZuSbBx8YEUjr3TNvmlE3CyGFZMFYPWUOkHZWDDjm+tP90wOYjAGSb
	 GdzNsblOo8AE/CIUR19L4JTpQzudFWUujYm//1Ewa92dw9LcQi8uhvs9Gf4NHxGVYS
	 FYebaIruenMV+3S7NT1JZ1e3Rv/Qaw8Y1eQ0OLf74o1KLPSKjeWjcm8+HSd5c0JU2d
	 7I/m32JGQacxZ/L7CKC4aNBNT4+cKk74TI4Jo1tA3KXBj/0KEKwGDrf1NgN5FxgWNq
	 xFHyT/8uxew2w==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:53 +0200
Subject: [PATCH v3 35/41] mtd: spi-nor: macronix: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-35-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111749_171166_F1534F99 
X-CRM114-Status: GOOD (  11.30  )
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

The flash ID is the new primary key into our database. Sort the entry by
it. Keep the most specific ones first, because there might be ID
collisions between shorter and longer ones.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/macronix.c | 130 ++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0508a207e9df..ea6be95e75a5 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -62,26 +62,44 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l3205d",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xc2, 0x9e, 0x16),
-		.name = "mx25l3255e",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x17),
 		.name = "mx25l6405d",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.name = "mx25l12805d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x19),
+		.name = "mx25l25635e",
+		.size = SZ_32M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &mx25l25635_fixups
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1a),
+		.name = "mx66l51235f",
+		.size = SZ_64M,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1b),
+		.name = "mx66l1g45g",
+		.size = SZ_128M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x23, 0x14),
+		.name = "mx25v8035f",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x32),
 		.name = "mx25u2033e",
 		.size = SZ_256K,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xc2, 0x25, 0x36),
-		.name = "mx25u3235f",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x33),
 		.name = "mx25u4035",
@@ -92,74 +110,33 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25u8035",
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x36),
+		.name = "mx25u3235f",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x37),
 		.name = "mx25u6435f",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xc2, 0x20, 0x18),
-		.name = "mx25l12805d",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xc2, 0x26, 0x18),
-		.name = "mx25l12855e",
-		.size = SZ_16M,
-	}, {
-		.id = SNOR_ID(0xc2, 0x28, 0x15),
-		.name = "mx25r1635f",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc2, 0x28, 0x16),
-		.name = "mx25r3235f",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x38),
 		.name = "mx25u12835f",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc2, 0x20, 0x19),
-		.name = "mx25l25635e",
-		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixups = &mx25l25635_fixups
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x39),
 		.name = "mx25u25635f",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K,
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx25u51245g",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-	}, {
-		.id = SNOR_ID(0xc2, 0x81, 0x3a),
-		.name = "mx25uw51245g",
-		.n_banks = 4,
-		.flags = SPI_NOR_RWW,
-	}, {
-		.id = SNOR_ID(0xc2, 0x23, 0x14),
-		.name = "mx25v8035f",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xc2, 0x26, 0x19),
-		.name = "mx25l25655e",
-		.size = SZ_32M,
-	}, {
-		.id = SNOR_ID(0xc2, 0x20, 0x1a),
-		.name = "mx66l51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx66u51235f",
@@ -167,22 +144,45 @@ static const struct flash_info macronix_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
-		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-		.name = "mx66l1g45g",
-		.size = SZ_128M,
+		.id = SNOR_ID(0xc2, 0x25, 0x3c),
+		.name = "mx66u2g45g",
+		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x26, 0x18),
+		.name = "mx25l12855e",
+		.size = SZ_16M,
+	}, {
+		.id = SNOR_ID(0xc2, 0x26, 0x19),
+		.name = "mx25l25655e",
+		.size = SZ_32M,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x1b),
 		.name = "mx66l1g55g",
 		.size = SZ_128M,
 		.no_sfdp_flags = SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xc2, 0x25, 0x3c),
-		.name = "mx66u2g45g",
-		.size = SZ_256M,
+		.id = SNOR_ID(0xc2, 0x28, 0x15),
+		.name = "mx25r1635f",
+		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-	},
+	}, {
+		.id = SNOR_ID(0xc2, 0x28, 0x16),
+		.name = "mx25r3235f",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x81, 0x3a),
+		.name = "mx25uw51245g",
+		.n_banks = 4,
+		.flags = SPI_NOR_RWW,
+	}, {
+		.id = SNOR_ID(0xc2, 0x9e, 0x16),
+		.name = "mx25l3255e",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
