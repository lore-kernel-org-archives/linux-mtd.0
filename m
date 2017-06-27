Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPw4f-0002Vv-H2
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 19:22:59 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 2/2] mtd: Remove duplicate checks on mtd_oob_ops parameter
Date: Tue, 27 Jun 2017 21:22:22 +0200
Message-Id: <20170627192222.13716-2-boris.brezillon@free-electrons.com>
In-Reply-To: <20170627192222.13716-1-boris.brezillon@free-electrons.com>
References: <20170627192222.13716-1-boris.brezillon@free-electrons.com>
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

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/devices/docg3.c        |  5 -----
 drivers/mtd/nand/nand_base.c       | 31 -------------------------------
 drivers/mtd/onenand/onenand_base.c | 18 ------------------
 3 files changed, 54 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 81e108454f54..98100e270af1 100644
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
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ef4462b69eaf..5b86f0bd486d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2323,21 +2323,6 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
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
 
@@ -2974,22 +2959,6 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
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
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index dbbc5b6cecc1..1c002281734b 100644
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
