Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D3C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5FS1sJ1+vNSPo8SOTA0XoQbKaD2QLyMSR06kmTdNUc=; b=F+kSlMkVAaByfY
	beKL26WlQIUIeWlkUKY4p8Hoeec/aNPiZjzhzlaifbr35bq/NEr8X5OE7yHcCV0UrBDWS3hyRDDG7
	Bf6KSMT4haCB2FCTi7AaepSv2t8+0qM7T6SRpRW5Z/1SIQcp0+j0j+xNnwoeoHeNHrxgJSXnn6dWa
	huL3tGcF3s+QyXD3ZRls74BpBD/g83sbxPmMjynuC7L7Oo6EyUEDsutzocuNsGL+PS+La3vrtDvuD
	k05nlvULwp1hmFAVFkCfXmX4WPU1/lSIZXb9bEuSmm9Kzf+VyAmwN57ZoWG91pvTf/IadRvcR0Air
	Brt7tlX3L1x3UJ3kdUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtRV-0000000E2mI-2yoM;
	Thu, 11 Jul 2024 13:02:37 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPK-0000000E1W3-3tWG;
	Thu, 11 Jul 2024 13:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+KKqiIe0zAVzdlcV1iQJgODjeG08/S9xkthtZjiraRg=; b=LO+8NzSMUa0B01z926WP3iP0dh
	W6PemI2pS+Zl7n1EsQDbqHqLvjXq/DjC4L3P7z2nq1zShSlwqFRwOfvsQHurJM8PaepVyXssIZIH1
	cpnWIqRWyfOdKpj8+0rsH7J8nLR7z7FSoYgO2M+ZuAoHANHox1kR64y6muOJj5AuYsAyuGwFhN640
	74YGrJCyDMtrwZT518P17akLDRJJ9Ak1T/fLQxyU4xAGr4CUDsyR8/l4nBYX0T5PISpqbjeRP/Mju
	gKrgm1LmK3v/a9nQibIDwgVMINq9epxBxb6rLKd3TdY3jUiDgnm6e7ccgTVe/ZfCcUaxppjpQVVzO
	ZuXJqKTw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPJ-000BTR-Gh; Thu, 11 Jul 2024 15:00:21 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPJ-0003ci-0u;
	Thu, 11 Jul 2024 15:00:20 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:07 +0200
Subject: [PATCH v3 07/15] mtd: spi-nor: issi: Use new SPI_NOR_TRY_SFDP flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-7-99353461dd2d@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=2924;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ZRmVQqdG+HwMnflnXqK8Hne0XXJ7bmicarecuxtLmbc=;
 b=gaG7Mtcl26BC8GhIEQZ7aWtgbhUzbNHEeYiqbJNLvhGEE4ky99WdyrXyOM7R/ZKrkAvPxQhuz
 sTz3IjkZueDC8Wu8/KhcG6dXzOc4WPa+KGeRalZTRedZCtVoV1wpt+Z
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060023_013771_1058CCA7 
X-CRM114-Status: UNSURE (   9.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This converts from the old (deprecated) implicit way of triggering an
optional SFDP parse with fallback to the static configuration in the
matching struct flash_info entry.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/issi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..7867489e214a 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -74,32 +74,32 @@ static const struct flash_info issi_nor_parts[] = {
 		.id = SNOR_ID(0x9d, 0x40, 0x13),
 		.name = "is25lq040b",
 		.size = SZ_512K,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x14),
 		.name = "is25lp080d",
 		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x15),
 		.name = "is25lp016d",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x16),
 		.name = "is25lp032",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x17),
 		.name = "is25lp064",
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x18),
 		.name = "is25lp128",
 		.size = SZ_16M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
@@ -109,17 +109,17 @@ static const struct flash_info issi_nor_parts[] = {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x17),
 		.size = SZ_8M,
 		.name = "is25wp064",
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x18),
 		.name = "is25wp128",
 		.size = SZ_16M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x19),
 		.name = "is25wp256",

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
