Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46525C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4N4D4hLTu5JT6HlZwps3TD3NUEB4SaEubvkgqNC2bA=; b=wFfPpRyuBUnrXM
	vPxgepRHOpLZyId28+tKr/3SjnIvwK9cgiwJB95M8yn7ncI6YLGQsnO2E/uU2K9Hdn77T3bgBP7WG
	a8VFGr8xcyrZk8L+dEc8srqxBcFt6qHPqZxdhjggRkavOS4liQdClYcQY44a/AX1gNHkFx4qomVzH
	w/WRktgwbjobWTPz3lctcdjK6Sjkuhb4kmQNdxNer6EOgHyHQSrdQt/XIUIgD1OFpGoIR++llKDuH
	ywjbyViSNOjavspoqrqj7iO0qRNmXqdx7p5Uzk5QoCyPzmscY+icTIDT/FHNrB7fqsZddl3GyW22S
	ZB85Mzi0AEKpPJMQY1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb1-00000003TB3-3FuG;
	Wed, 05 Aug 2026 08:03:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaz-00000003T6u-2hLU
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xFCGZoKQiD9TzzTrzW2O97nG3CHuVvL+BWagyTusTuQ=; b=E9bYZ+4fFPnSujoUO1SU9mpgKg
	LtTdSjySG27mLmANROEl70QaOXKmUxREPmWapJqjjVmu/fGI/YA+kuGqPl183+pLx7C7Ei3EHPlXA
	gN14yESyuzH3ltilN+095YKJALrVCOaj1jh3JFIKLithZKDV8m+uFCW8si++X/UHpNnQZRW+IDwwO
	rum4qxMHMOK9ibglesM/f0S5wVP2uZNfEq+tjl4Jp8XxThganYP2ULd5guNpK+Fm27tyXudNZFUOV
	HyfFCiud/vdNFKppaL9ywcIPzPi8oU83WI2zwxhYY6FrYAHNQWjHRnEQPa0hoE/XFmhaNKn5sCAQH
	FEUGZFGQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWar-0000000AYpG-3Elj
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 253E04E410F2;
	Wed,  5 Aug 2026 08:03:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8C15602AB;
	Wed,  5 Aug 2026 08:03:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25D5911C34363;
	Wed,  5 Aug 2026 10:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xFCGZoKQiD9TzzTrzW2O97nG3CHuVvL+BWagyTusTuQ=;
	b=xDi9PLFKb5f51a2LN75IICi3w/oZZl069EutgYZosqKUbFkamXB3m1/A7BXnrQFXLYIjaF
	9ZMNB8QogHDcVuNYBsgl9nHK4blg6whoc9koo6k9j7qpzN07yaZZffijKThoE/3Aj32DtC
	2iWkUfITEqjfzbrsFs+mqRcPppW6TxWqq4bjZ4Mj+S5S3FNvXzTHKCxLyGpbPQ1Krngllc
	5Hw8hQGu5lA6ae3Xv26Cv5wZPnZvDMomB6ozNm2ln3zsFm/gTeUuY07TVZoEd90NIWfBU4
	9M4m/i/PPcmTmcU++RHxFeXMAbPgs1ZtA8RXh8PmaJiJ+PJ4Y/yFXT4Hn+XNvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:41 +0200
Subject: [PATCH v5 16/28] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-16-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090317_954945_0B3A0A87 
X-CRM114-Status: GOOD (  12.25  )
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

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the bit remains disabled
for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 2cdb4acd9ecf..b250a43ad4e1 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -226,6 +226,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -300,8 +301,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -327,6 +328,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
