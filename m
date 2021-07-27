Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEA8C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F0B6023F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86F0B6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XImLFRIykSOojVLDpULeoN6ZTxctQlqA26/8E1rEpZQ=; b=W7cdTYKcaBwYGA
	6M8/8fn2P4uVuuXSrqfZYgSNRAOwqScdMjG73FJbkOeRarfEM5YAKBIZS04/9vkGzSrDQhsjlh+MK
	gccwIjJzw63xq0K1e1O2mws81UbqO3iXmJCPDRhJhoQq5AVVQCyO/EX65l/GGY0BcSRa2R8yrsDxt
	r5LvrQzxYKSLOcjLcQMT8YwtB9hf6jbwW5ogpTXfZMcalIrKmJKUVmVVSTVOBXttSxLHu3184l7wT
	HWFNA15XvUCL81pOT0wmI4uldGJT73um62P/gY2DvS1sqOlABuyNCAOHsxkUcgGEaRF929RAIIPsY
	8BwU/A/mgK3fgvwaEPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8H8A-00DjN2-Ai; Tue, 27 Jul 2021 07:03:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7j-00DI8M-8m; Tue, 27 Jul 2021 04:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361723; x=1658897723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IO52f8kF9wUaT16TlrBacs61p5rHu3R/YcDLO6eRPbE=;
 b=kcpR898Lh85bpfOWNk69KNKm6kkLLYhOd+LT35fq9PbXooxeHeeT0XxE
 CVWg3E5EHJUrJIYCdJK4ivkGnD3MwkTS0oHXftToK/9Jwj/Q6qEeyaxoZ
 9yf5BfogzUCUww8Dpm4JeMwaQ40koxaF1bFs+gsYKbOFP66MYtGuz1Tfb
 OIN5x18tdqeDt6UDZtStO9BVdnSiStoS6cYVBPQgxcheAH3yLT74gI0Js
 vGRGQYSRKOpWfU+v8CNH9/A8YQsX0yaCijxuJ/qH3O55llCxi4lKzpygu
 F07sHRX0ZAlgqIJdSpjA/3c4cl9crCfy+oCreoo+PJ+XM4TxQQ7EIz//g w==;
IronPort-SDR: QwPDHxRxJ0+iBUU+KPk44DezCULg+WgEA0au4LrKAh3UfNWnEVz71qf9G8/6Wh91fFmqwmN6GM
 lCTXdFohmNtHOCDoODKSWsWUgMGtiLzJ8ip9YQZOlHG0rxCb6cSPtWJkSTKkfRZChp5tL+vtpd
 IjcyeOC8Fx4EGgU3nXHKVLNFzSb9oSdf4iZAIvKT/YTlaYycbIqXnW5r5g1WJVXHKFmmWHvAn7
 uG1zmJ8a1OjtVBIn0e8Ss3DDrwTDg3e+y+4ei9DTM50s3h2S8viqiRXCXMx2Iwd1ll/B4EGmbZ
 4Gg3fgu+bpS5gNEwwVA3R+CA
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137654091"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:21 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:55:17 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 34/35] mtd: spi-nor: macronix: mx25l25635e: Use
 SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:52:21 +0300
Message-ID: <20210727045222.905056-35-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215523_393684_F2CD6611 
X-CRM114-Status: GOOD (  12.10  )
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
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_4_4_4B
0x3e.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
root@sama5d2-xplained:~# find / -iname spi-nor
find: '/proc/381': No such file or directory
/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
/sys/devices/platform/ahb/ahb:apb/f8000000.spi/spi_master/spi0/spi0.0/spi-nor
/sys/bus/spi/drivers/spi-nor
root@sama5d2-xplained:~# ls -al /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
total 0
drwxr-xr-x 2 root root    0 Mar  9 16:27 .
drwxr-xr-x 6 root root    0 Mar  9 16:26 ..
-r--r--r-- 1 root root 4096 Mar  9 16:27 jedec_id
-r--r--r-- 1 root root 4096 Mar  9 16:27 manufacturer
-r--r--r-- 1 root root 4096 Mar  9 16:27 partname
-r--r--r-- 1 root root    0 Mar  9 16:27 sfdp
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c22019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname    
mx25l25635e
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > mx25l25635e-sfdp
root@sama5d2-xplained:~# hexdump mx25l25635e-sfdp
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 00c2 0401 0110 ff00 0084 0201 00c0 ff00
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fffb ffff 0fff eb44 6b08 3b08 bb04
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 59d6 00dd 9f82 db03 0344 3867
0000060 b030 b030 bdf7 5cd5 9e4a ff29 50f0 85f9
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
00000c0 8f7f ffff 5c21 ffdc ffff ffff ffff ffff
00000d0 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000110 3600 2700 f99d 64c0 cb85 ffff ffff ffff
0000120

 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9709eb68b613..b4eaf22ee388 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -103,7 +103,7 @@ static const struct flash_info macronix_parts[] = {
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			      SPI_NOR_PARSE_SFDP)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K)
 		.late_init = snor_f_4b_opcodes, },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
