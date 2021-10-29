Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB696108F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EB696108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=He/MrVRAeXWR3UKb8ZOSl5hh2ZsQy2ScIMI56cc6Ti8=; b=p/XXOU+DnfCrbJ
	ykg70e87izgOoGQxSW/PyLJugyQjVdoCMQ1SLBGxIJAv7mRknqoJxln3Iunz/vrhI6F3F4UIyxjpb
	zvvHSCOTHt/JQ+ykoMzZvMpgpAtJnD319Lw9CI2oIxeoGBSOcTBi7b13BOKna2+NM0RhHaARdBOJl
	+ssGhYYSP/AfmSK8svpbVe4uWC3biCIxbMikaXyRzQSGZ+By2I9Zo0jB2GHr6BPYV4yZf2lPouGAD
	RKwJm38swe/46vWRCDh7hC2TfnnyRV7BeF88ncmcaeJnVnuxYW0Hp9U4r9RWz9h+2LDnYJ+anUxGV
	MHhzYb60B6Edf8HMgXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgW9Q-00Bh5R-B6; Fri, 29 Oct 2021 17:58:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfO-00BZJV-2o; Fri, 29 Oct 2021 17:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528467; x=1667064467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I7l7vfeioM4ln4m2Ot03TMikiTYhXl6oHMx8FTi5S64=;
 b=0s+8l/bMbeduKrh1OshyQRijsNTkMqPzrhdEXc3uCyOpFJHFMANqQSbf
 GmqnCG5H/nBxFfOUil1xhGWjuyemRMV7m1iKwJPwm2CJOhJnO16VBuwr1
 QbjB2DP47hqMJwFffrDvED1AzLwtb5kHjIotec5JJE/Vr/1YP8uA65i1n
 4ffvb3/Q30+VoHEK3WRDKd76wxTMZXt4IeBYWy6dz7FuIkVk6utfH+hhF
 mBWQ/dSZHRE6qNRm3DckWjahBKYn9wGWBUyBUEdSp+yFHAXkjeSxfDcI6
 NWe56NSTVO1k6mZAurDmoFSh8VPgyII4j/eKKpQ1gILSb7EPVSl6Wz+z0 g==;
IronPort-SDR: mypyJkQqeu0LpfZEgRgZRCKIDM9XgR5yFGPDNTGqM8BJqliKlp2G5d7XQWXEUtVaquvuD4f4K2
 OxSG8lVi6RBfaycIBRyLrthFcAdfZX/mf/Q7KNVy9m76XWD2P5NJvNXd5Cr5Bn0o86GlCWZjCP
 qZQFa+lo3/ttfic1JJZX64PBEH1lmGG8Zil5Pj8OHoZqH2Y2w+mbz3dCR3czPZC2A//n8yY3jN
 yTTh8RubsslZsPjAdtJ1zkrAfAU1Dl10Grj4zMSPuXjcQ+hbIwRY2xH1DLv7DC8+QGkEJJje4p
 HGh/sMDqpBWQ5FUwW++LRh6H
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141586313"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 13/25] mtd: spi-nor: sst: Get rid of SST_WRITE flash_info
 flag
Date: Fri, 29 Oct 2021 20:26:21 +0300
Message-ID: <20211029172633.886453-14-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102746_186650_C01E6975 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The flash_info flags should be generic and not manufacturer specific.
Get rid of the manufacturer specific flag and use the late_init() fixup
hook instead.
Please note that sst_write is now set at flash level and not globally,
per manufacturer. Manufacturer hooks are generally a bad idea, because
it affects settings for all the flashes and we might end up with fixups
for "manufacturer settings".

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h |   1 -
 drivers/mtd/spi-nor/sst.c  | 100 +++++++++++++++++++++----------------
 2 files changed, 58 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6c4b6f4743b..6fc63ef4267b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -336,7 +336,6 @@ struct flash_info {
 	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
-#define SST_WRITE		BIT(2)	/* use SST byte programming */
 #define SPI_NOR_NO_FR		BIT(3)	/* Can't do fastread */
 #define SECT_4K_PMC		BIT(4)	/* SPINOR_OP_BE_4K_PMC works uniformly */
 #define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 3593aae0920f..40e55b531edb 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -55,42 +55,6 @@ static const struct spi_nor_fixups sst26vf_fixups = {
 	.late_init = sst26vf_late_init,
 };
 
-static const struct flash_info sst_parts[] = {
-	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
-	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
-			      SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
-	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
-			      SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
-			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
-			      SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-		.fixups = &sst26vf_fixups },
-};
-
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		     size_t *retlen, const u_char *buf)
 {
@@ -177,19 +141,71 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_late_init(struct spi_nor *nor)
+static void sst_write_late_init(struct spi_nor *nor)
 {
-	if (nor->info->flags & SST_WRITE)
-		nor->mtd._write = sst_write;
+	nor->mtd._write = sst_write;
 }
 
-static const struct spi_nor_fixups sst_fixups = {
-	.late_init = sst_late_init,
+static const struct spi_nor_fixups sst_write_fixup = {
+	.late_init = sst_write_late_init,
+};
+
+static const struct flash_info sst_parts[] = {
+	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
+	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_4BIT_BP | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE) },
+	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst_write_fixup },
+	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
+			      SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
+			      SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		.fixups = &sst26vf_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_sst = {
 	.name = "sst",
 	.parts = sst_parts,
 	.nparts = ARRAY_SIZE(sst_parts),
-	.fixups = &sst_fixups,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
