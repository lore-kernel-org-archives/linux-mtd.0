Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A42C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYpkJ3W/lG16JagnXgy98aDMVFlSImNQzXCcJg9oYV4=; b=gCZw11UKPplswi
	1HEwdv9zTOOAvaxlYgJ5xwFtoHAFcKY1X/cQYzV+7PvZdrZRLWBsZnnFESVmj0BMSWvBcIYn9IV7p
	R+PlTmShKCZUKTkVoAAr2YRJiDiYy22xYOGSfZxGVUdXlI8lQP9Z3KUMV79URZ/d6B0/JFK2FazNP
	3lE4Lfy0tMcEs/jf2YXdOH4SrucD1AQKczG0Vy38WBp5XBfRwH6VBMNlNgAvnVR1wRBNwFr55Nush
	ex/cDoNq/Ohkjz+DvA8C9dwnywxnP8kksWaSx0RlNtbbIJwUAQUxMvzJUCWQnwxhzJeVfGI36vGqd
	XSzm6KovFOnOQVxGa04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMs8R-00Ed5V-6c; Wed, 23 Feb 2022 13:56:51 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwH-00EZUn-K9
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:20 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BF3872245A;
 Wed, 23 Feb 2022 14:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbHvy8hevO/uqaI9Zie2Nd+ZG6Y7RWXmci9VDa4GFEA=;
 b=dudIoW6kLaY+U43BXBdxaZk9D42nGi2Yi0aTL8+vl+RxymdfTiFPiORJdPyYZ77qZDMo/L
 mgxPoEIHVldZ3KxkJ/KK9JXz2ewR3IYx8N5rJdeiJ55fE1FcGKc1Aue0bMKqZevqGPjtR1
 iug1JNSRCJafYUanWqipRhcWtY/qeqc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 15/32] mtd: spi-nor: xilinx: unify function names
Date: Wed, 23 Feb 2022 14:43:41 +0100
Message-Id: <20220223134358.1914798-16-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054417_873149_80372F11 
X-CRM114-Status: GOOD (  12.34  )
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
Acked-by: Pratyush Yadav <p.yadav@ti.com>
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
