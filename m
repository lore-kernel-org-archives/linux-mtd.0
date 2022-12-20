Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734EC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9sBjuJ31TSPH4pmQgFEVQDQsOQF6pTnkGxgAUW4tEZ8=; b=L3JjDIeQRVZ2Km
	GDM9MpNOEpj4000EVBUvK5YX+dZjt9CLn0+Wr4DKFFqSavHdcmtdhnFRIyteSxFBdZsIG77vmdsVH
	lUkIxZ6fIbR7KwzaQsDySxg1+Npkj6PSfAq85um4riTEabIkbWj4qftYrkxlAomW1zBZq8btz2s4b
	yfAy3+ixu7PlnrRxu4AYGIvLwvNnzii/o6dVTGuA57bUWlEbAVwdVxg/gouc4nMEihTVQsl4k3tx0
	zGYvx5d80yo59FgpMg2z+i8/AfDnILi3L/hVkdH5djvwi95Q4rP4oSgnIgDHvjgTI9HPX2L3nzygF
	kpuvh7WOoTzkrvhWGJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ebA-00HQ5r-NQ; Tue, 20 Dec 2022 15:32:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dNc-00GXLp-OL
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 14:14:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52553B80D27;
	Tue, 20 Dec 2022 14:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E21DC433D2;
	Tue, 20 Dec 2022 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671545641;
	bh=cIGyHKTuCS/Vz5KNJx8REJ3tduNkZ8K9Gt4q4PtyC8U=;
	h=From:To:Cc:Subject:Date:From;
	b=D6BDL4+qcOjHM4dp6KlaZfoUh5/zCdKYUxyAuo5hRDC8So2zEBLpGeeRCIK43fKk1
	 5SX14NLeKsygPRdArfGtxePFPFOQc8wLOHgkSHau64cwNfO8H0xK0H/d8yRmVwJtdE
	 Paid6yWmazy/cp7qGKiTLK8mAvS6tBmoZNhrH8WLTRYSCy+ywQvXtgbGMI1Fa8UXww
	 3HJgch1Pk6mvdWr3xYkwuv/H27BTl+yy3sf8a8QC2odJ8p0BJCfxH81WovA4JLkC8w
	 z4Thajc0X7/5pyJxOPQadoKy/Tto7ARgV09i4H3n7mB6yLSyiwUMKwldHXuwnv1DD/
	 9FR4gqX+T53hw==
From: Arnd Bergmann <arnd@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Date: Tue, 20 Dec 2022 15:13:34 +0100
Message-Id: <20221220141352.1486360-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_061405_016046_370046D7 
X-CRM114-Status: GOOD (  13.49  )
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

From: Arnd Bergmann <arnd@arndb.de>

When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
fails to build, as it includes the shared CFI header:

include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
   62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.

linux/mtd/spi-nor.h does not actually need to include cfi.h, so
remove the inclusion here to fix the warning. This uncovers a
missing #include in spi-nor/core.c so add that there to
prevent a different build issue.

Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/spi-nor/core.c  | 1 +
 include/linux/mtd/spi-nor.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d8703d7dfd0a..d67c926bca8b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/math64.h>
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 25765556223a..a3f8cdca90c8 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -7,7 +7,6 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
-#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/spi/spi-mem.h>
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
