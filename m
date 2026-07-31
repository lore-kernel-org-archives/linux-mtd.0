Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F67C54F54
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXP8JsIfLrboa4OXkQKKyML6ecRPR4Uub2sJAkG4AVU=; b=ucqxOoH84VysJ7
	aFmKiQ9AzSlgrrYPsHbciZsi9n2LTiKPKd/uDu2fmxvEj3bAMbvyqdWINjegS8MzSDNorWEosixld
	GksohpV2NCFyAbT5XV9hnLrj3Qri8LXVmC3KVBP3BmmHQ6H9JTbelOprxQ+dGrg60J8QRMQineu6x
	1/Ea532/fdqUoRLV1g1TGEhgmjPxWIoHMmcAFkBmhogELoMiMlxRewFhavra037Dc4rCvSChOqrnF
	I401wOAQK/eYOzcnLqMyDnLTNYNuoTImCIy5lQ2a14sKUKAEHEUwSJdjqgKIe+VLkTNw/GE0sNwxv
	3pkV8agB4vX2bPB/Exlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplxZ-0000000CRrT-3thF;
	Fri, 31 Jul 2026 12:03:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplxR-0000000CRcX-3HP0
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 12:03:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34F6B1A135C;
	Fri, 31 Jul 2026 12:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 033C46039A;
	Fri, 31 Jul 2026 12:03:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB25711C167A6;
	Fri, 31 Jul 2026 14:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785499399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JM1R7ASx3L+nNtBQQ0JAlnIStLMKyGGuZzojRmGSwPQ=;
	b=UzL/79FEfokh/qhWUsnutqpjyxCaKfw2f9gVBKfe3kubisOA7DU/3TC/0R4fkGOCJwScGR
	F//FiWayItHg+x5jjce50cCYft0SVfccbfLBH8e433Y7/1195l3Zo0La+wwuSpve9aOFR1
	wOup3o1+h+1yypWnCotWpW3V4eW8Fjj4kgehn9UH84IBKBp0e1xERd84jCxdg2qQ3MXv51
	RicCCFJeIRn/E2mbUFQRjzWLa/PWf4nLudiWH9AFomqeRaOMpcY1fEtN7DJcgsE5dL19vK
	lO4AibWRjN3YasbH40dnT9sA5D3JX0xAVm3xzEwlNZe6KbrYQaNH44jNzn3Tlg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Jul 2026 14:02:14 +0200
Subject: [PATCH v2 21/23] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-21-2549ef1b1af8@bootlin.com>
References: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
In-Reply-To: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_050322_000346_487897F9 
X-CRM114-Status: GOOD (  11.11  )
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
all the other chips from this family have the same locking pattern, so
we can reasonably expect that these chips follow the exact same rules.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatiblity reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 73f6c26f81d7..ebe5c2474234 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -226,7 +226,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
@@ -306,7 +307,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
@@ -332,7 +333,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
