Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4rxg-0002fk-FF
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 08:40:41 +0000
Subject: [PATCH v3 5/8] mtd: cfi_cmdset_0002: do not fail on no extended query
	table as they are both optional
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 22 Apr 2010 10:36:06 +0200
Message-ID: <20100422083606.17166.52192.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100422083545.17166.17822.stgit@shiryu.yomgui.biz>
References: <20100422083545.17166.17822.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Wolfram Sang <w.sang@pengutronix.de>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After looking at AMD's CFI specification [1], both of the extended query
tables are optional. Thus, it looks like relying that at least one of
those tables exist is a bug in cfi_cmdset_0002.

This patch inverts the logic and checks for unlock function pointers before
exiting on error. This approach leaves place to add a call to a fixup
function to try to handle chips compatible with the early AMD specification
from 1995 [2].


[1] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf
[2] http://noel.feld.cvut.cz/hw/amd/20158a.pdf

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   89 ++++++++++++++++++-----------------
 1 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ea2a7f6..de1b4ba 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -353,65 +353,66 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 
 	if (cfi->cfi_mode==CFI_MODE_CFI){
 		unsigned char bootloc;
-		/*
-		 * It's a real CFI chip, not one for which the probe
-		 * routine faked a CFI structure. So we read the feature
-		 * table from it.
-		 */
 		__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
 		struct cfi_pri_amdstd *extp;
 
 		extp = (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), "Amd/Fujitsu");
-		if (!extp) {
-			kfree(mtd);
-			return NULL;
-		}
-
-		cfi_fixup_major_minor(cfi, extp);
-
-		if (extp->MajorVersion != '1' ||
-		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
-			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
-			       "version %c.%c.\n",  extp->MajorVersion,
-			       extp->MinorVersion);
-			kfree(extp);
-			kfree(mtd);
-			return NULL;
-		}
+		if (extp) {
+			/*
+			 * It's a real CFI chip, not one for which the probe
+			 * routine faked a CFI structure.
+			 */
+			cfi_fixup_major_minor(cfi, extp);
+
+			if (extp->MajorVersion != '1' ||
+			    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
+				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
+				       "version %c.%c.\n",  extp->MajorVersion,
+				       extp->MinorVersion);
+				kfree(extp);
+				kfree(mtd);
+				return NULL;
+			}
 
-		/* Install our own private info structure */
-		cfi->cmdset_priv = extp;
+			/* Install our own private info structure */
+			cfi->cmdset_priv = extp;
 
-		/* Apply cfi device specific fixups */
-		cfi_fixup(mtd, cfi_fixup_table);
+			/* Apply cfi device specific fixups */
+			cfi_fixup(mtd, cfi_fixup_table);
 
 #ifdef DEBUG_CFI_FEATURES
-		/* Tell the user about it in lots of lovely detail */
-		cfi_tell_features(extp);
+			/* Tell the user about it in lots of lovely detail */
+			cfi_tell_features(extp);
 #endif
 
-		bootloc = extp->TopBottom;
-		if ((bootloc != 2) && (bootloc != 3)) {
-			printk(KERN_WARNING "%s: CFI does not contain boot "
-			       "bank location. Assuming top.\n", map->name);
-			bootloc = 2;
-		}
+			bootloc = extp->TopBottom;
+			if ((bootloc != 2) && (bootloc != 3)) {
+				printk(KERN_WARNING "%s: CFI does not contain boot "
+				       "bank location. Assuming top.\n", map->name);
+				bootloc = 2;
+			}
 
-		if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
-			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
+			if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
+				printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
 
-			for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
-				int j = (cfi->cfiq->NumEraseRegions-1)-i;
-				__u32 swap;
+				for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
+					int j = (cfi->cfiq->NumEraseRegions-1)-i;
+					__u32 swap;
 
-				swap = cfi->cfiq->EraseRegionInfo[i];
-				cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
-				cfi->cfiq->EraseRegionInfo[j] = swap;
+					swap = cfi->cfiq->EraseRegionInfo[i];
+					cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
+					cfi->cfiq->EraseRegionInfo[j] = swap;
+				}
 			}
+			/* Set the default CFI lock/unlock addresses */
+			cfi->addr_unlock1 = 0x555;
+			cfi->addr_unlock2 = 0x2aa;
+		}
+
+		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {
+			kfree(mtd);
+			return NULL;
 		}
-		/* Set the default CFI lock/unlock addresses */
-		cfi->addr_unlock1 = 0x555;
-		cfi->addr_unlock2 = 0x2aa;
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
