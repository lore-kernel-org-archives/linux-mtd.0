Received: from mail-bn1bon0062.outbound.protection.outlook.com
 ([157.56.111.62] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYWAG-0002P3-3z
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 08:50:56 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH] mtd: Expand the ecc placement locations to 1260
Date: Thu, 19 Mar 2015 14:20:20 +0530
Message-ID: <BN1BFFO11FD0497164C4D8ECB568C7BDA7C8010@BN1BFFO11FD049.protection.gbl>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-kernel@vger.kernel.org, shaktib@xilinx.com, michals@xilinx.com,
 linux-mtd@lists.infradead.org, kalluripunnaiahchoudary@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1260 Bytes.
So, increasing the maximum ecc placement locations to 1260

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
 include/linux/mtd/mtd.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75..e73d85b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -95,7 +95,7 @@ struct mtd_oob_ops {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
-#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
+#define MTD_MAX_ECCPOS_ENTRIES_LARGE	1260
 /*
  * Internal ECC layout control structure. For historical reasons, there is a
  * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
-- 
1.7.4
