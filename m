From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 11/23] mtd: add mtd_eccpos(),
 mtd_oobfree() and mtd_eccbytes() helper functions
Date: Mon,  7 Dec 2015 23:26:06 +0100
Message-Id: <1449527178-5930-12-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to make the ecclayout definition completely dynamic we need to
rework the way these different ECC layouts are defined and iterated.

Create the mtd_eccpos(), mtd_oobfree() and mtd_eccbytes() helpers to hide
ecclayout definition internals to their users.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/mtd.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9cf13c4..25e3d0f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -253,6 +253,38 @@ struct mtd_info {
 	int usecount;
 };
 
+static inline int mtd_eccpos(struct mtd_info *mtd, int eccbyte)
+{
+	if (!mtd->ecclayout)
+		return -ENOTSUPP;
+
+	if (eccbyte >= mtd->ecclayout->eccbytes)
+		return -ERANGE;
+
+	return mtd->ecclayout->eccpos[eccbyte];
+}
+
+static inline int mtd_oobfree(struct mtd_info *mtd, int section,
+			      struct nand_oobfree *oobfree)
+{
+	memset(oobfree, 0, sizeof(*oobfree));
+
+	if (!mtd->ecclayout)
+		return -ENOTSUPP;
+
+	if (section >= MTD_MAX_OOBFREE_ENTRIES_LARGE)
+		return -ERANGE;
+
+	*oobfree = mtd->ecclayout->oobfree[section];
+
+	return 0;
+}
+
+static inline int mtd_eccbytes(struct mtd_info *mtd)
+{
+	return mtd->ecclayout ? mtd->ecclayout->eccbytes : 0;
+}
+
 static inline void mtd_set_of_node(struct mtd_info *mtd,
 				   struct device_node *np)
 {
-- 
2.1.4
