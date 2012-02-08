Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv9Kz-0003os-S0
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 15:21:41 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/9] mtd: harmonize mtd_point interface implementation
Date: Wed,  8 Feb 2012 17:21:23 +0200
Message-Id: <1328714485-19536-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
References: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Some MTD drivers return -EINVAL if the 'phys' parameter is not NULL, trying to
convey that they cannot return the physical address. However, this is not very
logical because they still can return the virtual address ('virt'). But some
drivers (lpddr) just ignore the 'phys' parameter instead, which is a more
logical thing to do.

Let's harmonize this and:

1. Always initialize 'virt' and 'phys' to 'NULL' in 'mtd_point()'.
2. Do not return an error if the physical address cannot be found.

So as a result, all drivers will set 'phys' to 'NULL' if it is not supported.
None of the 'mtd_point()' users use 'phys' anyway, so this should not break
anything. I guess we could also just delete this parameter later.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/mtdram.c |    3 ---
 drivers/mtd/devices/phram.c  |    4 ----
 drivers/mtd/devices/pmc551.c |    4 ----
 drivers/mtd/devices/slram.c  |    3 ---
 drivers/mtd/mtdcore.c        |    3 +++
 5 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 0e0e6ed..ec59d65 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -43,9 +43,6 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
 	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index d3474a4..9d2bf17 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -51,10 +51,6 @@ static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
-
 	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 6269a43..c4368ec 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -205,10 +205,6 @@ static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
 	printk(KERN_DEBUG "pmc551_point(%ld, %ld)\n", (long)from, (long)len);
 #endif
 
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
-
 	soff_hi = from & ~(priv->asize - 1);
 	soff_lo = from & (priv->asize - 1);
 
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 842e489..ccd39ff 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -99,9 +99,6 @@ static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	slram_priv_t *priv = mtd->priv;
 
-	/* can we return a physical address with this driver? */
-	if (phys)
-		return -EINVAL;
 	*virt = priv->start + from;
 	*retlen = len;
 	return(0);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index ead52b3..b20346e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -706,6 +706,9 @@ int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	      void **virt, resource_size_t *phys)
 {
 	*retlen = 0;
+	*virt = NULL;
+	if (phys)
+		*phys = 0;
 	if (!mtd->_point)
 		return -EOPNOTSUPP;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
-- 
1.7.9
