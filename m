Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90CCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6QVG4BmFC6hWLpcEOWjZDgkTTvfJ/xjjnZyu3eCpw4=; b=PKcDl8T7vYsJWA
	qdLrZHDGMwvyeiiGd+FMzH8IyghT24J/rm5Dy3xqRPsvhQMU8dim2fLxxc0/yhFR2z2ONH17MMUH+
	G3+Gwjc//QoK3nXLqY0bMxj1wHlf/juiRBdSJfipzHCM/2vFS+CzfyeZpjR4XE+RF+0Pi/WHaFnBx
	5bOfX5sF5unYg5p/nKsNa/Q+KS/xxm3HM1S1f4ymxYFEckbIBvl0hBeNCAFtfSD5ZTGfOjptDuG2Z
	HPJI4X7M1vvib2gALZNmzM6yWYaFTtNlLGW8yeX51nlDB1hpgzQ0aNqFq9+WxgwdO1SKIN1lbhowG
	IYEZRld0kT8XSFpBMbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM4i0-004WxM-RG; Mon, 21 Feb 2022 09:10:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4RF-004Qjv-VQ
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 08:53:00 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D245E223F0;
 Mon, 21 Feb 2022 09:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645433576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOr1V8e1egjKEQO/tpfMSEdK5Q3J9NZ9drx5r7CgO00=;
 b=pM81OIJTacIsscjAGjSaKnGoxLfY/wysKcl/TsSolLi7EAdB84o+Vj6lQGJs/ibgIxVLn7
 qLosoBwt920oJjvcYgkniNPp9QaVX/rUzr+gVCscOhg12oCUzAvbUbxY4Vc1Iz+MLqiFHy
 IxN92yfezJWYoL/BksN5S6mDTb7n1q8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 15/32] mtd: spi-nor: xilinx: unify function names
Date: Mon, 21 Feb 2022 09:52:19 +0100
Message-Id: <20220221085236.1452024-16-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221085236.1452024-1-michael@walle.cc>
References: <20220221085236.1452024-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_005258_193553_4EB8CCE8 
X-CRM114-Status: GOOD (  12.51  )
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
 drivers/mtd/spi-nor/xilinx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 580562bc1e45..07dd11788df5 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info xilinx_parts[] = {
+static const struct flash_info xilinx_nor_parts[] = {
 	/* Xilinx S3AN Internal Flash */
 	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
 	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
@@ -26,7 +26,7 @@ static const struct flash_info xilinx_parts[] = {
  * Addr can safely be unsigned int, the biggest S3AN device is smaller than
  * 4 MiB.
  */
-static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
+static u32 s3an_nor_convert_addr(struct spi_nor *nor, u32 addr)
 {
 	u32 page_size = nor->params->page_size;
 	u32 offset, page;
@@ -73,25 +73,25 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-		nor->params->convert_addr = s3an_convert_addr;
+		nor->params->convert_addr = s3an_nor_convert_addr;
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
 	return 0;
 }
 
-static void xilinx_late_init(struct spi_nor *nor)
+static void xilinx_nor_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
 }
 
-static const struct spi_nor_fixups xilinx_fixups = {
-	.late_init = xilinx_late_init,
+static const struct spi_nor_fixups xilinx_nor_fixups = {
+	.late_init = xilinx_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_xilinx = {
 	.name = "xilinx",
-	.parts = xilinx_parts,
-	.nparts = ARRAY_SIZE(xilinx_parts),
-	.fixups = &xilinx_fixups,
+	.parts = xilinx_nor_parts,
+	.nparts = ARRAY_SIZE(xilinx_nor_parts),
+	.fixups = &xilinx_nor_fixups,
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
