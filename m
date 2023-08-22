Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABA5EE49AC
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChKNIOE8rBGzBNpWPAIvhvGWesv2CeQw91KI7yEThvk=; b=BU8M9O8iXrqUbB
	h9+GgdCbrBh/4UD62lYfVhHHUXgDTV+Sfk7JdMvKwFBSe2uadHAi2wNKNlb8LhQI7bnuO1l2zoltu
	wntYwEbi1+XPdyHg6XloBEn9VgrLqcFNad5UZM4QaSUzRFp+ElhndeT9Bjsh4IekiSTJEPUPae8um
	XMVO1PebHH1LGR8TxekMLF013esPJcCvCHh0B4Kl7rT8+UbpEOdRsYgPprSVF9ID76H6uSQsJSVSw
	fQH28SlUkhiFCrfifeizhCNprFQx0iandoJdmTJw6xlEX+MIBEhV/hJPAxK24JGH46iZLCQ6ao3QV
	uBufBiOgmwEmYAr5M+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMXt-00FRCe-1W;
	Tue, 22 Aug 2023 08:15:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXY-00FIvm-29
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Aug 2023 07:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7/vpxHx7MGJHfFhcc/Chfsmox/3o12z41l1jmYBXCm0=; b=XW9oGwbUd5d86/vsfgpJjIHEs5
	bG4UZfqqlQHLTjShYAgBe1vYOGCkWqOlx5suBIjMOeOPLjIv2bTePfh7j6lnutZJLB5wqOPWWGqeD
	+6chPOCWjHvFFjK/vRpMZGUaiucfPFq4qbPqj4Oin1to0r7Inyw0NzvLAzy9P0Pb1vtmlwgh2ueF7
	WBWO8+WFivPmUKIwbO/a+NOW4uNcMhHZqIDMa2xnqXsQSa6vDHf4zDqLkI9aGf6aGKR/blFPt5vAD
	sImD+FLvSSRRZW2dYmZjoxsRuXwHHlrDmcZSZmvYAJs/zprduki8BMf+Ao6QqAVYwAnthSnfR68+k
	Y8EmCwrA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLXM-002YYv-0d
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB5BE64D87;
	Tue, 22 Aug 2023 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7748DC433CA;
	Tue, 22 Aug 2023 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688246;
	bh=S2VGpvolKhnaojGSg3lKj4d7SDdm9iFqv4jQmZl9diQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r3H31Kgixm/tob7MNx9kQ3x/nGVzVA2gLIIzIz8HURmeaoLo1eHjKF9Hmaq0tXhya
	 FwSX6ve6usH4LH1GOSOd9ATD9XfetrUa3SlHUIJaw2TwPe81yeSgunrgHkraIjNNr1
	 0zbnP8F5eM+nLIePk/DZ4J49twZ40T9/d6LmxpLYPrH3zUaqRFIP+poZHLaQuIw32s
	 hhyruXGNIhfRLN6NtTge4LRRM7O+Ptj0Sc5vtDAO2j8QpouAZbO9tD3dlJGMKWcTuE
	 gn+Ft+EHiboL6xYdCc0rmGy4L8NdcYie7oQdxNf4dhLVuJe5HKJg1sERx+1N3jvPxu
	 5DN5S3wBJXltg==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:51 +0200
Subject: [PATCH v2 35/41] mtd: spi-nor: macronix: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-35-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_081048_830617_103AF044 
X-CRM114-Status: GOOD (  11.78  )
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
