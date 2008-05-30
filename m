Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K24CT-0003L9-PF
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 12:59:18 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m4UCx7Sh024460
	for <linux-mtd@lists.infradead.org>; Fri, 30 May 2008 15:59:15 +0300
Message-ID: <483FF97A.9000400@nokia.com>
Date: Fri, 30 May 2008 15:56:26 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] [MTD] nandsim: allow for 64-bit size
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amend nandsim so that it does not assume 32-bit flash size.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   35 +++++++++++++++++++++--------------
 1 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index b480516..68c150c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -298,11 +298,11 @@ struct nandsim {
 
 	/* NAND flash "geometry" */
 	struct nandsin_geometry {
-		uint32_t totsz;     /* total flash size, bytes */
+		uint64_t totsz;     /* total flash size, bytes */
 		uint32_t secsz;     /* flash sector (erase block) size, bytes */
 		uint pgsz;          /* NAND flash page size, bytes */
 		uint oobsz;         /* page OOB area size, bytes */
-		uint32_t totszoob;  /* total flash size including OOB, bytes */
+		uint64_t totszoob;  /* total flash size including OOB, bytes */
 		uint pgszoob;       /* page size including OOB , bytes*/
 		uint secszoob;      /* sector size including OOB, bytes */
 		uint pgnum;         /* total number of pages */
@@ -459,6 +459,12 @@ static char *get_partition_name(int i)
 	return kstrdup(buf, GFP_KERNEL);
 }
 
+static u_int64_t divide(u_int64_t n, u_int32_t d)
+{
+	do_div(n, d);
+	return n;
+}
+
 /*
  * Initialize the nandsim structure.
  *
@@ -469,8 +475,8 @@ static int init_nandsim(struct mtd_info *mtd)
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 	struct nandsim   *ns   = (struct nandsim *)(chip->priv);
 	int i, ret = 0;
-	u_int32_t remains;
-	u_int32_t next_offset;
+	u_int64_t remains;
+	u_int64_t next_offset;
 
 	if (NS_IS_INITIALIZED(ns)) {
 		NS_ERR("init_nandsim: nandsim is already initialized\n");
@@ -487,8 +493,8 @@ static int init_nandsim(struct mtd_info *mtd)
 	ns->geom.oobsz    = mtd->oobsize;
 	ns->geom.secsz    = mtd->erasesize;
 	ns->geom.pgszoob  = ns->geom.pgsz + ns->geom.oobsz;
-	ns->geom.pgnum    = ns->geom.totsz / ns->geom.pgsz;
-	ns->geom.totszoob = ns->geom.totsz + ns->geom.pgnum * ns->geom.oobsz;
+	ns->geom.pgnum    = divide(ns->geom.totsz, ns->geom.pgsz);
+	ns->geom.totszoob = ns->geom.totsz + (uint64_t)ns->geom.pgnum * ns->geom.oobsz;
 	ns->geom.secshift = ffs(ns->geom.secsz) - 1;
 	ns->geom.pgshift  = chip->page_shift;
 	ns->geom.oobshift = ffs(ns->geom.oobsz) - 1;
@@ -537,15 +543,16 @@ static int init_nandsim(struct mtd_info *mtd)
 	remains = ns->geom.totsz;
 	next_offset = 0;
 	for (i = 0; i < parts_num; ++i) {
-		unsigned long part = parts[i];
-		if (!part || part > remains / ns->geom.secsz) {
+		u_int64_t part_sz = (u_int64_t)parts[i] * ns->geom.secsz;
+
+		if (!part_sz || part_sz > remains) {
 			NS_ERR("bad partition size.\n");
 			ret = -EINVAL;
 			goto error;
 		}
 		ns->partitions[i].name   = get_partition_name(i);
 		ns->partitions[i].offset = next_offset;
-		ns->partitions[i].size   = part * ns->geom.secsz;
+		ns->partitions[i].size   = part_sz;
 		next_offset += ns->partitions[i].size;
 		remains -= ns->partitions[i].size;
 	}
@@ -573,7 +580,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	if (ns->busw == 16)
 		NS_WARN("16-bit flashes support wasn't tested\n");
 
-	printk("flash size: %u MiB\n",          ns->geom.totsz >> 20);
+	printk("flash size: %llu MiB\n",        ns->geom.totsz >> 20);
 	printk("page size: %u bytes\n",         ns->geom.pgsz);
 	printk("OOB area size: %u bytes\n",     ns->geom.oobsz);
 	printk("sector size: %u KiB\n",         ns->geom.secsz >> 10);
@@ -583,7 +590,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	printk("bits in sector size: %u\n",     ns->geom.secshift);
 	printk("bits in page size: %u\n",       ns->geom.pgshift);
 	printk("bits in OOB size: %u\n",        ns->geom.oobshift);
-	printk("flash size with OOB: %u KiB\n", ns->geom.totszoob >> 10);
+	printk("flash size with OOB: %llu KiB\n", ns->geom.totszoob >> 10);
 	printk("page address bytes: %u\n",      ns->geom.pgaddrbytes);
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
@@ -825,7 +832,7 @@ static int setup_wear_reporting(struct mtd_info *mtd)
 
 	if (!rptwear)
 		return 0;
-	wear_eb_count = mtd->size / mtd->erasesize;
+	wear_eb_count = divide(mtd->size, mtd->erasesize);
 	mem = wear_eb_count * sizeof(unsigned long);
 	if (mem / sizeof(unsigned long) != wear_eb_count) {
 		NS_ERR("Too many erase blocks for wear reporting\n");
@@ -2013,7 +2020,7 @@ static int __init ns_init_module(void)
 	}
 
 	if (overridesize) {
-		u_int32_t new_size = nsmtd->erasesize << overridesize;
+		u_int64_t new_size = (u_int64_t)nsmtd->erasesize << overridesize;
 		if (new_size >> overridesize != nsmtd->erasesize) {
 			NS_ERR("overridesize is too big\n");
 			goto err_exit;
@@ -2021,7 +2028,7 @@ static int __init ns_init_module(void)
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
 		nsmtd->size = new_size;
 		chip->chipsize = new_size;
-		chip->chip_shift = ffs(new_size) - 1;
+		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
 	}
 
-- 
1.5.2.5
