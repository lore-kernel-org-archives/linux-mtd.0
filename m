Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F30C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qqrHgOvZ5VGxEOKUm08MNY5O9ktnZhTcRAXvq3iCXt8=; b=MNLgYn4hrAZZn+
	6O7tQJRvG6lKhRdecg7aHcm1SLEXz+2QfJxP3O5heHIovLHgL5xeituWwkt/P9vx/E561EkGfizHb
	MjRnzuCRHMAm1k1rYzSHihKuiwEq2t+hAwIxe9B75sDoEi2cNtEy/O3elkoFCGgfJG1jy07La8QGB
	yPIfTiXp/BzAe839uPyRiEIhbdDIKsBozT6JwsPIh8vVEbTkFzwnFj4K19K7s4NEFUgO+Grd+yw9J
	bhKqAKI2lQmNpQpVb9l8rFXraq5HB08cHRmiYOwAucWP17vSTa65O0oWTiYNJgIZ5Qn3PxRIrn0Y8
	K7YbHoxd2xCVO+4rfypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngPX5-00GSw9-Vi; Mon, 18 Apr 2022 11:27:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngPX3-00GSuY-3y
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 11:27:02 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8991222175;
 Mon, 18 Apr 2022 13:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650281216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tE+hOTJnGcUnUgDRWuGXseGh2QeCZJYtJ5niXhv0ouQ=;
 b=GF9v5mT7HOMfLibWpcdhP6WrqTplK8OVbJRvsIJ/nnpTuOUGq8x69BF/EaEDgl4O17rx+b
 ImTG/lqzpyCLDe/9ZVq7Jb6FfGJZ8Zu1H0P+35/70znI4gjGlP1s9ELuxGymMJe9D3xfTR
 FcjJOSII2QYQOHsVspSE74HDz/WIZgU=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: spi-nor: move SECT_4K_PMC special handling
Date: Mon, 18 Apr 2022 13:26:50 +0200
Message-Id: <20220418112650.2791459-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_042701_356706_A8D74541 
X-CRM114-Status: GOOD (  15.73  )
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

The SECT_4K_PMC flag will set a device specific opcode for the 4k sector
erase. Instead of handling it in the core, we can move it to a
late_init(). In that late init, loop over all erase types, look for the
4k size and replace the opcode.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Please have a closer look here. This is only compile time tested. Also
I didn't see much reason to reorder the flags.

 drivers/mtd/spi-nor/core.c |  7 +------
 drivers/mtd/spi-nor/core.h |  2 --
 drivers/mtd/spi-nor/issi.c | 23 +++++++++++++++++++++--
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 848836535cdd..fd41ab9a8746 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2364,12 +2364,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 	 */
 	erase_mask = 0;
 	i = 0;
-	if (no_sfdp_flags & SECT_4K_PMC) {
-		erase_mask |= BIT(i);
-		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
-				       SPINOR_OP_BE_4K_PMC);
-		i++;
-	} else if (no_sfdp_flags & SECT_4K) {
+	if (no_sfdp_flags & SECT_4K) {
 		erase_mask |= BIT(i);
 		spi_nor_set_erase_type(&map->erase_type[i], 4096u,
 				       SPINOR_OP_BE_4K);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 14bf28473cf3..e355457a8555 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -352,7 +352,6 @@ struct spi_nor_fixups {
  *                  flags are used together with the SPI_NOR_SKIP_SFDP flag.
  *   SPI_NOR_SKIP_SFDP:       skip parsing of SFDP tables.
  *   SECT_4K:                 SPINOR_OP_BE_4K works uniformly.
- *   SECT_4K_PMC:             SPINOR_OP_BE_4K_PMC works uniformly.
  *   SPI_NOR_DUAL_READ:       flash supports Dual Read.
  *   SPI_NOR_QUAD_READ:       flash supports Quad Read.
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
@@ -400,7 +399,6 @@ struct flash_info {
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
-#define SECT_4K_PMC			BIT(2)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index c012bc2486e1..3c7d51d2b050 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,6 +29,21 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
+static void pm25lv_nor_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	int i;
+
+	/* The PM25LV series has a different 4k sector erase opcode */
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
+		if (map->erase_type[i].size == 4096)
+			map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+}
+
+static const struct spi_nor_fixups pm25lv_nor_fixups = {
+	.late_init = pm25lv_nor_late_init,
+};
+
 static const struct flash_info issi_nor_parts[] = {
 	/* ISSI */
 	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2)
@@ -62,9 +77,13 @@ static const struct flash_info issi_nor_parts[] = {
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-		NO_SFDP_FLAGS(SECT_4K_PMC) },
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &pm25lv_nor_fixups
+	},
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4)
-		NO_SFDP_FLAGS(SECT_4K_PMC) },
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &pm25lv_nor_fixups
+	},
 	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64)
 		NO_SFDP_FLAGS(SECT_4K) },
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
