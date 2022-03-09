Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E09C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/zrezF/6c6T10elyitPIKhlghSLCjyDT6axooHByes=; b=s8vOEeqofN6CXs
	gNvMK/P7QhydlXeQw2L9Uvaupkts0uT+0goJ+xjVZQoP8DVXL8bHlSz0+Wegr5BJO7mSfNo8ADJPj
	q/jmBKgwDpLYl2Ih/NDh+8ywHMPQXdCwRXDgQnfWwvYtTfBq5EUuukWOSFe1+84ZtnEWrKi110nNg
	eibtbTILH1HrhmmbnT3rH5oy9C7e14wHuLil8zWoRo62I12QWqwRzDUmNRHvyYaINRvinu++fRSDp
	hzkBlGQTa4qL8IMhwng7HwNU7bzg6EN3ewnOlUeq+mou6qMGiOxi0imC4maXhiV5RXFyHL5ntj6NQ
	kQvBOnJYOvRWugmFSAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRx8R-008vXx-OT; Wed, 09 Mar 2022 14:17:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRx7t-008vMI-1l
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 14:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646835437; x=1678371437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2LKPixQNCEbNxRbIvjtc/abLj2E3NE0mNcxvQXI5FU=;
 b=m7P7iKIgk0ePZKSe6WssmZn9NBHL3Mmvy1tUHjSPfcabKrS4FjQVJitx
 pn+pzdTV2ZHel7RmT3XLO4agC9Zd2YcGQidclUR+B1VR4IJ1GxwEIuS6T
 Mea0BPBnh+4+dL5old2pgc/+iBXBgeMI+ikxQRvdJmtPBeIkTRt+S5Rmk
 /RZ2vxNllbUiZvIsdmnoz9u7qJ2O4q1Kab5GRlranBA9iMfcMdxBqXzgp
 GvkXCDQA7rJeJqURaNPoMa+pha2AnD69Y4H/dzjZMaliaDzY+J3SBdDnO
 hTGulIX/PBnAq6Yb8OKsURago5859SgYfNk2YeSrow8Z9QSIEH4cs/Y6v Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="155809696"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 07:17:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 07:17:15 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 07:17:13 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 3/5] mtd: spi-nor: Favor the BFPT-parsed set_4byte_addr_mode
 method
Date: Wed, 9 Mar 2022 16:17:00 +0200
Message-ID: <20220309141702.173879-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309141702.173879-1-tudor.ambarus@microchip.com>
References: <20220309141702.173879-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_061717_169367_D7A439F7 
X-CRM114-Status: GOOD (  13.24  )
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

JESD216 SFDP defines in the BFPT standard methods to enter and exit the
4-Byte Address Mode. The flash parameters and settings that are retrieved
from SFDP have higher precedence than the static initialized ones, because
they should be more accurate and less error prone than those initialized
statically. Favor the BFPT-parsed set_4byte_addr_mode method and use the
generic core methods where possible.
This patch may introduce regressions in case BFPT contains wrong data. The
fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
data.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c      |  7 ++++++-
 drivers/mtd/spi-nor/macronix.c  | 10 ++++++++--
 drivers/mtd/spi-nor/micron-st.c |  9 ++++++---
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 91d3754baa59..5de46a786cc5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2418,6 +2418,8 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
  */
 static void spi_nor_late_init_params(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
+
 	if (nor->manufacturer && nor->manufacturer->fixups &&
 	    nor->manufacturer->fixups->late_init)
 		nor->manufacturer->fixups->late_init(nor);
@@ -2425,6 +2427,10 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->info->fixups && nor->info->fixups->late_init)
 		nor->info->fixups->late_init(nor);
 
+	/* Default method kept for backward compatibility. */
+	if (!params->set_4byte_addr_mode)
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
+
 	spi_nor_init_flags(nor);
 	spi_nor_init_fixup_flags(nor);
 
@@ -2492,7 +2498,6 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
 	params->otp.org = &info->otp_org;
 
 	/* Default to 16-bit Write Status (01h) Command */
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 85e8655d362c..c267cbcc7f1d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -105,12 +105,18 @@ static const struct flash_info macronix_nor_parts[] = {
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-	nor->params->set_4byte_addr_mode =
-		spi_nor_set_4byte_addr_mode_en4b_ex4b;
+}
+
+static void macronix_nor_late_init(struct spi_nor *nor)
+{
+	if (!nor->params->set_4byte_addr_mode)
+		nor->params->set_4byte_addr_mode =
+			spi_nor_set_4byte_addr_mode_en4b_ex4b;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
 	.default_init = macronix_nor_default_init,
+	.late_init = macronix_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_macronix = {
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4baa9dce04f9..a23d2774f166 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -410,14 +410,17 @@ static void micron_st_nor_default_init(struct spi_nor *nor)
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params->quad_enable = NULL;
-	nor->params->set_4byte_addr_mode =
-		spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
 }
 
 static void micron_st_nor_late_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
+
 	if (nor->info->mfr_flags & USE_FSR)
-		nor->params->ready = micron_st_nor_ready;
+		params->ready = micron_st_nor_ready;
+	if (!params->set_4byte_addr_mode)
+		params->set_4byte_addr_mode =
+			spi_nor_set_4byte_addr_mode_wren_en4b_ex4b;
 }
 
 static const struct spi_nor_fixups micron_st_nor_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
