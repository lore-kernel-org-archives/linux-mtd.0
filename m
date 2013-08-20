Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBf1Z-0002FR-AL
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 06:02:38 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH for mtd-utils 4/4] check the MLC nand type
Date: Tue, 20 Aug 2013 13:58:37 +0800
Message-ID: <1376978317-28010-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1376978317-28010-1-git-send-email-b32955@freescale.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the current code, the MTD_NANDFLASH stands for both the SLC and MLC.

In the kernel, the MTD_NANDFLASH only stands for the SLC now,
so in order to keep the logic unchanged, we should also check the MLC nand
by MTD_MLCNANDFLASH.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 lib/libmtd.c        |    3 ++-
 ubi-utils/mtdinfo.c |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 3e8109a..2089373 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -776,7 +776,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 
 	mtd->eb_cnt = mtd->size / mtd->eb_size;
 	mtd->type = type_str2int(mtd->type_str);
-	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH);
+	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH ||
+				mtd->type == MTD_MLCNANDFLASH);
 
 	return 0;
 }
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index a9dc675..5ac95aa 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -315,7 +315,7 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 		printf("Sub-page size:                  %d %s\n",
 		       mtd.subpage_size,
 		       mtd.subpage_size > 1 ? "bytes" : "byte");
-	else if (mtd.type == MTD_NANDFLASH)
+	else if (mtd.type == MTD_NANDFLASH || mtd.type == MTD_MLCNANDFLASH)
 		printf("Sub-page size:                  unknown\n");
 
 	if (mtd.oob_size > 0)
-- 
1.7.1
