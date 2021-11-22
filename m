Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78148C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaOZfA/tbU4zSmueOHBVvfDBSAR9IHLBNSXTIm5dOT8=; b=0GnDwDf7lYLaCI
	EPPVQ2pq47IVAbOId6QMHuLpVDvA6JrQ1lu+1wATvziUgSdA7hOLr55HBGFDMH+zozZtngYyKYGQ1
	oFfjAFhFtsEKdKlMEw4XYNK/gPMucSvFEMOuZ+c64IP20N/ih2wyy2EgEyj3pBZdEF+AMI6UgUYJO
	96oGQkh78b9ALITAnor3zu42D7aoFBv1Yt5EJM+5tJULNAgyf2QabnJfUhYDPF/o3OzIIhqWCvQSX
	vn7kZrwcgTG12M+wEmgw6S6IJwuUFFSMaaKcaUoAzZTr7w9rcVE5YXFCOEuyWivlqDrtFPI47Er1S
	Z0yCDay1GPt9kr5wGcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6ua-00FvC9-Vo; Mon, 22 Nov 2021 10:51:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5z8-00Fh7c-Bc; Mon, 22 Nov 2021 09:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574698; x=1669110698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nuKtz7/UPsPwqZlihXZdlewhtp64cBNJXOnHtWUe+/M=;
 b=ha9MMg6aOeig9ejjwqo8btMpEUlNkarW9Od5eTbwGcIX1QnUKfTqjucp
 Eh4XEdcFa2WQ0QlUU1i47bTjb7TdDfgR3ypYOZTEbWuXYr/TAB34dln/A
 VIInLowNcZxj4S8Px6DsSldcPx97hiHd8+WQj6TapoF22qx3MI5vB+50j
 v8dDjXbBo+XM/htHS9g0EK/yg1eaEKfUJcYXD6u+qThPFd5GiCu5G8ONR
 MBlhGB5vdiWPI/4FmCdSwsSABnlQuD4rHFLrbixRJhXCuDgkHnVaostU5
 eLgU73OGbchF4DE1gcDDJQhbtOuDm2edChmphrJxKwwObwrPGsDZoRijY g==;
IronPort-SDR: +0d47nm9gjvo3r3SwAFNHFBL9WCex+pBPTfFBoo+sWLPfE0lTMqM4OVWBDmcVt7RYDUhhYqaVR
 MeYxmwmB5UAUJ+pKDBpxpZZFUT/xxBMjt6CurXwcNWEOtiAXQ3lrL0qyVqlnq9o6aO3XV/PdWz
 p2G3DrzNTZBw0p5HPWY5BVgHz8K4oRa0Sqe2rSIlakAipgmk1mohM6uXiZ/8FpPLg/axkklE8X
 z9EpaV5aIOedoFEgRuRx54z0UHRGArTBIc3n8N9MAJB4itA+FHlE7hIYRAlSqZ6rL1SXg7CG+9
 Kvc8MPCyeb1KBPIpqvefhxBJ
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="144713239"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:34 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:51:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 13/13] mtd: spi-nor: issi: is25lp256: Init flash based on
 SFDP
Date: Mon, 22 Nov 2021 11:50:20 +0200
Message-ID: <20211122095020.393346-14-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015138_523479_53065BAB 
X-CRM114-Status: GOOD (  10.39  )
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
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v4: use new flag macros

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
9d6019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
issi
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
is25lp256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-is25lp256

xxd -p sfdp-is25lp256
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030f2a9ffffffffffffffff
ffffffffffffffff003600239ef9c0648fefffff

sha1sum sfdp-is25lp256
98d61eb4691e61521b84b83e1ddb8132cae2fea5  sfdp-is25lp256

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
