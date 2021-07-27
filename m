Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7137C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:55:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624BE61131
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 624BE61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NkHRBjHEA4h8gr7auUhNQ8rJlY201ttYpBbCfxBgx4=; b=zxP/bnLPkTu/5i
	h8axSs7C17ylol7H2EJp+0PIm9BUp9WFbsqtTMySu5FnbxJoEyMduoSsIASCnZ4Tjfi1kaKkl0iR1
	+Zmd/TmFyHrLHqbkZW75lgCwpPtSFv+d7a/hk3X01nAogprO2lSFvfZdaYAOpkFSM46ZIsbI6I/+v
	rC3dsGDHtPqD2YtR3bGPcMEijtXWdXklwVj47GlhEvtfEYdgM2b3r8g3XiENEHeSXKbX5tB/5m5AV
	KpOY8tYaS5hjGZRlWgSgnPc/uHwGydOaS9c2RTQoabdQEjHupMqjR1fI/i3uPL3REOVQC6aNI+oWy
	OsP7dARtwpqhLRd9VQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GzZ-00Dh9O-U4; Tue, 27 Jul 2021 06:55:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7a-00DI5N-8J; Tue, 27 Jul 2021 04:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361714; x=1658897714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hS0mPNifufnhkL17r+uLX0qeIBwXPGRyRWvEieR6Zkk=;
 b=N7yrMvvGMRkLzQzOvA9ob0mPmz6UiCKkCDhoyK14/v2065u7TKjZcVz5
 //79q4lR+YPbO8Pv5ryDliku79f2tNPqDuNMWbT+K4cMG9MZRjjReVZ8Q
 4UiNIfxG94dw+R0it636uF8aIXMP+ninhIyHGpF2QB647ngLlRVDwdjw9
 MqQ7SGyAAFwUwte1GkaYwNUmwt0ua1rVNL+nkDoaO5dQVodBszOEnm61v
 GWoGuVv+2QYEUBeW6ZNjY6l85jZpHGCYTbOCT0NPSYuuu+JIKpdJkqyvt
 vmL2y3KbizlYqkz9Kgh5VbgwWYo5Y1LtHOnoY6hEp1RMfyoXcJQAMxND4 w==;
IronPort-SDR: aLBOaYRRYEX0ZV32fbSS2a1+x3HvExsKy1CcghO2b5JWEif6yfYRUnSNssM8v53H2aDdEG0XsV
 GIrKO5i38ewPDEh/uilW5x0vft+59o7llO4pWDo6LOCHucylBtdQdDli2IoHzwjM+cmcMduQLt
 7Mszqmh2hGEvBul9JrsytF7Tnwhbd3lbQzHl7FTfb8/ysukIq25CFh+p4IPCXTmkOTFS/3phuf
 ZkV2/IHt7rDibnujW9JQ4nIdYaeS/dpdJEQbQ1/lVHof2ZPyN1Idi8TD5Oqs1kDEOUE57RGl42
 DfQ6lXh/ZAzHBXhm27C0IgMz
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126055132"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:11 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:55:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 32/35] mtd: spi-nor: gigadevice: gd25q256: Use
 SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:52:19 +0300
Message-ID: <20210727045222.905056-33-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215514_476797_D4F05226 
X-CRM114-Status: GOOD (  10.55  )
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
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
0x34.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
root@sama5d2-xplained:~# find / -iname spi-nor
/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
/sys/devices/platform/ahb/ahb:apb/f8000000.spi/spi_master/spi0/spi0.0/spi-nor
/sys/bus/spi/drivers/spi-nor
/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-norroot@sama5d2-xplained:~# /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor^C
root@sama5d2-xplained:~# ls -al /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
total 0
drwxr-xr-x 2 root root    0 Mar  9 15:57 .
drwxr-xr-x 6 root root    0 Mar  9 15:10 ..
-r--r--r-- 1 root root 4096 Mar  9 15:57 jedec_id
-r--r--r-- 1 root root 4096 Mar  9 15:57 manufacturer
-r--r--r-- 1 root root 4096 Mar  9 15:57 partname
-r--r--r-- 1 root root    0 Mar  9 15:57 sfdp
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c84019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
gigadevice
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname    
gd25q256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > gd25q256-sfdp
root@sama5d2-xplained:~# hexdump gd25q256-sfdp 
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 00c8 0301 0090 ff00 0084 0201 00c0 ff00
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff3 ffff 0fff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 6242 fec9 e982 5814 60ec 3306
0000060 757a 757a bd04 5cd5 0600 0044 5008 0100
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000090 3600 2700 f99e 6477 cbfc ffff ffff ffff
00000a0 ffff ffff ffff ffff ffff ffff ffff ffff
*
00000c0 0eff fff0 5c21 ffdc                    
00000c8

 drivers/mtd/spi-nor/gigadevice.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ff523fe734ef..f4cdd87893a7 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -46,9 +46,8 @@ static const struct flash_info gigadevice_parts[] = {
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
-			   SPI_NOR_TB_SR_BIT6)
+			   SPI_NOR_PARSE_SFDP | SPI_NOR_HAS_LOCK |
+			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		.fixups = &gd25q256_fixups,
 		.late_init = snor_f_4b_opcodes,	},
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
