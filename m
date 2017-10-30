Received: from pb-smtp1.pobox.com ([64.147.108.70] helo=sasl.smtp.pobox.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9F7M-0000Mc-Dh
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:49:03 +0000
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 4/5] MTD: implement mtd_get_unmapped_area() using the point
 method
Date: Mon, 30 Oct 2017 14:48:32 -0400
Message-Id: <20171030184833.20709-5-nicolas.pitre@linaro.org>
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

The mtd->_point method is a superset of mtd->_get_unmapped_area.
Especially in the NOR flash case, the point method ensures the flash
memory is in array (data) mode and that it will stay that way which
is precisely what callers of mtd_get_unmapped_area() would expect.

Implement mtd_get_unmapped_area() in terms of mtd->_point now that all
drivers that provided a _get_unmapped_area method also have the _point
method implemented.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Richard Weinberger <richard@nod.at>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdcore.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e7ea842ba3..ecb0380158 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1022,11 +1022,18 @@ EXPORT_SYMBOL_GPL(mtd_unpoint);
 unsigned long mtd_get_unmapped_area(struct mtd_info *mtd, unsigned long len,
 				    unsigned long offset, unsigned long flags)
 {
-	if (!mtd->_get_unmapped_area)
-		return -EOPNOTSUPP;
-	if (offset >= mtd->size || len > mtd->size - offset)
-		return -EINVAL;
-	return mtd->_get_unmapped_area(mtd, len, offset, flags);
+	size_t retlen;
+	void *virt;
+	int ret;
+
+	ret = mtd_point(mtd, offset, len, &retlen, &virt, NULL);
+	if (ret)
+		return ret;
+	if (retlen != len) {
+		mtd_unpoint(mtd, offset, retlen);
+		return -ENOSYS;
+	}
+	return (unsigned long)virt;
 }
 EXPORT_SYMBOL_GPL(mtd_get_unmapped_area);
 
-- 
2.9.5
