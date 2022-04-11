Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512BFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD7iDzQk58boYvbLhoY4w9EMJHsFv+aMpS5GHzE+Whg=; b=zrIUQcuKZNdHdv
	MnAABEyJhPFAjesxOSBUkMEb3z3IaMrBTYK9W0m9gbsZwnE7Fd+w3fkas68iC/BDQ6uFMXlZeinTt
	H6D81HmaDkUS8yCYo8PxZzoMSlHVWkPSmwUcU4AMeP1TDGZICWM2B60Nolao3pM17q2M3ah2CVBtT
	jNREkvTJ5I1FQgqiuMbhro4myyRSut+s154Z2nsrtQ2rnuJ7z66pt13qsHpC8cH20DfeYKpzw57iq
	Q11weSQxgF08+SskrZWF/TiHT1XBoosXh7c7mBxTu1TcEyAobXMTZ7vUyd/PeiEp2YFe2YCDOgvlT
	UzS55Uu07Tfo3K7JPyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq6u-007oXQ-I6; Mon, 11 Apr 2022 09:13:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq4I-007n14-4E
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649668242; x=1681204242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idY7s0WCRZPb+aPMzGwgPQXPNOVLICQyDJA9JTrEoe0=;
 b=GnhA2M8J1Nl0xoW2HOTJU50Iq/Gr6cbY7HjaoFqiOxwKqbBKWJ+BaHeC
 FFaJnFg95L14mFNrUwtxlIYlp8bJDUw/yaJk+BkHthbHRGHzPr9fnXzmu
 o3QCd4ymewKqKg0EAhTw1lYgAre3KPm55lyVJZJ0KL0QPhuY20nGYz0D/
 Uv4cAoy3BUBmZDfW1lFAUOwI/pSi87aHhMLARykKnMAPIZaWf2TSTlBqh
 U7iRS+bU7Qk2rZFXYF9k+nMPIPl61FxWwKX674riOjw7weAdLngYEn9Xj
 0tyMcBOtHEunBgB0NTz5RjF/9J2bET1xvJjctyTnTc8rGTsVWkOPJUXwo Q==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="160048708"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:10:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:10:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 02:10:38 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v3 1/9] mtd: spi-nor: Rename method,
 s/spi_nor_match_id/spi_nor_match_name
Date: Mon, 11 Apr 2022 12:10:25 +0300
Message-ID: <20220411091033.98754-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411091033.98754-1-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_021042_210198_5761F52D 
X-CRM114-Status: UNSURE (   8.69  )
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

The method is matching a flash_info entry by searching by name. Rename
the method for better clarity.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
v3: collect R-bs

 drivers/mtd/spi-nor/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b4f141ad9c9c..214d3a1ac6b0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2876,8 +2876,8 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
-						 const char *name)
+static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
+						   const char *name)
 {
 	unsigned int i, j;
 
@@ -2899,7 +2899,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	const struct flash_info *info = NULL;
 
 	if (name)
-		info = spi_nor_match_id(nor, name);
+		info = spi_nor_match_name(nor, name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
 		info = spi_nor_read_id(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
