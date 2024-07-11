Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C069C3DA41
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXjeTsq3gpeTLlZuRAVe3SxM0Cr/ksjpPMHkLBeSR0s=; b=lU4zdNdQraLI0P
	416ZtVW5EFEFmHbENVcKsnHDpjWno4vmlQ4QT55+lo23pTr0nWKWCMJii/grDErNr5T1Jd1RVnhm3
	5ky0S8O/aFHArlQRCTJ1+PLtG0C5WBiyGikpn+zsg5B7Uk4U+CHWz7z0OqxcURzxXT2lk9J4hRqsC
	Iw18nJsknmtrL5OeNG5ZZH33vHVbZacytBe8Dshi4n1/JM7/srsmxmygsUZo58c5LsSJ9EpbfDLZu
	HkvyntM9LTQRHEaWb/+rSxseYONdh8Q0Qmgx38dmdRXgq/8Stidmf8oGRj4p7vFhTMnifjdxEkOn7
	3M33QrA/HcqC+2aFQr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtQT-0000000E25u-3TxV;
	Thu, 11 Jul 2024 13:01:33 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPI-0000000E1Uh-333q;
	Thu, 11 Jul 2024 13:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9ZrZJLS1DLB4jv/UMX2sL8nP6E/alEgCBVlU2XvWCHA=; b=z23R1L0o1zjmTbzlPIwov0PFJE
	lhi3iMgGLOiRExSNJDqSnTD3PDgq1PBhKeUKBvBvBmdCtPkWha60fArzZMVYNhoCeYponQcAQwnjJ
	lSEPGEtqRLnRVt2NZ6cxC9bCzl5DWPfv0ynlguI9P4SZcly/4e6xxRbw4VB0Gu8KI78eeeTpnIHV3
	25Q9oreBwE0Ty/EF4Oob+TBLqJET/GWsoy/U5NSeOStw1PuGinvO8HIb5nNYbEnaTroeIUdt6gDX1
	To60aVZIm7yM/zj7Qdzc5R2nHuGTrxde+R/MDNwgVYEawc7USc4PAn9cLgVtJy1/szkH1zUREV6gu
	J3Kke4uQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPH-000BSd-6S; Thu, 11 Jul 2024 15:00:19 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPH-0003Iu-06;
	Thu, 11 Jul 2024 15:00:18 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:04 +0200
Subject: [PATCH v3 04/15] mtd: spi-nor: atmel: Use new SPI_NOR_TRY_SFDP
 flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-4-99353461dd2d@geanix.com>
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
In-Reply-To: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=904;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Ob5pJLtErmzw/PEIKu46fWtb7DMNCAxcd8QknAftFds=;
 b=6fpJfGaww/bYkfwhAzRE1TJ6E/AkqJ+9CFbDEezK6EgmHnXqdB0LfnfLFFgSoNyg5MTiHE6oh
 j3/VXzy6xVECOYw4rWOFcavu67K0J/sHILjlLRXjVwzy/w0zqWAFybe
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060020_798248_9339FDAE 
X-CRM114-Status: GOOD (  10.82  )
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

This converts from the old (deprecated) implicit way of triggering an
optional SFDP parse with fallback to the static configuration in the
matching struct flash_info entry.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/atmel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a0..cfd6a406b33a 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -175,7 +175,7 @@ static const struct flash_info atmel_nor_parts[] = {
 		.id = SNOR_ID(0x1f, 0x42, 0x16),
 		.name = "at25sl321",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x1f, 0x44, 0x01),
 		.name = "at25df041a",

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
