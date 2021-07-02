Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B199AC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73841613FB
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73841613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AwwvPMa3kRLbdhdwPjtABunVee+bNRo5+VmtakZ2ZQ=; b=Ga4R9BJyIcWkja
	jTWa6nGRECOCOEo3YpxjawjAk//AisXadO3GNf1KjfHhjHiNtMVWiTAJeKFVnArzv8yenYRXebCEq
	GP7H/oMmTa2dIP13xfWLep28GCMRWtSCgepEoimutz0chuQddPUg7i1uFJaXnC3rYIomSZsid9dEn
	rABMmW6KVcjOcwl0b35WW6Lm1411UHkGaZQhpVzVy0vfeCMQd32OtBIiGuR9cFNXAoXXpx6yydAYg
	rnjY+y4j3SGgKwSx7RQS8BCnxFtq/0O7F51wDrUdBIocbmURwz8RxtYRDmkyvvIRc5+G00bO1e8+A
	N9eR5jcuxfmEMiRjVDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKMa-003Hd1-VA; Fri, 02 Jul 2021 14:41:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMB-003HXs-Ju
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236887; x=1656772887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkXbwSjE6ZgRVN3HbrZJTRDfcahmmCwoTtcQANFjcBk=;
 b=I4G1anJn8+a0NgnKWUQ4g/KH3YYnjhqjmLxifpZEMkfPDfZz5OMcBCIK
 aTPbM3I51MkreARm6x5fH3OSGryMhoDd6LimwdcZQ9bW2yjCYUeA+D0Iu
 w0+xk4IpPIk5HWn4ZXJcZX3DIu/r0+9Vva/PPTr/A7oGmaMyhd7Sa6RZe
 VkYWvV46DzMKCDIFXMDtOSBHdkktwBpWfw3Nu7nxxhQvQzBVmUM/dWA3z
 foDMIC7VxfdVykUflJHINhdfUjcGnvPdXCI//fDi2No6nQeMIYb0NlIui
 W8UlrrKZcR9erq3wxKBonBFOYOc6D1rhpQS4o2v6xQc8t1DP01Kkgb/bu Q==;
IronPort-SDR: NjLZKn6GhCisG7evFxn76Uv7t74ekQ8v4Rec9GKDkQhijuwDKD1AiIlhRzV1wueA4aKpOVUtA9
 yMBKc+8UWWhlzfQ42kvYQhlUp7uPS47joKjXZPS+fBfSucmeqOumgq3flHSpIwxxUL1PV99pzt
 NXITh1kR2rZt72uB1lXFSXr+n3P9DUZObZRRlFhzGvoIrJah/UlbQoQdR59XNV2Sw0eX2sMS33
 wc8J1VJ/c/gHHv9oK/JwMXe8Gr8O1VqLaBEU275AnsUuYjzdZmpgsgP/hLtsK5ho0EWJxdL2UB
 Pr0=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="123330209"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:26 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of ID
 collisions
Date: Fri, 2 Jul 2021 17:41:05 +0300
Message-ID: <20210702144110.250481-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074127_739381_EE8C6839 
X-CRM114-Status: GOOD (  13.08  )
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

Provide a way to report the correct flash name in case of ID collisions.
There will be a single flash_info entry when flash IDs collide, and the
differentiation between the flash types will be made at runtime
if possible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 5 ++++-
 include/linux/mtd/spi-nor.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3d9f3698fb7b..d528e28995c6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3208,7 +3208,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* Configure OTP parameters and ops */
 	spi_nor_otp_init(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
+	if (!nor->name)
+		nor->name = info->name;
+
+	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
 			(long long)mtd->size >> 10);
 
 	dev_dbg(dev,
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f67457748ed8..bd92acdd1899 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -369,6 +369,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
+ * @name:		used to point to correct name in case of ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @page_size:		the page size of the SPI NOR
@@ -399,6 +400,7 @@ struct spi_nor {
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
+	const char *name;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u32			page_size;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
