Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIAK-0007sO-3S
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 15:45:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: docprobe: use kzalloc instead
Date: Thu, 29 Dec 2011 17:47:05 +0200
Message-Id: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead of calling 'kmalloc()' and them 'memeset(0)', use 'kzalloc()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/docprobe.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 45116bb..31b84aa 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -241,8 +241,7 @@ static void __init DoC_Probe(unsigned long physadr)
 			return;
 		}
 		docfound = 1;
-		mtd = kmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
-
+		mtd = kzmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
 		if (!mtd) {
 			printk(KERN_WARNING "Cannot allocate memory for data structures. Dropping.\n");
 			iounmap(docptr);
@@ -250,10 +249,6 @@ static void __init DoC_Probe(unsigned long physadr)
 		}
 
 		this = (struct DiskOnChip *)(&mtd[1]);
-
-		memset((char *)mtd,0, sizeof(struct mtd_info));
-		memset((char *)this, 0, sizeof(struct DiskOnChip));
-
 		mtd->priv = this;
 		this->virtadr = docptr;
 		this->physadr = physadr;
-- 
1.7.7.3
