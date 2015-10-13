Received: from mail-ob0-f171.google.com ([209.85.214.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZ8-0006Ek-7Z
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:47 +0000
Received: by obbzf10 with SMTP id zf10so2566850obb.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:25 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 3/5] mtd: nand: omap2: Fix high memory dma prefetch transfer
Date: Mon, 12 Oct 2015 20:38:56 -0500
Message-Id: <1444700338-27582-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1444700338-27582-1-git-send-email-fcooper@ti.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Based on DMA documentation and testing using high memory buffer when
doing dma transfers can lead to various issues including kernel
panics.

To workaround this simply use cpu copy. The amount of high memory
buffers used are very uncommon so no noticeable performance hit should
be seen.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 drivers/mtd/nand/omap2.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 94d11de..537be2f 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -479,17 +479,8 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 	int ret;
 	u32 val;
 
-	if (addr >= high_memory) {
-		struct page *p1;
-
-		if (((size_t)addr & PAGE_MASK) !=
-			((size_t)(addr + len - 1) & PAGE_MASK))
-			goto out_copy;
-		p1 = vmalloc_to_page(addr);
-		if (!p1)
-			goto out_copy;
-		addr = page_address(p1) + ((size_t)addr & ~PAGE_MASK);
-	}
+	if (addr >= high_memory)
+		goto out_copy;
 
 	sg_init_one(&sg, addr, len);
 	n = dma_map_sg(info->dma->device->dev, &sg, 1, dir);
@@ -545,6 +536,7 @@ out_copy:
 	else
 		is_write == 0 ? omap_read_buf8(mtd, (u_char *) addr, len)
 			: omap_write_buf8(mtd, (u_char *) addr, len);
+
 	return 0;
 }
 
-- 
2.6.1
