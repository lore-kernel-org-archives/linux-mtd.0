Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JkQ-0002mJ-1t
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:41:39 +0000
Subject: [PATCH 4/4] mtd: cfi_cmdset_0002: add CFI detection for SST 38VF640x
	chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 22 Oct 2010 17:40:30 +0200
Message-ID: <20101022154030.11097.40767.stgit@dev.siriade.com>
In-Reply-To: <20101022154015.11097.94660.stgit@dev.siriade.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: fggs@terra.com.br, zhangyd6@gmail.com, w.sang@pengutronix.de,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for SST38VF640x chips in CFI mode.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Signed-off-by: yidong zhang <zhangyd6@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a359967..0248253 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -296,6 +296,21 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
 	sector_erase_cmd = CMD(0x50);
 }
 
+static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	fixup_sst39vf_rev_b(mtd, param);
+
+	/*
+	 * CFI reports 1024 sectors (0x03ff +1) of 64KBytes (0x0100 *256) where
+	 * it should report a size of 8KBytes (0x0020 *256).
+	 */
+	cfi->cfiq->EraseRegionInfo[0] = 0x002003ff;
+	pr_warning("%s: Bad 38VF640x CFI data, adjust sector size from 64 to 8KBytes\n", mtd->name);
+}
+
 static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
 {
 	struct map_info *map = mtd->priv;
@@ -347,6 +362,10 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
+	{ CFI_MFR_SST, 0x536A, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6402 */
+	{ CFI_MFR_SST, 0x536B, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6401 */
+	{ CFI_MFR_SST, 0x536C, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6404 */
+	{ CFI_MFR_SST, 0x536D, fixup_sst38vf640x_sectorsize, NULL, }, /* SST38VF6403 */
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
