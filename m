Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92134C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:10:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B43D61284
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B43D61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMXTiSTGaptg82BXwiqiLlFGH8dXQRr5LcETFdJFG1E=; b=OOtAti2NrGhz1e
	B8dV6XyEMxMeqAJqF7C0Tbo7b1/CgZVDfirwBc5pPPaj6hbk1aRxBlns36WOoEPdmrbaRliXt606h
	/YE1CiD8TRwvnehJsw27cb8/w99FxG2eWVNkVSmByuUeIa+Iu3HtaQXdbaSNAOH6iuAj+BzZdy61h
	nAt22jq7wrZ+XIBQsECp7YLTmBPEb86nYeYLcsssqn9ioYHuh5xVd1IuZTmWeqquADV09j3gcS6yt
	b6ndssyUMSGB1HBjqiQe4bJOWVjeruHr4Ur1CtqhdISFXAmHT3ziEY1/PRd1ChVXp4XY7g/0Xz4PS
	gkuPbDjpuu2kL9uri76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPCI-00DFRf-UU; Sat, 06 Nov 2021 17:09:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOpG-00D8Go-Nx; Sat, 06 Nov 2021 16:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217154; x=1667753154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ndXgdMbnyk42/xvtMViQJVRpHDXd71BUKyKxzevKRc8=;
 b=BWeTuuMbjBeI5Ai25K/7d366wv5LtYxBBddExkdtNFZ6+TqCAJD5IZDO
 AKvenWCV3TaSsI8RGpbknkGPjMrTwdV3N0CmyJiwTtqz7XsH/l/m75mbi
 ssEwH5e9z9SSGtsT/YfmGHtMM5MfzJr4JtL7tQkdNq7+c8j6ptkjDQ1Ce
 rJgpdMAkYLPTfBr8Ga0X+JUmBIokRVS7kgbyzSY9pPFGkgm8njfKysKIE
 wV+Jz4SasWJiAJ81LCsoInBEqn8C69T2MvMiSRJVK9Yura3YFJfnT+XSx
 bOXUxZYetu87xhlO+RUmL5COJhnVJ9X0XFzEAGiCZbEMilmgVmANJj6dM g==;
IronPort-SDR: 2oT4CpvyDJVRbqsB9cGrOxAx7PZc4cSku4QPEOphj5v2qbJaA5/sk0+52mA9PXwBAJfZwD1ZTT
 Grh9iQHOZ17d2gEe4jyGbVzTHS/sKPiSO2IfYhytqOYJQTMSVsLDHgODhBiVu1nkY7cyTAyG+5
 bsyk/3joRv+TrIn1XXBVS4QkVj5OWiwFtuNkm1mbuQFY5R4wXvfVJQus/2yHgjEBxrs9sHnt2v
 I36t4tpgaommDISpKi821kPFq1845mykxW2P6+1ChSOudzN/OK4e4TFpIVdp4Xmbib1k6FzGEX
 z1J3PU7CdHuN+imt+aP5wQ+U
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="142416166"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:08 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:03 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 1/6] mtd: spi-nor: core: Report correct name in case of ID
 collisions
Date: Sat, 6 Nov 2021 13:36:52 +0200
Message-ID: <20211106113657.172690-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094554_862624_F8F573CA 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Provide a way to report the correct flash name in case of ID collisions.
There will be a single flash_info entry when flash IDs collide, and the
differentiation between the flash types will be made at runtime
if possible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 7 +++++--
 drivers/mtd/spi-nor/sysfs.c | 2 +-
 include/linux/mtd/spi-nor.h | 2 ++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ea26f27a3229..3d97c189c332 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3132,7 +3132,7 @@ static void spi_nor_debugfs_init(struct spi_nor *nor,
 {
 	struct mtd_info *mtd = &nor->mtd;
 
-	mtd->dbg.partname = info->name;
+	mtd->dbg.partname = nor->name;
 	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL, "spi-nor:%*phN",
 					 info->id_len, info->id);
 }
@@ -3271,7 +3271,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	spi_nor_set_mtd_info(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
+	if (!nor->name)
+		nor->name = info->name;
+
+	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
 			(long long)mtd->size >> 10);
 
 	dev_dbg(dev,
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 9aec9d8a98ad..017119768f32 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->name);
 }
 static DEVICE_ATTR_RO(partname);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fc90fce26e33..be7ebaf092fe 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -369,6 +369,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
+ * @name:		used to point to correct name in case of ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @addr_width:		number of address bytes
@@ -398,6 +399,7 @@ struct spi_nor {
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
+	const char *name;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u8			addr_width;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
