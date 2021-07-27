Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652F1C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B65B60FC0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B65B60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKQJtdAXampgeNKe4Ij29D4r6rxFBtz+CCFwVAVgICw=; b=Fr7851OL0+ysWY
	AeGo+4CIxD9Rb675E/KtSBOKNXMnh+uRTuwk5zyIPdgOxywI2ASKJgJFKx7HYfrZcTc8XYdbPefdX
	WnRYUc55Ta/6WUXgvmWYbV0wHHiTBK0ozMcbr6JSH2qGfF1DM2laf1MDNWE/C9fEiYIuJfylWxmuG
	pipNN/XN5mSf6fZROjIB5w74yHgxmAdlxGR5OU92r1Jr8SeFYqR08f2SuuojUw9i8OnyIUm0PC7wl
	uSge5QTCtxjNOw03SSkmeKQpjHP3lm4rEUe/xgqjqRgamGjt2buBSeTdMTx5KCRcarPVKMzyZv24Y
	2dc/3OQ4EwpZT6/Z/b1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Gqs-00DfZo-Qo; Tue, 27 Jul 2021 06:46:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F7P-00DI2K-HZ; Tue, 27 Jul 2021 04:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361703; x=1658897703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YFDXqOqiOz32GuoZm4etjvBxgxuwZuogj1CClYqVE5o=;
 b=dkCQp1cKitu15gSz8P8J9lIfOcq3gTxBvI/prMC34F47j3KYfe/RqSUK
 1yPhCtSAcd3s1gm51r0YcjfzTlHooy8wj1S9+D32Y+qH2Ww7bosaJEpoL
 tTQDPVXgaFrhlcLUwOR/UuqqlaHrEmVpCRG/BMDC7M4Pi0YMkvWwqLoH6
 ARj9lS6VETfCKvif4t1ICiKT//Z3OWBufmhabPODYPHnF5nhsY3LMMLj8
 12RNuwyUd+wxTbZ2agucUezTI6xvdU8i5w+6XYZ66fqZU0MMmIgdszeiY
 jNinJIEkCHZj3/pbzuC7IEkeCal9fmVMDUc6XM8JmJdXitN5/RcJoFtbS w==;
IronPort-SDR: JVvyxwtejNbZoD/1CJ87+R8FUe3lgSUduA9OGZilUS/nrvWQwwt4Zciio4V2F/7u8+Cio3tF8Z
 DzwUWNO8U9FP7TcC5BeXH0IrrMDIzP73IXv3T3PpyEZBsxvGW5cP5YgwgxbqtSGCUdgPFTCpeN
 znKN19A+zGpy/xK5yn+lE5BJ4UUjhpEVVOs5AZegGXnWr/mzMDT/cHW7T1vC39NCCV2i/ma5uE
 cSM0An1Srg3NuyVedhx8v3VYvzmQZCq1lugD7gfbVjrGsyBLz8Ru946PeHMwTvBUuHGPmt303f
 /I4Vl6ux4EZkojfNFiEylkXF
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482199"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:55:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:55:01 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 30/35] mtd: spi-nor: issi: is25lp256: Use SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:52:17 +0300
Message-ID: <20210727045222.905056-31-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215503_689370_2D3B4ACE 
X-CRM114-Status: GOOD (  10.51  )
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
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
9d6019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
issi
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
is25lp256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-issi
root@sama5d2-xplained:~# hexdump sfdp-issi 
0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
0000010 059d 0301 0080 0200 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff9 ffff 0fff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 4a23 00c9 d882 ce11 cdcc 4668
0000060 757a 757a aef7 5cd5 424a ff2c 30f0 a9f2
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
0000080 3600 2300 f99e 64c0 ef8f ffff          
000008c

 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index aeff8f60cbae..4f778f5d6adb 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -45,7 +45,7 @@ static const struct flash_info issi_parts[] = {
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			     SPI_NOR_PARSE_SFDP)
 		.fixups = &is25lp256_fixups,
 		.late_init = snor_f_4b_opcodes, },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
