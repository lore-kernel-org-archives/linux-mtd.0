Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E85AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A7160FF2
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5A7160FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2W9X30LCZsOSEgkspxukVSUlEcQqV7+f8lw/JMzE6JI=; b=JfiojT0+039Qvm
	7R/1/SyHeQ134JgmwEcuHucfy+cVqCYmBuMl1fif4YL3ihjhxEQyDCgEoLgDIo9aWLnumIuoc/ouQ
	VQVhAAx9M5+0E5nhMgn5jxI7K0v1/mZIiJLTlAmVzkC5DNAU70p6WRWRpr9NidXSjr5MgZ/jY3PuC
	D12zM73bxPGYOqd3HQgrIlBVbWnsFqYmk6NeHoKTbCqQ+9ohJGsFwVtYi/18DK5uAUOIgh2L8Xz0I
	+TPthkyQYb0eH41URMotcf3vXyY+DIYzI4f2yUIGMxcUKBd+ChdNZP7OLo55owQIwPx+pLPpCwV0U
	bBtfZctMaVJbIxY4YL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVlu-00BbPc-VA; Fri, 29 Oct 2021 17:34:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVf0-00BZAg-9Z; Fri, 29 Oct 2021 17:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528441; x=1667064441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bQ1EUefahDw+rLciX6TmonvZ2Xb9mgZn9ccAocEqiAQ=;
 b=Pm/v/AXMM8nQCETDN2vBZPnRS2NKkhR+o1x0VcCLIVsixib8F9OeINJq
 ewmyXA9YgO5l2JvRXELqXiDeRAGoxDC9KlrMB7lvr8YCtjEJGe3Lhb4Xa
 WvxlOJaUQzyCwdEy0bjMUVK5Fm6JEL9MWOEUzRGOpe/iXN3VR9+r2lqk/
 QPjumiM0ewfo+oHU19AfdObr0aJCaTFQ4R+c1mxrpCebcG6Vx7DDAYrrK
 4HG1eZwVUM9+zwOs4QEoSOlzG+h5KtZ4yC1PKr0XXAtmNpp03GgCW7PCj
 uTv8zpL3VmVWenbT0Zyx+dkhbPHjaNYdYBvna2W5GK3LBGOlW9i5Twogz g==;
IronPort-SDR: kUCK6LATRfnqJxaLRcGWINbG6WQuOUk51sSwrfSjXCrTjtXwcvq9rBsww81qbauK3DnXvuCSG1
 D9P/KjPSNZFd9HQSB5j9JYxk+ACV5mLEU3en77Z/HiR25sLg9WjChdR0bw1AkCPJNewAbJT1aS
 CpRlQKvURoFxN/9FFwJ69wtV4Sop8b1ubijPF6wLGcUDdP0jnaskdhZQkfb6cxXXOIRuIYX1fm
 mrXDwHuhzBf6e2nMd4P6TjfWDTqrabWnSP63+vyQSekIVpET/lx2fCezMjA7PTjyCDdLbMxlou
 wltdGhyc1qjtOkYXbEyo+QUk
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183476"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:10 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 06/25] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Date: Fri, 29 Oct 2021 20:26:14 +0300
Message-ID: <20211029172633.886453-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102722_369768_D209B89C 
X-CRM114-Status: UNSURE (   8.43  )
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

Locking is not described in JESD216 SFDP standard, place the
locking init in late_init().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/atmel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 1fea5cab492c..d0e7883b38e3 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -48,13 +48,13 @@ static const struct spi_nor_locking_ops atmel_at25fs_locking_ops = {
 	.is_locked = atmel_at25fs_is_locked,
 };
 
-static void atmel_at25fs_default_init(struct spi_nor *nor)
+static void atmel_at25fs_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_at25fs_locking_ops;
 }
 
 static const struct spi_nor_fixups atmel_at25fs_fixups = {
-	.default_init = atmel_at25fs_default_init,
+	.late_init = atmel_at25fs_late_init,
 };
 
 /**
@@ -146,13 +146,13 @@ static const struct spi_nor_locking_ops atmel_global_protection_ops = {
 	.is_locked = atmel_is_global_protected,
 };
 
-static void atmel_global_protection_default_init(struct spi_nor *nor)
+static void atmel_global_protection_late_init(struct spi_nor *nor)
 {
 	nor->params->locking_ops = &atmel_global_protection_ops;
 }
 
 static const struct spi_nor_fixups atmel_global_protection_fixups = {
-	.default_init = atmel_global_protection_default_init,
+	.late_init = atmel_global_protection_late_init,
 };
 
 static const struct flash_info atmel_parts[] = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
