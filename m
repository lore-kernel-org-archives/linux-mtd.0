Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB14C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLT73/WSumXgceJTph8Hfi+agRDofRmw3a70akP17DA=; b=1mrreSzyyP06LC
	/LhWMEBmaJz3N+qQfFaH0KUR1P7B9O6Rx7KrHfywXojXwMpLU0Q227cOaLjbwUva9YXYvtEFgSTcp
	JDlCWDkz7YlsOQC1VPWzM/nKNH5B89BNsqHYF5SMBX2hR8C0dtmotO/t4uWmR1hibBQMLatK5RToz
	xGmrzt21AVKZRPKHP89aZ9uEydk1MPXfKO6tVTlH3w7+mLZScna9MylmmQOcKFkoG1jCto/WjwtMZ
	wF5UXFnZ86Ou8TB2uUtFTIQvO9WJpRnfVhQGFnWfvtzCY/MgR5MU06olwzl1LQ6wPUkpk4hvlkLj4
	EAy3UQQdFaJhduJXTxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6ft-00Fs2v-84; Mon, 22 Nov 2021 10:35:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yl-00Fgzl-LE; Mon, 22 Nov 2021 09:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574675; x=1669110675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2FJsCwJcst40zrWjB/BTRhqHSwEgDxHD4FWh60t27g=;
 b=m17odJdM/dhqejVz7gV70S3J+YJeVvv6M0XKlALWysFEddwUcxwauwsO
 SBjsNrfzCpxyqYN0OdRknARbvnT2DBZieTkyo8sISx/v/i9rI/1vkuQ29
 LqSg39KN6tvTqoi5J8+bJ9UOpjynaItewx2qo5ztZFnBhsz/kiKxurOft
 Xr8G3xHWyqOGWit93MMgQELsTWOedsthnZ631EsqZtbvons/WtS3TElNY
 qN2z5TJBZXHSlE8FYiHKqNoe4eo6KEgtOcvkFGXsFZrz4gR+d4Y7l+dsP
 BC+A2BMhAW4K4PB31GU7nM0YdZRh6h7NtY6BCN05bFkvCZ4LBECoebCaP g==;
IronPort-SDR: An+ihysE4YofZ4rzgEBfow9gaqzBB1avtNF7+krmdOnyHh5T3w94o/1P1grd37PIjMbE8KyAbm
 KPmyAdfjYX58vxrvte3zoggVgprrom5wTMB8We3i0rBR41eErFoxdw6sW8En/ACmPCfbIWRgDV
 LvyNerNPPUp5MzHZoD7IO+aABHeiala+WgW3PzVnzWplSHB1uaYR8r7YWrLuf8TiLNdqPwwGJP
 rvr1jWHUcQMPGi7FPBPJsA3PbKcSjrnfTcc2FAmXXh0tHv+hvcK32jPC+PoMBr6C9eW4pwd4zg
 6PZ+tEwEcSN9HmALYe/GYfX1
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="144129542"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:14 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:51:09 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 09/13] mtd: spi-nor: core: Move spi_nor_set_addr_width() in
 spi_nor_setup()
Date: Mon, 22 Nov 2021 11:50:16 +0200
Message-ID: <20211122095020.393346-10-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015115_781447_6BF04213 
X-CRM114-Status: GOOD (  17.89  )
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

spi_nor_setup() configures the SPI NOR memory. Setting the addr width
is too a configuration, hence we can move the spi_nor_set_addr_width()
in spi_nor_setup().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
v4: no changes

 drivers/mtd/spi-nor/core.c | 102 +++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4ff386719674..655db0fe49d2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2484,13 +2484,61 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 	return 0;
 }
 
+static int spi_nor_set_addr_width(struct spi_nor *nor)
+{
+	if (nor->addr_width) {
+		/* already configured from SFDP */
+	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
+		/*
+		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
+		 * in this protocol an odd address width cannot be used because
+		 * then the address phase would only span a cycle and a half.
+		 * Half a cycle would be left over. We would then have to start
+		 * the dummy phase in the middle of a cycle and so too the data
+		 * phase, and we will end the transaction with half a cycle left
+		 * over.
+		 *
+		 * Force all 8D-8D-8D flashes to use an address width of 4 to
+		 * avoid this situation.
+		 */
+		nor->addr_width = 4;
+	} else if (nor->info->addr_width) {
+		nor->addr_width = nor->info->addr_width;
+	} else {
+		nor->addr_width = 3;
+	}
+
+	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	}
+
+	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+		dev_dbg(nor->dev, "address width is too large: %u\n",
+			nor->addr_width);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
-	if (!nor->params->setup)
-		return 0;
+	int ret;
 
-	return nor->params->setup(nor, hwcaps);
+	if (nor->params->setup) {
+		ret = nor->params->setup(nor, hwcaps);
+		if (ret)
+			return ret;
+	}
+
+	return spi_nor_set_addr_width(nor);
 }
 
 /**
@@ -3075,49 +3123,6 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	return NULL;
 }
 
-static int spi_nor_set_addr_width(struct spi_nor *nor)
-{
-	if (nor->addr_width) {
-		/* already configured from SFDP */
-	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
-		/*
-		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
-		 * in this protocol an odd address width cannot be used because
-		 * then the address phase would only span a cycle and a half.
-		 * Half a cycle would be left over. We would then have to start
-		 * the dummy phase in the middle of a cycle and so too the data
-		 * phase, and we will end the transaction with half a cycle left
-		 * over.
-		 *
-		 * Force all 8D-8D-8D flashes to use an address width of 4 to
-		 * avoid this situation.
-		 */
-		nor->addr_width = 4;
-	} else if (nor->info->addr_width) {
-		nor->addr_width = nor->info->addr_width;
-	} else {
-		nor->addr_width = 3;
-	}
-
-	if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
-	}
-
-	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
-		dev_dbg(nor->dev, "address width is too large: %u\n",
-			nor->addr_width);
-		return -EINVAL;
-	}
-
-	/* Set 4byte opcodes when possible. */
-	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	return 0;
-}
-
 static void spi_nor_debugfs_init(struct spi_nor *nor,
 				 const struct flash_info *info)
 {
@@ -3249,15 +3254,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.
+	 * - set the address width.
 	 */
 	ret = spi_nor_setup(nor, hwcaps);
 	if (ret)
 		return ret;
 
-	ret = spi_nor_set_addr_width(nor);
-	if (ret)
-		return ret;
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
