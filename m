Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppm8bt2MZvmUOclF1eSq8Zf5iBm0UGFqw0ATIYWHYII=; b=wDZiTeNaBQ9rHr
	f/Ke+kyilr9z47/5EheCPwT1bqARe8vBybQvgWp1CXY7WIaAsQgM5I1fUnu0XAftlZkx/JXEVTCzQ
	FC1EaKS0O8vvZXefjVQY9QHwA0tQOWhBOfOluPywoQHggju6Gnb2JF/t7Lsn748n23h2+p38eEt1/
	aO5MT0QxlNLEuk/9M/VvO9HKe1/wYgwKtt0F12oHYpdCh0jhT2gUQYgDZo/AbIhL06SJbZbTHBrYF
	Op0Hd7XYarIKavB5PRD78k3TEcxrk0xSUoXff7qZTKzSwCItR/Lkkdd8BuCr/O6GXFDn+yJgBeJoa
	cwNJjWo9E4K+86YKwggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRx8j-008vfl-Kd; Wed, 09 Mar 2022 14:18:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRx7u-008vNK-Rn
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 14:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646835438; x=1678371438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IORGV7QlcA5sohOEM4gfP0Bb40JV3m1t21ODzfp/29o=;
 b=EWnpaNrriBAR+wp0K4hKVWLg7/2JrC06oltUk0IQypNMi+GCuKsTPHdD
 CmJBRzQOQlV0HMbzn5tG6bULRFGBRlkHtU/RIiWsm8oen8bPRe4632PoF
 XWxN/lnjZw4NPQCJHlATdNYMvwQN8wa0Ml3CdLZF/iy7Evx1oGDQXFo/I
 f5V7ocq0NfUouv4Xl6n9ysurELXB6FTiSqkyG6gCImZwnVKPIvNf91TX5
 lkRG3B3I6z7AHp/VqLhelRwkDXXG6Ktmz17Awtfb0Za2QjBlS67oovunE
 jGd2cBjYwuL3DL6yKLK5R/D6tDiiJqPTpNK/lw0fbhzDL5E4vUwuI8qyJ g==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="165097814"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 07:17:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 07:17:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 07:17:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 4/5] mtd: spi-nor Favor the BFPT-parsed Quad Enable method
Date: Wed, 9 Mar 2022 16:17:01 +0200
Message-ID: <20220309141702.173879-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309141702.173879-1-tudor.ambarus@microchip.com>
References: <20220309141702.173879-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_061718_939745_51A795DF 
X-CRM114-Status: GOOD (  12.53  )
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

JESD216 SFDP defines in the BFPT standard methods to enable Quad Mode. The
flash parameters and settings that are retrieved from SFDP have higher
precedence than the static initialized ones, because they should be more
accurate and less error prone than those initialized statically. Favor the
BFPT-parsed Quad Enable method and use the generic core methods where
possible.
This patch may introduce regressions in case BFPT contains wrong data. The
fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c     |  5 +++--
 drivers/mtd/spi-nor/issi.c     |  4 ++--
 drivers/mtd/spi-nor/macronix.c | 14 ++++++--------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5de46a786cc5..9a5299a7b212 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2427,9 +2427,11 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->info->fixups && nor->info->fixups->late_init)
 		nor->info->fixups->late_init(nor);
 
-	/* Default method kept for backward compatibility. */
+	/* Default methods kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
+	if (!params->quad_enable)
+		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 
 	spi_nor_init_flags(nor);
 	spi_nor_init_fixup_flags(nor);
@@ -2497,7 +2499,6 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	const struct flash_info *info = nor->info;
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
-	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->otp.org = &info->otp_org;
 
 	/* Default to 16-bit Write Status (01h) Command */
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index c012bc2486e1..0fefda46ccad 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -69,13 +69,13 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K) },
 };
 
-static void issi_nor_default_init(struct spi_nor *nor)
+static void issi_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
 static const struct spi_nor_fixups issi_fixups = {
-	.default_init = issi_nor_default_init,
+	.late_init = issi_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_issi = {
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index c267cbcc7f1d..4fd65d55388a 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -102,20 +102,18 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
-static void macronix_nor_default_init(struct spi_nor *nor)
-{
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-}
-
 static void macronix_nor_late_init(struct spi_nor *nor)
 {
-	if (!nor->params->set_4byte_addr_mode)
-		nor->params->set_4byte_addr_mode =
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (!params->set_4byte_addr_mode)
+		params->set_4byte_addr_mode =
 			spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	if (!params->quad_enable)
+		params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
-	.default_init = macronix_nor_default_init,
 	.late_init = macronix_nor_late_init,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
