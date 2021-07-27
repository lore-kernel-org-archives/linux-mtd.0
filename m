Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79ECC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A774460F94
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A774460F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8K+rCzxgRvIHW4WBoG3d03GxLyAoKF0KVZDrMERJKM=; b=XLp40+KvvDyA9q
	I4gcKmxdx6fv4BRe4+VoZoWHkyXsWeuKaPhs0dOP4ATTsOiWrDmdN+i5W7NyOzirCkomAH2/FpqEI
	X4gaRIXSnzSMYsaEgG//v9PieXvlHlS5oKxOqMl2uzvBTgIhFPyfgVdDInYe6IusgIaBzZh9BkYdQ
	kEdsR/WS4GdRvEqhgKoShTxy3n4bqjo/3hZ0zlNL4hBHUks//MEG7vsQ8hk057dbnCWAJRg2Dy2TT
	pZtyjN6Kjjnr13SiFnGz5L3HY5OjlaxtgSx0E/IVJFgHj+/0WbIH9tGPZFlubxqFel8hF9SgG+xrT
	3Qy2C/rKOuHsvyJO81yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FKI-00DMQq-Ma; Tue, 27 Jul 2021 05:08:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5c-00DHX1-3g; Tue, 27 Jul 2021 04:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361591; x=1658897591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W6PtSFtp9YKqjBcoAfppno8q9Rqg4UE5THfHt9mw6j4=;
 b=fFXmBeHaZQLbLUGr6DLs0aBleNIxTVofdp4WlCHa+0Crv14n2/OeHba3
 VMV2377iV2Pj5BHCTUkAunAClZRu/bmwdcC9Zr5qSg87E2fWYjczutv11
 UZuh89+OIwYOZNDe4yuJkSjs8zuNOBewvLGCGO5CQoQsv69Ztlc35gzg1
 bjr0ZI3lho/o++RBdOfFugfixJjX1bL/W2bIKBsSHmcWmDg2qznqoq5SJ
 Vb5F04Dab9MXd4WfIgUNBc9RnF36PImZzGcFWQPckd5BgTDT4QYfffwdh
 x8hu4yJRC5l8xn1hEDkw5XFR2r3e2X2utS31AgAHX8TcCDxJ0CLSKlIyV g==;
IronPort-SDR: gZF7Qu8Y7QzSbm/fPqfTG1EMuOqzd/aGljBooSMpqDUrwGzO0coA606m6kG7b474tnst7+iDzL
 hzm1zMJEtTSzv2wXUXl9vzyjicpEyrLEkVCnZ6/siaBEN8TIpo0cD+N7WyC+/JIJStdF+6V45n
 EcVswKhV9afaIYu4VoZGbG4fZvT9bRrBQmYbMtFwwDwBSOILVB4fSO1I3KMqESutc6lLzjpGcF
 fkmggytgHWyfBQ28cW/csADprfKMaYGjH+O67VcxoOgeTgiq05b1LSr6Sw80wWRjXFvQj/VAnZ
 bBCMQkdMe3HvGviTM3EuRDP8
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482114"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:10 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
Date: Tue, 27 Jul 2021 07:51:55 +0300
Message-ID: <20210727045222.905056-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215312_247553_C0D32E95 
X-CRM114-Status: GOOD (  16.55  )
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

The goal is to get rid of the spaghetti way of initializing the flash
parameters and settings. late_init() hook will be used to tweak various
parameters that are not defined by the SFDP standard. Can be used by
non SFDP compliant flashes in order to tweak flash parameters that
are not/shouldn't be handled by the flash_info flags. Will replace the
default_init() hook.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 15 +++++++++++----
 drivers/mtd/spi-nor/core.h |  8 ++++++++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d30c8f350dc1..15ccc9994215 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2667,11 +2667,18 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
  *
- * Used to set default flash parameters and settings when the ->default_init()
- * hook or the SFDP parser let voids.
+ * Used to tweak various flash parameters that are not defined by the SFDP
+ * standard. Can be used by non SFDP compliant flashes in order to tweek flash
+ * parameters that are not handled by the flash_info flags.
  */
 static void spi_nor_late_init_params(struct spi_nor *nor)
 {
+	if (nor->manufacturer && nor->manufacturer->late_init)
+		nor->manufacturer->late_init(nor);
+
+	if (nor->info->late_init)
+		nor->info->late_init(nor);
+
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
@@ -2713,8 +2720,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  *    wrong).
  *		spi_nor_post_sfdp_fixups()
  *
- * 5/ Late default flash parameters initialization, used when the
- * ->default_init() hook or the SFDP parser do not set specific params.
+ * 5/ Late flash parameters initialization, used to initialize flash
+ * parameters that are not declared in the JESD216 SFDP standard.
  *		spi_nor_late_init_params()
  */
 static int spi_nor_init_params(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e9896cd60695..13d5c5edfd27 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -391,6 +391,11 @@ struct flash_info {
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
+	/*
+	 * Init flash parameters that are not declared in the JESD216 SFDP
+	 * standard.
+	 */
+	void (* const late_init)(struct spi_nor *nor);
 };
 
 /* Used when the "_ext_id" is two bytes at most */
@@ -457,12 +462,15 @@ struct flash_info {
  * @parts: array of parts supported by this manufacturer
  * @nparts: number of entries in the parts array
  * @fixups: hooks called at various points in time during spi_nor_scan()
+ * @late_init: used to init flash parameters that are not declared in the
+ *             JESD216 SFDP standard.
  */
 struct spi_nor_manufacturer {
 	const char *name;
 	const struct flash_info *parts;
 	unsigned int nparts;
 	const struct spi_nor_fixups *fixups;
+	void (* const late_init)(struct spi_nor *nor);
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
