Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAFC5AC80
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7aPvuD57bLXo4EOAmtNcWU4tdLcLMDZJlhCIYtw+uI=; b=QPQZDYRao9ajvz
	TkfAlWZH0esKIHqqgkPDbGJZAQfMElWGHYwQH5wVRozrmO5i9Taq6jS169tWI3wlInSl6NyCxivJV
	RbnzrdPfvsStDO44KfLHaZ9xD5JPIwUcdvkydNOObYb5Q3ADNPAcSR9qMzX0xU9c1VCZDnqCs/hbh
	5RAtRooHmMgepL+sW6ZZsc4fQ/+yMeKbSnf1J+0qs8nSgDYUGaoWncvuotO/9Q3duHAMm360vaVae
	SYn4vMCx/4oorzJpNAkqFNBu8RKbpvBf0qNfgnuiCD96Jog7r1eC4tI2/GbeWlfA495ReeRo5HyrP
	ChQLozDieiiVro2pi37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbn-00000007cwj-1fqp;
	Fri, 07 Aug 2026 10:15:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbZ-00000007cPx-1gUI;
	Fri, 07 Aug 2026 10:15:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F3104E41136;
	Fri,  7 Aug 2026 10:15:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BDA5603F0;
	Fri,  7 Aug 2026 10:15:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 985E511C3750A;
	Fri,  7 Aug 2026 12:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097706; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YIcQIYOb8WRakMR4QF2N+EU56xSs7c72GvKGLdWLtsA=;
	b=tY32tZdIvdjua0uLucyYbNN+MwaN5GEkXkFNMmCmNbpAGT8WV/deQcLmsH87AKWlk3t+E0
	Rlvi6Io3aWgUJu//FfltORp/wF1WUM3tiOOJtHJy21ww0xQlGi6I5PtsV1d1Y0GC1hmfFJ
	NM7qPiS2nghFwIsEhFLjFQ6JYZEUS/aVJw+kFo9fmffm3Iv9ukS+4W34bibVeTTF/8y7iS
	bmr4iLgVJ4/bvi7mC7qxhB9DThp2kgS1nF9OkYOhFMO+pwMTdeirylrqFXO2KVdIxf3zK0
	6AGGyo0ooDMhYtSOLhCLc2k2jN77ag0d46fIO/lPaF/tpB2ncf46eEPMlvpXlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:14:09 +0200
Subject: [PATCH v2 17/18] mtd: spi-nor: winbond: W25QxxRV-Q/N/M: Add
 missing chips
MIME-Version: 1.0
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-17-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
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
X-CRM114-CacheID: sfid-20260807_031509_607008_A25B8B4E 
X-CRM114-Status: GOOD (  10.62  )
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

I currently do not have access to the following chips:

- W25Q25RV-Q/N
- W25Q25RV-M
- W25Q51RV-M
- W25Q02RV-Q/N

Yet, I successfully tested the entire JV family and all other chips from
the RV family. They all behaved strictly identically, so I propose to
nevertheless add the missing comments for the sake of clarity and
completeness, as well as the missing 02JV/RV entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 5e3924345667..17d889709d53 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -258,7 +258,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.fixups = &w25q128_fixups,
 	}, {
-		/* W25Q256JV-Q/N */
+		/* W25Q256JV-Q/N, W25Q25RV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
@@ -278,6 +278,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &w25qxxjv_rv_fixups,
+	}, {
+		/* W25Q02RV-Q/N */
+		.id = SNOR_ID(0xef, 0x40, 0x22),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &w25qxxjv_rv_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
@@ -361,12 +367,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q256JV-M */
+		/* W25Q256JV-M, W25Q25RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q512JV-M */
+		/* W25Q512JV-M, W25Q51RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
