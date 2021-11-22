Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57677C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Llhueo/P/DJ7VcQBNiDZ245fygIIL8RPORHL6iuZj7I=; b=YcjgSivtVOkI99
	+7DMrNynQ3c2kZOpGBKIYeLOCz1HBoK9XKmqPuAhX9A76Z/BA2f6MBusHCPXt7hwSKC7Y8J2KCJz0
	6jO6r2Fiw4rbN3p3J87nWYDmDaY1GAP2/IpOOimguvkemLt2SFziUXNxRfR0BnbCglU8K1V9STvcy
	tM/a76DSfTkSVcJ4+Ayc2tUrYY1JykbNRgUcALN8f3+c7mHjcRqR/DhZaAClq71QpvGITQFGgsQO1
	aVtCnfTHKrt66xfkT59LT4rFAOCZP3NUdECcyCQ/zajB9J+98lVGg0MRI6joBuhmmWh3aCpf3PNtc
	5CJRR8Oa4uMRZdlqywaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6jH-00FslL-Fe; Mon, 22 Nov 2021 10:39:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yq-00Fh2l-Ts; Mon, 22 Nov 2021 09:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574680; x=1669110680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=98203Q+DVa/SbI5j8L8iDCVa6RLBmSypZmYZ/7G00WM=;
 b=DU8H/E/qaEiYXPO0IF1p2M8l/lJWn6d+Lv2jC8VLRCINC+QzaFz3WPno
 1cM2R48VRICqg1CoDfbVcm+aUWhENqYDL14SRoRKNnULB12U3RirOjt0O
 FKkVcpVibpagpcWQnntcirChigGi44U5QURqNMRayGGbqIN39BwEC3pri
 +WgrrtX/5uXRz7qxalVHXN00VvZEJ3A2pJ+H/VQ0eDVyORk4RNKTONIbk
 oFTUfxeLD3hvWDO1PL6tKMSokZL1TxM90Swlev/usnDLHVWMywo0Kj1wu
 4VGj/mV8ojHxPMgYoc+MBZCSl6yemR2VLgnq2tOxIn4TBC3Ze5v10vTVb g==;
IronPort-SDR: NSvwKrUdZmzrIo4ZHS3sM3bIHU8vka6n+MpFWRqFEVHipqFIdWrFH3Zt9B0mGQy+U2FM3Nqkud
 yJeApH7mR0k0X+UtPt1S7FXJesNaWn8RVxkZA0yhIRgbregOEB4fcXUpNqmYAWzN8+pW72s979
 jClCuIc9cfUUWyZBfvSm0isc3WGWBtY0kfFnRtGLMvK9qTnItg9siMLefmkPMGlGRgj8UaFC7+
 fY2vkHvTFOTdFELVK17Uf9+gitA0OeeR+eJp+9XH5nTRRJZ/2MYQ79WVNX+IONQEVc7uWZ+/My
 Z8aM8b5KVnqAdE8IkWy+LzsJ
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="77169767"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:19 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:51:14 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 10/13] mtd: spi-nor: winbond: w25q256jvm: Init flash based
 on SFDP
Date: Mon, 22 Nov 2021 11:50:17 +0200
Message-ID: <20211122095020.393346-11-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015121_104937_62B6F5AD 
X-CRM114-Status: GOOD (  10.05  )
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v4: use new flag macros

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
ef7019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
winbond
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
w25q256jvm
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-w25q256jvm

xxd -p sfdp-w25q256jvm
53464450050100ff00050110800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff0f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14d3e96376337a757a75
f7a2d55c19f74dffe970f9a5

sha1sum sfdp-w25q256jvm
1d9f526670a97553a648567e051e8f7723f7a73a  sfdp-w25q256jvm

 drivers/mtd/spi-nor/winbond.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 421509406368..a7573df0a62d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -117,8 +117,7 @@ static const struct flash_info winbond_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
