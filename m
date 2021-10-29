Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334A6C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E937B610A0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E937B610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EvVEvP4kfOjawuHvmIxtFZGaPeKVq/0TDMJFX8wRoE=; b=noLJUI4tWaoHu1
	7QTB7CsL6uOYNnYqNItEpH6j5nYkz4D3i/mLu0HW+CfeUv3w5EBwbU5V7lLYYRJVQY+3oGUk7pRbm
	6nVwl8I/i4/ffoFF48M5ww8YHXBfmyIEwwHQ/fmt2Y8m7zArtdnJ2+Nd7qX8LJpjEbaqjeMPUe22D
	L8e1cbXxy7q9+x+L3p8d4Kc6xaWVOxBQwS+lkJ4tyBY7z7My5lG33ai9pOdDGR71FAzYhvQu6SShT
	UIWr45sPOmepbRbeTmiEbg65YGCOqUfY0lhidGWZJ8waqLchxiP8GujQS6IrRr8Bx9J6bwMK/N2Rc
	n+uXA+md+or+R0dAcUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVxS-00Be3s-KY; Fri, 29 Oct 2021 17:46:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfD-00BZFH-Es; Fri, 29 Oct 2021 17:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528455; x=1667064455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YdE+SgbfKpFNhWbzxp0lJU6yqY1YopFvEPZOalaIgQ=;
 b=IEymfV94LD9p239NPOQgDepudHioaANMUQ3FAxucrC7UrcA5cyrjcSSS
 gLg9fWxUM9uq8Q74NjdtfkFUv015fB9xMtRVyanA/vOkaE8nMG+f5DAI4
 +/9I3vJQQMKvec16pbTSY6biX/EhKIlIF5XsEKMpboW6gU+rneMajqKkU
 Fq2iZDB7rr3cmkkcqnxn6xNPeTk6d9M2x2baEXLytlywgAhIJd8m0oZo5
 TVKdE4DsgydC2HoMq2JXi4F82G2BXyRrOTrjnOQcEceSGSBcek4T7KLK9
 I4xYbnpS650zK9wKUero1D+PK7Db8pL+dgb+HV55uqnGKbG0zIAt6yrKd w==;
IronPort-SDR: TVM2A+KP9Ck1UjFB6QB4YfeVlLkC57D1sI3XOJVwod4BDDZmscM/VZkXddu0qFZK81iMy3QKC5
 1amgEXnLyKoUxLOEoTBoR8NWTBvKHvJn0929QAJTy7nLUNWanDc1pB10o/fOc98zB+mo1iuHRk
 9cerz/Fqdjk3cdGmKUTsXQAexg6MaNq0C0Iv607riDsPho8Pko3oCDN5iHJfu1U4INrIoXlWDZ
 49BUnddbgMITn4EWHl1jL4cGGg+5NMJTuTDyqwjfB+SJo1EhN0iP3tExDvvbmAremTdlrttFw9
 MwBvMJn8yQ1lMIzoN0G27HdX
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063392"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init() to
 set _write()
Date: Fri, 29 Oct 2021 20:26:18 +0300
Message-ID: <20211029172633.886453-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102735_568463_D1D84B52 
X-CRM114-Status: GOOD (  11.85  )
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

Setting the correct nor->mtd._write in a fixup hook was misleading,
since this is not a fixup, just a specific setting for SST, that differs
from the SPI NOR core default init.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sst.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 660aabde477a..3593aae0920f 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -177,14 +177,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-static void sst_post_sfdp_fixups(struct spi_nor *nor)
+static void sst_late_init(struct spi_nor *nor)
 {
 	if (nor->info->flags & SST_WRITE)
 		nor->mtd._write = sst_write;
 }
 
 static const struct spi_nor_fixups sst_fixups = {
-	.post_sfdp = sst_post_sfdp_fixups,
+	.late_init = sst_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_sst = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
