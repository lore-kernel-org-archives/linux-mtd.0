Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8BEC0219E
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Sep 2024 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+EPAlqT5tV02MD4sSS/k5JnGKih0RII0066hq7yVkXQ=; b=DZVMUn/G3qUzwO
	UyyjECupVcTtLfBG2PLFKcDPfwZUWZe/m5nCUWGZSbs+xMWMXJMMWQGoKElHRdrWD/ons3ZEsezsB
	IIz4ihe3Le5mdHHtGSODK7wBGA+GCQgTGVp+NhT3igU06QM5HPNS6T2oXuSpOyARutYg3pkulClJ7
	PRU0z3IgfVKcR01pjGmKcao6sTd77fy6lDc/upOiIVlnim8kPUeRDzqFq31Hw4LPkfntjupGQafao
	gmr57RHeamaTTZDFJIb4BdAtyHjGU7D+CLP1nKJaCLsr79cQ6ppgHQI6agUZkoNg8p/bOTZnEFyib
	096RRkkMvBRohUJyGduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spazP-00000001Izf-31rB;
	Sat, 14 Sep 2024 22:11:35 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spaxJ-00000001IYc-3BBF
	for linux-mtd@lists.infradead.org;
	Sat, 14 Sep 2024 22:09:27 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4X5lhG6XcFz9stW;
	Sun, 15 Sep 2024 00:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1726351759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HmJQqphtQlEtypYq7uxTvPKW98l/WUTqZWaoRmWspX0=;
	b=CDetg4XzaRnWdfyPCitSPcx6w8M9NVDDFi9H4CS86wpEzGVrYvgmS9qQMtbkr4nQcUIOZl
	77RQWLmk/jbNIdfOl6wnK7rvW8DfoyPIrT/xNH8Ny/T7NdncIzERbb62TzuTKdGxdJZ0fV
	OLrvnCOTBbAH58jhkb/Z9PoLsFcXDsrANfXJRQUQ2DCPS3myMWJJoQfgm67GojAP312Auw
	/FARgfAwtsWgJPmcuHNoRkMFB34rXIC1qP0JXsI54bGqMCZ6hAS7X31P8+RFKE8HDhsG1J
	+LDQQi5RR/MwkzFDnfDONt82scmIBHgcA1JpGIVT/iYuJJbKdXMkNTepiUR7nQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1726351757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HmJQqphtQlEtypYq7uxTvPKW98l/WUTqZWaoRmWspX0=;
	b=jeIwqz1Gt8iviHJ0yplxD1zgCBtervI6OKuo5sdAiCqJxI/AZ6jzfF5cEVv3rP8F6nhXmI
	3d7t+8mNPZu2DftMYPWsYpItpUL4XpIM1UutBtL+kfW2hVc1WSYdiT65b8lf7+87LQhMpN
	aquQxSDd71jTGDYyuFMJodYvyhw+ns2gseHAGacANsfh0eUX2bHCp964TzaAPia/X2kVHm
	f1dgfiV7s/0iqd4Ab/qawUz17O8J1nbqhMtYRLW2h137B8EviGBCMeII6Lq8mE3w5pRFAx
	8hxzAL3/f25ORYHk6sNqI1PtNELSK5pdMmvxvHUEFOwVP+qxxVilKlNw7Gdq4g==
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
Date: Sun, 15 Sep 2024 00:08:16 +0200
Message-ID: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: fo8jpe3tzxzz88n6ujidzxnaxeq5qu5c
X-MBO-RS-ID: 115e5983787f55d5ca0
X-Rspamd-Queue-Id: 4X5lhG6XcFz9stW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_150925_982968_BDA1C972 
X-CRM114-Status: GOOD (  21.06  )
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

The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
and 256kiB uniform sectors device configuration, however according to
section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
manufactured devices, which means 64kiB sectors. Since the device does not
support 64kiB uniform sectors in any configuration, parsing SMPT table
cannot find a valid sector map entry and fails.

Fix this up by setting SMPT configuration index bit 0, which is populated
exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
fixup hook and a wrapper function. The only implementation of the hook is
currently specific to S25FS512S.

This fixes the following failure on S25FS512S:
spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
 drivers/mtd/spi-nor/core.h     |  5 +++++
 drivers/mtd/spi-nor/sfdp.c     |  4 ++++
 drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9d6e85bf227b..ca65f36e5638 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_smpt) {
+		ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
+		if (ret)
+			return ret;
+	}
+
+	if (nor->info->fixups && nor->info->fixups->post_smpt)
+		return nor->info->fixups->post_smpt(nor, smpt);
+
+	return 0;
+}
+
 static int spi_nor_select_read(struct spi_nor *nor,
 			       u32 shared_hwcaps)
 {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..d5294424ab9d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
  *             incomplete or wrong).
+ * @post_smpt: update sector map configuration ID selector according to
+ *             chip-specific quirks.
  * @late_init: used to initialize flash parameters that are not declared in the
  *             JESD216 SFDP standard, or where SFDP tables not defined at all.
  *             Will replace the default_init() hook.
@@ -426,6 +428,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	int (*post_sfdp)(struct spi_nor *nor);
+	int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
 	int (*late_init)(struct spi_nor *nor);
 };
 
@@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_parameter_header *bfpt_header,
 			     const struct sfdp_bfpt *bfpt);
 
+int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
+
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5b1117265bd2..542c775918ad 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		map_id = map_id << 1 | !!(*buf & read_data_mask);
 	}
 
+	err = spi_nor_post_smpt_fixups(nor, &map_id);
+	if (err)
+		return ERR_PTR(err);
+
 	/*
 	 * If command descriptors are provided, they always precede map
 	 * descriptors in the table. There is no need to start the iteration
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d6c92595f6bc..d446d12371e1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
 };
 
+static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
+{
+	/*
+	 * The S25FS512S chip datasheet rev.O Table 71 on page 153
+	 * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
+	 * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
+	 * device configuration, however according to section 7.5.5.1
+	 * Configuration Register 3 Non-volatile (CR3NV) page 61, the
+	 * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
+	 * 0 on newly manufactured devices, which means 64kiB sectors.
+	 * Since the device does not support 64kiB uniform sectors in
+	 * any configuration, parsing SMPT table cannot find a valid
+	 * sector map entry and fails. Fix this up by setting SMPT
+	 * configuration index bit 0, which is populated exactly by
+	 * the CR3NV bit 1 being 1.
+	 */
+	*smpt |= BIT(0);
+	return 0;
+}
+
+static const struct spi_nor_fixups s25fs512s_nor_fixups = {
+	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
+	.post_smpt = s25fs512s_nor_post_smpt_fixups,
+};
+
 static const struct flash_info spansion_nor_parts[] = {
 	{
 		.id = SNOR_ID(0x01, 0x02, 0x12),
@@ -829,7 +854,7 @@ static const struct flash_info spansion_nor_parts[] = {
 		.sector_size = SZ_256K,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
-		.fixups = &s25fs_s_nor_fixups,
+		.fixups = &s25fs512s_nor_fixups,
 	}, {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x00),
 		.name = "s25sl12800",
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
