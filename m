Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bw1nlK0/tOWG0FqehCT/vU5GXeaxMAirFCfiFJ5iOMc=; b=gkqArZbF8yz87R
	wHp7XUdP7dLQpfeC4geLHKN/2Gzzhr8+iIHTTpZXeMrGnBvkjg85yIohZz75BKrMX3H1AMjIfXm5O
	DZpXz0CKwWAUE8zcEgkizt05j20nJpAoEy0ktPWnEKgjFQXPAHTgS0pptw62Osa+3l34YyfwWRyH4
	/3cnX4hNB2yNMdQBM+la1ah8QeGf0mdgG3HuvsAIEebfZY1KTzOwhM68rXQYoyX/zW/VzrmaiHmMX
	5kDn8EaYA3NK3DGPq4AYINGK5cBtJfRjEf0TU0p4GZHC18TFIPC1QlonbQhtxm8S3Fb6AXNFor/oZ
	kGrTcXCnp/dgwQ9THblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubcs-008yU2-Fg; Tue, 07 Dec 2021 14:39:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub4i-008pKO-H3; Tue, 07 Dec 2021 14:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885848; x=1670421848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PfEMjuaNYak8oHmNLUvt1/7XZF/tdDnmQDJdSDhk9Hs=;
 b=Ebilv34/MZXfgq00h73UFVeGW0QnYJGJWT7dYnDKub4xdaxUg+7aDDAT
 hxO+H8SVYwRHOhXSPVBsPCps204H4xMqMtzouVI0nFBrXEocqT7uBoSzM
 BewTkRWOfxpKWLkZ50YazwHX1TZMhJD5pdLhb20bQhZUXAy6A+2Q3uzhI
 x4xnzO/NsfbN5lisq4J7NMZaC9EB+/mWDNUzzyyVFWvSv9RkjlnXCYyiQ
 btLmvdbqXGryhDDysz/ZAK1wvqG0ZIdgj/T1RBJPIw14L/UH+j58halWE
 zn6CkIp7wEKgIZ3YBTUglfG0filnGPVVzKSGCthpVCmyJCezCzE808ZbM g==;
IronPort-SDR: u27Xo6UYqakt8xAj8VB0FsB2gXox0PUl6JRYpZ6iCvfCSZw2SzGB8obXqEMGZ9JaIgBFarAvHu
 Jqf3Ui9oTz9vaF5LmvlwR6kiyWPY6cy0W1cRXWTKgD8bB5bZUS8vt/HU/u0pApyX3nO9RsOlPM
 Gs6DHEY67bG8kso3NB91rj3GCHjqlHwR3nYBIGUzPscjlA36v7LBmi48OAGnUZf8sJxwx1LILH
 lF+wUzifnVNaGr1i6x8+sVon1X/QI8b3WqJBraqotXhdSFetcUpTqRvde6RyfnshD4ZfYcEQr/
 Kry09b7J6lbfgPzemt5xvYlW
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="146381876"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:04:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:04:07 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:04:02 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 13/14] mtd: spi-nor: gigadevice: gd25q256: Init flash based
 on SFDP
Date: Tue, 7 Dec 2021 16:02:53 +0200
Message-ID: <20211207140254.87681-14-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060408_624552_2D168E59 
X-CRM114-Status: GOOD (  10.77  )
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
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c84019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
gigadevice
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname    
gd25q256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > gd25q256-sfdp

xxd -p sfdp-gd25q256
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
083b42bbeeffffffffff00ffffff00ff0c200f5210d800ff4262c9fe82e9
1458ec6006337a757a7504bdd55c0006440008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff003600279cf9
7764fccb58e3ffffffffffffffffffffffffffffffffffffffffffffffff

sha1sum sfdp-gd25q256
9f25eb3b17832b26dbba288f1b07de1f8a42e446  sfdp-gd25q256

 drivers/mtd/spi-nor/gigadevice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 0c32e029b975..e9817233c51f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -53,8 +53,8 @@ static const struct flash_info gigadevice_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
+		PARSE_SFDP
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
