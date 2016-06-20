Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bEzbD-0006HW-EL
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 13:50:48 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "George Spelvin" <linux@sciencehorizons.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mtd: nand: implement two pairing scheme
Date: Mon, 20 Jun 2016 15:50:17 +0200
Message-Id: <1466430618-9713-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/nand_base.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  3 ++
 2 files changed, 100 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b0dc29d2af7..dc30e3c5c032 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4293,6 +4293,103 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
 	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
 }
 
+static void nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
+					struct mtd_pairing_info *info)
+{
+	bool lastpage = ((page + 1) * mtd->writesize) == mtd->erasesize;
+
+	/*
+	 * The first and last pages are special cases.
+	 * To simplify the code and keep the same distance for everyone, we
+	 * increment all pages by 1 except the first one (page 0). The last
+	 * page receives an extra +1 for the same reason.
+	 */
+	page += (page != 0) + lastpage;
+
+	/*
+	 * The datasheets state that odd pages should be part of group
+	 * 0 and even ones part of group 1 (except for the last and
+	 * first pages), but we incremented the page number, that's why we're
+	 * doing the reverse test here.
+	 */
+	info->group = page & 1;
+
+	/*
+	 * We're trying to extract the pair id, which is always equal to
+	 * first_page_of_a_pair / 2. Subtract the distance to the page if it's
+	 * not part of group 0.
+	 */
+	if (page & 1)
+		page -= 3;
+
+	info->pair = page >> 1;
+}
+
+static int __pure nand_pairing_dist3_get_wunit(struct mtd_info *mtd,
+					const struct mtd_pairing_info *info)
+{
+	int page = (info->pair * 2) + (3 * info->group);
+	bool lastpage = ((page * mtd->writesize) > mtd->erasesize);
+
+	/*
+	 * The first and last pages are special cases.
+	 * To simplify the code and keep the same distance for everyone, we
+	 * incremented all pages by 1 except the first one (page 0). The last
+	 * page received an extra +1 for the same reason. Now we need to
+	 * revert that to get the real page number.
+	 */
+	page -= (page != 0) + lastpage;
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
+/*
+ * Distance-6 pairing works like distance-3 pairing, except that pages
+ * are taken two at a time.  The lsbit of the page number is chopped off
+ * and later re-added as the lsbit of the pair number.
+ */
+static void nand_pairing_dist6_get_info(struct mtd_info *mtd, int page,
+					struct mtd_pairing_info *info)
+{
+	bool last2pages, lsbit = page & 1;
+
+	page >>= 1;
+	last2pages = ((page + 1) * 2 * mtd->writesize) == mtd->erasesize;
+
+	page += (page != 0) + last2pages;
+
+	info->group = page & 1;
+	if (page & 1)
+		page -= 3;
+
+	info->pair = page | lsbit;
+}
+
+static int __pure nand_pairing_dist6_get_wunit(struct mtd_info *mtd,
+					const struct mtd_pairing_info *info)
+{
+	int page = (info->pair & ~1) + (3 * info->group);
+	bool last2pages = (page * 2 * mtd->writesize) > mtd->erasesize;
+
+	page -= (page != 0) + last2pages;
+
+	return 2 * page + (info->pair & 1);
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
index fbe8e164a4ee..874b2671af90 100644
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
