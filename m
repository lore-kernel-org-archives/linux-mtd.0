Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B040C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jOleDzFBFFtSZkowA7LnE/iMvLMx5f+jK/kRvMjO0Q=; b=zsotpEcwniyS+s
	dWGBG4F2XCq81P7Q8DUqcmaiAC2C0oWAbUx3CZtPsgIvj52p+snheIY4KDOUySvHRU4lUSr9SwO6I
	vxP+wstxZGeeovd34tiMW6MWzZkcEjIwCAarMC4ze7wGYjPFGp5+bsiXso89J4sRzLRJqFq2/jlCw
	rYlz3cPIfIEfnFnv2QyTRRgCNzd9wRTmJn/QG8MJCtHpliNFwno5cayU4TYrqxEwQ8gawbfod261s
	MIDJeL9oBOtdHdrPLtXrgnktwjHS+EIzvh9yzv6CC1YzcLokuQq55Z+fu+kQFeeSm5bi3RdI11r/W
	m8ZDZRKkHBjKxy8W0x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtA0a-00GGXH-Oi; Fri, 03 Dec 2021 14:57:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Tu-00G8Bg-H3; Fri, 03 Dec 2021 14:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541449; x=1670077449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9Yf/9dT8J63ijGSQqz9A4O66npyRd/xOLIf/lEjTes=;
 b=HEknyI8RhcpAJLrWkufH/IeitUObMaRm1kV4221Q51/HnEV/Zy7aSco4
 6hJCJIODUwBp3pNmXB2f+U2HhdoP+UOlOj3Jn4XKNcVIgrFa0NagCF9pD
 5bLFDLikdLdYBbHqeU1FkVYt5wjPmFGWT9FSXVOpt/qNmocuIdcyufWV7
 bJ3lgIziSNlncafhWwaCBbp/DYSXDNzT1N3dESqpHR+xNDec5RDsD9HAg
 3lOdPdz0tQKGlIQNwryOAW2h0YdIRAPJu0PSeD7UO/M2bcl0I4TX6+tM9
 zT9CMMFZeY68CD36kM7tiIyCp95sBh5Rc4ymGUxdNWIw3T0TXBIWuLDTU Q==;
IronPort-SDR: VZ0FX+4kLzDJqYE3VngS3qO2NycbcrNlAz5kGbGQFudbHLKG41wnnMg+kHapTFIPLuSLSRCvDc
 JRJxm3HMV9lerp/vJNrE8VqwP3/MZsqBF5PLkSMGlk7o3zG5mSR5B3bcy3sxRPsI2IHTQGwU9B
 BZmKnQeYgO07gpp8ySoh5sEv13RDZn0qkGQQKIdIsw8hjWT+EV6svIAd7gXrf0QORtVdaALqMg
 ayOhWnxrHPPpOZPBLazk7MjVG0HVlhjKBzCy+jYUr6QrR8etVy+osr30Gj3SXQPaVMjh0cvDKe
 wr08MZAU/BJULd4S4JR9hJy1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="138583157"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:24:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:24:07 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:24:03 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 14/14] mtd: spi-nor: issi: is25lp256: Init flash based on
 SFDP
Date: Fri, 3 Dec 2021 16:22:56 +0200
Message-ID: <20211203142256.47370-15-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062410_659735_F86A17BC 
X-CRM114-Status: GOOD (  10.62  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 6707fcfda055..c4fff3c36356 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -46,7 +46,7 @@ static const struct flash_info issi_parts[] = {
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
