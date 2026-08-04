Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275FEC55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZq7LMoVDp1s0pqXHQ538T+F6HgXhmA8/xII9BSfrio=; b=oI9iLGZPBDYWUL
	QR/3kENHWhA5iF5ZJf4QO60i7NZ3BFPWDcPyVVNzZmwXHZOld5ImoafwFFEjo5Bpn2H4sGAxhqtxS
	Onqdv9w+zCngTHbJzwDLa1stW+Md5y8CyML/rTWr/N0XfpFl0vIYRfZtPUNVSkVpw0r/VUAcTbqBN
	l2q4EBv3Yb1FXqTYaugGn0QZyipZ0iZ85PNzEPMqYYLesRbvdepLFPCaAR96r3oJUk6laaShAflTw
	pYpi0IrJv8KKoakX41xiapMepgdaFCFZcgaq7AiBk1Lml4DfBgN9glJkEp3AYkKTOkKZOLQpIv/Zm
	JQWDafv49+wvs8CDp8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsq-00000001cd7-3hUj;
	Tue, 04 Aug 2026 11:00:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsm-00000001cTE-3X11
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 11:00:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C4E54E410DC;
	Tue,  4 Aug 2026 11:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BA396029E;
	Tue,  4 Aug 2026 11:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B709411C32B3E;
	Tue,  4 Aug 2026 13:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Z2fZ1HsvRf2oJCPhM7cvSNUBhizZXIjDtniecho4UM=;
	b=opzln06Px8nv9+oLv/DRD55uTLgrzh6nkCB7PPccbwsN08ERuJMb3TB577P0u6JD4KipUN
	pW7gs+8h7fvHbCh3NT2M6pRTUT7CjFOfzkwc6jPMjpkISRZUu1efASH7cJebD65ODoXcua
	+5b+FrLs/4AGOHKxL1fyCHq7AcZnF7swzRORI9utfYav1D6y02j8SorN7xkDcIcRrUhGiU
	NMIDCLC3vvvwe9TrF6qtZwJDffhtUxTZoXLtc1OeECKOGR7A59Fa5hlzUiKxv/0e6Tn0aH
	FhDfTz4lzqhfbDVR1IK+bdREwwEd8AM/O+JLffSy1jBR4MVzl0yDxwtbuXSAaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:23 +0200
Subject: [PATCH v3 25/27] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-25-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_040029_052661_1A9C936A 
X-CRM114-Status: GOOD (  11.44  )
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
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 5ab7f4860295..6b21fed74f4e 100644
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
