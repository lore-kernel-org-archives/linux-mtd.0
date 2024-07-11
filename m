Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959AFC3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhaZa/Vu9dYBVj0LjpI1jfi9JHATj79ZLEmK36Vgrs4=; b=iRMRctNBtyA4zB
	wh0yNU+p9K8Byv1gVgXXQqLUmw0EQbmjNowxdxYLVeCHxTROpksTx1WtJzfHvEmLcm99/JeeRW9Td
	AUIwrlwPpP0+x2fpklVKBRDaDgSnloU8zlauCzPjJKV3nBK18UyKu1IkT7LZj1DTBxEEgZ+D2CGkb
	+eXyBtQWasXkmtRraZPtfM+IKMjlzaDk+ny500z3Avao0N8x/3nQxVgUcMqeMPSiI+ngY3pih/rI5
	2TlQW3foKFq4refUUhs/xUr+FPtevNoqoF3NXJLrnTIKwDk3xxDtoGnhD46LG3btvJfR5ClO+18yd
	tm1L7R5hv4qqpNyca3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtTI-0000000E3yC-1z7x;
	Thu, 11 Jul 2024 13:04:28 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRtPS-0000000E1Yn-1IOn;
	Thu, 11 Jul 2024 13:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Iaiuq01WZqY1WjmLd9MSC9VUF3H2g1ho967hHMq1cSs=; b=lNMTe/g+MPV27Y9bXCVzRVwFyy
	Pk7fyTn3D8N6rxdGkyx4xsUU0c426emWxGcBgJThXWQf9wd0KqBw3kfZq3f4Fc+bLlTh6hQdmcojX
	nd2C8wiK02xcBn90n1LwfgXXKBTx6T2/e/okYN80vytpdG0Pb0DgNnKeqTAA3M5y5sDN6mQ+Obt1H
	PlqeINYoX+kuS586+pTkugm/DrTe7lJQ2mX3PEK2OVOOJ41d7N7uxxu5gG4pNHjnYFYxLK3g4D1Fq
	bQDpI+w8U54BEcdqARDg2jFby0lP5Vy4l78jCY8DvTPNAcfm5guQ/ADYp9feglW2H31jK6UpSvj3c
	XIT7sLbQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRtPQ-000BVs-U8; Thu, 11 Jul 2024 15:00:28 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRtPQ-0004e5-2M;
	Thu, 11 Jul 2024 15:00:28 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 11 Jul 2024 15:00:11 +0200
Subject: [PATCH v3 11/15] mtd: spi-nor: sst: Use new SPI_NOR_TRY_SFDP flag
MIME-Version: 1.0
Message-Id: <20240711-macronix-mx25l3205d-fixups-v3-11-99353461dd2d@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720702815; l=1495;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ljG3r26u3NWW/rRWWrTsFxrJ5qKb4+lQAH18feZYI74=;
 b=kuHOxZiK5BJO4gpOctj5rGZOrOg18d08fVjYk3yinG0AKzGrCIgyMRc89GYjVMEljgg4zK3eE
 Yc+x6CYl0FhC38EMd56YnQrydnA7l9yLh0sblAlMTAAolHceQo45Pl0
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_060030_384297_96BE3BB7 
X-CRM114-Status: GOOD (  10.28  )
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
 drivers/mtd/spi-nor/sst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 180b7390690c..bfebef62dd36 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -146,7 +146,7 @@ static const struct flash_info sst_nor_parts[] = {
 		.id = SNOR_ID(0xbf, 0x26, 0x41),
 		.name = "sst26vf016b",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xbf, 0x26, 0x42),
 		.name = "sst26vf032b",
@@ -157,13 +157,13 @@ static const struct flash_info sst_nor_parts[] = {
 		.name = "sst26vf064b",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 		.fixups = &sst26vf_nor_fixups,
 	}, {
 		.id = SNOR_ID(0xbf, 0x26, 0x51),
 		.name = "sst26wf016b",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_TRY_SFDP,
 	}
 };
 

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
