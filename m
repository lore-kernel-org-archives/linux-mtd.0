Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA294EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3AmUueO+huSWJ9MOi4Etad6TZxAtbtAh3VSV1XMayk=; b=0kHhkvoC7X5EcG
	cIr6YZ5+AWm9Rcv06iqIAUJ84jnuXU6CEECszVCy2oPhEPdAP+Ck840haGKpF1IiVwVI6R/ASYym9
	uQPVu3JWtzUG412Z9YBLsRdUEbv7H4NUWsb3X9j+tF/w6Cp6WShng9luiOVB2589eK5kcpmXQbAro
	zKzfkUO7zsT3Zq8+aT8UergHYBbez8ejZvbB7AMMS2s8pt0sLJnqzp2m+6me4GRyDahV0WFGoG3oD
	0A8+kV4eunZYV2hT02EHSloNS2xdoEkkFGAtvN6ycHC+r0tWCeIpTw3YHdqeiy05QDDpaoPgSiDja
	Ih97rzWGWW3cswrVhmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYaN-00DVFX-1F;
	Fri, 08 Sep 2023 10:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYt-00DU6h-30
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NpUuxLbMynnDwzJqfX1UfouM3U/qSIlbBF65KXyzonI=; b=QEBXrgfgq1nesQK6S2F+Ss89ul
	lq/7NWDh7s256hbumdrOd78VOpH4oyY1r8Nyz/81G8cNrzrUQBtYX6pmdFFFVjlxGsFtIK40MhDC+
	ycwPlCaL68xN896i7W3CO0oQkhrSonUhvx/Ts4mC11x5XojCp7QHLB8oxGWJWOmlNFX8fnIbHu7lD
	4rBZ6sqWIoQtJhzTvYC0/j3f2JQP6gep/RQiizaK9ZCqeEC4w/mvS0zbs9xxs/WRlCACug9+FEoOt
	Z+tYwlf7AVFXDExKN40NQyqqnSeEq9hPNjpNST5LBj5ums1QtKD6HP7pKWUq/iA2dtcV8QpOU0kQq
	1FqW2YWw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYk-002R49-2A
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:18:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5592ACE1B81;
	Fri,  8 Sep 2023 10:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46467C433D9;
	Fri,  8 Sep 2023 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168271;
	bh=q62jcKfbyvw1UyVsR97jLApwSi8lfnOL5ELNif2Hl1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dcfgBTZELeDlvRfNAxwJZ8XBsoPl3VGjKYz63YW4cuRev4tzeMsqqr2dTIQir65f1
	 kISPN1HfkmlgYTsMtOaXneOxowbDlExDh/iHoxuu3o7uWGwZgiZS8+DgUvGuYHoNeN
	 gFdibWX83X+LrQQRFyUJRBCg4aec/5iIOUpbuxtaYyayncO1JftcAaKJCTdyeEKlq7
	 2LKAZf9X57qXdjh3ERrMGnmudavp74xQ7AN3+MvAoz8NcXR1ro6bFSvM62nOkh26Wi
	 Fpm9A74/v2V/PZLw88H4s61ehzGGdAmeqGgtoqlylis7SBG3MHIFr/G041dc4EX57e
	 pU/kZl7ZZFoiw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:57 +0200
Subject: [PATCH v3 39/41] mtd: spi-nor: winbond: sort flash_info entries
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-39-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_111757_080055_98079BF7 
X-CRM114-Status: GOOD (  11.18  )
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
 drivers/mtd/spi-nor/winbond.c | 166 +++++++++++++++++++++---------------------
 1 file changed, 83 insertions(+), 83 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index edc64c99cd81..142fb27b2ea9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -72,37 +72,25 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25x16",
 		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x15),
-		.name = "w25q16dw",
-		.size = SZ_2M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x30, 0x16),
 		.name = "w25x32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0xef, 0x70, 0x15),
-		.name = "w25q16jv-im/jm",
-		.size = SZ_2M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.id = SNOR_ID(0xef, 0x30, 0x17),
+		.name = "w25x64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x12),
 		.name = "w25q20cl",
 		.size = SZ_256K,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0xef, 0x50, 0x12),
-		.name = "w25q20bw",
-		.size = SZ_256K,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x12),
-		.name = "w25q20ew",
-		.size = SZ_256K,
+		.id = SNOR_ID(0xef, 0x40, 0x14),
+		.name = "w25q80bl",
+		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x16),
@@ -110,57 +98,84 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x16),
-		.name = "w25q32dw",
-		.size = SZ_4M,
+		.id = SNOR_ID(0xef, 0x40, 0x17),
+		.name = "w25q64",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x18),
+		.name = "w25q128",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x19),
+		.name = "w25q256",
+		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+		.fixups = &w25q256_fixups,
 	}, {
-		.id = SNOR_ID(0xef, 0x70, 0x16),
-		.name = "w25q32jv",
-		.size = SZ_4M,
+		.id = SNOR_ID(0xef, 0x40, 0x20),
+		.name = "w25q512jvq",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x50, 0x12),
+		.name = "w25q20bw",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x50, 0x14),
+		.name = "w25q80",
+		.size = SZ_1M,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x12),
+		.name = "w25q20ew",
+		.size = SZ_256K,
+		.no_sfdp_flags = SECT_4K,
+	}, {
+		.id = SNOR_ID(0xef, 0x60, 0x15),
+		.name = "w25q16dw",
+		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x80, 0x16),
-		.name = "w25q32jwm",
+		.id = SNOR_ID(0xef, 0x60, 0x16),
+		.name = "w25q32dw",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		.id = SNOR_ID(0xef, 0x80, 0x17),
-		.name = "w25q64jwm",
+		.id = SNOR_ID(0xef, 0x60, 0x17),
+		.name = "w25q64dw",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x80, 0x18),
-		.name = "w25q128jwm",
+		.id = SNOR_ID(0xef, 0x60, 0x18),
+		.name = "w25q128fw",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x80, 0x19),
-		.name = "w25q256jwm",
+		.id = SNOR_ID(0xef, 0x60, 0x19),
+		.name = "w25q256jw",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x30, 0x17),
-		.name = "w25x64",
-		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
+		.id = SNOR_ID(0xef, 0x60, 0x20),
+		.name = "w25q512nwq",
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x17),
-		.name = "w25q64",
-		.size = SZ_8M,
+		.id = SNOR_ID(0xef, 0x70, 0x15),
+		.name = "w25q16jv-im/jm",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x17),
-		.name = "w25q64dw",
-		.size = SZ_8M,
+		.id = SNOR_ID(0xef, 0x70, 0x16),
+		.name = "w25q32jv",
+		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
@@ -168,64 +183,49 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x18),
-		.name = "w25q128fw",
-		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-	}, {
-		.id = SNOR_ID(0xef, 0x50, 0x14),
-		.name = "w25q80",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x14),
-		.name = "w25q80bl",
-		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K,
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x18),
-		.name = "w25q128",
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x19),
-		.name = "w25q256",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixups = &w25q256_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
-	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x19),
-		.name = "w25q256jw",
-		.size = SZ_32M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		.id = SNOR_ID(0xef, 0x60, 0x20),
-		.name = "w25q512nwq",
+		.id = SNOR_ID(0xef, 0x80, 0x16),
+		.name = "w25q32jwm",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x17),
+		.name = "w25q64jwm",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x18),
+		.name = "w25q128jwm",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x80, 0x19),
+		.name = "w25q256jwm",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
-	}, {
-		.id = SNOR_ID(0xef, 0x40, 0x20),
-		.name = "w25q512jvq",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
