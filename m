Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69781CD6E5D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jfh/1OpLcDglESGSQEHVYApz/T6jvSttBeTdF+OgLqw=; b=T3mkJ5p69d62da
	lsB5IDaple5gs1LTSljsj3IpjvWB46mJY/TD2l9oIYLFjBTW+wOnAMLWEqc/XD6sZvXIifk5totK9
	i1wIc/ad5Kic6oaxIGp7iskLjla4xADMmKsd2t1wJclH5my1F/59l3xl4g6DadYfzRXTTEUI8vc6K
	f7Y64PwESfkSfi0Oge7yitKfqVdO9JhYdPKf6SWVddDD1Xkf9+QZL0R3IgQ1qD7COEKzUx8AGwQRJ
	fKQoaNBXyrn4go2DCNRQvyKEc/HVSvDPRNcgFlfTafOjxws2T9PK6BGX+6HbsceYbCqeVNMxk1dux
	KxrmWuLUnDVfkNUSxisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AQ-0000000BAol-0td6;
	Mon, 01 Jun 2026 12:54:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AO-0000000BAnu-00w1
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 12:54:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6564841AE1;
	Mon,  1 Jun 2026 12:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D14D1F00898;
	Mon,  1 Jun 2026 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318491;
	bh=++KZjmDI8jwFu2xNTmZLajhpDKSYGvFyfbw9tpfvy6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V1i8/bYBs+BApXRZwg0GLhzZ9uESHGg83xJ4ah7tarpeCzSckKe9TCiPgaxjuARo2
	 grqttMQWtEWA51N4qhryBZHAc536WCHte1qunfW9atNC+v/fuFV1j/L0hw8K/I0ka9
	 zqMIzvqFfDZCq1kWtPdZZsUIcUAKoac0xD0//pfF3Tc5aiZMz87RnPdJzyBCRQUgK9
	 WERACfD9B3cegQYflaESxxG6OS32eFVh4dt2YyInVnCK56ZlXjWRTdQA9DRlHbw4dl
	 UnXUAoMik5aheix3C2/0bAvrpK85e+JboneYB/S3TlhWspoJVcW8Qsv/Mdjr9cog7T
	 8H+bgsM9NXExA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] mtd: spi-nor: rework flash parameter initialization
Date: Mon,  1 Jun 2026 14:52:45 +0200
Message-ID: <20260601125438.3481722-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org>
References: <20260601125438.3481722-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_055452_090568_7587E2C0 
X-CRM114-Status: GOOD (  21.92  )
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

Rework how the flash parameters are initialized. It used to make a
difference whether a flash is in the in-kernel database, whether it
supports multi I/O and so on. Recently, that makes more and more
problems because flash IDs are reused among legacy flashes (w/o SFDP
support) and newer flashes [1,2,3,4].

Simplify the whole parameter initialization, by starting with the
parameters we have in the in-kernel database and the try to parse SFDP
(and let it override any settings).

[1] https://lore.kernel.org/linux-mtd/CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com/
[2] https://lore.kernel.org/linux-mtd/DGB4745HRCFI.1DRYTHXURWZJO@kernel.org/
[3] https://lore.kernel.org/linux-mtd/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/
[4] https://lore.kernel.org/linux-mtd/DD6SI06QNEE4.2YCRTWJHEAAQM@kernel.org/

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 65 +++++++++++++-------------------------
 drivers/mtd/spi-nor/core.h |  1 -
 2 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fbf8c2d9c6b5..67e0377b606f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2868,11 +2868,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 
 /**
  * spi_nor_no_sfdp_init_params() - Initialize the flash's parameters and
- * settings based on nor->info->sfdp_flags. This method should be called only by
- * flashes that do not define SFDP tables. If the flash supports SFDP but the
- * information is wrong and the settings from this function can not be retrieved
- * by parsing SFDP, one should instead use the fixup hooks and update the wrong
- * bits.
+ * settings based on nor->info->sfdp_flags.
+ * If the flash supports SFDP but the information is wrong and the settings from
+ * this function can not be retrieved by parsing SFDP, one should instead use
+ * the fixup hooks and update the wrong bits.
  * @nor:	pointer to a 'struct spi_nor'.
  */
 static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
@@ -3053,43 +3052,25 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sfdp_init_params_deprecated() - Deprecated way of initializing flash
- * parameters and settings based on JESD216 SFDP standard.
+ * spi_nor_try_parse_sfdp() - Tries to parse flash parameters based
+ * on JESD216 SFDP standard.
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
+ * flash parameters and settings will be restored.
  */
-static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
+static int spi_nor_try_parse_sfdp(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter sfdp_params;
+	int ret;
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor))
+	ret = spi_nor_parse_sfdp(nor);
+	if (ret)
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-}
-
-/**
- * spi_nor_init_params_deprecated() - Deprecated way of initializing flash
- * parameters and settings.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method assumes that flash doesn't support SFDP so it initializes flash
- * parameters in spi_nor_no_sfdp_init_params() which later on can be overwritten
- * when parsing SFDP, if supported.
- */
-static void spi_nor_init_params_deprecated(struct spi_nor *nor)
-{
-	spi_nor_no_sfdp_init_params(nor);
 
-	spi_nor_manufacturer_init_params(nor);
-
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
-		spi_nor_sfdp_init_params_deprecated(nor);
+	return ret;
 }
 
 /**
@@ -3152,7 +3133,8 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  *
  * 1/ Default flash parameters initialization. The initializations are done
  *    based on nor->info data:
- *		spi_nor_info_init_params()
+ *		spi_nor_init_default_params()
+ *		spi_nor_no_sfdp_init_params()
  *
  * which can be overwritten by:
  * 2/ Manufacturer flash parameters initialization. The initializations are
@@ -3163,7 +3145,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  * which can be overwritten by:
  * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
  *    should be more accurate that the above.
- *		spi_nor_parse_sfdp() or spi_nor_no_sfdp_init_params()
+ *		spi_nor_try_parse_sfdp()
  *
  *    Please note that there is a ->post_bfpt() fixup hook that can overwrite
  *    the flash parameters and settings immediately after parsing the Basic
@@ -3189,17 +3171,14 @@ static int spi_nor_init_params(struct spi_nor *nor)
 		return -ENOMEM;
 
 	spi_nor_init_default_params(nor);
+	spi_nor_no_sfdp_init_params(nor);
+	spi_nor_manufacturer_init_params(nor);
 
-	if (spi_nor_needs_sfdp(nor)) {
-		ret = spi_nor_parse_sfdp(nor);
-		if (ret) {
-			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
-			return ret;
-		}
-	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
-		spi_nor_no_sfdp_init_params(nor);
-	} else {
-		spi_nor_init_params_deprecated(nor);
+	ret = spi_nor_try_parse_sfdp(nor);
+	if (ret && spi_nor_needs_sfdp(nor)) {
+		dev_err(nor->dev,
+			"SFDP parsing failed. You need to manually declare the flash parameters.\n");
+		return ret;
 	}
 
 	ret = spi_nor_late_init_params(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2ebc5c3caca1..3d7c31bff5cb 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -548,7 +548,6 @@ struct flash_info {
 #define SPI_NOR_HAS_CMP			BIT(10)
 
 	u8 no_sfdp_flags;
-#define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
