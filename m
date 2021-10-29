Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C16C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:32:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF9C60FF2
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCF9C60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmVtw2WXWnWtdOnnGMBZIOqwxYO4lfy3BZY+X9U35ik=; b=yJ6raItuM1LKZU
	xsws52RvGK8IiThDaSZP3+ObA3jMd3dTkdcytcWV5IsWiiRwLqeYkamEL6l1OdjfmDW5hrFktH4Mq
	onwTNyTfg/gicxMOTs6WGNEJ4PzRCAUAgzv6juZIlShY6y6ILwRLrhB8hFQ1kuO8QwaCLXfXQ1JhF
	IAsz3ltADdjTlrwyfzmvlA89Fd2C0xRV+AoT4kSqD0xHNGx1DlswzRar/5sxfcmp5iohA4AtF3xgc
	HXoo3Ba6ZnUMtueM+5apZApIr+hIZpmfF12Yg2U1T2dzqyj2bOA6FQJXEVAoshsGsav92YQ1fy8dd
	/0fdNqNo7abTQDedVMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVjr-00Bal3-Q0; Fri, 29 Oct 2021 17:32:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVev-00BZAg-B8; Fri, 29 Oct 2021 17:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528437; x=1667064437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4p2OOypcQ1hzIYvvCoGusI1XTKcc/ypExIM8PU9DLpY=;
 b=kyYTWY/2EG5+0HNuOmBKR22gsQo7LpzRW2ZANEInQlfedzxz1oQ3N3Gc
 Zo/5KJPP/3NxWm/uRLxQIc0FJ1yR5LeQRQmq355gkXRXpS/VBfSL6U0W0
 OoRyq1617X7nIAQ6DuXi8HjvSkuCYvxe+q+mEduwS1zAvl+twlux3f33f
 dhArIyuWgZcoI2XstKUW3nCbBDBY+xmIRSjJkqvRmuUd/1F0cf7aCj/d8
 zcTCJU0iGG9UdVs8FVwNeR3wRxM+zVS0UBP64IC2TBp1D1z1Jf6Jl+MTj
 EtZvUSv8Zfo7khtFVqfMIbHamKQOMB9VhYoozcotUZRaSbWDsIiUpum0g g==;
IronPort-SDR: iHzyeyS9ncbzyzq60mz1O8BYtb4IjWGCpZja5xpsJTQfb9FY4LScEmKNO5d2lnULELAAAJ4G4C
 KtqcRLtLrn/FLFPSvDZT7ppFF2ZWXF1aq2GEqULWLE4+DoOgfjAbv+r5vI0GLLKQd4RddC1i3Y
 SVkpGY4Wm0RrszsbqMUUKIOvkuJXtiuRc88/VD2ltE6/N3y4Et3SevyCmfWt93zwz/MFGS2mxW
 EMzKcpr8HU0IxKNKdEpmeKl1cTj8uOIfriunTrsceoh9QDGbDHHiBWnlvixxN5yxB3VqIBhsP1
 s3E+Uc9h9B6jGHxf623L85W/
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183432"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:04 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:00 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 05/25] mtd: spi-nor: core: Introduce the late_init() hook
Date: Fri, 29 Oct 2021 20:26:13 +0300
Message-ID: <20211029172633.886453-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102717_438655_8E2E72CF 
X-CRM114-Status: GOOD (  17.53  )
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

Flash parameters init is done in a spaghetti way right now.
There is the init based on the flash_info data, then there is the
default_init() hook, then SFDP init, an intermediary post_bft(),
then post_sfdp() and a spi_nor_late_init_params(). Each method can
overwrite previuosly initialized parameters.

We want to separate what is SFDP and non-SFDP specific. late_init()
will replace the default_init() hook and will be used only to initialize
flash parameters that are not declared in the JESD216 SFDP standard, or
where SFDP tables are not defined at all.
We cut a member in the chain of initializing parameters by getting rid
of the default_init() hook, and we make it clear that everything that is
in late_init() is not covered by the SFDP tables defined by the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 17 +++++++++++++----
 drivers/mtd/spi-nor/core.h |  4 ++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 13515ad12bf1..4679298c5301 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2666,11 +2666,19 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
  *
- * Used to set default flash parameters and settings when the ->default_init()
- * hook or the SFDP parser let voids.
+ * Used to initialize flash parameters that are not declared in the JESD216
+ * SFDP standard, or where SFDP tables are not defined at all.
+ * Will replace the spi_nor_manufacturer_init_params() method.
  */
 static void spi_nor_late_init_params(struct spi_nor *nor)
 {
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->late_init)
+		nor->manufacturer->fixups->late_init(nor);
+
+	if (nor->info->fixups && nor->info->fixups->late_init)
+		nor->info->fixups->late_init(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -2712,8 +2720,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    wrong).
  *		spi_nor_post_sfdp_fixups()
  *
- * 5/ Late default flash parameters initialization, used when the
- * ->default_init() hook or the SFDP parser do not set specific params.
+ * 5/ Late flash parameters initialization, used to initialize flash
+ * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
+ * tables are not defined at all.
  *		spi_nor_late_init_params()
  */
 static int spi_nor_init_params(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 48f26d3f1b3c..f6c4b6f4743b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -297,6 +297,9 @@ struct spi_nor_flash_parameter {
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
  *             incomplete or wrong).
+ * @late_init: used to initialize flash parameters that are not declared in the
+ *             JESD216 SFDP standard, or where SFDP tables not defined at all.
+ *             Will replace the default_init() hook.
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -307,6 +310,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	void (*post_sfdp)(struct spi_nor *nor);
+	void (*late_init)(struct spi_nor *nor);
 };
 
 struct flash_info {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
