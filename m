Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40492EE57F1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9vHr0YUlvckr0JFjz+0tFS0+x2a39qVOz3+6lJjHS8=; b=vaV0YsfLPigZef
	8q8hDAbZ2VI1cs2h4WLuj0W5JY9dBqMrrVKzLXvM/dr0ad07X989D/Gxpj2nv5chj3A/SnJl3I/2S
	TO1OYD9rUKWMXqx1wqgURxvOvv6FKxbRhTAZc/D8FDH7p3qhk8niy6rJOFyMTomUbkWAOSwS0pzp4
	+Ru31sQFIBB1h3hc/AnSmro/Ir4BzRxHjHkPbqN2UC6QFc37wjnsXrd8LLXm8Y4v8jBGg94hkCguN
	2QiKYGrOzBtCbcEAr0gH5Osy7oHn80hQLktVIwFzMpodmUoyvrr5Ej5bo6aYEWyejC9nxCv1AO5J3
	tM/FtSqCSe2X7KxcUBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYu-00DU68-0E;
	Fri, 08 Sep 2023 10:18:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYi-00DTw4-2y
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IE4eauRJF29U+rDli/OXa2o/HvwBfmYdm6rpvh7Dsi4=; b=pd12EIXrjWSFXcX4Gvtb9qOgx8
	2ikXYIWJFiZATSlGuuOK9B6BuTRzFgZE4W2GHh7o7oMq+5w1bPFtfPd7SvuwlCe4+KKzFi/8pRExi
	2bReI7n/XG+4ci00h1KdOtrm0vgseM7XEhBQXa9RQ9UEdgJmdSUIwBj6WfzipfPmarJrc5BY+ftLw
	gv+Z3HDeFWn+ZuM6nm1rmVekSknF2+TLFL61IFYDE9TBT7EW0Hbu3EgJMHF71fOH3qExenrcd6upw
	A3/0/oFu+INwm3nf08QWUoe7Q8Bn8Z8F01hlWzCkd09YhQNRM2QXFjSO7gP3yy4ApCqbC3QXSJAiz
	lN411Ehw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYT-002R1K-0Z
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34F28614A4;
	Fri,  8 Sep 2023 10:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A5C433CB;
	Fri,  8 Sep 2023 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168257;
	bh=yf+i4Rv/o/8TXBlVhYljTJbV/eUqv5ZZTBjDmCQ4PA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PxOw24D6l/ljwy+toiqvno/4y3Cv5dYLakRCHcn5yzMUAyRyEungolKFkqr4y+KOO
	 j6NBMP8Fi4KHk8u5Z4qK48TKM6xoUxhUqNk3mHxS8aauW6laOSMpvqlaLa62ZjulRh
	 k/DHsi63LEPkL1TMiF6umZngnRo1ed8ZVlQF1QL4SA8h79++zwrL6NQ0VEbDWSWl9s
	 Zb1aAt2E3CtAJ+rAquoRMN18dtHJDh+oGh6Y3lorKyYpTSoDYBFsCqA1eQTSkmJB5f
	 YVcn2lk3rKS0RKRKxr+A7Hr4JGCXVNwNrwojTqsEoUDXEdR453zsuyltKHNkRaukER
	 EOpLNb9lpJ7eQ==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:50 +0200
Subject: [PATCH v3 32/41] mtd: spi-nor: eon: sort flash_info database
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-32-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111739_226529_54E5B582 
X-CRM114-Status: GOOD (  11.25  )
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
 drivers/mtd/spi-nor/eon.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index ba09cb6c2abd..c1ddf662f782 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -10,32 +10,37 @@
 
 static const struct flash_info eon_nor_parts[] = {
 	{
-		.id = SNOR_ID(0x1c, 0x31, 0x16),
-		.name = "en25f32",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
-	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x16),
 		.name = "en25p32",
 		.size = SZ_4M,
-	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x16),
-		.name = "en25q32b",
-		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x17),
 		.name = "en25p64",
 		.size = SZ_8M,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x14),
+		.name = "en25q80a",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+	}, {
+		.id = SNOR_ID(0x1c, 0x30, 0x16),
+		.name = "en25q32b",
+		.size = SZ_4M,
 	}, {
 		.id = SNOR_ID(0x1c, 0x30, 0x17),
 		.name = "en25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0x1c, 0x30, 0x14),
-		.name = "en25q80a",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.id = SNOR_ID(0x1c, 0x31, 0x16),
+		.name = "en25f32",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.name = "en25s64",
+		.id = SNOR_ID(0x1c, 0x38, 0x17),
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x15),
 		.name = "en25qh16",
@@ -57,11 +62,6 @@ static const struct flash_info eon_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x19),
 		.name = "en25qh256",
-	}, {
-		.name = "en25s64",
-		.id = SNOR_ID(0x1c, 0x38, 0x17),
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
