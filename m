Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFED2C5518F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4N4D4hLTu5JT6HlZwps3TD3NUEB4SaEubvkgqNC2bA=; b=zUCXP4gVkZBOoB
	OK45sfOqkFTqq0UIdYa6m8ZWwRcKGCpHeqyI7SiKulNMwfr1YyA/+76+5ma2afJCq0YSj69WzuKzS
	oOTbuPQRB5UWPwMgYoorNUs8KIn9lFf7iewTLUarr3bEiB6eWo8i2wbCZio25SRxVkHdvZA41Gat5
	5Uz3eqkzZt5et8yb9MvhY8cYydp5n6MFp3GmXUDPcRUAj3zND3om7fAjbJXbpkIXkPXXhZ9tvdMYK
	1blJjZ/Qqzn15fw4yX6cKQyUMptoutnsg0eE++BVuwPUc8NBBUGWGZd4XrdW4FHErT0DZ7TgkgISe
	cbnbHYa500hKLT76xF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsa-00000001cBj-3kTf;
	Tue, 04 Aug 2026 11:00:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsX-00000001c6G-3iCp
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 11:00:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66A951A1402;
	Tue,  4 Aug 2026 11:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DD186029E;
	Tue,  4 Aug 2026 11:00:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D4A411C32B2D;
	Tue,  4 Aug 2026 13:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xFCGZoKQiD9TzzTrzW2O97nG3CHuVvL+BWagyTusTuQ=;
	b=d+HeD+xOJRBlLgC95/SrGeC5TIrRE39t8OtAShpE/ETPcJpkdYtN3ILhmvrMLWfgVAvBbZ
	EXoV9/chxx/0mcg9i+6ianE6JtykPI2bU2GN/lX7B9J9jD3x9xLEie6M25GQIpUv3Ipd0q
	aRvpceH1KJSAhpWyVE7osbphFVIIXWUqSnJpo1lbh4Y5Cwwh7b+ITDYioNjnhMoVGCPbTJ
	aHZ+WnGEj5AWewqBarHxouhvjntyNTLL9DziIfKtwOoHQ++722F65s/sr6+QfFIhwfn/cZ
	NiQk7Pk/I6iBLtl9hleFKoe5P4l0M7nH/MKfyd1x7L1OZ2Ltr7RzdT7iCRoeIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:13 +0200
Subject: [PATCH v3 15/27] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-15-542ce107bc92@bootlin.com>
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
X-CRM114-CacheID: sfid-20260804_040014_197954_D4D85920 
X-CRM114-Status: GOOD (  12.27  )
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
