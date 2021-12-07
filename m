Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5167AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9HAKf/aIBVhqaRQadm/nr7SDw82OPM8ZHH5IxuCAxU=; b=AV8OFlajUYol54
	ALqZJ7bh535s5pRdfmezSY4AyaJTaht5Ivu53ojGZP5fgzGtZe3Llh1d/sHAU3OB5qHaz4hPEIUhY
	b214hhypMV5aJe2GUpO1rYjQDWQN26r7xX6VDlfA+FnMMtg0q9p7LuHaQVUpGyDBFxYVnG2af1jsx
	hMRda53Toc0LdrHH+bEo0g4CVmF1wMuEZ0WE4X68X3i63QM4tcaZu8yL/U6enoVQgniZ01Ao4blVw
	7ztbgSnJGdvSGtFcWdviEqWKOY5ycSWEPzdthTxzUPJLDCweaUwHDlHJWw/YsNp5fQjKCtYTG5FcC
	m8N+Xwzj7jXJfrmq6u9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubSZ-008wBc-Fh; Tue, 07 Dec 2021 14:28:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4a-008pGD-0l; Tue, 07 Dec 2021 14:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885839; x=1670421839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OyUPNYV0q7PWpj6Q5+7tRxI7+7Ecx4YIIhNlEFirKSQ=;
 b=ZtBReb02ccewsxJU5s7KbOqVJDtTYzk48Vbztm8c7grUhb2rjZZ+hiDa
 JRizIMnZLVfoswI0bU/6p8P5QufpCT7bU65kGiDfT/txpckI/QN8aGoEj
 Bnsdzyku26dFXZ9Pb9GFXKzV3uZaPzEIcUXI++rB1YkwCx5Qu+piL+07B
 5yUwLMHbnXu+fF6CShsdx9oJMJ2AosKph2ecmUk86x7sKGE95OYS564K4
 xfKLbd9mFFWWCQdbxHQVZ1mglJEZHo9N+yhjIjTvd+v2Hl2//z+1Gzfw2
 sX9pDPjsp+gxXqr2KhLr9/YN9mifu5Zx0QRocE9rtmWurkWOrhV1CmAXT A==;
IronPort-SDR: O3m9CuS/xRoL3bxNZZXm9nr6k5gcjAgLX0B5V4Bfxa5JjP0D3eLyAZBUHqrkEg0A7Ei9kACNub
 YNIaZ2miJ5JT33seUPiUxJlQKgj1huMBSOEz8xPOZ0WLZRP8CQ4oLGDm0pFSiw4JKTCzSVVY8G
 ja+iiQT222fw8spO+DU2qiyhC3KLLcf7N0m+mAV9m66W3TYeZ1V0o3jvAee0nFYrIZjbPa90xS
 2JP1VNEujGdes885+2YEcVpvq2BuAV80RN58W1a5RWaOAAG6yvB8BncliJkPcoq7hPslNHMnHp
 CyiHmPRS2zlYtGYPnWo0of8X
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="146381854"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:52 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:47 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 10/14] mtd: spi-nor: core: Move spi_nor_set_addr_width() in
 spi_nor_setup()
Date: Tue, 7 Dec 2021 16:02:50 +0200
Message-ID: <20211207140254.87681-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060400_170167_E996F4C4 
X-CRM114-Status: GOOD (  18.03  )
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

spi_nor_setup() configures the SPI NOR memory. Setting the addr width
is too a configuration, hence we can move the spi_nor_set_addr_width()
in spi_nor_setup().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 102 +++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c5a5844e98c5..2e21d5ac0e2d 100644
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
@@ -3078,49 +3126,6 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
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
@@ -3252,15 +3257,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
