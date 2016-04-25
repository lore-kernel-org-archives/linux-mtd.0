Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1audKr-0004jL-2N
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 10:01:47 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] mtd: introduce the mtd_pairing_scheme concept
Date: Mon, 25 Apr 2016 12:01:18 +0200
Message-Id: <1461578481-26567-2-git-send-email-boris.brezillon@free-electrons.com>
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

MLC and TLC NAND devices are using NAND cells exposing more than one bit,
but instead of attaching all the bits in a given cell to a single NAND
page, each bit is usually attached to a different page. This concept is
called 'page pairing', and has significant impacts on the flash storage
usage.
The main problem showed by these devices is that interrupting a page
program operation may not only corrupt the page we are programming
but also the page it is paired with, hence the need to expose to MTD
users the pairing scheme information.

The pairing APIs allows one to query pairing information attached to a
given page (here called wunit), or the other way around (the wunit
pointed by pairing information).
It also provides several helpers to help the conversion between absolute
offsets and wunits, and query the number of pairing groups.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdcore.c   | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c   |  1 +
 include/linux/mtd/mtd.h | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e3936b8..315adc0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -376,6 +376,68 @@ static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
 }
 
 /**
+ *	mtd_wunit_to_pairing_info - get pairing information of a wunit
+ *	@mtd: pointer to new MTD device info structure
+ *	@wunit: the write unit we are interrested in
+ *	@info: pairing information struct
+ *
+ *	Retrieve pairing information associated to the wunit.
+ *	This is mainly useful when dealing with MLC/TLC NANDs where pages
+ *	can be paired together, and where programming a page may influence
+ *	the page it is paired with.
+ *	The notion of page is replaced by the term wunit (write-unit).
+ */
+void mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
+			       struct mtd_pairing_info *info)
+{
+	if (!mtd->pairing || !mtd->pairing->get_info) {
+		info->group = 0;
+		info->pair = wunit;
+	} else {
+		mtd->pairing->get_info(mtd, wunit, info);
+	}
+}
+EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
+
+/**
+ *	mtd_wunit_to_pairing_info - get wunit from pairing information
+ *	@mtd: pointer to new MTD device info structure
+ *	@info: pairing information struct
+ *
+ *	Return a positive number representing the wunit associated to the
+ *	info struct, or a negative error code.
+ */
+int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
+			      const struct mtd_pairing_info *info)
+{
+	if (!mtd->pairing || !mtd->pairing->get_info) {
+		if (info->group)
+			return -EINVAL;
+
+		return info->pair;
+	}
+
+	return mtd->pairing->get_wunit(mtd, info);
+}
+EXPORT_SYMBOL_GPL(mtd_pairing_info_to_wunit);
+
+/**
+ *	mtd_pairing_groups_per_eb - get the number of pairing groups per erase
+ *				    block
+ *	@mtd: pointer to new MTD device info structure
+ *
+ *	Return the number of pairing groups per erase block.
+ */
+int mtd_pairing_groups_per_eb(struct mtd_info *mtd)
+{
+	if (!mtd->pairing || !mtd->pairing->ngroups)
+		return 1;
+
+	return mtd->pairing->ngroups;
+}
+EXPORT_SYMBOL_GPL(mtd_pairing_groups_per_eb);
+
+/**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
  *
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1f13e32..e32a0ac 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -397,6 +397,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.oobsize = master->oobsize;
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
+	slave->mtd.pairing = master->pairing;
 
 	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 29a1706..4961092 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -127,6 +127,36 @@ struct mtd_ooblayout_ops {
 		    struct mtd_oob_region *oobfree);
 };
 
+/**
+ * struct mtd_pairing_info - Page pairing information
+ *
+ * @pair: represent the pair index in the paired pages table.For example, if
+ *	  page 0 and page 2 are paired together they form the first pair.
+ * @group: the group represent the bit position in the cell. For example,
+ *	   page 0 uses bit 0 and is thus part of group 0.
+ */
+struct mtd_pairing_info {
+	int pair;
+	int group;
+};
+
+/**
+ * struct mtd_pairing_scheme - Page pairing information
+ *
+ * @ngroups: number of groups. Should be related to the number of bits
+ *	     per cell.
+ * @get_info: get the paring info of a given write-unit (ie page). This
+ *	      function should fill the info struct passed in argument.
+ * @get_page: convert paring information into a write-unit (page) number.
+ */
+struct mtd_pairing_scheme {
+	int ngroups;
+	void (*get_info)(struct mtd_info *mtd, int wunit,
+			 struct mtd_pairing_info *info);
+	int (*get_wunit)(struct mtd_info *mtd,
+			 const struct mtd_pairing_info *info);
+};
+
 struct module;	/* only needed for owner field in mtd_info */
 
 struct mtd_info {
@@ -188,6 +218,9 @@ struct mtd_info {
 	/* OOB layout description */
 	const struct mtd_ooblayout_ops *ooblayout;
 
+	/* NAND pairing scheme, only provided for MLC/TLC NANDs */
+	const struct mtd_pairing_scheme *pairing;
+
 	/* the ecc step size. */
 	unsigned int ecc_step_size;
 
@@ -312,6 +345,32 @@ static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
 	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
 }
 
+static inline int mtd_offset_to_wunit(struct mtd_info *mtd, loff_t offs)
+{
+	if (mtd->erasesize_mask)
+		offs &= mtd->erasesize_mask;
+	else
+		offs = offs % mtd->erasesize;
+
+	if (mtd->writesize_shift)
+		offs >>= mtd->writesize_shift;
+	else
+		offs %= mtd->writesize;
+
+	return offs;
+}
+
+static inline loff_t mtd_wunit_to_offset(struct mtd_info *mtd, loff_t base,
+					 int wunit)
+{
+	return base + (wunit * mtd->writesize);
+}
+
+void mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
+			       struct mtd_pairing_info *info);
+int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
+			      const struct mtd_pairing_info *info);
+int mtd_pairing_groups_per_eb(struct mtd_info *mtd);
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
 int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	      void **virt, resource_size_t *phys);
@@ -397,6 +456,11 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 	return do_div(sz, mtd->writesize);
 }
 
+static inline int mtd_wunit_per_eb(struct mtd_info *mtd)
+{
+	return mtd->erasesize / mtd->writesize;
+}
+
 static inline int mtd_has_oob(const struct mtd_info *mtd)
 {
 	return mtd->_read_oob && mtd->_write_oob;
-- 
2.7.4
