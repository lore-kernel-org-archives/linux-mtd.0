Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4rxq-0002jG-Hk
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 08:40:51 +0000
Subject: [PATCH v3 7/8] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{32, 64}xxB chips
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 22 Apr 2010 10:36:16 +0200
Message-ID: <20100422083616.17166.44918.stgit@shiryu.yomgui.biz>
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

This patch adds support for detecting SST 39VF32xxB and 39VF64xxB
chips in CFI mode.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 0e91dce..66e5586 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -281,6 +281,17 @@ static void fixup_sst39vf(struct mtd_info *mtd, void *param)
 	cfi->addr_unlock2 = 0x2AAA;
 }
 
+static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	fixup_old_sst_eraseregion(mtd);
+
+	cfi->addr_unlock1 = 0x555;
+	cfi->addr_unlock2 = 0x2AA;
+}
+
 static void fixup_s29gl064n_sectors(struct mtd_info *mtd, void *param)
 {
 	struct map_info *map = mtd->priv;
@@ -309,6 +320,10 @@ static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601
 	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202
 	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201
+	{ CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // SST39VF3202B
+	{ CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // SST39VF3201B
+	{ CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // SST39VF6402B
+	{ CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
 	{ 0, 0, NULL, NULL }
 };
 
