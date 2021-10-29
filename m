Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADC6C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:43:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B5861038
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39B5861038
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X90xYkKkIqwW/X+70YymlwroRRp255shu44SX7UG7NI=; b=p9ii9qnpzyG9gX
	a9nGLqAgCwZZGhb8MJDcHS5TcN5wuLprVSOyxkDkPM6v4N+Sf9NuKfGAZOsPdgRJej5zfjwVFfLEV
	/YJdDNbPRVCHcnwfhsHDz2rX9fCj26dCl44Sk6gUxisoVqNJFWT98+8aEB1ZL0Qm3EU6IGSzLubjc
	lQFBAo/cggj2MX4CX36WD/wTCCsCFmdzL9kJ/a4cMxeWGeJa+q6B0fKVtOVgF/+Dua6Bo49FNPxMt
	ZNa3DzTl6OZYdFVSqakurGjT+qBcWDtPH2VkrbYH7y6PS/iUOenMX+z4VmBTiq8JIVe+XWXfCSdzL
	P4dS6FHwTQHWMqX1F3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVtr-00BdFW-OA; Fri, 29 Oct 2021 17:42:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfA-00BZFH-V6; Fri, 29 Oct 2021 17:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528452; x=1667064452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qh3l2t9hCCvugDDhvYkEpFAfmmOdyntyWtWRo/GiZXQ=;
 b=ACIFeFD7pUTC3z6W5qtunoZNw2SFHFKRQaA+EF1NY9R1iIB9k+PH21p6
 fES/SwuOrFg/RcydjT+vgnqZ821RVMzLFkQ4DMlxfo6tu3/q3Cs0CuWe0
 8h2WkfxWgYSjHqhTKgngxUCS+vdOjRInHZCvlJcdbAyoNxr/lGh9oWg6r
 nz42tyQdPegzGhmJ9sdGBmKQhL+5aLuRU1lkzFt5WYO7Zpg7goNZS/tIv
 QvwFBbA3xPGBH2B6A3nA9q6l2CjYVxkq+WikkJubkeJ/AIPGJZ/RnVJYy
 4PfTz3SMRtdGAW0VEWrabD1C3y+t2J/Q+k/wbfeO1V5DXNh2+6C12MEFl w==;
IronPort-SDR: vwMddPe+IVget9vxXJFdeBHCjQYpseZIUjjzffvw9mHta0PHZ/YzohUhHvgJaAyT0qLrEL/kLS
 zBdsMHgil997jLUXlIxuJ67aL4y8uvKssvh3hVuKEXmWLihWaUKk4NBtLI3sB0vD5Zqtw+LGdn
 eddoJq5StLayR1PhxH0HuBsILbVLYwAkna8Jb44Wpdkr2KEobXuJX0D1UIj/gjliO8fU5v+/pc
 nNHavaBfaBliPs054DTiZTiKTNHznx2zPs8IplnGgfp2TQMH/BHRQwdhGUr6l/V69+qpuht6RH
 41go2Chvs8ImzQfDAMRVyXBS
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063375"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 09/25] mtd: spi-nor: xilinx: Use manufacturer late_init()
 to set setup method
Date: Fri, 29 Oct 2021 20:26:17 +0300
Message-ID: <20211029172633.886453-10-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102733_052179_33B90346 
X-CRM114-Status: GOOD (  10.29  )
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

post_sfdp was misleading in this case, as SFDP is not supported by
xilinx. Plus, there's no fixup here, just setting the correct
setup method, as required by xilinx parts.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/xilinx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 0658e47564ba..7e970ccf7903 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -80,13 +80,13 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static void xilinx_post_sfdp_fixups(struct spi_nor *nor)
+static void xilinx_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
 }
 
 static const struct spi_nor_fixups xilinx_fixups = {
-	.post_sfdp = xilinx_post_sfdp_fixups,
+	.late_init = xilinx_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_xilinx = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
