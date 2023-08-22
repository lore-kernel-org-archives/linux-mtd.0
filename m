Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC7EE49A8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/IckuSlM6mUvR0fjRMKdDh/MSw7CAdSJWXSExmdoW8=; b=WgOFaG5SYdP/0t
	V0BJ3B+Zly7jBZh85LPb2cNlV8z/KD2BPC7mH2HI/D7AqbKhxDPZFnfhffZKKw2Tfkl/PCW5az358
	cuicyWx+beSPYv5jlEYVRLVIMizwKAUerrkFKWCgwAy0LzFvFpRKLuZMrFR7JFolt7eKBWzEKgP/3
	OoQBArM9V7ohudSDObnX3NjI2EWQFvIf+3MQCnPs5gIGaDDs/KgvUSp9D5NwTpbke1R44XqTPfirV
	Rj3wFffPAyVJj28FiomxR8kSoxqrYbHpimQf+Va8WQXbEXLpfhOMQMttePswagKhyuAN1JfSGZCKp
	jt/ftw/Ge3u8quUMMr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWf-00FI1R-1S;
	Tue, 22 Aug 2023 07:10:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWc-00FHyb-0n
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE15164D68;
	Tue, 22 Aug 2023 07:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66ACDC433C8;
	Tue, 22 Aug 2023 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688200;
	bh=Zs1A1HxiQPsOM73l5lBrT2OaeEpwSq16bUHtLZRB2hM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lOO0Zwi1fSHW+5O6Y9lMi4o9D+VRhJWXOASsDq/RCdENK8VWml5uEpDRZopB2l3iU
	 GPJqAik2JrAq8IJiUd5Do2W9gjIz9O8I4SiYvLvYwvyoZIqSvdnjsHlDV6WjkUjL/X
	 9k5XKAKyMwkcC0FmPusv47Eeh7pKtQ7lKMQzh0rGeMji4s7oy0K6IB/wASGzfmt2nI
	 6qGzyPNaJjqUuXZ8fJWX5Ea7YcOwG7zgp9CTD+iM/5TaJ/COh1Wb0TaDNFP85Hu2Gs
	 EOhFbjBdcf0SbQuXa97z13ab30NfK/55UIwER+gOznvI/y1ifPJT9cGsWEgEvRM8Xk
	 F5qKYeWtqypRQ==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:28 +0200
Subject: [PATCH v2 12/41] mtd: spi-nor: introduce (temporary) INFO0()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-12-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001002_417131_7A69B001 
X-CRM114-Status: GOOD (  14.01  )
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

The id will be converted to an own structure. To differentiate between
flashes with and without IDs, introduce a temporary macro INFO0() and
convert all flashes with no ID to use it. After the flash_info
conversion, that macro will be removed along with all the other INFOx()
macros.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.h      |  3 +++
 drivers/mtd/spi-nor/issi.c      |  4 ++--
 drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9e6ad02b03b0..c42b65623da7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -571,6 +571,9 @@ struct flash_info {
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
 
+#define INFO0(_sector_size, _n_sectors)					\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 0),
+
 #define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 9d22b799ce94..b936a28a85df 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -77,11 +77,11 @@ static const struct flash_info issi_nor_parts[] = {
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
-	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
+	{ "pm25lv512",   INFO0(32 * 1024,    2)
 		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
-	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4)
+	{ "pm25lv010",   INFO0(32 * 1024,    4)
 		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
 	},
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 6ad080c52ab5..5406a3af2ce0 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -272,15 +272,15 @@ static const struct flash_info st_nor_parts[] = {
 	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128) },
 	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64) },
 
-	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2) },
-	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4) },
-	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4) },
-	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8) },
-	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16) },
-	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32) },
-	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64) },
-	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128) },
-	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64) },
+	{ "m25p05-nonjedec",  INFO0( 32 * 1024,   2) },
+	{ "m25p10-nonjedec",  INFO0( 32 * 1024,   4) },
+	{ "m25p20-nonjedec",  INFO0( 64 * 1024,   4) },
+	{ "m25p40-nonjedec",  INFO0( 64 * 1024,   8) },
+	{ "m25p80-nonjedec",  INFO0( 64 * 1024,  16) },
+	{ "m25p16-nonjedec",  INFO0( 64 * 1024,  32) },
+	{ "m25p32-nonjedec",  INFO0( 64 * 1024,  64) },
+	{ "m25p64-nonjedec",  INFO0( 64 * 1024, 128) },
+	{ "m25p128-nonjedec", INFO0(256 * 1024,  64) },
 
 	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2) },
 	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16) },

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
