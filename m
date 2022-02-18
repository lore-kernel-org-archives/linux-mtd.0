Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1208C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5S4OL6TXDRk3eMLXM4UOb+D7C8pDN8jH+hYD6sTo7A=; b=TDt5VXQ0bNh/Aw
	jLP2hdSZl78AbSXI78NAguoIj6xHLYvzRXytbwy1V1sh3JqH9B5EqpqP9D40j/pjbC/KnZcxk7+kb
	CtsOOYVaZXnYP4Q+aFM5M2AJHVpwt7UpGUdPat58ardCHvy/7UXn/qeAe9z7txJdejTLLXdKnUm8Z
	i58CPu27pTqmdA1i/9brS7LfKTJmzCnlQckpb7T/S47EASQM5BC3L8CJr+wvUlSPNbUYXRflbXnu9
	JBHf2dsH0G4B0faj3XpuzcFlh9DMm1quntxW/ybZV5ulzIbAFyJ/IdzHm5H8bPyvPqfIzY2/ocFCe
	lAxNzY5hajassXNI4LVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1nG-00E5ik-3Q; Fri, 18 Feb 2022 11:51:22 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yo-00E1Q4-Nw
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:30 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B1BD92245A;
 Fri, 18 Feb 2022 12:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY/ubQNSRnKpIjV+ZU1mBaI6kn7JLs7xpJYX2NPaQ14=;
 b=EDMP+B6kLIA6o3qzkaAv8TKo21QrGPpWDz/fd+73647aOBaYe50W84cGFesHPplzPFqBTN
 jO+OqwrhnztlN1qK9Vy7ej+MbnCie5GTnzs/ecsVWd0d6DhUYWRKucQqrr6tfjAhlptlCi
 GIk24bn+teNrLrc4rpgtDI90DEKQ8k8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 15/32] mtd: spi-nor: xilinx: unify function names
Date: Fri, 18 Feb 2022 12:35:50 +0100
Message-Id: <20220218113607.1360020-16-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033626_991357_D8DB2569 
X-CRM114-Status: GOOD (  11.28  )
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
 - <flash_family>_
 - <flash_part>_

There are no functional changes.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/xilinx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 580562bc1e45..42ecdc6fc625 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -8,7 +8,7 @@
 
 #include "core.h"
 
-static const struct flash_info xilinx_parts[] = {
+static const struct flash_info xilinx_nor_parts[] = {
 	/* Xilinx S3AN Internal Flash */
 	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
 	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
@@ -80,18 +80,18 @@ static int xilinx_nor_setup(struct spi_nor *nor,
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
