Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB379CD6E50
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qseTaJejh/7Z41Iaj6gCw2oquFoUy5a0zeD2muGAiBM=; b=s6GsMyVYhbc8qt
	GoOtWR8Vn0ulxRZ50pV3XDfSfHF1lCDkOBvUc+5S27IqUY9JZfa4Yg5VgP4vY0+jx1cL5sE4YgAdP
	zddGsxNNcq84UWE6zU+UegrS5/dZeArnOjzs4DXN0XX4gQDyGRmVM86SN+NMFQDb4zCfNBCKARsjw
	mC+uKj5n8m1lUOd5S1XpjVeGzM12lYkcEtZZJKd0fC3nawCxjB/+7LwN2ZlfklODUdjslUKOhcA1C
	NvYegMk2a9PDCN+jpqlKvkA2FEOVQ6ZyPXZC09UnIKFKI7YMR4yg0MKLtcTmq/TqCceK0xH6dTkWA
	4S4YJQ8wIioMWpPy79GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3j-00000007gT3-3PwK;
	Fri, 29 May 2026 15:23:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3e-00000007gJ9-38Jh
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 May 2026 15:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IjSPN9VwA7YTilMOtm3qT0LxYXMmLRFNCUb/cFx9vIE=; b=taEedjSm5Rnlj94Qa5QjmXGojB
	pvFL5YwlwTOgYcifbX2077guofRMBY3ou0BDvG/kWLvhtjGGoofLAIB5NSv5vts+bgRs7UnmPoX7c
	6q6oBDrAPMgtkL5kTiSldAU9OdbUoANaAQqndRqSDVijE1NA3dxfFVxmVI5EwEjj7Mgkl6mJry7Fc
	Z64hRE4LsZCRFbnmdShxeL3LknNAS1L9rY1BQQ5RaNJ/c/9pGwPzQChjzyI5I6VdqDlmI6Byuq2fy
	dhaLWzc8+Q/Mvv4Q1qHyl1PSAAXtRH3ouzN37mXLpOhTw8ZTEYDCIQ2nl+SwRP53Xww3qRgRfxfG0
	hG/8rteA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3a-00000006L4Y-15dX
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 916421A373A;
	Fri, 29 May 2026 15:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66BC3601FA;
	Fri, 29 May 2026 15:23:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EECA910888CED;
	Fri, 29 May 2026 17:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IjSPN9VwA7YTilMOtm3qT0LxYXMmLRFNCUb/cFx9vIE=;
	b=dyupbKuhUdaU38QmR5yhxzGzKZ1Vj3uXEV8JxXnRQUbSywgQvtMhYqj6rbzofVHukznUQ2
	aXNzrCNPcoSbYqb8xhRHCnTBZYZmvMbKsrx/aXyhH/jzNaDD4NYYeL3b6cxPVF42PnyQ45
	J0urkOwq9gdovKBAb11MzTqq6s6H+UrBo3A1suxUzc1rMnxlBDpiT91ClHr3ChFmGVMtq2
	Ga3rxh73FLpgOBEp2F8ckIT6DvN34LMHakkv+wQIrLEbrncE7UPGu+ghx/cEemWxlIreu9
	tsKTCqbsqaHUmSnOaBquQjM/eBoVrdFySOcefGt1g5EdFNk+RKxFi8WWrGChug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:49 +0200
Subject: [PATCH 29/30] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-29-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_162330_416602_82D5917A 
X-CRM114-Status: GOOD (  10.27  )
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

I do not have any W25Q256JV-Q/N/M nor any W25Q16JV-M chips in hand, but
all the chips with a density <= 256Mib are older revisions of the JV
chips which do not yet implement the 4BAIT extension table, as such,
they cannot advertise their quad page program capability. We can
reasonably expect that these chips follow the exact same rules, so add
the missing flag.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index c1dbdf7610fb..08fbbc2b948b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,6 +217,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
+		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -287,7 +288,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -303,6 +304,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q512JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x20),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
