Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYpcg-0008QZ-78
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 08:51:08 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Ladislav Michl <ladis@linux-mips.org>
Subject: [PATCH v5 3/3] mtd: Remove duplicate checks on mtd_oob_ops parameter
Date: Tue,  9 Jan 2018 09:50:35 +0100
Message-Id: <20180109085035.12438-3-boris.brezillon@free-electrons.com>
In-Reply-To: <20180109085035.12438-1-boris.brezillon@free-electrons.com>
References: <20180109085035.12438-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some of the check done in custom ->_read/write_oob() implementation are
already done by the core (in mtd_check_oob_ops()).

Suggested-by: Peter Pan <peterpansjtu@gmail.com>
[Remove redundant checks done in mtdpart.c]
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Ladislav Michl <ladis@linux-mips.org>
---
Changes in v5:
- Remove more checks in nand_base.c

Changes in v4:
- Integrated into the SPI NAND preparation patchset

Changes in v3:
- Rebased on mtd/next after "mtd: Stop directly calling master ->_xxx()
  hooks from mtdpart code" had been dropped

Changes in v2:
- Merge "mtd: Remove unneeded checks in part_{read,write}_oob()" into
  this commit
---
 drivers/mtd/devices/docg3.c        |  5 -----
 drivers/mtd/mtdpart.c              | 23 -------------------
 drivers/mtd/nand/nand_base.c       | 45 --------------------------------------
 drivers/mtd/onenand/onenand_base.c | 18 ---------------
 4 files changed, 91 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 5fb5e93d1547..a85af236b44d 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -904,9 +904,6 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	if (ooblen % DOC_LAYOUT_OOB_SIZE)
 		return -EINVAL;
 
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	ops->oobretlen = 0;
 	ops->retlen = 0;
 	ret = 0;
@@ -1441,8 +1438,6 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	if (len && ooblen &&
 	    (len / DOC_LAYOUT_PAGE_SIZE) != (ooblen / oobdelta))
 		return -EINVAL;
-	if (ofs + len > mtd->size)
-		return -EINVAL;
 
 	ops->oobretlen = 0;
 	ops->retlen = 0;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index dd28cb0de2c8..76cd21d1171b 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -108,25 +108,6 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 	struct mtd_ecc_stats stats;
 	int res;
 
-	if (from >= mtd->size)
-		return -EINVAL;
-	if (ops->datbuf && from + ops->len > mtd->size)
-		return -EINVAL;
-
-	/*
-	 * If OOB is also requested, make sure that we do not read past the end
-	 * of this partition.
-	 */
-	if (ops->oobbuf) {
-		size_t len, pages;
-
-		len = mtd_oobavail(mtd, ops);
-		pages = mtd_div_by_ws(mtd->size, mtd);
-		pages -= mtd_div_by_ws(from, mtd);
-		if (ops->ooboffs + ops->ooblen > pages * len)
-			return -EINVAL;
-	}
-
 	stats = part->parent->ecc_stats;
 	res = part->parent->_read_oob(part->parent, from + part->offset, ops);
 	if (unlikely(mtd_is_eccerr(res)))
@@ -191,10 +172,6 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 {
 	struct mtd_part *part = mtd_to_part(mtd);
 
-	if (to >= mtd->size)
-		return -EINVAL;
-	if (ops->datbuf && to + ops->len > mtd->size)
-		return -EINVAL;
 	return part->parent->_write_oob(part->parent, to + part->offset, ops);
 }
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 889ceadbf607..e7ec55b1d368 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2187,21 +2187,6 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
 	len = mtd_oobavail(mtd, ops);
 
-	if (unlikely(ops->ooboffs >= len)) {
-		pr_debug("%s: attempt to start read outside oob\n",
-				__func__);
-		return -EINVAL;
-	}
-
-	/* Do not allow reads past end of device */
-	if (unlikely(from >= mtd->size ||
-		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
-					(from >> chip->page_shift)) * len)) {
-		pr_debug("%s: attempt to read beyond end of device\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	chipnr = (int)(from >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
 
@@ -2272,13 +2257,6 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	ops->retlen = 0;
 
-	/* Do not allow reads past end of device */
-	if (ops->datbuf && (from + ops->len) > mtd->size) {
-		pr_debug("%s: attempt to read beyond end of device\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	if (ops->mode != MTD_OPS_PLACE_OOB &&
 	    ops->mode != MTD_OPS_AUTO_OOB &&
 	    ops->mode != MTD_OPS_RAW)
@@ -2820,22 +2798,6 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	}
 
-	if (unlikely(ops->ooboffs >= len)) {
-		pr_debug("%s: attempt to start write outside oob\n",
-				__func__);
-		return -EINVAL;
-	}
-
-	/* Do not allow write past end of device */
-	if (unlikely(to >= mtd->size ||
-		     ops->ooboffs + ops->ooblen >
-			((mtd->size >> chip->page_shift) -
-			 (to >> chip->page_shift)) * len)) {
-		pr_debug("%s: attempt to write beyond end of device\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -2891,13 +2853,6 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	/* Do not allow writes past end of device */
-	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		pr_debug("%s: attempt to write beyond end of device\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	nand_get_device(mtd, FL_WRITING);
 
 	switch (ops->mode) {
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 050ba8a87543..979f4031f23c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1383,15 +1383,6 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	}
 
-	/* Do not allow reads past end of device */
-	if (unlikely(from >= mtd->size ||
-		     column + len > ((mtd->size >> this->page_shift) -
-				     (from >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "%s: Attempted to read beyond end of device\n",
-			__func__);
-		return -EINVAL;
-	}
-
 	stats = mtd->ecc_stats;
 
 	readcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
@@ -2024,15 +2015,6 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	}
 
-	/* Do not allow reads past end of device */
-	if (unlikely(to >= mtd->size ||
-		     column + len > ((mtd->size >> this->page_shift) -
-				     (to >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "%s: Attempted to write past end of device\n",
-		       __func__);
-		return -EINVAL;
-	}
-
 	oobbuf = this->oob_buf;
 
 	oobcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
-- 
2.11.0
