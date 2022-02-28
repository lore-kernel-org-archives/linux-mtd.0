Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F13C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFm50Bvuc9hond9Bhp0Ddw/SyW4x+iS/CUzkjRLfvtc=; b=g3j7yvERFGy4hQ
	TdQbym5jbL+AzBf0dQ31LHCJj5DP6wrPflP2RCkEAtCMPrKAaLKOacJicy+Em0hGeA4wTLaz5QcgZ
	3LqWIGubFs9O7C9x2WrCVLTrOnwI3FHRc1LO3fCkHpN3az5ULqtowzoOM6SpEBh4Cbn8Cx2rKOF1o
	UuZf9vnmzhetEDcOODQd9hXKoX01AI1tgNCBe+Tat4+1Qr7UguO2Vy5mANQBiklMUjhGsiPOuS8iw
	2soZFzaZRHAJ/BGkovN7xW4kvQVmhcA5nClt9SdXGwiu+wMAIH/1wG7lzEF3cGBKOCxRSJKRYuBMP
	DSONTQ0u0uy5R4vZ3oHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgNq-00Cfiv-OP; Mon, 28 Feb 2022 13:48:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgLD-00Cec7-DZ; Mon, 28 Feb 2022 13:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055931; x=1677591931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gccul47yRy9Y9vzsi27KwhQ7Bx4nV7g9umfHMvg/wOc=;
 b=2LgBUvg0BOl7eH67sfQ75BBsGTKHjO4kWtc1RJj818sLceUJTS/R9Rho
 s9ZjE9vQqDyfr2UN27j55EoyuJhNXC1lnwJ6sGhjTO5bpIZEmjdanySBk
 zrOLcrrM/6EtDBv2aHe+7touu26nJ8F0CzXWqmKTsezh5r8u+8BPFlrj4
 NsB9wZGOkguxFEJPQkvuJnOnc0tStEWxDa8v98fLRGG4xwPXiJHjMuNOL
 sOj8yfNumMt+B0sJoD/LyzQoecYtG8tnSew/P8KllMCfwmwNqstRmQJ9f
 EX3cgUPj4olz0/ZJuvxDT16xXedtynEESn6N1UHmRdnZ0TnN9S5QiJe9m g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="163872969"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:29 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 4/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
Date: Mon, 28 Feb 2022 15:45:03 +0200
Message-ID: <20220228134505.203270-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054531_504434_C08A3577 
X-CRM114-Status: GOOD (  11.03  )
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

Macronix has a bad habbit of reusing flash IDs. While MX25L12835F supports
RDSFDP opcode, MX25L12805D does not. Given that it is unlikely that RDSFDP
will cause any problems for the old MX25L12805D, differentiate between the
two flashes by parsing SFDP.

cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
.0/spi-nor/sfdp | xxd -p
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff

 drivers/mtd/spi-nor/macronix.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2754bbef3d2e..45c2f2c50e56 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -26,6 +26,24 @@ static const struct spi_nor_fixups mx25l3205d_fixups = {
 	.post_bfpt = mx25l3205d_post_bfpt_fixups,
 };
 
+static int mx25l12805d_post_bfpt_fixups(struct spi_nor *nor,
+				const struct sfdp_parameter_header *bfpt_header,
+				const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Macronix has a bad habit of reusing flash IDs: MX25L12835F collides
+	 * with MX25L12805D. MX25L12835F defines SFDP tables, while the older
+	 * variant does not.
+	 */
+	nor->name = "mx25l12835f";
+
+	return 0;
+}
+
+static const struct spi_nor_fixups mx25l12805d_fixups = {
+	.post_bfpt = mx25l12805d_post_bfpt_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -82,8 +100,11 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256)
+		/* ID collision with mx25l12835f. */
+		PARSE_SFDP
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
-		NO_SFDP_FLAGS(SECT_4K) },
+		NO_SFDP_FLAGS(SECT_4K)
+		.fixups = &mx25l12805d_fixups },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
