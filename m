Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7180C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85383610D0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85383610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7M18Jz0G6qe2/qQDUjQXGzXdATULGfa9u9kmflv3xw=; b=AungE6jbVBhhXj
	GcrONhckIPdLf55ugv7XN012TkwbsP8Noi4EBLI8K+Spf9wCf87tw09zyH+oZ374bDI7glq56VfeX
	c5ulb0MHNO9HF3LnHGQP1TIMc/u3VquAZR/DDu0Gz8FAgXsCDBu4Sg4Y5Zuin2SdADiyfEbQAYzzO
	DNpIN4tVjn/PdCEnvDGX41FHH2bxTSrztEfjHliMKdger0rF0nJBX+5YkIhQbj4hqGeTRpFdPlp7h
	CGDGS+lRsvmIo8CxpBBS5mJ1dKgsOmSOhKD2y41tpA5wCpK88SEpWBTnvxgST7nS+NFz6CAKXSeKv
	mwk163mNTOmYxHxnrAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FcW-00DQEf-BO; Tue, 27 Jul 2021 05:27:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F61-00DHdT-5U; Tue, 27 Jul 2021 04:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361617; x=1658897617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSuRmV8kupJ1GFmuO0CIaIgArMhoyaX7b2kfMAny4uw=;
 b=a+oAGr4wBuZ4h5OGmu6YbBwtdL43CxZrg0Hsh8KRIQcGdTKAl8fakYR+
 cwnNxZD/ABf2ztmLHtwz9a4U3TxwPh9+ctBKua8vP9VPo/vXchY/wJXvy
 hyz6O2JHx36ItQWHbPfTlO0T52YgYf66wSXARRyuKoRbdKj76OgdydfIJ
 hYFXEDbu/nnTGFsIwHf5w0GZCYkQEJdye/gF7riwdLc4SMAebtQqa0nZC
 rKcfCm1qqmhsKkpA1CjGnGhkslQwbphXdteCaNWqjcIAmROkNRaWdh9aZ
 aKOg49AI7UKmyUHEn3BWlm5qjbIz2RN7pNAZyoNFiIv+KJU3QkopJeVM2 A==;
IronPort-SDR: 3yEOlbzqoXx0spaVogL6EFIyMtXIlGqU9SRlDjBQlNbbuAnh7ZlKJDa6Z/7dzMHy3jSKNtXmNz
 Pif+h3qJ+hhRLQ1Mnw/KYKvlMWvvFqO4TKk/ZeKRA7uzoZuU64YW1Fw+bf58hVpx9WWaKgI/X7
 athk7mIQh1r+D+q8TfD9M+4dzp1OloZvgi5uEEupe6u/9VQMj0lqju1M2gaQQumH6vgIUI7ah/
 JVny5HW7DInCC+HGLaqQcdYD8KyxFvHpX0/F5lMU6nRIOu3B0RLA2maEYI0TisFzpjQmeegvfw
 Sy4Q+8XQUcvzRp28ZuOFYEeH
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137653981"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:31 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 13/35] mtd: spi-nor: sst: Use manufacturer late_init() to
 set _write()
Date: Tue, 27 Jul 2021 07:52:00 +0300
Message-ID: <20210727045222.905056-14-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215337_277872_E3C292E2 
X-CRM114-Status: GOOD (  11.46  )
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

Setting the correct nor->mtd._write in a fixup hook was misleading,
since this is not a fixup, just a specific setting for SST, that differs
from the SPI NOR core default init.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sst.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 29d100febdbf..eeb10766b70e 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -173,19 +173,15 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_post_sfdp_fixups(struct spi_nor *nor)
+static void sst_late_init(struct spi_nor *nor)
 {
 	if (nor->info->flags & SST_WRITE)
 		nor->mtd._write = sst_write;
 }
 
-static const struct spi_nor_fixups sst_fixups = {
-	.post_sfdp = sst_post_sfdp_fixups,
-};
-
 const struct spi_nor_manufacturer spi_nor_sst = {
 	.name = "sst",
 	.parts = sst_parts,
 	.nparts = ARRAY_SIZE(sst_parts),
-	.fixups = &sst_fixups,
+	.late_init = sst_late_init,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
