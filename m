Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B85C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 01:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipXxeMn5ajJqWlS6PulCJrtGsXrJS0W7Tz4i0q9/rLA=; b=OficItTxgwlC0R
	2NLaW0rXdBRJgTAYT8K3KsoszwAgSv9VZDuuZWZr8dySlnaUoOFrCL3aAgcDRf9cUIAawKnHdRASE
	VWDNPu7AAeBcaoTA/imPe2BruTGAKLh2P/+YcanehHU8cP1bpcIHGGjQCGUM7aunTMDXrcmWwOPPY
	qy1Rb83YRhB7zdORPJzFvsr/tzfp52SsFgveL7LgGPBMCUYJkdiXlVgWO/UkWqDicdNL+QPYOJlaN
	UB7n75nSI9iLw1WwegKTX5/gw8ldDT3QQPxcc+58PmHAOuWBKuF0vpL55T8zCcHl2FCQl2n7O+bwk
	OGEhsnXA+BrH21KXc8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1eZL-00Fyu6-KY; Mon, 27 Dec 2021 01:12:55 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1eZE-00Fytl-Tq
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 01:12:50 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640567561;
 bh=pBGw2in93wvElXpOJ5wOGA09re3QZeq3M/lNxQ0hx7g=;
 h=From:To:Cc:Subject:Date:From;
 b=mb+r+VAqV5uN65zQIlBhGUxQ5emzGx9MxNQE0r8rrKrO8/ei2ngOSdU/ITjsTDEW3
 ncre2MvvfWQFbEbe7xYNy+QzRpgBd3cwrD7JYMNZQTP5PnXes6jUpoF1PnqQQRlbwR
 X6SAqO3goHeM6CmKg/f+zFFIxJaRR38bXsH6yQ2UUccPN2M28ffKDIjBnTRKKwturR
 xu+Ms9UGcC9wsol6BnkD/CdqbwN4IJ6L+GW4XqUGNI5MEb65vV8PvE+ZTDsUPTr5qF
 BlNKaNeAvwsXxCuM6VjTC0lm4ic/dEhr4772YVB1zbLCMcvcwlgkljT2PN4X9QfIKs
 YDbC/F3WpyjyQ==
To: linux-mtd@lists.infradead.org
Cc: Nick Hainke <vincent@systemli.org>,
	David Bauer <mail@david-bauer.net>
Subject: [PATCH] mtd: spi-nor: fix reading/writing of MX25L6405D
Date: Mon, 27 Dec 2021 02:12:30 +0100
Message-Id: <20211227011230.1168054-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_171249_308985_E73FDEAC 
X-CRM114-Status: GOOD (  10.56  )
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

From: Nick Hainke <vincent@systemli.org>

Macronix MX25L6405D supports locking with four block protection bits in
its status register. Furthermore, the chip will not work with the "16-bit
Write Status (01h) Command". Add flash-specific fixup that disables the
SNOR_F_HAS_16BIT_SR flag.

Tested on Nanostation M2 XM.

Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
lock()/unlock()")

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/mtd/spi-nor/macronix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..6dd148e9f660 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,15 @@
 
 #include "core.h"
 
+static void mx25l6405d_default_init_fixups(struct spi_nor *nor)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+}
+
+static struct spi_nor_fixups mx25l6405d_fixups = {
+	.default_init = mx25l6405d_default_init_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -41,7 +50,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		.fixups = &mx25l6405d_fixups },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
