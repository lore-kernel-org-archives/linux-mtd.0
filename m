Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B56C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYUBZ5f81+m4QezDqOTuoRFwgJLoJCpuG0jJlqG2AZA=; b=sszJ1+Xa0PYROr
	MwoT+dnFllg/od7j7s8jUh7kp03ot5ocTYlUmpm2/CtFb8cepNKuF8mAcqpMwTFHH6rBpK54k1twz
	WbcY+Bz+lK8nAh+u4uk3ZXF3SlpAWiwXoAYhhInmZQUGuAxA2Knw+wPvg3MTUJH8+PGBAee6FuDex
	6tVN/yK39V6lLw63HaYWCWA3ktW2TbA2G6G/2EJ2gqMuKSJuU0PpMnQxWB6yUXRHxJK1RLfcttWrd
	cYcAB+0nLLMq0EPaldhonay9FPifX2SSd3upPNihgh+3KzCA5ijsAhVkMjBLcHb8OvkyLs3q/3Ksv
	GNe005VuBJ8aZW7kBv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgQf-00CglU-5U; Mon, 28 Feb 2022 13:51:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgLN-00Cefj-LQ; Mon, 28 Feb 2022 13:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055941; x=1677591941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uh6n1H0rQZDj/XVLiHcHjDe8r47+9/28l+o2v37pSs=;
 b=0sDhWAIdXo89bwor00Ai1NHZdKKUi00L3kiSnLqBRVtvpKh6mhdblzhg
 0W2yKk+SJedjrMhcFTqsZOe2sCaWm1luHNNDKb8F6zA5yfay2JSKryoTF
 rXwRw4GjISLQW6Sk8hMrJikfDwqZN7BLXYMJ8VNs3yMzQmUSMBTF/MWPD
 WY7OFWAuJ+H4XUi97bKCWvpZ9qCLBHUgfwG2bgj9uzFj9cFD/Oehgfois
 RbxgAPuXCNpTRvBNRvanCIlX983rSL7QbweMqbeoCCwnCV+50PViz/yP6
 ULCX5zyHQS+FiLDUaaqIKntZQ080xNHhudsVVJuIXGebKM7z+VVa1iRBB w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="147499224"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:38 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:34 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Date: Mon, 28 Feb 2022 15:45:05 +0200
Message-ID: <20220228134505.203270-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054541_831076_B7D95D5F 
X-CRM114-Status: UNSURE (   9.09  )
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

Flash does not support continuation codes and may collide with a flash
of other manufacturer, Intersil being an example. Add support for
xt25f128b.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2700 f99f 6477 e8d9 ffff

 drivers/mtd/spi-nor/manuf-id-collisions.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index 75c5ad6480ee..0447e245f4b1 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -17,6 +17,15 @@ static const struct spi_nor_fixups boya_nor_fixups = {
 	.late_init = boya_nor_late_init,
 };
 
+static void xtx_nor_late_init(struct spi_nor *nor)
+{
+	nor->manufacturer_name = "xtx";
+}
+
+static const struct spi_nor_fixups xtx_nor_fixups = {
+	.late_init = xtx_nor_late_init,
+};
+
 static const struct flash_info id_collision_parts[] = {
 	/* Boya */
 	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256)
@@ -24,6 +33,11 @@ static const struct flash_info id_collision_parts[] = {
 		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ)
 		.fixups = &boya_nor_fixups },
+
+	/* XTX (XTX Technology Limited) */
+	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256)
+		PARSE_SFDP
+		.fixups = &xtx_nor_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
