Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159EC3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/F/wsB1VjIFEgO73Z/JBgygBv3nre6LZXf8NlsnVTg8=; b=5BbkyBzKxsWj/Z
	80fOq965Z1Eb0CiaaNu8tlYdDAq5xPxauIFOsI7Byb30mJv2TPtsAPKjRL1ffie8sYUJeL8l8Wwws
	/k+8HV7SotP+gLi1RqmpMUYn9CfwsZA1CSMv9CG8H2vsFvHNhRfv5OT8K8nuontoKmucd7EBMemhT
	08OS5Z40i8E/SWzzZFnNFeLW5Zc/Zp/k+ymBGGmooJ5aA6LCdNH29c4NNqhgH5C6T8Uhb1ChHVvYe
	MefvYF1y9Pu501KhNMOex8uoRxRwXoNzScwAWDBYJm9/YfxM1n5WBDOSEWCDUN8F5sKpu2uadEXBr
	UqsntjJotChGTqasU3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtSD-0000000E3HK-2wAa;
	Thu, 11 Jul 2024 13:03:21 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPL-0000000E1Wc-2LWq;
	Thu, 11 Jul 2024 13:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1gViG0Am9XFir/+Rywn/yPhuXM8ueFi7r8F4u7hLGcU=; b=r9PHbn2iadCNsW8/DN/aTa1lh7
	LMiIiCF0E0EEQsWxkvrbf3AEbP5g0qraIE1dPACZc0qk44Yh+uNYvPtnoMA7t1IV3lG7tbhYL6HpM
	LJ4KZLCOvVedSXiU8pqqNfuhP0816lPZ9tXWFfCIW7ZQqXHKU0qBPxZinuXXY0WRt/n/AmaMomeUt
	ZymDUbeobDl+x0ugoMwVx+idnlLcAc0P+FuqFHGZ2SykspPCUiDKQ47DPQ9717M324dPoIbNZP+WP
	MRDPTgbZcA98P5dP3d99y62GUGKseNQi5/a9sl7kwBjm2uqJKgLwsnmkmJ1VOAVaoUy811VsBXokw
	M+B7j2sg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPK-000BTb-4j; Thu, 11 Jul 2024 15:00:22 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPJ-0003hl-2w;
	Thu, 11 Jul 2024 15:00:21 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:08 +0200
Subject: [PATCH v3 08/15] mtd: spi-nor: macronix: Use new SPI_NOR_TRY_SFDP
 flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-8-99353461dd2d@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=4335;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=tSRHJerrgIY/xhP42g5Z+NiohX0lf8pP4THxPt55rtI=;
 b=POonLqbqEcbbcx3n9p07EI157zH05Ksrj6WAkr7zW1glmn8qp4PctNakp1ER7wxdUQzL5brsR
 ldgQ642NXXAB2a4LC3M2acfCgo7nLhQUi3jOOCFqHE6dT681NYWq9g2
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060023_727139_4BA9BC13 
X-CRM114-Status: UNSURE (   9.55  )
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
 drivers/mtd/spi-nor/macronix.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 090f28e05a5d..d31abdbe916f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -77,24 +77,24 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
 		.name = "mx25l25635e",
 		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixups = &mx25l25635_fixups
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
 		.name = "mx66l51235f",
 		.size = SZ_64M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
 		.name = "mx66l1g45g",
 		.size = SZ_128M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
 		.size = SZ_1M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x32),
 		.name = "mx25u2033e",
@@ -114,7 +114,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x36),
 		.name = "mx25u3235f",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x37),
 		.name = "mx25u6435f",
@@ -124,7 +124,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x38),
 		.name = "mx25u12835f",
 		.size = SZ_16M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x39),
 		.name = "mx25u25635f",
@@ -135,19 +135,19 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx25u51245g",
 		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx66u51235f",
 		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
 		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
@@ -161,17 +161,17 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x26, 0x1b),
 		.name = "mx66l1g55g",
 		.size = SZ_128M,
-		.no_sfdp_flags = SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x28, 0x15),
 		.name = "mx25r1635f",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x28, 0x16),
 		.name = "mx25r3235f",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x81, 0x3a),
 		.name = "mx25uw51245g",

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
