Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5931C4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 745386113D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 745386113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riGwicPZXzX+aYZ5rEFTJ+7MoYcwV2fsIuCG1l/EtYY=; b=htpSW5QvbJ/BrB
	h7MnX7+YATEfFuMIQHEe1vhQbNIorrNayLYt3G+yleM15kzdeMm2WXSIwPbZlXL4OOYrXapaYU05k
	1nalZKesJYFG1COiqwfmtjyDxmqToCdkCMPNaizYMZmbqTb6rrwd3myXB1spTnjXMrwjNP6m2WZb+
	rzlPJu6O/iT58O20EGsVGMFuhodqJ/Ma4hv7D9gbMabdT3iXEERn2iN4rAPCq5mK5Z1Ie57LQ+2Xk
	VsetMftaSkmW3f9EHJNMhLk+riauRfyNSdkfjNPNV7V2ZNAyEPni/WNZoZ56kTMvEfYopCKoDXac2
	xI+SfGDwDgPuCKLcQPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8H3z-00Di1r-Tn; Tue, 27 Jul 2021 06:59:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7e-00DI6m-JM; Tue, 27 Jul 2021 04:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361718; x=1658897718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rz4/CFcmWeFTUWNky+5xp12x4PAxGGUNRLbxni7Jfno=;
 b=gVgIGzims56M4sKilYuZ2iDAgWoLImyw37nEi8xWFJkbJQx4215KoAtk
 1Ry5I4fele6wuHTXHuqVXI66zmbGOKyu6jHlVKfV+cAnLtKf+telClqB/
 2ymf2kogJWZrFmtrIClxpT6j6CblWoqjwf9rfJyQZgTS0VIkG1deBFBSr
 DiucgmBR9d7fUzUy9Kw1CGFlUO6ZJgEyCT0rxJ1GbC3xomAmbK3cVAJiA
 gZHVP9niqQIXUGSTqovx7VixUNi7WLs7aSzwYGRngCnxruc9xj3qMR4oF
 /RIbSxxxN/H+GcdcmwnMD5gNGGgAs9ZGtGv8nfM+O/ZI1xY5agyH3HxxK A==;
IronPort-SDR: Wvx7nzcvRdplnheYJYEAtKiRY1GCTq4k5K/Irf4omM2Rc1AyFyucrUv2+RRV0gdwULu6vyWd/y
 OYX6kMlNsLOsiszRDpg4tGEnrZk3YLDSdkP2xXfdhaM5L15I1YQYDYSO1pCGUgVb1iLYz/T4vO
 6iYyDOkp1pv1R3otJwRqjcNkjuVpVZy8n/hg0xG6pWe2ZBTgs4SWXy3spPej6KOHsaPfzhibkV
 7kczvSmbSKmtJElgie1ovHqwgyyFFiluPHVnFYn6uE5AqXGZn2umhrsZtWeyRLAxQWgKfhZFwt
 z/XfOqy0m1KyC6SIjA3Hmta+
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935595"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:55:12 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 33/35] mtd: spi-nor: micron-st: n25q256a: Use
 SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:52:20 +0300
Message-ID: <20210727045222.905056-34-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215518_731686_A64EB938 
X-CRM114-Status: GOOD (  12.11  )
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
^C
root@sama5d2-xplained:~# ls -al /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor
total 0
drwxr-xr-x 2 root root    0 Mar  9 16:14 .
drwxr-xr-x 6 root root    0 Mar  9 16:13 ..
-r--r--r-- 1 root root 4096 Mar  9 16:14 jedec_id
-r--r--r-- 1 root root 4096 Mar  9 16:14 manufacturer
-r--r--r-- 1 root root 4096 Mar  9 16:14 partname
-r--r--r-- 1 root root    0 Mar  9 16:14 sfdp
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
20ba19
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
st
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partnme     
cat: '/sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partnme': No such file or directory
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
n25q256a
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > n25q256a-sfdp
root@sama5d2-xplained:~# hexdump n25q256a-sfdp
0000000 4653 5044 0100 ff00 0000 0901 0030 ff00
0000010 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000030 20e5 fffb ffff 0fff eb29 6b27 3b08 bb27
0000040 ffff ffff ffff bb27 ffff eb29 200c d810
0000050 0000 0000                              
0000054

 drivers/mtd/spi-nor/micron-st.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 31ebd4c9b431..c685dc6c5aff 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -156,9 +156,8 @@ static const struct flash_info st_parts[] = {
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ)
 	  .late_init = snor_f_4b_opcodes, },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
-			      USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512,
+			      SPI_NOR_PARSE_SFDP | USE_FSR) },
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
