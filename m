Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NiotB-0004l0-CS
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:58 +0000
Subject: [PATCH 6/6] mtd: cfi_cmdset_0002: add CFI detection for SST 39VF3201
	chips
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:58:15 +0100
Message-ID: <20100220125814.14843.41936.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
References: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SST 39VF0201 chips use the 0x0701 command set, fully compatible with the AMD one.
This patch adds support for detecting them in CFI mode.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   24 ++++++++++++++++++++++++
 drivers/mtd/chips/gen_probe.c       |    1 +
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3df6056..ad5271b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -43,6 +43,7 @@
 
 #define MAX_WORD_RETRIES 3
 
+#define SST39VF3201		0x235b
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
 #define SST49LF008A		0x005a
@@ -246,6 +247,19 @@ static void fixup_use_erase_chip(struct mtd_info *mtd, void *param)
 }
 
 /*
+ * SST 32VF3201 chips report 2 erase zones while they actually
+ * only have 1. Patch this on the fly.
+ */
+static void fixup_sst39vf3201_erase_zones(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	cfi->cfiq->NumEraseRegions = 1;
+	pr_warning("%s: Bad SST39VF3201 CFI data, adjust from 2 to 1 erase region\n", mtd->name);
+}
+
+/*
  * Some Atmel chips (e.g. the AT49BV6416) power-up with all sectors
  * locked by default.
  */
@@ -303,6 +317,7 @@ static struct cfi_fixup jedec_fixup_table[] = {
 	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
 	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },
 	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
+	{ CFI_MFR_SST, SST39VF3201, fixup_sst39vf3201_erase_zones, NULL },
 	{ 0, 0, NULL, NULL }
 };
 
@@ -352,6 +367,14 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->writesize = 1;
 
 	if (cfi->cfi_mode==CFI_MODE_CFI){
+	    /*
+	     * SST 39VF3201 chips do not have a real PRI.
+	     */
+	    if (cfi->mfr == CFI_MFR_SST && cfi->id == SST39VF3201) {
+		cfi->addr_unlock1 = 0x5555;
+		cfi->addr_unlock2 = 0x2AAA;
+	    }
+	    else {
 		unsigned char bootloc;
 		/*
 		 * It's a real CFI chip, not one for which the probe
@@ -412,6 +435,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 		/* Set the default CFI lock/unlock addresses */
 		cfi->addr_unlock1 = 0x555;
 		cfi->addr_unlock2 = 0x2aa;
+	    }
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 991c457..599c259 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
 #endif
 #ifdef CONFIG_MTD_CFI_AMDSTD
 	case P_ID_AMD_STD:
+	case P_ID_SST_OLD:
 		return cfi_cmdset_0002(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_STAA
