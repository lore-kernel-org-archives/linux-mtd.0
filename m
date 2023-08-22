Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5FFEE49A5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZGo5Iht0Kj2DjftFEtYwjw3KXYnNYMUz6a/n0wAON8=; b=ny++TJJDnLLNBd
	rVyamEDVizO06frMx66yuocsjhN7eK8SgKzGp6ceWSRQSqy4Pv2klnQ/6vrBW7Oy2IunT2/RdHZDF
	PDojV18rdKCqWOC6p3C5O2iNkzEOy5ARJulAkwKCnVeI1Ie2YBeZbIyLpLZ3jgO81EkZAJunC+tHk
	hufRxwX1Rva9J7YzSAdAVtJAidJ7aleH14GjPeI9kuhz0mCOVdm3lRRghNTQ4YLMVIrq8nP8IKbdp
	SUoWVB2xzAQHHiy4KcDvR4VCJOgUH6f1Dsd06IKMVOcPrJ/SO9i7in8L6SlIMsOu+QE1ilcB+MufA
	MxEtit3SfWG93etkD8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWn-00FI9O-2f;
	Tue, 22 Aug 2023 07:10:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWk-00FI5s-2d
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:10:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5390564D7F;
	Tue, 22 Aug 2023 07:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CF4C433CD;
	Tue, 22 Aug 2023 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688208;
	bh=/w74BS2QCeQojVG/rqqHstQ1qJ1lqBhIWSXiUyyFHDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y9l3diezSTIUpTQ1jlL2Z1l1ckiNNZ1kHcK1cdTLblNpqsjTIN/foIXCRd9ShP2M+
	 6wAtZFlqswuYfZQr2e+nnB1nxtfFc6jLNyC2cq8FK/5/Im7I+K4g7J25YvCbJXU3kF
	 unXKJ05xDpVEenVzEvVmBvbh1TmXvASmaT58kOk+t8WR9YMWUK6AQMyvr/updAd5Gk
	 f8qgwEtyaGh0AQPiBEWkbqAP1+4+OuG9ms2+MrpyPMclq7XLZdP/RcOxROFvyROrw3
	 URPUJW/tyrK7kVWG2LZnDfD32MmSTNSV5lvhD7ji7NByXYv8okRATEaBpfU+gmMGuS
	 xfu0JxTb6bwjg==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:32 +0200
Subject: [PATCH v2 16/41] mtd: spi-nor: remove or move flash_info comments
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-16-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_001010_955054_B9CEF608 
X-CRM114-Status: GOOD (  15.11  )
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

Most of the comments are a relict of the past when the flash_info was
just one table. Most of them are useless. Remove them.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/atmel.c    | 1 -
 drivers/mtd/spi-nor/eon.c      | 1 -
 drivers/mtd/spi-nor/esmt.c     | 1 -
 drivers/mtd/spi-nor/everspin.c | 1 -
 drivers/mtd/spi-nor/intel.c    | 1 -
 drivers/mtd/spi-nor/issi.c     | 2 --
 drivers/mtd/spi-nor/macronix.c | 1 -
 drivers/mtd/spi-nor/spansion.c | 3 ---
 drivers/mtd/spi-nor/sst.c      | 1 -
 drivers/mtd/spi-nor/winbond.c  | 1 -
 drivers/mtd/spi-nor/xmc.c      | 2 +-
 11 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 58968c1e7d2f..d2de2cb0c066 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -163,7 +163,6 @@ static const struct spi_nor_fixups atmel_nor_global_protection_fixups = {
 };
 
 static const struct flash_info atmel_nor_parts[] = {
-	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
 	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
 		FLAGS(SPI_NOR_HAS_LOCK)
 		NO_SFDP_FLAGS(SECT_4K)
diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index 434aaf155856..4848ffe8b38f 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -9,7 +9,6 @@
 #include "core.h"
 
 static const struct flash_info eon_nor_parts[] = {
-	/* EON -- en25xxx */
 	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64) },
diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index fcc3b0e7cda9..12779bec5f99 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -9,7 +9,6 @@
 #include "core.h"
 
 static const struct flash_info esmt_nor_parts[] = {
-	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K) },
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index 84a07c2e0536..d02c32f2f7ad 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -9,7 +9,6 @@
 #include "core.h"
 
 static const struct flash_info everspin_nor_parts[] = {
-	/* Everspin */
 	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
 	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
 	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3) },
diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index 9179f2d09cba..aba62759a02e 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -9,7 +9,6 @@
 #include "core.h"
 
 static const struct flash_info intel_nor_parts[] = {
-	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
 	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64)
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index b936a28a85df..d31401bcab64 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -47,7 +47,6 @@ static const struct spi_nor_fixups pm25lv_nor_fixups = {
 };
 
 static const struct flash_info issi_nor_parts[] = {
-	/* ISSI */
 	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,   8)
@@ -76,7 +75,6 @@ static const struct flash_info issi_nor_parts[] = {
 		FLAGS(SPI_NOR_QUAD_PP)
 		.fixups = &is25lp256_fixups },
 
-	/* PMC */
 	{ "pm25lv512",   INFO0(32 * 1024,    2)
 		NO_SFDP_FLAGS(SECT_4K)
 		.fixups = &pm25lv_nor_fixups
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0f3bd3ed8eff..b21e688fe056 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -33,7 +33,6 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 };
 
 static const struct flash_info macronix_nor_parts[] = {
-	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d7012ab3de2c..1a1d2368c462 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -756,9 +756,6 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 };
 
 static const struct flash_info spansion_nor_parts[] = {
-	/* Spansion/Cypress -- single (large) sector size only, at least
-	 * for the chips listed here (without boot sectors).
-	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 57df68eab6aa..1e06c6841a18 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -61,7 +61,6 @@ static const struct spi_nor_fixups sst26vf_nor_fixups = {
 };
 
 static const struct flash_info sst_nor_parts[] = {
-	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K)
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7873cc394f07..2d3ae972b419 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -42,7 +42,6 @@ static const struct spi_nor_fixups w25q256_fixups = {
 };
 
 static const struct flash_info winbond_nor_parts[] = {
-	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2)
diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..48062ccb22fa 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -9,7 +9,6 @@
 #include "core.h"
 
 static const struct flash_info xmc_nor_parts[] = {
-	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -18,6 +17,7 @@ static const struct flash_info xmc_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 };
 
+/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 const struct spi_nor_manufacturer spi_nor_xmc = {
 	.name = "xmc",
 	.parts = xmc_nor_parts,

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
