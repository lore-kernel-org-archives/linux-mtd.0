Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA93C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeoGNhdmkaeLeKvumdhLOYVI1RmMxXjdhoBzcBL+kp0=; b=VoVV7zW17u27YW
	bMKRNb59uXyFKw+4nuZJEXsZvR/AMKOH9/fC902vVFikVPJDn/CaFxACfhniIxh2pWMZ8xGdKj0n6
	sJQjtubLjEtUdRtpCoHwggpx/HyGKpy4+n9kytTn1ggUDzYfCyJi+zof3H4Qn9ib9038NRD6ECQQ8
	JsgOPdPutTDvyI8pX2CqNSSLrXSXn5A7y05pn/lZ994KN5yzFdwAHkmrekOvwmKOmsQKggtR52llw
	D6Gr7Iw+iYV5ZCmMC95iL+pJzvq/KqW61RjC4bF+7AuEvArAcy4EWA3Qgnse8uzECSgCXe9Fq6PYj
	Q8mKB6sVgST/UbV7erJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL558-00F4VC-VS; Fri, 18 Feb 2022 15:22:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4iz-00Etxn-Q3
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645196349; x=1676732349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1kB/UXvtaiyeXTg8NuvWf/Arx24JYsUgr40cN0Fyi6s=;
 b=TdnaZrZsh2FuRviuIhCzd4htnrysYkQibMjtwxBWtx+e7t0qF7GZSZXV
 DRdcB9F9STv/GFK7yauuqbFxBHV0nsD5ssBJbaPTRgueq9QlS4nktj+SB
 H91ELhbbSikBpJIq1MzIxoAYMCe21UJ/MYN2QvBpeJteqBcRWpnsH8Q0h
 gD8+y+TwOeGZNxLy5gf2JDImmouOOKK8EGzkzDPj8+EM3XCKEvpoH5PWV
 j0/T8fjvqsEdaMoueku18Tx+h9SS2PJGx1/08+oe+apW4D9XvhoQUI5mW
 Y1sLllrfYouK46McTrWZuqq6bfjCNQPZOlYn9OyqOnUNQ9EnyUbQMiIY1 g==;
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="154088331"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2022 07:59:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 18 Feb 2022 07:59:08 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 18 Feb 2022 07:59:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 1/4] spi: spi-mem: Allow specifying the byte order in DTR mode
Date: Fri, 18 Feb 2022 16:58:57 +0200
Message-ID: <20220218145900.1440045-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065909_902180_E49ACF81 
X-CRM114-Status: GOOD (  12.80  )
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

There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
when configured in DTR mode. The byte order of 16-bit words is swapped
when read or written in Double Transfer Rate (DTR) mode compared to
Single Transfer Rate (STR) mode. If one writes D0 D1 D2 D3 bytes using
1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will read back
D1 D0 D3 D2. Swapping the bytes is a bad design decision because this may
introduce some endianness problems. It can affect the boot sequence if the
entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1 mode.
Fortunately there are controllers that can swap back the bytes at runtime,
fixing the endiannesses. Provide a way for the upper layers to specify the
byte order in DTR mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 include/linux/spi/spi-mem.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..e1878417420c 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -89,6 +89,8 @@ enum spi_mem_data_dir {
  * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
+ * @data.dtr_bswap16: whether the byte order of 16-bit words is swapped when
+ *		      read or written in DTR mode compared to STR mode.
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
  *		 operation does not involve transferring data
@@ -119,6 +121,7 @@ struct spi_mem_op {
 	struct {
 		u8 buswidth;
 		u8 dtr : 1;
+		u8 dtr_bswap16 : 1;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
 		union {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
