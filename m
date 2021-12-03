Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB6FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtJc39d7Gg5gcOS0PXdmZDkSjMGdhrBMGE+6iJmxJEk=; b=Gz/P/fODWq46pd
	1GN29qA2oYRQoWL8BRvb+egySNWHc28fp/u+PLcSxqUoQY0nqyTPjtcMIflCp4GZxzoiOWpv/Gq6/
	HExtapYz6ISboF1GX9xQ36wBz8PcMBln3F8BHm3v2otbsV+vuXrh5gMZK0EhYqQbswGE93CxaRlf9
	8TkAAx1pr1fnLVDU/r28T7e5701YUhX6Xa7Z8JLgXktrvTDTte2P3KKxOs0gPJNyBuIV65r+fbqXm
	WYwTK5gZ74yb6fftmGU6RA0wjhPgiX5aJD3v78RpDaaMVam6jMeeiwQJMK+/0OubM3vJ75VnJEjei
	UhlC+4bYCoxAlBaC1KKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9lI-00GD7I-MQ; Fri, 03 Dec 2021 14:42:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Tb-00G855-8b; Fri, 03 Dec 2021 14:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541431; x=1670077431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8t3zu23uMVnnpno8aoRmey4GN3YlrzdE3+ON4rixrec=;
 b=rTjpkRQSJQT2liPfs1xfHFO0I3In97adVo5kuF5aQHSavlO14sE4ufSb
 ZAxlIDppUF1T0jp8TkwjpL2hb++BW5+a988M0wKmUP0PRJxdYLLUAxSZO
 OqxfAQLfLrC8aJFwd1f+QdAKfI+aOfFT4l+556VvmDTyloHzZnw3F8127
 4LhTDhUaEZtlIFAPtedRQsbXmUOOaXAwFhlUfNqJItPi7RkaLAl+g0V5c
 2dB8taS7qwhdiTD+EUV8u9NFLPsODHwW6gylSiFx3LK792rUwnIcYa8Wd
 Ai4PH0jJJhXqAVCrxbsJvW1w3pQA7oe4oFlLLFWhMlJrupMwsK4yXxw49 Q==;
IronPort-SDR: oSJVGrUC02wU8AyUdUj5NXqUCeuw8Eax922UUWyrl8rTdRHjFHYIWJxRaDAgk7v4BBYGpBbnov
 t7oDA/2o79zmKwzPxHe42/bZOqw4md/Ym/i3KP1DpPZOPSgfc7H1FQdb1KK7gWdutYqcBGDp8c
 8j+tcOz5ANPrd/pM28J4CyFbofBJonip5yPoYAxEiPiITfM2wxL8L9Ze79NKYzp7fC8J3eAAlb
 L4nfEXeoc8P/gPX7ry8yfgGUxCcE8Bxhsw/k/9g0r57RuYNp2PthNpKQBWjGkvqHXwaXe/Xjv6
 k8w+uuJTDEluWtbZzUC+LAoq
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="138583104"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:48 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 10/14] mtd: spi-nor: core: Move spi_nor_set_addr_width() in
 spi_nor_setup()
Date: Fri, 3 Dec 2021 16:22:52 +0200
Message-ID: <20211203142256.47370-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062351_477835_C82AACBF 
X-CRM114-Status: GOOD (  17.95  )
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
index d5eaf9a705ae..075b6d0e092a 100644
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
