Received: from pb-smtp2.pobox.com ([64.147.108.71] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9F7M-0000Ma-DH
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:49:06 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/5] MTD: mtdram: properly handle the phys argument in the
 point method
Date: Mon, 30 Oct 2017 14:48:29 -0400
Message-Id: <20171030184833.20709-2-nicolas.pitre@linaro.org>
In-Reply-To: <20171030184833.20709-1-nicolas.pitre@linaro.org>
References: <20171030184833.20709-1-nicolas.pitre@linaro.org>
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
Reviewed-by: Richard Weinberger <richard@nod.at>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/devices/mtdram.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index cbd8547d7a..4418629e8d 100644
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
+				*retlen = addr - *virt;
+				break;
+			}
+		}
+	}
+
 	return 0;
 }
 
-- 
2.9.5
