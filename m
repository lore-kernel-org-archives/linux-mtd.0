Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD50C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5rhZutp8YyRiHO2uGxbjxuwab2na1d2V03ICeVfP/A=; b=zWf3MaP7NTmUEE
	4h5nTCplbJC+683FVTTZXFD6IHeD2uHBY10qXQQZ61wN72tjAjyDCQAEnbYVobTOwWUCXYgQmUp8N
	9d9RUBEucyP/NATNP22CvUcHU5v7CK1hYEZI3d0WzsmEOFWVn7x/QyzA6oIgqRGhc7zrKGcWzHZkv
	aHXmZ4Sn981LfNDRCPgI0SuslTL9ZTTY2yxITqTyucy2SuzamLHj6MqkdoBAhaoGmfOeKMLsLvBrW
	D/cJW1YNA/ObXdkBKAC3GbdEZYy4MHyIgApwakutHwMeSCvfNf4bIWDHqZcgsgffufxce4HmcnGR2
	vcA8Fxb1zSyS1KEVgwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6Jh-00Fmwo-Sl; Mon, 22 Nov 2021 10:12:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yB-00Fgpw-SX; Mon, 22 Nov 2021 09:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574640; x=1669110640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CpNc2jGij/LjlkTOMWJPl6BuQ9rc9apGwFFMRa05mBk=;
 b=uz/lYT+ltQPk6q3eO7gPPNliD7KV3cnJlFOe4dzwfiByIg47IKUUT3fh
 WqsFejODY+b9O2uPQxKrQQcBaW6n0eW62Oq13z40Ih7YDKVHVRtueGyRi
 KxEdfRbpGaV0QH7hb09mr4BX4bGTOVzWJQ5WPdymhch272ir4146VUKxe
 m4Gosh0vgV9BypYHJIFjEI1AB7W6IyDylgW9ZlBkjdHeYNMYIYpaVTSgJ
 uHfxB4UhG/3m0hEs4uFpa2y8AW/QX2maBYN4fohIU/eW9FudVogyr7Sd6
 51eANsax08rM/qd3cK8/hP3EvFlZfh9ULo/W8i4uDMmZwQ/44pd3FbAZQ A==;
IronPort-SDR: dc/jOI8beAHknju0KlB/U8pLLPS2pG5XAPZtRcjELWC5tVJt4gLfoij9AngEZjI6UBcc+MEhSB
 2kUaFEN83o3k6q7SO0Y62Ii1hwfq4epzpsRRklSk6l8+R6p8ivpYeptrTOz0NkTj5EX92mppr7
 kpUufFz4lvy9/EgqvryF7PTT79tz+v1kqfQ6nuaAeuc0M/27Cf3mvBJ1X0ThB854D5GWCP7dyS
 pL/f1H1rg7w/VUQi1M8FTZGw3soJFcw/dgLMuk6ymCWcLozuHMr0U8W8Qojl1HySYxb2NKPE0n
 mmjCJD1gD8AS7brLBCBAjIst
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="144129416"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:37 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:32 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Date: Mon, 22 Nov 2021 11:50:09 +0200
Message-ID: <20211122095020.393346-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015040_035305_9FDB9598 
X-CRM114-Status: GOOD (  15.09  )
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
Reviewed-by: Michael Walle <michael@walle.cc>
---
v4: no changes

 drivers/mtd/spi-nor/core.c | 56 +++++++++++++++++++++-----------------
 drivers/mtd/spi-nor/core.h |  4 +--
 drivers/mtd/spi-nor/otp.c  |  2 +-
 drivers/mtd/spi-nor/swp.c  |  2 +-
 4 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5b9c827d411c..c2da885f4d8d 100644
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
+	/* No mtd_info fields are used up to this point. */
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
