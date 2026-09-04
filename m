Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C08C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgzTYW81KTVM5xLfSU8WBI+9yeQcZShO3UlSRwtq0WE=; b=aF+O5xotyS8Vak
	NwUCx7+Mu7QpLbengwSiszqsitb0wO6Wnu33L+NwnU+zJkHY9D+r2+YaOn97+CCZBvlaYZ3SMc120
	cV+PypBfNyUIkXAzdLT3U576/aeKJs6ZBrvyS0zCsTSoMKuexFiVK3/DXzcuq7sY2OZH3ttHUsnwg
	Qlyusvy1fMJcqxYBVe4JT8yzc/945ye+Dxrh26S9H4IHpxP33r4SGstWMLMBYlQoYI0AOXgGN8lcn
	u8BMKU9cWVKZbdVKmfMpl/3sykbWZDHh5dxb/z1xpUOW7KHInoLPSGg7/PREnKGZWSVbBQCJ7yvM6
	m8Jc2MFLcDryy1hmNJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZU-00000002qkM-1g8W;
	Fri, 04 Sep 2026 17:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZT-00000002qjS-2HuX
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PDuQBuqQ5Eqfy+3Z3OCef/VeYuSq4VTsl7Z7MUvQqhg=; b=Ct3RiC+d+6O/1RAAs9dOsAzebc
	lKWP729zK3AZLn6Vv1oo/qiqYqRrvIB1BRqxZCxwIK34fHu9oGnJt7jFCkLSg2zMD1W/Q6FhdKERq
	Bxk/6tOu2U6vMv3B9xW4Fyl/jfNp2kKMQXAvjm0ji96jQK5VdMbjcTFl/STXAaI50XQG8WKuKRd3B
	DNe7/WhXe3SuzJydgUNMtma5PkfTZ13RCdg9SBVEyntlkAIxzI7nZHD7XxQU8qql9W75X12Xklgbs
	7m4So98ff4ezA8/gknWm5l+GksGvPkvaH0Rr3jqmet/qMKbTsYP7OGNmeUy6mdmsA+aCNH/7EYpU2
	rM68KZ8w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZQ-0000000EKqk-1zCO
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA2E51A19B2;
	Fri,  4 Sep 2026 17:19:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE3226057F;
	Fri,  4 Sep 2026 17:19:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2A3B11C79982;
	Fri,  4 Sep 2026 19:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PDuQBuqQ5Eqfy+3Z3OCef/VeYuSq4VTsl7Z7MUvQqhg=;
	b=d8MIYvv41uWctGK9Ey3UGSJxY8Vxyhao5BxQ22KaO29RYI+zyLVGlznsIFghKH9QxL2GDF
	o1KfctQcJPfN/YDCwvN5DSQZX98M3pWqHRD6K8AdtAh8tjbcv9vVEfxA5iR+9nMV4igc8P
	9w6OV+RkznnTd+DgUWC8VTZE15UUo5pvq6LpF5ToR1unA28OltGGjBfLwa+X57cj9rnuqw
	A678NgGCAfUnjmncCbOTDnxC815kAkSyQCuVtFOHB/qQhspQlhW5bWRH5zo0CFIgtCFiCE
	bgK+lZ0wrYbV9mRHL1ef3WP1EZoFHeDjtdoU+VJvQb8Un4ZwiJCAETpKrJwZ+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:57 +0200
Subject: [PATCH v6 04/26] mtd: spi-nor: winbond: Move W25Q01NW to its right
 place
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-4-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181920_833816_739EA495 
X-CRM114-Status: GOOD (  10.12  )
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

Chips are sorted by families, and inside the families, by density. The
second ID byte indicates the family, the third indicates the
density. Move W25Q01NW to the right place.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6b99d9488c40..13a2fcd703e8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -300,6 +300,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		/* W25Q01NWxxIQ */
+		.id = SNOR_ID(0xef, 0x60, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
@@ -365,12 +371,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
-	}, {
-		/* W25Q01NWxxIQ */
-		.id = SNOR_ID(0xef, 0x60, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
-			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
