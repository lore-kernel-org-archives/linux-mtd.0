Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B12AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADg0VD/91RQ3fR1OjFLWIg/enGy9Rc8Mr4emwVrVRE4=; b=s3nG/7p1NQHCuj
	cVB8z0HyL45pgqEM/lP2mVO3YI8chyZ7tzqOXHzQqBmpyUDN8ygcuX9o7NOI+BQDvVqTldhQaN2qC
	Sh1sqbVqpDYsNqWw10n6mb67Tb0I2td+pZ1pj+EXhlTQPPS0dr9IxVJf8epYkHEtreI9/qFpssIgZ
	DwnbAwTraBuRzQPFEPan2WVAO/KR1mHHVDoQ9K2/PN5rXLNde1PnkcH+HPNNQXEqxH/kMiRCOiQ4S
	d9WcWokK4L+ed+ecOWO0T5k2EV1JFrp9QWakLbBjQSE0UrlIIIUEorzh9KFBhejTuuK7V8QqytujB
	9K11hLPijoZvYcclpbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9wm-00GFp5-HB; Fri, 03 Dec 2021 14:54:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Tr-00G8Bg-94; Fri, 03 Dec 2021 14:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541446; x=1670077446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/rKmhm8LIfkfNMkVdI89byIg2OOSd0s5SWzBmsiYK4=;
 b=jxvFosZCIdEj083RY8gLSLA/aG/Rozv1z4YBcz8dNFf1IK9vHLlrgmzV
 yU1Ib73mtawvwDhvr1D+9XfAxbi9P+KyGdV+hhcoGZ/sXGXl2oKYY+Qea
 iweMojoPGKHZrd2bDscTKQfNmk2S1sF90Qixdv+XqNb8V6QvUDNIjk/Zi
 FMxMESpiQG6P38mUDz3US/6ushWTQouk0uT7F8EkJdI0bamq8gKkoQtjQ
 JOWZkN1l9bSTycC4AFMKwi+bXe7ZvJj8cfhRWL0hBAelPNmrXV07iJOor
 4JaZ9epFx85s/wS4Hr649ySRskU8Mr6nyL+YRFGqkEpBlyNSzSrAkaSun w==;
IronPort-SDR: 0dqlgqjRbADzYM0tgc5k467bkKARDoQg2wXOC3xLcvLo+NvDXsIW3gdKhnZQVt2EzWvHvNtx5h
 UbvJohVo50g/B2jqrrzJkkRSIswpRgrmiGGn7rnRGD25Mr5J+i0//59yLU4fMGOj6mOCb4qLuF
 r85+SeeLeEpO1xb1EOM+geBQ7NlKp18q2LO/6XmKeRjePiqAVR4agriSwVqlMm/MejmWffK46Q
 m+KcdoBGRxn4LFDVRGwoLLSEPKC9ES9fuxJ6O+Jtsiwgx4Gs749nakMndXqk7YrGDD8vnPo4yW
 1JbUYhdWWLBqijSg5RVOmfmm
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="138583141"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:24:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:24:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:58 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 13/14] mtd: spi-nor: gigadevice: gd25q256: Init flash based
 on SFDP
Date: Fri, 3 Dec 2021 16:22:55 +0200
Message-ID: <20211203142256.47370-14-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062407_444543_A9D58C7B 
X-CRM114-Status: GOOD (  10.02  )
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
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
0x34.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 94634797fdd6..e9817233c51f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -53,9 +53,8 @@ static const struct flash_info gigadevice_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			       SPI_NOR_TB_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
