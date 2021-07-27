Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93734C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5802560FF2
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5802560FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNdmrggPs5+rfyRpAoWcF7QkEcCHkh4bEtiXb4+r+HI=; b=btaHScnSU8P2M9
	jTdGe7PT/AHY+ij6TSCL4pFbJYWlcVlVjZue9LnkDmeaHjWes1KnwYq6PkZ8sP8jBaHSAPFgSiyrv
	WfaKIAUhsY3IOnptAtaX1jCP8bzCuVzG5btOeVGSFuTQUYW+bha8JvuIKM3Pva56KN8zwHtW6ENa5
	bpLOyMvjvijEckG2KiA41rgrb65SvoT6jZ+6vJdbgwweNeA7hhXh34qnFOrzfTMSJ5xZX0aPgNI2I
	slg4adWEjsYqeiTFc9qqmkJnfnS53PoXGq9v9BwjjVA7FkxlqUJoSQ9z5Iq1mVWiLPIui+gtnB/2f
	/K/E9TMkjCUDZfvsp43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Gi5-00DeB5-JK; Tue, 27 Jul 2021 06:37:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7J-00DI07-2C; Tue, 27 Jul 2021 04:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361697; x=1658897697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SNa9I8ZyXHR+DV0mECnoEPrhIlp8JDOTWsPWdriZ+C0=;
 b=WprYdK4mZTFgZXiS6Ejh0YfkunKKdbbyDfVYsoXMh1IgWZE7xQMUh4EN
 uLLpK8tcbPY8+1hWNzEouYpbhlQ1IvfEb69zQImRrY4MYHNghU32dgxXh
 EcFv/5G1VHDjoK1vSCo8b+RjPUpnT/y1VVRCXjn83HZb2bGNTCpsC/jQ1
 JRm7333V8ThARzi+abxp77MaR/LX1aIM6eHSLnwHog61OFnI2xcZZzsH1
 /QGZGTtonf6teEz/mybGSLNletOzcyQbdUZ8+Rwf5B+TqNgN2peVXdY5x
 yPuMiUZYmg7A36S2h6rZhM4Ry8zSrGF0hCSV/7YuyDFEnR6PO5NmVjB14 Q==;
IronPort-SDR: WTb/T6w3ECs1nHZWKa6dV8ur3EToSdsf2iJzaTyhKGwstOmIo28gp9qyaT5YDPgREtGzHrL86D
 0qTTE8HIv0UecCcgtsBSnLQpBrNzxkTZ232LCRT6dmJRhaegnG093X5D246MeTf+dyyizIiP12
 i3fCjHZYgxidWW9Gi38dy+4vRorZiO6qjse0N1Db2GNPk9Ii5bNnbghhWyHseHAab8CYtTibAy
 kbCVcKMGlQ6xNg1XBzUW4CiQnhq+DaWU4OUSGax/bNcmDVkKlEkHFsJBZWecaUbSGmg8z7TIAH
 7h94DZwSgIGubRsZM9QkuLjt
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935555"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:51 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:46 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 28/35] mtd: spi-nor: sst: sst26vf064b: Use
 SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:52:15 +0300
Message-ID: <20210727045222.905056-29-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215457_185125_CE8B2341 
X-CRM114-Status: GOOD (  10.90  )
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
root@sama5d2-xplained:~# find / -iname spi-nor
/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
/sys/devices/platform/ahb/ahb:apb/f8000000.spi/spi_master/spi0/spi0.0/spi-nor
/sys/bus/spi/drivers/spi-nor
root@sama5d2-xplained:~# ls -al /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
total 0
drwxr-xr-x 2 root root    0 Mar  9 14:45 .
drwxr-xr-x 6 root root    0 Mar  9 14:34 ..
-r--r--r-- 1 root root 4096 Mar  9 14:45 jedec_id
-r--r--r-- 1 root root 4096 Mar  9 14:45 manufacturer
-r--r--r-- 1 root root 4096 Mar  9 14:45 partname
-r--r--r-- 1 root root    0 Mar  9 14:45 sfdp
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
bf2643
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
sst
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
sst26vf064b
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sst26vf064b-sfdp
root@sama5d2-xplained:~# hexdump sst26vf064b-sfdp 
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 0081 0601 0100 ff00 00bf 1801 0200 0100
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20fd fff1 ffff 03ff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff 0b44 200c d80d
0000050 d80f d810 9120 2448 6f80 811d 0fed 3877
0000060 b030 b030 fff7 ffff c229 ff5c 30f0 80c0
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000100 00ff ff04 7ff3 0000 7ff5 0000 fff9 007d
0000110 7ff5 0000 7ff3 0000 ffff ffff ffff ffff
0000120 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000200 26bf ff43 5fb9 fffd f230 f360 ff32 120a
0000210 4623 0fff 3219 190f ff19 ffff ffff ffff
0000220 6600 3899 05ff 3501 0406 3202 30b0 4272
0000230 e88d 8898 85a5 9fc0 5aaf ffff ec06 0c06
0000240 0300 0b08 ffff ffff 07ff ffff 0202 06ff
0000250 0003 fdfd 0704 fc00 0003 fefe 0202 0e07
0000260

 drivers/mtd/spi-nor/sst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index eeb10766b70e..c3bdaa6af2ec 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -81,8 +81,7 @@ static const struct flash_info sst_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SPI_NOR_PARSE_SFDP |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		.late_init = sst26vf_late_init},
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
