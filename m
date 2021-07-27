Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEF1C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA5460F44
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CA5460F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGtj4gjaOZVrS6u5gvF2cp8JuOFTxT1VB9GcOZ6Ej+o=; b=ZKjqiuwRgonbVQ
	BN0Rc00QRVOUgt+IOWZ4Fa4UnMslf2ZmWBZwKEqcjR7cO7M9BfACQGfmMqSiNmxnrIBDznodEul98
	tQyGjU+x+FzIBUha9atX/7Z/uolrJAObdnCD8tF22of88HbAwzvIaBFqsr1ZB1ymoyjf7WYTBSI5r
	5/0/UOUa4rSNvsaa5dzr0S169sTCNTZpmE4hA+mW3YTbeiolFokc5g+Rtdx4qGpUdxjOvf797PIqj
	oEaOjHBIrGG5mq2mClz8M9BovI4ir644TQEkSmWf21BQCIkT/vCba7PEURobEpl4NdWuh5nbEKqMO
	7Ov7PYyje52/utKOQAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GdI-00DdLA-QA; Tue, 27 Jul 2021 06:32:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F79-00DHxc-T1; Tue, 27 Jul 2021 04:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361688; x=1658897688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slTmtpnqab5rT6lwyPep+HqlYjo+D1OO6WRDMlDoHTA=;
 b=hoIn0IeuDnIwScoZhGPm4my1o+tmlEjK2MsRxixRypvTK2tJSw15roUP
 Cqgs4jmEMMdShQSzFs3uahBPUfAe/D4r+nVf79CXS2ENe6HWtS73jrzQh
 bhQ+qmZzUBRkCJkwuf/ak3aJQS3naUJsDGzPks/Vazpo4vLkLldFJhU0I
 G7E+sfRlVUzpmqx7MiHUem7NeoYPkARUpsWzMpFwwzJZnIWnLsnpscWW8
 6gP1e4bhEVcbLORZvxYoGISyYinbVIRVx23qpsd9s4GImO4YEEF8l7P5O
 L+OIcXjUNL1AubSHi+WkPFXHRJk+zaFhl7VNwZHYH8Y2MPQni7xoCZzSA Q==;
IronPort-SDR: KxHsrL+kTCLqTU1/PiRmM+xHi6hOQ0bdtOo6pkcWEj8ZSA4L+QxKg4BQMKWW/BlA3loWBa2/Bk
 jh1QNJCMaYhXAW/sSmeLEyVXukYEB0kjG7q0SoxWXOxJuhlWm+Mg865nZHv0yArs4CxgjAyyrC
 ZuQOCOqB41AMNDy1NF6Vwi/43YPYN9cYYpADAbr7qZV6d4IuObCofJjkqK15x7v+1348QacanS
 m6gJis4aa+19iH3L4cHFVTz06/JEQ1u80UVuhkAFn97dB/kQXlhxH6R4T7GYbv0CEmMBl9K1VJ
 yfnjQy30zy6JZbJpYVWvCFdB
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935540"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on SFDP
 first for new flash additions
Date: Tue, 27 Jul 2021 07:52:14 +0300
Message-ID: <20210727045222.905056-28-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215448_024160_9CB406B5 
X-CRM114-Status: GOOD (  18.90  )
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

Remove the spagetti way of initializing flash parameters and settings,
at least for the new flash additions (for now). All flash entries should
be converted to either use SPI_NOR_PARSE_SFDP or SPI_NOR_SKIP_SFDP.
SPI_NOR_SKIP_SFDP should be set either when the SFDP tables are completely
wrong and we can't parse relevant data, or when the SFDP tables are not
defined at all, or when RDSFDP command is not supported by the flash.
After all the flash entries will be converted to use these flags and after
the default_init() hook will be removed, the
spi_nor_init_params_deprecated() will be replaced by
spi_nor_info_init_params(). The flash parameters and settings will be
initialized either by parsing SFDP, or via the flash info flags.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 103 +++++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9193317f897d..ef06a8d6abb8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2627,28 +2627,6 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 		nor->info->fixups->post_sfdp(nor);
 }
 
-/**
- * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
- * based on JESD216 SFDP standard.
- * @nor:	pointer to a 'struct spi_nor'.
- *
- * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
- */
-static void spi_nor_sfdp_init_params(struct spi_nor *nor)
-{
-	struct spi_nor_flash_parameter sfdp_params;
-
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
-
-	if (!spi_nor_parse_sfdp(nor))
-		return spi_nor_post_sfdp_fixups(nor);
-
-	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-	nor->addr_width = 0;
-	nor->flags &= ~SNOR_F_4B_OPCODES;
-}
-
 /**
  * spi_nor_info_init_params() - Initialize the flash's parameters and settings
  * based on nor->info data.
@@ -2722,6 +2700,39 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
+/**
+ * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
+ * based on JESD216 SFDP standard.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The method has a roll-back mechanism: in case the SFDP parsing fails, the
+ * legacy flash parameters and settings will be restored.
+ */
+static void spi_nor_sfdp_init_params(struct spi_nor *nor,
+				     bool treat_id_collisions)
+{
+	struct spi_nor_flash_parameter sfdp_params;
+
+	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+
+	if (!spi_nor_parse_sfdp(nor))
+		return spi_nor_post_sfdp_fixups(nor);
+
+	memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+	nor->addr_width = 0;
+	nor->flags &= ~SNOR_F_4B_OPCODES;
+
+	if (!treat_id_collisions)
+		return;
+	/*
+	 * Fallback to flash info params init in case the SFDP parsing fails.
+	 * Used to handle ID collisions between flashes that define the SFDP
+	 * tables and flashes that don't.
+	 */
+	spi_nor_info_init_params(nor);
+	spi_nor_manufacturer_init_params(nor);
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2797,7 +2808,9 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_init_params() - Initialize the flash's parameters and settings.
+ * spi_nor_init_params_deprecated() - Initialize the flash's parameters and
+ * settings. The function is deprecated, it will be removed and replaced with
+ * spi_nor_info_init_params().
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * The flash parameters and settings are initialized based on a sequence of
@@ -2821,11 +2834,40 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
  *    Please note that there are ->post_{bfpt, sfdp}() fixup hooks that can
  *    overwrite the flash parameters and settings immediately after table
  *    parsing.
+ */
+static void spi_nor_init_params_deprecated(struct spi_nor *nor)
+{
+	spi_nor_info_init_params(nor);
+	spi_nor_manufacturer_init_params(nor);
+
+	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
+	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
+		spi_nor_sfdp_init_params(nor, false);
+}
+
+/**
+ * spi_nor_init_params() - Initialize the flash's parameters and settings.
+ * @nor:	pointer to a 'struct spi_nor'.
+ *
+ * The flash parameters and settings are initialized based on a sequence of
+ * calls that are ordered by priority:
+ *
+ * 1/ Default flash parameters initialization. The initializations are done
+ *    for all the flashes, regardless if the support SFDP or not.
+ *		spi_nor_init_default_params()
+ * which can be overwritten by:
  *
+ * 2/ SFDP based or the deprecated way of initializing flash parameters.
+ * Ideally at this step the flash parameters init will be done either by
+ * parsing SFDP, where supported, or statically via flash_info flags.
+ *		spi_nor_sfdp_init_params() or spi_nor_init_params_deprecated()
  * which can be overwritten by:
- * 4/ Late flash parameters initialization, used to initialize flash
+ *
+ * 3/ Late flash parameters initialization, used to initialize flash
  * parameters that are not declared in the JESD216 SFDP standard.
  *		spi_nor_late_init_params()
+ *
  */
 static int spi_nor_init_params(struct spi_nor *nor)
 {
@@ -2835,15 +2877,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_init_default_params(nor);
 
-	spi_nor_info_init_params(nor);
-
-	spi_nor_manufacturer_init_params(nor);
-
-	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
-				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
-	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
-		spi_nor_sfdp_init_params(nor);
+	if (nor->info->flags & SPI_NOR_PARSE_SFDP)
+		spi_nor_sfdp_init_params(nor, true);
+	else
+		spi_nor_init_params_deprecated(nor);
 
 	spi_nor_late_init_params(nor);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
