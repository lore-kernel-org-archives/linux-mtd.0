Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94EDC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//HkmZ3lFIlZY1A1vGEvYiBsuIel68k41fYoaqbXR1U=; b=M3BuDDYdG1DCP/
	DmY07Wpy50z5aKpy1GK/xJbcBhn3vrzZwZqyA474qr/WuHYmKPnP2P1/0I1aML3tlLWz6LxgEbuu0
	CCjqXfga/umRw2l3V+fBRtwd0yGOj4kZUkf8rHNwrECC5i6zm57u4pPLlNs1d0xk+q4Sz+LYzYD0x
	Vxi6vyAkcPLWmZUzzPKW3wnNBxuorJfYaF7VLvr+XDa5V/XJMs318Uh0Ve039RRXrj0u8xcsDdMEA
	IJKfbzImYMioxJa8i1Dj+A1wFx4BMOuwBtreKMNZcvzYhzzAeowxjfVdyfFRpoqXle6Fybo167bqE
	5v7VaO7v9NDmvhLeTKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mub6C-008ptc-FI; Tue, 07 Dec 2021 14:05:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub3v-008p2n-0f; Tue, 07 Dec 2021 14:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885799; x=1670421799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WA8UkMTRNH9SdxRBM3cxzm30Ez6tjGHzr8frqyLWzeI=;
 b=URhLOfrSWfnMAxYb6Eu7q/3i40nt1cbQkpekqNrE15Wq9LMowsfZ4L81
 7UScEMSAFs0sA76r3Kf6chOtdz58DVLkxF1Z8dWPXGQDwyMxSJqjEHmkt
 FRKTWxz+rRfAH32ec/c99meFVJYJglVHGhQrmBmAgZ1mCX2OZz+8EpCzI
 SvpyuaTPYpFD/uYQ5dI+bW+pBPybQyjd7P5ne7yjGqcuojp5BtukckuN7
 rCKNKyuZaTRkF/UPGZWh8e9mc1HxXe54PokSJakDdpnXNkfdJ9TiJYZvT
 lmxL3b9i4H/DmL5zIOHo3aa+gbXzKvpzeNeHQnoZz4o24AjZdGF/khsjA g==;
IronPort-SDR: DDeBgzGlEU3E7cDBh9w8XGrtCWWA+EXp7DP4KZ81lk5nWblkfWvQlFRWDLXL+KclrNZ3MPTZGG
 OSLStosT891AXDG+BTdrSMpHOj8zMQQBJ790kzN00h3LoveA7Rzr61sfK5ah+KUAHMuVFESSlW
 8DoohFKzbKgGtutVLt520f71ScRLP4Q/gQF4j0sjpV9SunGvdiogOtJcHVAohwg1kYNqsdHk0b
 tjWDHvahaMefHQnRyWpS3oWjV6Fsp3/sNCg8pGahT4d94oHbNhi92h2QGTpxWzkbk96Jhfcp/o
 8Yt/YW9gT6aJbDa9KNiREuq9
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="141566169"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:16 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:03:11 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 03/14] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Date: Tue, 7 Dec 2021 16:02:43 +0200
Message-ID: <20211207140254.87681-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060319_214054_4F648F90 
X-CRM114-Status: GOOD (  15.41  )
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
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 56 +++++++++++++++++++++-----------------
 drivers/mtd/spi-nor/core.h |  4 +--
 drivers/mtd/spi-nor/otp.c  |  2 +-
 drivers/mtd/spi-nor/swp.c  |  2 +-
 4 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b9c827d411c..dbb2c98c0366 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3080,6 +3080,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
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
+	mtd->writebufsize = nor->params->page_size;
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
@@ -3134,26 +3163,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
@@ -3175,12 +3189,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
-	if (info->flags & SPI_NOR_NO_ERASE)
-		mtd->flags |= MTD_NO_ERASE;
-
-	mtd->dev.parent = dev;
-	mtd->writebufsize = nor->params->page_size;
-
 	if (of_property_read_bool(np, "broken-flash-reset"))
 		nor->flags |= SNOR_F_BROKEN_RESET;
 
@@ -3204,15 +3212,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
+	/* No mtd_info fields should be used up to this point. */
+	spi_nor_set_mtd_info(nor);
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 50bae06bc024..f6c4b6f4743b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -552,8 +552,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
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
