Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E44C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31A060F4B
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E31A060F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtsMoIXd2wQFj/BaI++gpTuHb3dSKTQMkXKrl6Hf+ws=; b=AcliJbb1xQiuXZ
	Ysc+8d6vv2ML6QWXd2uZ3KUy6cvtdxfoNEWRGdg8ZxZrbJE2CXNEVXQ4QAKV9bixTWfeDOX9eivNZ
	UdCeZoFhKVbmPqq0yAnzkc5nRGqlIvxg5+rP4W/WtZml0xQCvUy8EV5d4tkm03XGNggvT8g3VFyVA
	rtZ31pLHB+xiscjBg2n79vXGURFfjHNLYmwY5g0caO4IOT4PVDpSosYB+y1LLjj48dQo5rQDmJLEc
	bRKxcKZd88wWGP+MgwLMAAqlSfzZ9yrKuO+jxOA4QJgcmY2BM2NnV6qZjR+9Odbap0dgu7KkmImXZ
	ZjDaPYyah8jWMu30ayYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWpf-00BpVG-Hw; Fri, 29 Oct 2021 18:42:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVgH-00BZfQ-Kk; Fri, 29 Oct 2021 17:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528521; x=1667064521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSTJFKMFZgVwlkka+UgeQxsQYT1gkbnzovK0WdmAXwE=;
 b=a3eqLhVSJ9yZC3nzHVXG2igLpOYFUjC67m2Isj9VCCvIdKv3SPAueQ/v
 FIhOxAZZvNKxXepJRsWWQT5/aRV6RwxUgelUZx1bKW1Bodm/4Bi1pOxtW
 zgNt3zDuQXqdxa+uXJ3sZfd8CRaCVuhTRZaQwi9zxCXwhZ81qcxBkQ2PP
 Po+hJRKTrpkGx8Ssx1vufjS/33BzQZ8AcSN4R5vGXsbPOqKPPwXjQBOZ2
 EmP2/JuWOwoIecfc9eWX2j67F9fVkOUWUkoXraCGNbfyaaJFTWYnNARj4
 gBG4wfD6fu3XAXbdXtnDjIV2SpzG/FyXyUA/nBMUmKTSDcEIPWAHePEXe Q==;
IronPort-SDR: ZAmB0FOy6NzqdtNkWqMFEQOr9DHZ5LXTouGpuy0oT1nWX3I9ZyYphH44FibjbhJUoOGSoq2hT+
 AAuMefjlTt4GBpK2ogqUNw/3qljPrj4QE+5ucO+AMVd/fZfm8A3JwOxryubfacgQhiaSsCefkR
 D5aoGyxZyNxrycxCZRVrP/rpMobiQLzFDwfkpx371fvMRQLr+oxQE07qGtAY0eWlmuBL04Fn0p
 zcPxuaVbBNnk2KufcEvl4F3vp7ZQb0fYnUTQ/djlqeXTwX8/gO7zzUdfMKuxV0FrdlhFWbj4wd
 iCDTgSCYZKaAjOexdPWQvRRQ
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="134821134"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 24/25] mtd: spi-nor: issi: is25lp256: Init flash based on
 SFDP
Date: Fri, 29 Oct 2021 20:26:32 +0300
Message-ID: <20211029172633.886453-25-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102841_789467_4C9E6186 
X-CRM114-Status: GOOD (  11.09  )
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
 drivers/mtd/spi-nor/issi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index b2abe8202143..3c5ce2c2c646 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -45,7 +45,7 @@ static const struct flash_info issi_parts[] = {
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_PARSE_SFDP |
 			     FIXUP_FLAGS(SPI_NOR_4B_OPCODES))
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
