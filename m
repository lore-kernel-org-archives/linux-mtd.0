Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3145CC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:24:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB20560E90
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 17:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB20560E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eJ6Ar0crcrWStN1awd+Da91JYe+CI3OX+G7iMe4HtI=; b=wxnMYTk1lFzgXz
	jkqXcEenfJUL+r3fOMZP2BoJmymVEQamLy9XqOwIRt7fedaJExdlG8ITJoRvqL1+FSaiKy87UHNbY
	vCtEo9pGNlUpXqN0ywyn08bEckMcGvptzSJFws7vFG8rKAdz5TkNRUt1s61q9SMv04bnp5FhQyj3A
	zvgZ0Mh1sG1rqylZxXPlIYE3laZi/fBPHSf5+2Hvt3owpg/Zkv5DhiCdQa/2UZmSYGtvA2tk0hNu2
	W7htCJ2341m/kLXi+24/W42RnzNAqL3cjz7qm4L0PX8yg2CC2rme93XkyT03LXHgmYpXalMrw5Me8
	js6kJEY8PM3PPS8zH7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjPQF-00DIbX-Au; Sat, 06 Nov 2021 17:24:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjOqX-00D8ZW-3C; Sat, 06 Nov 2021 16:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636217233; x=1667753233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ETzlqTmprmqCqeX+2ubiF0LzvkpGQHif9pQpJj+GjLw=;
 b=WNSW0EePewQKCCXyDdsw1r72oOWbXUcq1HpVOhKB1oQ6NZdw5/z28ytK
 SQ3aZnsJeBxLOdx0va6pdL7Sj8t172HYLpft9/B4Kz593JMv0k1M/wQTd
 kHU29kmxSKX91fJyv8mWL1MHfucel8GCSekZtMb5ocdSLCrPSLi4JR8T9
 Kb+ZBEWDOp0+Adq6Ay/C7Q2+FJe66h2gkklrkQ9qliCUWGO+m8Ime2NXy
 tb7zQzHXmzwH2rkTctynOCRe/ra/2dehKLmRrtl+7izTbVUCq2NPayosN
 OeEe3k7WgFmCexnVcToyiQ1kDRZS4SK68y9HcWDnPOuxyfiprw+eLPf6p g==;
IronPort-SDR: 3VIzx7d2vnnS7UVLUxSRyvzUS7X5GkzeR9NGqOhAkl0uEXrF21FUVfXVGwMhqF5HwY4lIMf2iT
 UgOhVeBjE/y5tKKB9RvQo1Yo0AYGSllNzFFZW5U+iLCjsMaBP9eyvmfLJiPmPXEM4MplMbUo0+
 dA7mO3ttcKBUnWC+ybjj+2/CjDPEQ/26FNFSViG9h3VjHGvmGyk9fSSHtV7GOujr99NyR3XRVG
 IDmE0f/GSwfgaxqBBjxZ7ZScTKroR71rC5dcpUHXRlL/LlMAWU6CCVGoeUOyt+dwYTITtJlydk
 lFu/PNsAZW2nIuEl7pC0oc/1
X-IronPort-AV: E=Sophos;i="5.87,214,1631602800"; d="scan'208";a="150948769"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2021 04:37:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 6 Nov 2021 04:37:27 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 6 Nov 2021 04:37:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 5/6] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Date: Sat, 6 Nov 2021 13:36:56 +0200
Message-ID: <20211106113657.172690-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106113657.172690-1-tudor.ambarus@microchip.com>
References: <20211106113657.172690-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_094713_189710_0AD99518 
X-CRM114-Status: UNSURE (   9.87  )
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

Flash does not support continuation codes and may collide with a flash
of other manufacturer, Intersil being an example.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2700 f99f 6477 e8d9 ffff

 drivers/mtd/spi-nor/manuf-id-collisions.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index 4dcdf98c3eec..7827cfc584df 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -17,12 +17,25 @@ static const struct spi_nor_fixups boya_fixups = {
 	.late_init = boya_late_init,
 };
 
+static void xtx_late_init(struct spi_nor *nor)
+{
+	nor->manufacturer_name = "xtx";
+}
+
+static const struct spi_nor_fixups xtx_fixups = {
+	.late_init = xtx_late_init,
+};
+
 static const struct flash_info id_collision_parts[] = {
 	/* Boya */
 	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		.fixups = &boya_fixups },
+
+	/* XTX (XTX Technology Limited) */
+	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP)
+		.fixups = &xtx_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
