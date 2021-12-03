Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1AAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFfOAn2uZwnGK1vuP+OCcUF9UvJx5ubwvB5AFW1UhAk=; b=WMEeWMlj+t0ni4
	PV64gaNlMoMGPXCoBNo793ekMBDTWaipQkOGXeNpFOLLS31j3P3cmRRZbAlMTYxD1LxC7HVGT8mwG
	wOk+zKG83I4TXznQimrcKsAg6Tc93GKwsZArt2vV1liF0zvl25IDWnjXTGUURvXPpGK0oBL0lWqx2
	FNlmAbGwS1qxDn6EPwh9HaQKsjM211zY5CDikkJR9Zskdj9ISpiY8jp0JbIJ8t3MhTo3NalCMKXGP
	4MiX5gZzen2Cmzf99ik3PspXZPZbG/il3J4paWuHT/nYIpy8Vsb3eH7r29tNnbVM48A6VlmnvPsZP
	9zBBADNfm44uV7B/CTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9t2-00GF41-7e; Fri, 03 Dec 2021 14:50:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Tj-00G88Z-DY; Fri, 03 Dec 2021 14:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541439; x=1670077439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbxi1xswVZLJS0JZjz0x3j/nn5Gp1A3L9WIwhTgjcu4=;
 b=fINmcg5v32xNIBrxXf8g+NkXY+lfTU+mxHalFVzBCw4lwLShAUbN+bj4
 zlEKRbk0fw2QE9Ge+C0aSYPFfKyvJZMb6zMRzRMQFb2ZC8qWjd1yCHk5p
 NtBb0riqp+7OTUnPCDYg6T0ac30XCvhYSaKiobEJmD6hGr06mNs8gJH45
 wZwCujgumEIgkFKMgatSl0+Xv3eYlZkynRMP9gjMMR13ryDCHPVPRcCqO
 lnQagwvmzoA+g9Kw4RfwofopYO5V1QMpxjWzIkjW9Ssci26Vj+/SIfnfN
 uZCohCmi6GbIY7599DasKWWB7iVUKbjlLYFJNJxUuvX8cxDqd1MWyQ1SS w==;
IronPort-SDR: E8KgZ728VjoTW+PgzEHb3mOzzYk7b+x3O5MKj9ZPGIfj77Bvbum6sWCR69XWO06zfxdDvkjPDj
 2i3x7X+n/AUK1gHvSjMqQsV8OLN8A5mm0hSL2aT5uyMRhVTukIZkuyNA0ddG6bsD+XtrfV7fBd
 ug4BSJEcfERVyGeonHn5KE2sEPNBTTEc3kfOTOBMjSYihuKuZDed1DFdnmXCP8orrFohvj+GdH
 2v4VWVs7/AKiBsl+zJMZluywPpmLRG0cp0OigwjN4wK9CVPleHbVIfROtJs1sIFFrmiuIj5wwD
 sTBSa4WJc0EcdMNjOI8Y4sz4
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="138583114"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:58 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:23:53 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 12/14] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
Date: Fri, 3 Dec 2021 16:22:54 +0200
Message-ID: <20211203142256.47370-13-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203142256.47370-1-tudor.ambarus@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062359_559977_35336B7B 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

s25fl256s0 does not define the SFDP tables nor implements the
RDSFDP 0x5a command. Skip the SFDP parsing in order to avoid
issuing an unsupported command to the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 1282a759cd75..92c2350e7ff3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -210,7 +210,8 @@ static const struct flash_info spansion_parts[] = {
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
 		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
