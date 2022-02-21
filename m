Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EB8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oyw9LIZKNIK43KczGX4WnniZ5RRo+rgCHR8w1XsZDcw=; b=Q0Er4CLtuFsPDY
	j3FYJv5EGLVFqZxbCwN9smujYOiYNLBIPSIUD9o8GiXe47aBVIHnZXJVbZwIcnpk28FGn/d0/Mpi5
	2Uin7wVui4ifJuzy/7+tbKK3Bdjv1DzYtWyYvKsKPY1RAasr6L2bWMaZhsNYzkCiUBL07LrlS/+fM
	QEbP4D3YUeXLHXLHlfk+bxBx6xk8LrK/K1l59lMw1Y8tYx7LIvVBh+mAeYR+cf0f31Xye8DsEWiuF
	DJ/0xFjfQDGCh9FhiZwU0QNqOThKe6XWqkoigshdEP5sGKw6gw8xhn3mw+2Ve1ZDvnl9d7U4e7HLm
	/BrO3M5StddjAiHjZFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM7WJ-005Yth-Qk; Mon, 21 Feb 2022 12:10:23 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7US-005XtU-49
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 12:08:29 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EEF6E22438;
 Mon, 21 Feb 2022 13:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645445303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+5cpXOML1DyD30ajFcyeJsXitD44VhKMRI6U4XESAo=;
 b=VjjCtB5b/9ISjzdz7m/52fzJO1Z6ZFkUZ8/UagifLuS3+tmoSajbnDJdfc5zSvwjBYtsyh
 9bgdYLB7sXtcZCM5phZNfHUZ2NowPSVRUDHVnQ3qeNOanjupSeuq7JIYpYDV/NGtqUsO0s
 io3jYTpiQpVz3aLISWX4SVLUufq7wGs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 08/32] mtd: spi-nor: intel: unify function names
Date: Mon, 21 Feb 2022 13:07:45 +0100
Message-Id: <20220221120809.1531502-9-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221120809.1531502-1-michael@walle.cc>
References: <20220221120809.1531502-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040828_392804_553055A0 
X-CRM114-Status: GOOD (  12.98  )
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

To avoid name clashes unify all the function and static object names and
use one of the following prefixes which should be sufficiently unique:
 - <vendor>_nor_
 - <flash_family>_nor_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/intel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index d64e114e9fb4..9179f2d09cba 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info intel_parts[] = {
+static const struct flash_info intel_nor_parts[] = {
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
@@ -20,6 +20,6 @@ static const struct flash_info intel_parts[] = {
 
 const struct spi_nor_manufacturer spi_nor_intel = {
 	.name = "intel",
-	.parts = intel_parts,
-	.nparts = ARRAY_SIZE(intel_parts),
+	.parts = intel_nor_parts,
+	.nparts = ARRAY_SIZE(intel_nor_parts),
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
