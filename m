Received: from pb-smtp1.pobox.com ([64.147.108.70] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e27fZ-0002Ln-0G
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 03:26:56 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] MTD: mtdram: properly handle the phys argument in the
 point method
Date: Tue, 10 Oct 2017 23:26:17 -0400
Message-Id: <20171011032621.26979-2-nicolas.pitre@linaro.org>
In-Reply-To: <20171011032621.26979-1-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the phys pointer is non null, the point method is expected to return
the physical address for the pointed area. In the case of the mtdram
driver we have to retrieve the physical address for the corresponding
vmalloc area. However, there is no guarantee that the vmalloc area is
made of physically contiguous pages. In that case we simply limit retlen
to the actually contiguous pages.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 drivers/mtd/devices/mtdram.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index cbd8547d7a..7dbee8e62f 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/ioport.h>
 #include <linux/vmalloc.h>
+#include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/mtdram.h>
@@ -69,6 +70,27 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	*virt = mtd->priv + from;
 	*retlen = len;
+
+	if (phys) {
+		/* limit retlen to the number of contiguous physical pages */
+		unsigned long page_ofs = offset_in_page(*virt);
+		void *addr = *virt - page_ofs;
+		unsigned long pfn1, pfn0 = vmalloc_to_pfn(addr);
+
+		*phys = __pfn_to_phys(pfn0) + page_ofs;
+		len += page_ofs;
+		while (len > PAGE_SIZE) {
+			len -= PAGE_SIZE;
+			addr += PAGE_SIZE;
+			pfn0++;
+			pfn1 = vmalloc_to_pfn(addr);
+			if (pfn1 != pfn0) {
+				*retlen = *virt - addr;
+				break;
+			}
+		}
+	}
+
 	return 0;
 }
 
-- 
2.9.5
