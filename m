Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C7DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVUyKj5Pj4v7ihccvtVSTSyPCK0G0QBulsoStui3teA=; b=1rAnou18vrWpp6
	zc74rZiVfPOtW8JYt8bbQWYxdcuJ1MRph9Mao5LyBi5CVgc3ThHERd0iHfqqOlARIexAq/H8S+RKW
	Dp2T7Sy4rvxBoPJlqGwkP/ETUVjoLhfxDBYPAArM5Qdky1Ckjhae3dL6vCeglnxIOQBsPpc2HQGUA
	tSgaIumKenhEXSSSUSz4sFT71bCwVPKKVsXwRBXvLYIPdhYTLouVHaS+gZm/rJByHBrodOro7TjGn
	kFNrYV6dEiXYl1xe/uIpOcN8kWy9zrSToDIHBJGpxX8hUgpU+mhbQG9MRrPSf7FklIrEejvVge6d5
	/jQqp+R/PkNPuolcp2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9ej-00GBZ4-FS; Fri, 03 Dec 2021 14:35:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9TS-00G7yR-0l; Fri, 03 Dec 2021 14:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541422; x=1670077422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbq4knLpePkXlE9LlhQhcjw0zguQe8NeA6ZlIQ6JKSU=;
 b=s5IMJAkxVxmtUSeOXW+hSZRiRtSiziRI6yXU3lBtqfuxG85rJWeJBPcx
 A8Ke6q3oLKhJqLZe6F+wM4EEaR4h1HquiCFjXiuYzgQGkJaU3JqDZ2ecE
 BTQH/anvq+r16bHONcb8E2d3xL4nMZ6r4W4HWwFMt6ZRablzamXIgbxxI
 UldKZEKDRprVrevH/ODAlgyqCAYFgelOPqQhGPC0gxMvZPj3YemU1JNka
 dE7tLZ4E6/+w0yIJY47v1AUae1Sx1AxrVH1hb6YncMawgK+yVYVVMb5cC
 KTV2f2cb0AjdSc7v747YVAqRuaFnR99r1o/4wXeX5Ba7idjpkaFZdCWAZ A==;
IronPort-SDR: 9d0J9OSA325LyKJUySndtb6kUxRK3kaft7UKfEV3ndSRg8jShK/yrXicOSK8xwlUaHQQ0NeZ25
 gkCjrGIA/F/gUi/8X6qf8d0wr7T2Oi/4iBBjHNGSI/XHUVleNmB+iQ2Z+c/mRqrnvc7L021S4V
 1J1lJoBGqPwaOSnWsxDB0/QbtfBRekXYcsBtHVNvXN+IX2brL22LTvm/c9d0pFje6f31BDH3f3
 +0xmrwdfNVWfuts98+qd7xhkPe4GTdfeSZUfvkfiv+DFRsy4JUerPtuPIQxsoatb8V+eodSZ0H
 o8F8VmsbaowD/ZfgI673XyLE
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141189502"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:39 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 08/14] mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
Date: Fri, 3 Dec 2021 16:22:50 +0200
Message-ID: <20211203142256.47370-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062342_224334_44192C96 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Group NOR flags initialization. Introduce a dedicated function for
setting the fixup_flags and emphasise when those flash_info flags
should be set: when the SNOR_F_4B_OPCODES/SNOR_F_IO_MODE_EN_VOLATILE
setttings can not be discovered by SFDP for this particular flash
because the SFDP table that indicates this support is not defined
in the flash.
In case the table for his support is defined but has wrong values,
one should instead use a post_sfdp() hook to set the SNOR_F equivalent
flag.

No functional change intended in this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1ac7e8de4b8e..86bbd1ca22fc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2692,6 +2692,25 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 }
 
+/**
+ * spi_nor_init_fixup_flags() - Initialize NOR flags for settings that can not
+ * be discovered by SFDP for this particular flash because the SFDP table that
+ * indicates this support is not defined in the flash. In case the table for
+ * this support is defined but has wrong values, one should instead use a
+ * post_sfdp() hook to set the SNOR_F equivalent flag.
+ * @nor:       pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_fixup_flags(struct spi_nor *nor)
+{
+	const u8 fixup_flags = nor->info->fixup_flags;
+
+	if (fixup_flags & SPI_NOR_4B_OPCODES)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2710,6 +2729,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		nor->info->fixups->late_init(nor);
 
 	spi_nor_init_flags(nor);
+	spi_nor_init_fixup_flags(nor);
 
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
@@ -3147,7 +3167,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	struct mtd_info *mtd = &nor->mtd;
 	int ret;
 	int i;
-	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
 	if (ret)
@@ -3197,13 +3216,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	fixup_flags = info->fixup_flags;
-	if (fixup_flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
