Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DADEE57FC
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hSAcQ+zUMrk5/wP3c1GHqY3eDbSRe9tFS1S4FKzUBs=; b=Q8CJslQkKgscCw
	U7e6bM396QnZwXBvHzKHac16XHbHa6VlJLEXLQivsmlxn6WRCkPZv1xq+Nh/n+2X5mWdPQvRtGMDm
	qbw2RZpC0OVgKxko8xQBLbhl/1rqKFYz3EgHZw1W2ORLHgkwzAT9nvgB2quD0nom6vrtX5cAl4IjT
	G50PNYel65MikUotZ4cFBtMfu+JPw/GNmoQmEG4MHAv3MOj63ZO4RsUQQ77pbic4yYvi6+8WToKTe
	f1o9Z+eCqOeZhkswfhT/KSDqLkKV9ui5gKS/jSqNmjKVLJtM8CMXZRHT9mbVHJhc9G/UIKiMBsDVf
	wLd/khYk63sCMEVyp5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeZhx-00DgFK-0M;
	Fri, 08 Sep 2023 11:31:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYj-00DTwj-1x
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0RoG3lTcZshnjkAJ8PMP7F0yaI6WNx0OLiR58Ww6f1U=; b=GFg2iL/OzNdC77X0dzZA4IIE9i
	q7+kkB3oAc4A4KNu7OiFwAsOtNrPwKmSr//NMFNoL5RJVSGBiLZ+xjsyXzNGp4U5SoA5FitRuKIjJ
	pdRQ7ZEZ+fNdfi167yb7iVq8ZvCwpRSL88NyfwReCy41kz4j62nq4UWIlZQGGzK12IKd/1VHjK2Qv
	ILFXBjyv+q3IXqqWNQncjA8rwfqOosMj4TOe9khzj/HzKZAI9/2gBUbLXnlQpYzVq1iyp+wG52nDa
	j/GST0bISIvmD7dkDpHXscfmYdmeenxbBaZAWk0X+YuSRo3yEcHLA68messGrYPGuSYzTt9OFxjDK
	hK5kFhPQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYR-002R14-33
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2DEE61495;
	Fri,  8 Sep 2023 10:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D0CC433BB;
	Fri,  8 Sep 2023 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168254;
	bh=ynRD6EJmzx9ScX9FqHEAG3RGBNXu033RrZwYL9Faey8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sBIySQNkGtQEVLyt+YcTgdwTBYTjpnjzqXiUUDvRJ/g60FnJt+0Yj98t5vHE1H6AE
	 4zwuPF7G2jyu0gXzwCqrLFNUNBfb648mmwWRjzWX1plzWYVj/ANMYBP4nYYxlTRppm
	 UdZJ3m8gXVbowf1Ukc2SKCvLL9++hKt///9/5siCpLP4oXgHfKkv1oUMmWQ9nu5LlO
	 wjgjrFlkjBzheP3g2vAfCMIV+Ivb7rpwAJqdL+rOLpF8tI/m/ObEm7sxDtMZRtEJXf
	 5bRR4bJ4zuw6CBHuoiJfFzQE9cxyLGt4CrAQJtcA5UAmhvtk4xUT0kBByl6tD/SdM9
	 ngsUEPVOoR0Ow==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:49 +0200
Subject: [PATCH v3 31/41] mtd: spi-nor: atmel: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-31-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111737_973296_219AF4C7 
X-CRM114-Status: GOOD (  11.44  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/atmel.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index ccc985c48ae3..18e904962d0e 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -164,20 +164,20 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
 
 static const struct flash_info atmel_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x1f, 0x66, 0x01),
-		.name = "at25fs010",
-		.sector_size = SZ_32K,
-		.size = SZ_128K,
-		.flags = SPI_NOR_HAS_LOCK,
+		.id = SNOR_ID(0x1f, 0x04, 0x00),
+		.name = "at26f004",
+		.size = SZ_512K,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x66, 0x04),
-		.name = "at25fs040",
-		.size = SZ_512K,
-		.flags = SPI_NOR_HAS_LOCK,
+		.id = SNOR_ID(0x1f, 0x25, 0x00),
+		.name = "at45db081d",
+		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x42, 0x16),
+		.name = "at25sl321",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0x1f, 0x44, 0x01),
 		.name = "at25df041a",
@@ -186,62 +186,62 @@ static const struct flash_info atmel_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups,
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at25df321",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x45, 0x01),
+		.name = "at26df081a",
+		.size = SZ_1M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x01),
-		.name = "at25df321a",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x46, 0x01),
+		.name = "at26df161a",
+		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x48, 0x00),
-		.name = "at25df641",
-		.size = SZ_8M,
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at25df321",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x42, 0x16),
-		.name = "at25sl321",
+		.id = SNOR_ID(0x1f, 0x47, 0x00),
+		.name = "at26df321",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0x1f, 0x04, 0x00),
-		.name = "at26f004",
-		.size = SZ_512K,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0x1f, 0x45, 0x01),
-		.name = "at26df081a",
-		.size = SZ_1M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x46, 0x01),
-		.name = "at26df161a",
-		.size = SZ_2M,
+		.id = SNOR_ID(0x1f, 0x47, 0x01),
+		.name = "at25df321a",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x47, 0x00),
-		.name = "at26df321",
-		.size = SZ_4M,
+		.id = SNOR_ID(0x1f, 0x48, 0x00),
+		.name = "at25df641",
+		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &atmel_nor_global_protection_fixups
 	}, {
-		.id = SNOR_ID(0x1f, 0x25, 0x00),
-		.name = "at45db081d",
-		.size = SZ_1M,
+		.id = SNOR_ID(0x1f, 0x66, 0x01),
+		.name = "at25fs010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x66, 0x04),
+		.name = "at25fs040",
+		.size = SZ_512K,
+		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
+		.fixups = &at25fs_nor_fixups
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
