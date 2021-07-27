Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFB7C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94F66109D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C94F66109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3m65mBN22Ms5vb7hgZH26RXym+aejq56v1OHUzpDV/U=; b=pdAWo7IbmOrJ6v
	kqm196wdyfE+9r2Yo9U/hlIVuFORZ/k50QLGhGeJ85Zp/O+AQMMoSzUIHTnkoVAqsQTdgJap6MCIW
	NtzGcbML9yV/fJnzNwdx/PmXzutut0XVn7zs0KcbjZukK0gl63ea22DKbyOgUrRgaI7q6BHH1n93Z
	5g/2pWrMbnJ8Ug9EMh6/0jzzLW9L0NrWUvk2c4UhH41/iffQ/RDGyNbKM/yQRh1og4phUG2wltNFf
	aLereBOz0P+JurpeyfkIvhMXGmGUWGUmfr8nY1/D0YqNd+7nl3QrL4bnHSp/C2Fy4aoHa0noB25nX
	StyocroBoELeOfDZebfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FNX-00DNJO-RK; Tue, 27 Jul 2021 05:11:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5h-00DHYa-Dk; Tue, 27 Jul 2021 04:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361597; x=1658897597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxTTUSqP4zNCXhtrcOx5menYSWiRlPcQ4R03mryo9WM=;
 b=zs0/IamD8qOYWdTO9icrYpcnvSWh9soG0UtVXiuJuM8eZzJC0Rsk0xcH
 p06QhkUACdLBBLDruttRG0UMzOua4qGNez248KgxCCyjpoyJQBqJ8iQPt
 E22KRgUigmOpFoBd4b1TQs6PF+pJ3CQUc6f/VyK86KRhr48iupPCTlyef
 Y33LTrJlDBV8nsahzWQh8vmLBDtVIOnZiSMN/GhxgTlRIPgDulcp4DVXd
 G267JyoUY9CdKAc9JU/w7NbJZDm8aK1VsriNINhPio8Sdq8h2mDXhIlb5
 GlnZHEKo6QgbPcJQ8z8gYCkNteZSGV+N3JoMd3dbzBFcoFjiD5GJXYBs6 w==;
IronPort-SDR: 4o4O3ixXKpK6pf70C5bAyN2dddo6HeIl2JHDb3zXN4v9WQEdTewstlfOGljLBVUxAvstSRTqQB
 Vv2u4cWyN9tsyv3gCY08yORC6EHd8rDUjN3pR+Z1KSbMph1nT3sTHw0xEgC/py7eHEpMiC/+/V
 cqiNM06bqzXI87XPrOXEjvyVKUCR/nEJT1cdL0URZnxkIlbOz8pZkT8T9Wm/1OSHQbhA5HNvFf
 HUUzT0Hbh6Mbdf55wnw3YGNky99TBgNnKdyxHEqNjaR7YuCiVz37pZ2Rpk9WyOQpDKumzX03LK
 TpK0514isQYjLxfrLu+29cRq
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137653937"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:15 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:10 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Date: Tue, 27 Jul 2021 07:51:56 +0300
Message-ID: <20210727045222.905056-10-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215317_561131_538FB3C4 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

Locking is not described in JESD216 SFDP standard, place the locking
init in late_init().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/atmel.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 1fea5cab492c..b937ef734e55 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -48,15 +48,11 @@ static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
 	.is_locked = atmel_at25fs_is_locked,
 };
 
-static void atmel_at25fs_default_init(struct spi_nor *nor)
+static void atmel_at25fs_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_at25fs_locking_ops;
 }
 
-static const struct spi_nor_fixups atmel_at25fs_fixups = {
-	.default_init = atmel_at25fs_default_init,
-};
-
 /**
  * atmel_set_global_protection - Do a Global Protect or Unprotect command
  * @nor:	pointer to 'struct spi_nor'
@@ -146,34 +142,30 @@ static const struct spi_nor_locking_ops atmel_global_protection_ops = {
 	.is_locked = atmel_is_global_protected,
 };
 
-static void atmel_global_protection_default_init(struct spi_nor *nor)
+static void atmel_global_protection_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_global_protection_ops;
 }
 
-static const struct spi_nor_fixups atmel_global_protection_fixups = {
-	.default_init = atmel_global_protection_default_init,
-};
-
 static const struct flash_info atmel_parts[] = {
 	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
 	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK)
-		.fixups = &atmel_at25fs_fixups },
+		.late_init = atmel_at25fs_late_init },
 	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK)
-		.fixups = &atmel_at25fs_fixups },
+		.late_init = atmel_at25fs_late_init },
 
 	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 
 	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -181,13 +173,13 @@ static const struct flash_info atmel_parts[] = {
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
 			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
-			.fixups = &atmel_global_protection_fixups },
+		.late_init = atmel_global_protection_late_init },
 
 	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
