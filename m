Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAE2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D3B610C7
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50D3B610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmmkuPi/m0ofSdLrhYm7O8A6xTDfjfszmc9XRuIFWqU=; b=gtaqd4Uw4ZlHvR
	kLreaFyDyzBLZK+xM8IsT+9QOvmGOkeFz9wnZ8JM8SfJJBnwJQ7eqGIZVts2xpg6hFKtcSzGzGvSl
	dXdDxYUiDQOyW2yQH2fDN8yJABuBY3f3QLm3KP+lWnY9UHZpDAIOwTZEI4zSXHb4d531w0wC0+ly5
	6Miuz1YRdctRS/ny4WNfa/sT2H4Rpd+fmlC3l80pKOQESYM9rYV6cIuFWIQAseh3qTdiqgalYwTDy
	kdnU3hLpmp+85+PuMleh0IKaE7tsIpWKogT+i0rJnrY+QjCp5gQjtWnCDYNeffxmAgdOK1wGCnKbL
	8n/3ALmR0jNoTh8sFEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgViM-00BaJF-Lu; Fri, 29 Oct 2021 17:30:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVei-00BZ8n-5m; Fri, 29 Oct 2021 17:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528423; x=1667064423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P75VB/lOc6uW/G1tH7F5eQNHpvlpKggC2JE7im7PN9E=;
 b=f5P0GrlsTMh1JctOINAnYsHlpPJ8in296IK+ZFYxvj5Bm5JM2J/hQekD
 xLpzE1Ob4eSoN8xokkwSrc8dYs4Mh6RgLKu+LlKjx1sNDXvNbFFaSOUyf
 LOtGxYr5s+R+A03RuJ9kefQiHT64doDsJEJ4rJFfWnfry2FraO7CH9jWQ
 8x/OzsY/JHnx8I4WEiZopwMFT4xlhZi5xOR34PRLEjOQt/8dqTuNHkVe4
 8OLBbHU+ACNOyYZTKaFZTZZ4Fc/J9I7fUMAXs+eIBDvQ51Bgz8FKSmY+v
 cvCD2ZX0datjHtZAR/SVn66aant/jtCxEKVeu13pAmN6IZgcJTZRx6UoX w==;
IronPort-SDR: r835OISJ+aeYLps0397retVcTKVm/zYNWBJeoU01lUjVdKkasw5RA0By25t/vrtpPyVLlICh5X
 JZmc7h4TOt6LlWat8FQNlNAsKcIeRXXKywRaiLqyWATY6rdF2fh6LhzfTfA4PnOBvcY2Vgiv1K
 VLFkKAlmG7T28bK4xsctqQ9lcPjl5nOxWV8WOGMhZGyRKdii2pTSLR3jGszPzvAzPdRLZbsBoZ
 5qP1vCO+1eIDNLTQa/R0Eit0Zv3d0Eg/YlB0T+QZatio0sk06u7dcsRGlQrgigkouAzvP6mDAr
 ctdePczrxhdgkglpfhcy+evm
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183358"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:26:54 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:26:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Date: Fri, 29 Oct 2021 20:26:11 +0300
Message-ID: <20211029172633.886453-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102704_259613_D8D80D01 
X-CRM114-Status: GOOD (  14.42  )
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

Used to init all the mtd_info fields. Move the mtd_info init
the last thing in the spi_nor_scan(), so that we avoid superfluous
initialization of the mtd_info fields in case of errors.

While here use common naming scheme for functions that are setting
mtd_info fields:
s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
The functions names are self explanatory, get rid of the comment
for the OTP function.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 54 +++++++++++++++++++++-----------------
 drivers/mtd/spi-nor/core.h |  4 +--
 drivers/mtd/spi-nor/otp.c  |  2 +-
 drivers/mtd/spi-nor/swp.c  |  2 +-
 4 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 277d1fde84c8..ae971c773334 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3071,6 +3071,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
+static void spi_nor_set_mtd_info(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	struct device *dev = nor->dev;
+
+	spi_nor_set_mtd_locking_ops(nor);
+	spi_nor_set_mtd_otp_ops(nor);
+
+	mtd->dev.parent = dev;
+	if (!mtd->name)
+		mtd->name = dev_name(dev);
+	mtd->type = MTD_NORFLASH;
+	mtd->flags = MTD_CAP_NORFLASH;
+	if (nor->info->flags & SPI_NOR_NO_ERASE)
+		mtd->flags |= MTD_NO_ERASE;
+	mtd->writesize = nor->params->writesize;
+	mtd->writebufsize = nor->page_size;
+	mtd->size = nor->params->size;
+	mtd->_erase = spi_nor_erase;
+	mtd->_read = spi_nor_read;
+	/* Might be already set by some SST flashes. */
+	if (!mtd->_write)
+		mtd->_write = spi_nor_write;
+	mtd->_suspend = spi_nor_suspend;
+	mtd->_resume = spi_nor_resume;
+	mtd->_get_device = spi_nor_get_device;
+	mtd->_put_device = spi_nor_put_device;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3125,26 +3154,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_HAS_LOCK)
 		nor->flags |= SNOR_F_HAS_LOCK;
 
-	mtd->_write = spi_nor_write;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (!mtd->name)
-		mtd->name = dev_name(dev);
-	mtd->type = MTD_NORFLASH;
-	mtd->writesize = nor->params->writesize;
-	mtd->flags = MTD_CAP_NORFLASH;
-	mtd->size = nor->params->size;
-	mtd->_erase = spi_nor_erase;
-	mtd->_read = spi_nor_read;
-	mtd->_suspend = spi_nor_suspend;
-	mtd->_resume = spi_nor_resume;
-	mtd->_get_device = spi_nor_get_device;
-	mtd->_put_device = spi_nor_put_device;
-
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
 	if (info->flags & SPI_NOR_HAS_TB) {
@@ -3166,12 +3180,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (info->flags & SPI_NOR_NO_ERASE)
-		mtd->flags |= MTD_NO_ERASE;
-
-	mtd->dev.parent = dev;
 	nor->page_size = nor->params->page_size;
-	mtd->writebufsize = nor->page_size;
 
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
@@ -3196,15 +3205,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	spi_nor_register_locking_ops(nor);
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
 		return ret;
 
-	/* Configure OTP parameters and ops */
-	spi_nor_otp_init(nor);
+	spi_nor_set_mtd_info(nor);
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 223a03769950..48f26d3f1b3c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -548,8 +548,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
-void spi_nor_register_locking_ops(struct spi_nor *nor);
-void spi_nor_otp_init(struct spi_nor *nor);
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 983e40b19134..fa63d8571218 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 	return ret;
 }
 
-void spi_nor_otp_init(struct spi_nor *nor)
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 8594bcbb7dbe..1f178313ba8f 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
 		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
 }
 
-void spi_nor_register_locking_ops(struct spi_nor *nor)
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
