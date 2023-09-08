Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD2CEE57F1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baVDm8ihzYTtF5YRi8J5jQzro97pPV6NR0vYEcP2Sks=; b=fwdSvPjDUpAYvp
	Ju75Rd75vJM1AH34jJ+AIVs9fgvfaazpvQt4PMMaM3QwRaUQ0CuZ3hPuv+QurPqs2hs43hoe1OQ5D
	WxJ/CevNLyEeu/w2xqJYNWQ74DBDPbaRUN54SbgvB2K0uab/yjl/O/dme3oMmEU7QKxQNJM3G7m+j
	iCCTM+Lv8BNGxZ9KCeO11+m89xBBL0fhc1SKyduIPYEkGJXSSFMo3CyWG+vJ8WrEImd1b9s+0Nr7c
	p7liTmUdrreEywp/xrcbFwVyWWjyGqB5KMN7ZlGSeiaqhFj6CXJr4QiJtR3A0b9HiBoWFQp9jrDXm
	y9p2roQcOQYvVbiBEa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXt-00DT5B-37;
	Fri, 08 Sep 2023 10:17:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXq-00DT0u-2M
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0CB48CE1B70;
	Fri,  8 Sep 2023 10:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3ADC433CD;
	Fri,  8 Sep 2023 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168214;
	bh=ZcPPVMVPnBfzcciWk7xdcV4hm0fvWEKOMgYyC6d4/oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TVKBMsxp1TioKgwa1aWzc7wqSaGXjTIBTI3p7nzuxIz+ZcJIM1OFlfe8zPI7ulBY3
	 D+giqlip3oODdivd+lYJyqp67xpub54FeAIQQGv+wcV8JNJOi8wikiefwJk8XYovEs
	 RpUFDDT5NGA8YxAPgRRllSFBCwPXMNqM2G6RZ2n+JH05NuHC7RWF560F3R28AdTfSk
	 M1Hc/j4WgTKrrI72A+Yv5M38VMJgdaRhq/iE23uErKBlR5BdQg3qeqPes1JXUVeAzr
	 SBO3Pdhw9dUyG8uKOCvH2/sNuoHJ2dAp7aNrTtdjrRb3Kzl6Dj+vjyDyuz8Rc9a/Rq
	 VRpdypj60XrZQ==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:30 +0200
Subject: [PATCH v3 12/41] mtd: spi-nor: introduce (temporary) INFO0()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-12-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031659_147845_9C1E4EF1 
X-CRM114-Status: GOOD (  15.04  )
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
convert all flashes with no ID to use it. The difference between INFO0()
and INFOx() is that the former, doesn't have a pointer to the id
structure. Something which isn't possible to do within the INFOx()
macro.
After the flash_info conversion, that macro will be removed along with
all the other INFOx() macros.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v3:
 - reword commit message
---
 drivers/mtd/spi-nor/core.h      |  3 +++
 drivers/mtd/spi-nor/issi.c      |  4 ++--
 drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5f7cfdf1e834..b8226492bbd8 100644
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
