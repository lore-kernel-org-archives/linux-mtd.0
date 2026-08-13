Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71553C5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yt302lDEoQM7uYR0sEcxcvcEA2Cd8y6uAcQPLwK2AE=; b=hresSVqbY8R/VF
	2W0Nzel/oyun17KsQdtt21aeXlhRKNjJlSNDwas675tCBEok7B0BPOumPCwMK1nbD55qrVhlthZtm
	9kHlB5ljCMdn+R/S/3TNdre/HTqdZE5xvhY85hHSdWVmnhbwOK+Ellw/ISC3JxH2EEIpuupVZmxnD
	93xLzZWFsILHk2MQ5HILIsFX/AE4I7czpwlKml0SDCT7OgkUOZuUn1yYU+Cg/qh7llWQwt8srvpKw
	oxY8i1NyPB9WG4VIDTcag5ufMr8HgARwHFPBTSmvKzNnqzNuIqdS23fNEvqhDFJfxtNQ5tzMMCrFH
	0+/2ORyV1nTMdtsjiYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXFS-00000000zJb-0E3q;
	Thu, 13 Aug 2026 15:21:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXEz-00000000yW4-3Zwy;
	Thu, 13 Aug 2026 15:21:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DCD64E4120B;
	Thu, 13 Aug 2026 15:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 013B1602B8;
	Thu, 13 Aug 2026 15:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC3C11C4E078;
	Thu, 13 Aug 2026 17:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0vOnNyGZDVVEMHwxhEXU8qma2QM2Rky8jc9YgFawibM=;
	b=x01bHdZr4txGJyzLNTdz1xON5oO3Dn0rzmfBudCUQR7XW0AToHLg9eyzZmuwOvujtyf0Pv
	OpAlmoQ2RYu2f9gOlzn8WZEOIROUv57KRbg1WXVjS4sD/dn9Y1mXGcwusimvKGXQ/T7dyf
	NP2PEaGLgwU3ElReRAdjfeXc1+RV1736S7jGzeqlgGd8XhTfRpWN9pg6PYdvyQtbymxrNj
	kBl41RVCrAs1G1gTbxeHodIPAewsGn8Q+aNPrNHpmu7Y75XTP6pDCarJQOB3wPcwlGeRm1
	PDoJs0FH9DDZVY69DlaUljDCgfkoGhNbskNB58fcFIaXJ8GqJ6AP7AQsDUg72A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:22 +0200
Subject: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082110_171848_C611836C 
X-CRM114-Status: GOOD (  10.90  )
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

I currently do not have access to any chips from the W25Q25RV
density. Yet, I successfully tested the entire JV family and all other
chips from the RV family. They all behaved strictly identically, so I
propose to nevertheless add the missing comments for the sake of clarity
and completeness.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6ad7d4a7da8d..b4ed41c692a8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -265,7 +265,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q256JV-Q/N */
+		/* W25Q256JV-Q/N, W25Q25RV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
 		.size = SZ_32M,
@@ -377,7 +377,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q256JV-M */
+		/* W25Q256JV-M, W25Q25RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
