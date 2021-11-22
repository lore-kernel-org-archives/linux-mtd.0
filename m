Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20rBuVJo5kANhQWHBgWLv7Cqk75FjBvxTmUxB8a6Zuk=; b=MyLzoRU9f0nJFZ
	S/MRw39v9WGWY8emJ9sWv3LHAcvDPIswc/yz4fubUxSde3ffekCkm7KhQtPEgJUXEwwTSdqOd8prn
	ruBvrOlTA1MoijqNJIrq/6JBlk1KFcy3qH6VRpv2+eQWTN5uVSWkaYUbzqpPUh3j/NsF2vjSU/Ztt
	PpfI007m8DFvKwrsFcT0wtB5A/1ZYthT0rY9UO++gDrFukN36v4veQ4rHPOWVztRARoO44Pq3KCo9
	UPktVsUe5euR0LecQ2atbvVK4vyXZRA6Q5mRlFjV0TRJdmOJ89LOoxsJg5V7LvUKPdKJuf+dSf3jl
	VnAPdS0Wgu5EHIEkBmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6qk-00FuRV-TY; Mon, 22 Nov 2021 10:47:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5z1-00Fh5e-SO; Mon, 22 Nov 2021 09:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574691; x=1669110691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNTfVhM/ESG1LI59bGrfDvVS/SmU0iEocfait6l4Hhc=;
 b=GqT6vOw/MsRJncxOpEmUwXmFM0h37OfX0X+wUQVp4UNXcW83rSn7D0nN
 5VEovDKCt1qS9D2flLsvwusdL6q3p8DSBXPH2x/bd6dGSoUuAaXuSWrhe
 coZbGAE1DmwsJTjhgCLi6RH6/4KiBc9pcWAzahwfSB9D7L869hLdB2V+r
 hkh4HOjMpjHFA7pCzdLhUGAeUvnJ1noNQxbX1SpuS02bOYztK/uHXG1F9
 ys02ZtPozOlyqd0SGMT0gCCBKqPpoKkIUUy8oAgtH3vJyzfFQFb1s4f4+
 2pN7JFyh4wlWpCgY4Dv5LZQliBtnx/Pm8rduYkCOqGxvySMrvnrh4a19c A==;
IronPort-SDR: AJkQeMawgIaunO86Vqq29jILesniWWsMIYsKyiUlJlED8ZgkyqRA0sLU+JxeQx/65gIY+OV1KF
 OhoZQTdtid0cIyY5ZbWoEhHWCF+2IQgY1v+ndfMfXXtJvFAMdQiWE42+/TnNx7SU3ZDLqY3Vo/
 OgFMUkYE/pWIjDEDY2PRguu8NL5GXUY9SCVnu84gEL8b6CCBz/SjE6ZSCc0lg3pcKB1d1N5juI
 wi+XBuxns9oyRE/AKcXjDS9V2OTjuGBQBWZE8RhCw3njPtjUEWJjDeh+HE6cxja/Ah8iWaiUDj
 V4tTa6MAwP9hMT0aLYWhytRs
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="137310460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:29 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:51:24 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 12/13] mtd: spi-nor: gigadevice: gd25q256: Init flash based
 on SFDP
Date: Mon, 22 Nov 2021 11:50:19 +0200
Message-ID: <20211122095020.393346-13-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015132_035565_AD4FDEFB 
X-CRM114-Status: UNSURE (   9.96  )
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
0x34.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v4: use new flag macros

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
