Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F309C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB4D60F90
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDB4D60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vI97lk7MvugtbCuM0JmpcvknIvpeVAqA3xLz3nfLuE=; b=AEmKynCG7bnWg7
	S8A1EgxRkxTGIiI7YnYZP0oQW6aF7lhg+kQaYraNNwOLPuYmWRmuPfRksuKXpnB3ph8ijMAx50z/f
	qvCimg2k1h+WCoiHGqH8BLeb7XEYbg/gTrALH0vJNJ3NIpe1c7SnpowvWBlyFQyk86FF0+jwvXAXd
	eknuKbg3Qwjr6G7FN4jlNNm5G8yTgpeqEYuYaaLi45fCLGrMfzwJo8MaWcwK+/IZEPgug4Ve5DH4/
	CLHofrhXXLX+fYhPj5Oz5gz4lEiFRNMM3tgFuAbYhtjDixc5ADs4D2yzSMQ9EUmb6wHu6IHq7TDF3
	2Il1DA7xpvYNUbyJxvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Flb-00DRmE-LS; Tue, 27 Jul 2021 05:36:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6B-00DHg2-UN; Tue, 27 Jul 2021 04:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361627; x=1658897627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+IGlN+uye5uhaNJhXu4Hwk6b/4NW9Rf6HIzmXPOgcI=;
 b=tMKwhmX/nlGwn6KPCWa60wy/FJRPVx56u38Fsb3oOwjOfpU+gU0lfmUW
 HnEHwQxGWKbKPoYaKaJR0x22SZWmRoDOtkP3yiDtIVwkO/a5O/EKUtviH
 GQqjDWN0M0rqcGxOIKe7B1LvIJqixqqD1LIXJiXErjkJB+fmL4cMgOzSt
 gL9nM/Lqb941sJGrK3VkGHEsPICRyBtKC4mYKrQXTZcsKWkN0ZuhbpsgH
 ap3eSQEV/IVyT+Xc6Oknayv+zgcy8oQ9ufZbpOTdDPHg9yIgLF13DiRDj
 WKJspI3w0YsHJlVhWICHz0vOOcqEVl5BdfJBK6jgYcqDUF/rf7YReQ66H g==;
IronPort-SDR: jEKDt/h7q1F3Ek5F0YU/hmBdvZ1lhyeX1eRtbeaPWVxvb+KWqMCVAZJcD+ZE+DH/CQUqWv8Zoq
 dEV3teZS8wR7TpWoJujgbSg1sASEBaiw6/nnUGmzufjLj8aWQw8ejW3iij2IyGaoFHebPhmZtC
 8FbNL/0QB08rS6Cq3vwejwvZ/zG+TWgJmYehlmz+8HnRwN/ZSOrL/Eeosqiqk1HXR9Td/4GP9T
 dvvwZA55Hq1Cz+hZUaMuKcNf48Q5EC2wsJjTY8jPMrCjtaO6CxFkcHPOSDe2a3ZNEDmJKDlX/X
 COjuz0J7h8CJTCdV0vqGpdgq
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482146"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:45 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 15/35] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups()
 only when SFDP is defined
Date: Tue, 27 Jul 2021 07:52:02 +0300
Message-ID: <20210727045222.905056-16-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215348_086424_5FDE7E07 
X-CRM114-Status: GOOD (  14.72  )
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

spi_nor_post_sfdp_fixups() was called even when there were no SFDP
tables defined and the function name was misleading.

We introduced the late_init() hook which is used to tweak various
parameters that could not be extracted by other means, i.e. when
parameters are not defined in the JESD216 SFDP standard, or when
the flash_info flags are incomplete.

Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
hook is as of now used just by s28hs512t, mt35xu512aba, and both
support SFDP, there's no functional change with this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 66 +++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 15ccc9994215..1f38fa8ab2fa 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2509,6 +2509,25 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 		nor->info->fixups->default_init(nor);
 }
 
+/**
+ * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
+ * after SFDP has been parsed.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Typically used to tweak various parameters that could not be extracted by
+ * other means (i.e. when information provided by the SFDP tables are
+ * incomplete or wrong).
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
@@ -2523,11 +2542,12 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor)) {
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->addr_width = 0;
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
+	if (!spi_nor_parse_sfdp(nor))
+		return spi_nor_post_sfdp_fixups(nor);
+
+	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+	nor->addr_width = 0;
+	nor->flags &= ~SNOR_F_4B_OPCODES;
 }
 
 /**
@@ -2643,26 +2663,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
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
@@ -2709,18 +2709,12 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    should be more accurate that the above.
  *		spi_nor_sfdp_init_params()
  *
- *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
- *    the flash parameters and settings immediately after parsing the Basic
- *    Flash Parameter Table.
+ *    Please note that there are ->post_{bfpt, sfdp}() fixup hooks that can
+ *    overwrite the flash parameters and settings immediately after table
+ *    parsing.
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
  * parameters that are not declared in the JESD216 SFDP standard.
  *		spi_nor_late_init_params()
  */
@@ -2740,8 +2734,6 @@ static int spi_nor_init_params(struct spi_nor *nor)
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
