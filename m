Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HO7Pp-0004bg-Kg
	for linux-mtd@lists.infradead.org; Mon, 05 Mar 2007 02:15:29 -0500
Date: Mon, 5 Mar 2007 10:15:22 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD/NAND: make oobavail public
Message-Id: <20070305101522.f007b179.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: wookey@aleph1.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During the MTD rework the oobavail parameter of mtd_info structure has become private. This is not quite correct in terms of integrity and logic. If we have means to write to OOB area, then we'd like to know upfront how many bytes out of OOB are spare per page to be able to adapt to specific cases.
I _do_ _agree_ that no assumptions can be made about the size of spare OOB area per page. But still, a filesystem may want to store some caching/speedup data in OOB, thus increasing the performance or decreasing the mount time, or for whatever else reason you can think of. If there's no OOB space available, that's okay; if there's some, that's also okay; but the thing is that we need to know the situation upfront.
The patch inlined adds the public oobavail parameter.

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

 drivers/mtd/mtdconcat.c            |    1 +
 drivers/mtd/mtdpart.c              |    1 +
 drivers/mtd/nand/nand_base.c       |    1 +
 drivers/mtd/onenand/onenand_base.c |    1 +
 include/linux/mtd/mtd.h            |    1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 880580c..41844ea 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -727,6 +727,7 @@ struct mtd_info *mtd_concat_create(struc
 	concat->mtd.erasesize = subdev[0]->erasesize;
 	concat->mtd.writesize = subdev[0]->writesize;
 	concat->mtd.oobsize = subdev[0]->oobsize;
+	concat->mtd.oobavail = subdev[0]->oobavail;
 	if (subdev[0]->writev)
 		concat->mtd.writev = concat_writev;
 	if (subdev[0]->read_oob)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 633def3..01e4aff 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -338,6 +338,7 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.size = parts[i].size;
 		slave->mtd.writesize = master->writesize;
 		slave->mtd.oobsize = master->oobsize;
+		slave->mtd.oobavail = master->oobavail;
 		slave->mtd.subpage_sft = master->subpage_sft;
 
 		slave->mtd.name = parts[i].name;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index acaf97b..6af37b8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2524,6 +2524,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
 		chip->ecc.layout->oobavail +=
 			chip->ecc.layout->oobfree[i].length;
+	mtd->oobavail = chip->ecc.layout->oobavail;
 
 	/*
 	 * Set the number of read / write steps for one page depending on ECC
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7f1cb6e..621c3f8 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2367,6 +2367,7 @@ int onenand_scan(struct mtd_info *mtd, i
 	for (i = 0; this->ecclayout->oobfree[i].length; i++)
 		this->ecclayout->oobavail +=
 			this->ecclayout->oobfree[i].length;
+	mtd->oobavail = this->ecclayout->oobavail;
 
 	mtd->ecclayout = this->ecclayout;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 6a8570b..3d956c3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -121,6 +121,7 @@ struct mtd_info {
 	u_int32_t writesize;
 
 	u_int32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+	u_int32_t oobavail;  // Available OOB bytes per block
 
 	// Kernel-only stuff starts here.
 	char *name;
