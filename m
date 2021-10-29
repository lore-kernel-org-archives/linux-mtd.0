Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE095C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79EE60F58
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B79EE60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8v9ZgnyQQhDtwGsUF4O8pcWEsxz+7wpIQccRvn/m2n8=; b=lF0Bq+H2vB29/3
	AdK8LPdhp7RMPQaDNfGp4Z0mg4AoghhOePClhh6wXxJNhW1cbvxniX4kAdI3aVHer6+y6yg7NCNXs
	pr24gO/aMkwJ1J+NStsYvG8fNuMj/QRlKXjkEMkS+oV3klGb7qTyX1rDVgRUvTUTJWNo89MFf4OJb
	oKC3M1xj73hVeQ3pqMNxNCJ8dc2UDJe8m9JdprNPwIh4g7tL4Ctpa/RVUOO4E43coEQGYGkOybJVL
	/Czgf0Tr1KmxaTFpG+FsMmZ2wHOf9C3WQ73KVcQePBQWCzj/P9yTo40o/V4umPW5pSUfG2u7OM+qn
	aAJkiGahWhHZcUhkqHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgW58-00Bg6W-5g; Fri, 29 Oct 2021 17:54:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfJ-00BZJV-UU; Fri, 29 Oct 2021 17:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528462; x=1667064462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LWbD8gEodACBTbqaz7/KSk2oNYh9kRvSJ6g5Uml+LjY=;
 b=N4mn6i3IADNDS5kdQb9kcz52/N/0WmpW6I+br36zNpIcwlyHOt0+UBiP
 o2j9bjqlyfcKZjJ6YlhB9VF/7oYxzlJWPmbornYomTD1i3ory8kdTL5Td
 7tBQNwkg2AxRYfK895myT2BDVROiM3lKdtrE0SAZIvTn/fOFUUXP/upNk
 o8rfbn1O4M/vq0R0N7y/qcOeeBwK9aFXKPtAMEQV4NvSHaLY0sWrSjKOL
 2Wu1OeCOhzFUtdpeQI69oeIyE2Mi/AbPh5qLrbCCIT/nWbW0kKUvHvm1u
 gydS6i0sOeJ7xhgms2kqRORcBVGcyDNXch33i4FitUfFKNaZtKEVohkWG w==;
IronPort-SDR: +VEljPz0baj7Mb17XPq/L3TYK2aJ712T38OSVvZvmLxUvjeO+7aNbll2Tih52alMACvol4Lqde
 6d4ykYJEtP9erQKxwYABelCjhZLiC7BX+2ihN1KxT5P/1Kg48ycWzPS15XeRodU+lGUySfXF/W
 7aYqkV8RZv5XMAkrj+sRFFh5tF/y6cjCD69xIptahyVlFepcL+O6Dgm2q+P48QEsqepudeJCZs
 +H4PRKPDfnB0eyyNE8/5L+OXACD4xa3GiwrJ5HnUT4tR8+I1e8CCkFqZRE2tFBup4vfC4CtRxP
 ZQ0AmaSXPv5RMAnDIHEc46Zu
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141586297"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 12/25] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups()
 only when SFDP is defined
Date: Fri, 29 Oct 2021 20:26:20 +0300
Message-ID: <20211029172633.886453-13-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102742_054516_BD5D9F78 
X-CRM114-Status: GOOD (  16.29  )
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

spi_nor_post_sfdp_fixups() was called even when there were no SFDP
tables defined. late_init() should be instead used for flashes that
do not define SFDP tables.

Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
hook is as of now used just by s28hs512t, mt35xu512aba, and both
support SFDP, there's no functional change with this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 56 ++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4679298c5301..82cc56c9d09e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2508,6 +2508,25 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 		nor->info->fixups->default_init(nor);
 }
 
+/**
+ * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
+ * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
+ * tables.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Used to tweak various flash parameters when information provided by the SFDP
+ * tables are wrong.
+ */
+static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_sfdp)
+		nor->manufacturer->fixups->post_sfdp(nor);
+
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		nor->info->fixups->post_sfdp(nor);
+}
+
 /**
  * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
  * based on JESD216 SFDP standard.
@@ -2522,7 +2541,9 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor)) {
+	if (!spi_nor_parse_sfdp(nor)) {
+		spi_nor_post_sfdp_fixups(nor);
+	} else {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
 		nor->addr_width = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
@@ -2642,26 +2663,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
-/**
- * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
- * after SFDP has been parsed (is also called for SPI NORs that do not
- * support RDSFDP).
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Typically used to tweak various parameters that could not be extracted by
- * other means (i.e. when information provided by the SFDP/flash_info tables
- * are incomplete or wrong).
- */
-static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
-{
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp)
-		nor->manufacturer->fixups->post_sfdp(nor);
-
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		nor->info->fixups->post_sfdp(nor);
-}
-
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2712,15 +2713,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
  *    Flash Parameter Table.
+ *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are parsed.
+ *    It is used to tweak various flash parameters when information provided
+ *    by the SFDP tables are wrong.
  *
  * which can be overwritten by:
- * 4/ Post SFDP flash parameters initialization. Used to tweak various
- *    parameters that could not be extracted by other means (i.e. when
- *    information provided by the SFDP/flash_info tables are incomplete or
- *    wrong).
- *		spi_nor_post_sfdp_fixups()
- *
- * 5/ Late flash parameters initialization, used to initialize flash
+ * 4/ Late flash parameters initialization, used to initialize flash
  * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
  * tables are not defined at all.
  *		spi_nor_late_init_params()
@@ -2740,8 +2738,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
 
-	spi_nor_post_sfdp_fixups(nor);
-
 	spi_nor_late_init_params(nor);
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
