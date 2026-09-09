Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E10C79FB7
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVn1NweoNNPnZT3ddj3kYjzea5eRNhlfwU6pN5xN0jg=; b=jsYi4s0HohAZlG
	cSQCbUS5zZTMUpKZQ254daKKqlNepA3Oi/mXSfdDUh6n6DsYAEhgEtu08NIcSCGNCtupi6L+Awc8c
	ZGRkw35I6fR2tP+Kvjh4bSU/mJaUiEBQuF1qUzmycINgzIS4L5sv/uD0W2YkScdmZBibfx9B4dnib
	riH4qd/gHNbfReXteW9kkbjdyd1wFcMQD8P5oiikz59QcJn7LnjDz8V9M2nmJGUftYE6/inR+CnqB
	DtJpf3zdj4KZyNMnqAeFYzot2/VUsXatItLYppBXOidgKATAiXzjaYCrNVMdTVZEzTbBbYQJWjL67
	YZEKhyGUJkrNuhLGWepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KBl-0000000C9Qd-0BKt;
	Wed, 09 Sep 2026 15:26:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KBg-0000000C9Nh-04s5
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 15:26:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E6744E415B5;
	Wed,  9 Sep 2026 15:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C6C960448;
	Wed,  9 Sep 2026 15:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED59F11C7AF93;
	Wed,  9 Sep 2026 17:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JX145afNqmwx7gx0nctZs7OY5qzDSHefsh4nXWmrx18=;
	b=0jXSHp738jOPFFhXTRBsYJT11m9ADic8WCOnEbPw6+7quoC6NfD1SF4gVolzU2+uHi04p7
	50qYGeMC1AvfNxzku9HKf+uDvWlfXv62TG7FOESxcf3RaXmIKeG2HcePOw203f5qI6a041
	6xSS4J+3c2VHL36b9xCYx/k0KAX6oZR0a/rGZq1g2AymEd7Y40R0F8fFOcld2d+hkF7Kck
	nJTIgyGhEO+8J1sx8YCD6cyNmb8GAqMHCIt3u411Bpc7+IyDnc6a3URr9IZoWKnsd9GpFJ
	8Ee7faOAXJL0qF76i76uuydt9sEgTfZ2U5BVwXoBuaWNwqP3ZxvZoJIx+122Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:40 +0200
Subject: [PATCH 09/25] mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-9-c1b20c39dd1f@bootlin.com>
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082612_459577_3FDF52AE 
X-CRM114-Status: GOOD (  10.76  )
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

I do not have any W25Q256JW-Q/N/M in hand, but since all the other chips
from this family have the same locking pattern, we can reasonably expect
that these chips follow the exact same rules.

Add the missing CMP flags.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4ffc7a39ac6d..62f69e868d7d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -348,7 +348,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-Q/N */
@@ -441,7 +442,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-M */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
