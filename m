Received: from t111.niisi.ras.ru ([193.232.173.111])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PndnR-0000s9-AU
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 21:11:28 +0000
From: Antony Pavlov <antony@niisi.msk.ru>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0002: fix sector erase command for AM29LV040B
Date: Fri, 11 Feb 2011 00:04:37 +0300
Message-Id: <1297371877-32123-1-git-send-email-antony@niisi.msk.ru>
Cc: Antony Pavlov <antony@niisi.msk.ru>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The AM29LV040B chips use 0x50 as sector erase command instead of 0x30 [1].

[1] http://www.datasheetcatalog.com/datasheets_pdf/A/M/2/9/AM29LV040B.shtml

Signed-off-by: Antony Pavlov <antony@niisi.msk.ru>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index f072fcf..a401dbe 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -332,6 +332,14 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd)
 	}
 }
 
+static void fixup_use_sector_erase_cmd_30(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	cfi->sector_erase_cmd = CMD(0x30);
+}
+
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */
@@ -374,6 +382,7 @@ static struct cfi_fixup jedec_fixup_table[] = {
 	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },
 	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },
 	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock },
+	{ CFI_MFR_AMD, 0x004F, fixup_use_sector_erase_cmd_30 }, /* AM29LV040B */
 	{ 0, 0, NULL }
 };
 
-- 
1.7.1
