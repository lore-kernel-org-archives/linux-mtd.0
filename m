Received: from mail-bl2on0084.outbound.protection.outlook.com ([65.55.169.84]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuNv1-0006GI-6P
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 17:01:48 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <michals@xilinx.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, <kpc528@gmail.com>,
 <kalluripunnaiahchoudary@gmail.com>, Punnaiah Choudary Kalluri
 <punnaia@xilinx.com>
Subject: [PATCH] mtd: Expand the ecc placement locations to 1216
Date: Thu, 5 Nov 2015 22:28:55 +0530
Message-ID: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
So, increasing the maximum ecc placement locations to 1216

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
 include/linux/mtd/mtd.h    | 2 +-
 include/uapi/mtd/mtd-abi.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75..1fd3cc6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -95,7 +95,7 @@ struct mtd_oob_ops {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
-#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
+#define MTD_MAX_ECCPOS_ENTRIES_LARGE	1216
 /*
  * Internal ECC layout control structure. For historical reasons, there is a
  * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 763bb69..c4d592c 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -220,8 +220,8 @@ struct nand_oobfree {
 	__u32 length;
 };
 
-#define MTD_MAX_OOBFREE_ENTRIES	8
-#define MTD_MAX_ECCPOS_ENTRIES	64
+#define MTD_MAX_OOBFREE_ENTRIES	32
+#define MTD_MAX_ECCPOS_ENTRIES	1216
 /*
  * OBSOLETE: ECC layout control structure. Exported to user-space via ioctl
  * ECCGETLAYOUT for backwards compatbility and should not be mistaken as a
-- 
2.1.2
