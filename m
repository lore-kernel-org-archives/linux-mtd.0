Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587ADC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111B860FED
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 07:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 111B860FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1TQ6lM5AyA4FIJ4ikMLYD1VPaG+CcNW0kRvzhNg6eI=; b=P/RoD1bYc/wOkk
	raxfbehaXVM/JIZow6bI9DasScpcXcq5n882oRAoZRJ4oz2wffMWrBXWdxfBTL3s1boS80KL3WAcL
	k5tC21kCzFBhr2GFIHz1hTGaD9LigzsWGm8/2cDBpLhjFA4J+hNHz5P7WLJQCEXePhJ2pg8kIo2LS
	o+Z6zo4DXqxT5G6DTM8rxa2/R2ai0SVfnPILL1oQsKF3lP26xeKzFNZSLAwawlkEjfmYhZuWnAXq5
	YOQ5QDfkuUv9zNVh13EfOioEorvf4IuCWA/O8ILsMnqPBhYnGtkH6OBb8hDkhdn8MrP241lAMgDSQ
	1nGhvP7iUsWz5VjUrzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjGZK-00Cm9U-8n; Sat, 06 Nov 2021 07:56:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjGYt-00Cm5O-H4
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 07:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636185387; x=1667721387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0xOFI5hWEaSGWdQ9gbww3MKKBqKAcuVlKz7F+BR/5w=;
 b=kxqSijgSNzv3i+js+HlU4KKKLxKy0iHG/Y+APwG+/HRf3yilLMML4flM
 i1Mn8SPHIVXp8aGZmyOllFQ03XTyyTmg8ShtTIcZQgbrwWKETeaxkEO5I
 b1W1WG96xJFn6Y3joJC30ZqWOsGxlQk8w41w2zSuqDMLvMPRhIcztDuxQ
 42UKwShKqk+3RyNBolleMgxqXzI3CpjS8qzhdDz+2Gl9LBYuGxlyUKmmE
 EJC9dIq5MGrm77ENw+OF1uA/NBAhOxLxS35xuqoO77yBa4WUdxJcQI8tb
 23RxKl8IMey8Hm+i2Xse3cWXS3+xQxn/YFOHKjZ31XnzmCIvINlkG0KjG A==;
IronPort-SDR: ReHRl7xzAO8h4Ryc8j9cyHjItTcWzxpyiOTXoxMee2dcR4DlW65YwV1K/XtRaz/RX+C1w1B0gC
 wQdNZrdrVdaXwlAiwLPXaoaEM7DNtsX1EJmbnJ+Thm1z0whRC68xtV7vKun9Xbn0FMERMKxiBh
 qfGv4wrWmJIa0hUBh2OvmToRzMx3+Gq6kC7jKdENw54OYb+ZzcqnoNCI9fWGIfoZSldfz+hU2m
 8bqsILpfcYXQNRrcdf08pMiLCbUt+sZ8xODdGNxlok3202c9FlJSzBQJSeHI+0A1yAm4VxMjbE
 tAg4aA2vmKrzNg4R90YY2gK+
X-IronPort-AV: E=Sophos;i="5.87,213,1631602800"; d="scan'208";a="138225306"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 00:56:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 00:56:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 00:56:23 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Alexander.Stein@tq-group.com>, <michael@walle.cc>, <p.yadav@ti.com>,
 <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is
 set
Date: Sat, 6 Nov 2021 09:56:16 +0200
Message-ID: <20211106075616.95401-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106075616.95401-1-tudor.ambarus@microchip.com>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_005627_652283_C1295370 
X-CRM114-Status: GOOD (  10.40  )
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

SPI_NOR_NO_ERASE is used either by F-RAMs, or MRAMs, or EEPROMs,
neither of which supports SFDP, so once SPI_NOR_NO_ERASE is set,
SFDP can not undo it. These type of flashes should be moved out of
the SPI NOR core anyway, so don't complicate things and just skip
the erase logic when SPI_NOR_NO_ERASE is set. Normally SPI NOR core
should operate just on SNOR_F flags, but since SPI_NOR_NO_ERASE
should be removed, don't bother with extra code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a1b5d5432f41..52c82d943499 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2680,6 +2680,9 @@ static void spi_nor_skip_sfdp_init_params(struct spi_nor *nor)
 					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
 	}
 
+	if (info_flags & SPI_NOR_NO_ERASE)
+		return;
+
 	/*
 	 * Sector Erase settings. Sort Erase Types in ascending order, with the
 	 * smallest erase size starting at BIT(0).
@@ -3195,12 +3198,13 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 		mtd->name = dev_name(dev);
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_CAP_NORFLASH;
-	if (nor->info->flags & SPI_NOR_NO_ERASE)
+	if (nor->info->flags & SPI_NOR_NO_ERASE) {
+		mtd->_erase = spi_nor_erase;
 		mtd->flags |= MTD_NO_ERASE;
+	}
 	mtd->writesize = nor->params->writesize;
 	mtd->writebufsize = nor->params->page_size;
 	mtd->size = nor->params->size;
-	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 	/* Might be already set by some SST flashes. */
 	if (!mtd->_write)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
