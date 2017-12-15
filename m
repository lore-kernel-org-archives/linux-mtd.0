Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePpHw-00045Q-Gz
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 12:40:31 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v3 2/4] mtd: Add an helper to make erase request aligned on
 ->erasesize
Date: Fri, 15 Dec 2017 13:39:52 +0100
Message-Id: <20171215123954.30017-3-boris.brezillon@free-electrons.com>
In-Reply-To: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's currently nothing forcing alignment of einfo->addr and
einfo->len on mtd->erasesize. Since we don't know if automatically
aligning those field in mtd_erase() will hurt some drivers, we add an
helper function to let drivers that need such an alignment explicitly
ask for it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Changes in v3:
- new patch
---
 include/linux/mtd/mtd.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd55bf14ad51..205ededccc60 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -489,6 +489,34 @@ static inline uint32_t mtd_mod_by_eb(uint64_t sz, struct mtd_info *mtd)
 	return do_div(sz, mtd->erasesize);
 }
 
+/**
+ * mtd_align_erase_req - Adjust an erase request to align things on eraseblock
+ *			 boundaries.
+ * @mtd: the MTD device this erase request applies on
+ * @req: the erase request to adjust
+ *
+ * This function will adjust @req->addr and @req->len to align them on
+ * @mtd->erasesize. Of course we expect @mtd->erasesize to be != 0.
+ */
+static inline void mtd_align_erase_req(struct mtd_info *mtd,
+				       struct erase_info *req)
+{
+	u32 mod;
+
+	if (WARN_ON(!mtd->erasesize))
+		return;
+
+	mod = mtd_mod_by_eb(req->addr, mtd);
+	if (mod) {
+		req->addr -= mod;
+		req->len += mod;
+	}
+
+	mod = mtd_mod_by_eb(req->addr + req->len, mtd);
+	if (mod)
+		req->len += mtd->erasesize - mod;
+}
+
 static inline uint32_t mtd_div_by_ws(uint64_t sz, struct mtd_info *mtd)
 {
 	if (mtd->writesize_shift)
-- 
2.11.0
