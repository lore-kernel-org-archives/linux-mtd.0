Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1audKr-0004jM-2L
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 10:01:47 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mtd: nand: implement two pairing scheme
Date: Mon, 25 Apr 2016 12:01:19 +0200
Message-Id: <1461578481-26567-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement two common pairing scheme (found on many MLC devices), and name
them in reference to the paired pages distance (3 or 6 pages).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 96 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  3 ++
 2 files changed, 99 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7bc37b4..a64e0d5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4274,6 +4274,102 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
 	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
 }
 
+static void nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
+					struct mtd_pairing_info *info)
+{
+	int lastpage = (mtd->erasesize / mtd->writesize) - 1;
+	int dist = 3;
+
+	if (page == lastpage)
+		dist = 2;
+
+	if (!page || (page & 1)) {
+		info->group = 0;
+		info->pair = (page + 1) / 2;
+	} else {
+		info->group = 1;
+		info->pair = (page + 1 - dist) / 2;
+	}
+}
+
+static int nand_pairing_dist3_get_wunit(struct mtd_info *mtd,
+					const struct mtd_pairing_info *info)
+{
+	int lastpair = ((mtd->erasesize / mtd->writesize) - 1) / 2;
+	int page = info->pair * 2;
+	int dist = 3;
+
+	if (!info->group && !info->pair)
+		return 0;
+
+	if (info->pair == lastpair && info->group)
+		dist = 2;
+
+	if (!info->group)
+		page--;
+	else if (info->pair)
+		page += dist - 1;
+
+	if (page >= mtd->erasesize / mtd->writesize)
+		return -EINVAL;
+
+	return page;
+}
+
+const struct mtd_pairing_scheme dist3_pairing_scheme = {
+	.ngroups = 2,
+	.get_info = nand_pairing_dist3_get_info,
+	.get_wunit = nand_pairing_dist3_get_wunit,
+};
+EXPORT_SYMBOL_GPL(dist3_pairing_scheme);
+
+static void nand_pairing_dist6_get_info(struct mtd_info *mtd, int page,
+					struct mtd_pairing_info *info)
+{
+	int lastpage = (mtd->erasesize / mtd->writesize) - 1;
+	int half = page / 2;
+	int dist = 6;
+
+	if (half == lastpage / 2)
+		dist = 4;
+
+	if (!half  || (half & 1)) {
+		info->group = 0;
+		info->pair = (page + 2) / 2;
+	} else {
+		info->group = 1;
+		info->pair = (page + 2 - dist) / 2;
+	}
+}
+
+static int nand_pairing_dist6_get_wunit(struct mtd_info *mtd,
+				       const struct mtd_pairing_info *info)
+{
+	int lastpair = ((mtd->erasesize / mtd->writesize) - 1) / 2;
+	int page = info->pair * 2;
+	int dist = 6;
+
+	if (!info->group && !info->pair)
+		return 0;
+
+	if (info->pair >= lastpair - 1 && info->group)
+		dist = 4;
+
+	if (!info->group)
+		page += 2;
+	else
+		page += dist - 2;
+
+	return page;
+}
+
+const struct mtd_pairing_scheme dist6_pairing_scheme = {
+	.ngroups = 2,
+	.get_info = nand_pairing_dist6_get_info,
+	.get_wunit = nand_pairing_dist6_get_wunit,
+};
+EXPORT_SYMBOL_GPL(dist6_pairing_scheme);
+
 /**
  * nand_scan_tail - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index fbe8e16..874b267 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1092,4 +1092,7 @@ int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip, int page);
 /* Default read_oob syndrome implementation */
 int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page);
+
+extern const struct mtd_pairing_scheme dist3_pairing_scheme;
+extern const struct mtd_pairing_scheme dist6_pairing_scheme;
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.7.4
