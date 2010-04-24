Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5hp5-0006Ko-GA
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 16:03:16 +0000
Subject: [PATCH v5 7/9] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 24 Apr 2010 17:58:22 +0200
Message-ID: <20100424155822.14723.21170.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <w.sang@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Chris Moore <moore@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SST 39VF{16,32}xx chips use the 0x0701 command set, fully compatible
with the AMD one. This patch adds support for detecting them in CFI
mode.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   35 +++++++++++++++++++++++++++++++++++
 drivers/mtd/chips/gen_probe.c       |    1 +
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 23114ab..c5837d0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -256,6 +256,31 @@ static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
 	mtd->flags |= MTD_POWERUP_LOCK;
 }
 
+static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	/*
+	 * These flashes report two seperate eraseblock regions based on the
+	 * sector_erase-size and block_erase-size, although they both operate on the
+	 * same memory. This is not allowed according to CFI, so we just pick the
+	 * sector_erase-size.
+	 */
+	cfi->cfiq->NumEraseRegions = 1;
+}
+
+static void fixup_sst39vf(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	fixup_old_sst_eraseregion(mtd);
+
+	cfi->addr_unlock1 = 0x5555;
+	cfi->addr_unlock2 = 0x2AAA;
+}
+
 static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
 {
 	struct map_info *map = mtd->priv;
@@ -278,6 +303,15 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd, void *param)
 	}
 }
 
+/* Used to fix CFI-Tables of chips without Extended Query Tables */
+static struct cfi_fixup cfi_nopri_fixup_table[] = {
+	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602
+	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601
+	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202
+	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201
+	{ 0, 0, NULL, NULL }
+};
+
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
@@ -403,6 +437,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			cfi->addr_unlock1 = 0x555;
 			cfi->addr_unlock2 = 0x2aa;
 		}
+		cfi_fixup(mtd, cfi_nopri_fixup_table);
 
 		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {
 			kfree(mtd);
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
