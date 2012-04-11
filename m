Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHlz7-000798-Ef
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 01:04:33 +0000
Received: by werp11 with SMTP id p11so291301wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2012 18:04:31 -0700 (PDT)
From: Grazvydas Ignotas <notasas@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: omap2: fix resource leak in prefetch-busy path
Date: Wed, 11 Apr 2012 04:04:34 +0300
Message-Id: <1334106274-24993-1-git-send-email-notasas@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Grazvydas Ignotas <notasas@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If prefetch engine is busy, current code "forgets" to call
dma_unmap_single(), which results in a deadlock later, so add it.

Signed-off-by: Grazvydas Ignotas <notasas@gmail.com>
---
 drivers/mtd/nand/omap2.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f745f00..7feb274 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -402,7 +402,7 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 			PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write);
 	if (ret)
 		/* PFPW engine is busy, use cpu copy method */
-		goto out_copy;
+		goto out_copy_unmap;
 
 	init_completion(&info->comp);
 
@@ -421,6 +421,8 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 	dma_unmap_single(&info->pdev->dev, dma_addr, len, dir);
 	return 0;
 
+out_copy_unmap:
+	dma_unmap_single(&info->pdev->dev, dma_addr, len, dir);
 out_copy:
 	if (info->nand.options & NAND_BUSWIDTH_16)
 		is_write == 0 ? omap_read_buf16(mtd, (u_char *) addr, len)
-- 
1.7.0.4
