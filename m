Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qja28-0006iI-DB
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 16:54:07 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd: spelling fixes
Date: Wed, 20 Jul 2011 09:53:42 -0700
Message-ID: <1311180822-6226-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311180822-6226-1-git-send-email-computersforpeace@gmail.com>
References: <1311180822-6226-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ftl.c        |    2 +-
 drivers/mtd/inftlmount.c |    2 +-
 drivers/mtd/mtdchar.c    |    4 ++--
 drivers/mtd/mtdconcat.c  |    2 +-
 drivers/mtd/mtdcore.c    |    2 +-
 drivers/mtd/mtdswap.c    |    2 +-
 drivers/mtd/nftlmount.c  |   26 +++++++++++++-------------
 drivers/mtd/sm_ftl.c     |   16 ++++++++--------
 8 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 95d7768..c7382bb 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -598,7 +598,7 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
     unit with the fewest erases, and usually pick the data unit with
     the most deleted blocks.  But with a small probability, pick the
     oldest data unit instead.  This means that we generally postpone
-    the next reclaimation as long as possible, but shuffle static
+    the next reclamation as long as possible, but shuffle static
     stuff around a bit for wear leveling.
 
 ======================================================================*/
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index d19898c..2ff601f 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -367,7 +367,7 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
  *
  * Return: 0 when succeed, -1 on error.
  *
- * ToDo: 1. Is it neceressary to check_free_sector after erasing ??
+ * ToDo: 1. Is it necessary to check_free_sector after erasing ??
  */
 int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 {
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index d899757..8da6dbd 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -43,7 +43,7 @@ static struct vfsmount *mtd_inode_mnt __read_mostly;
 
 /*
  * Data structure to hold the pointer to the mtd device as well
- * as mode information ofr various use cases.
+ * as mode information of various use cases.
  */
 struct mtd_file_info {
 	struct mtd_info *mtd;
@@ -495,7 +495,7 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 /*
  * Copies (and truncates, if necessary) data from the larger struct,
  * nand_ecclayout, to the smaller, deprecated layout struct,
- * nand_ecclayout_user. This is necessary only to suppport the deprecated
+ * nand_ecclayout_user. This is necessary only to support the deprecated
  * API ioctl ECCGETLAYOUT while allowing all new functionality to use
  * nand_ecclayout flexibly (i.e. the struct may change size in new
  * releases without requiring major rewrites).
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index e601672..d3fabd1 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -770,7 +770,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 
 	/*
 	 * Set up the new "super" device's MTD object structure, check for
-	 * incompatibilites between the subdevices.
+	 * incompatibilities between the subdevices.
 	 */
 	concat->mtd.type = subdev[0]->type;
 	concat->mtd.flags = subdev[0]->flags;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 887aed0..09bdbac 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -449,7 +449,7 @@ out_error:
  *   is used, see 'parse_mtd_partitions()' for more information). If none are
  *   found this functions tries to fallback to information specified in
  *   @parts/@nr_parts.
- * * If any parititioning info was found, this function registers the found
+ * * If any partitioning info was found, this function registers the found
  *   partitions.
  * * If no partitions were found this function just registers the MTD device
  *   @mtd and exits.
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 5e5423b..9961063 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -86,7 +86,7 @@ struct swap_eb {
 	unsigned int flags;
 	unsigned int active_count;
 	unsigned int erase_count;
-	unsigned int pad;		/* speeds up pointer decremtnt */
+	unsigned int pad;		/* speeds up pointer decrement */
 };
 
 #define MTDSWAP_ECNT_MIN(rbroot) (rb_entry(rb_first(rbroot), struct swap_eb, \
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index e3cd1ff..ac40925 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -32,7 +32,7 @@
 
 /* find_boot_record: Find the NFTL Media Header and its Spare copy which contains the
  *	various device information of the NFTL partition and Bad Unit Table. Update
- *	the ReplUnitTable[] table accroding to the Bad Unit Table. ReplUnitTable[]
+ *	the ReplUnitTable[] table according to the Bad Unit Table. ReplUnitTable[]
  *	is used for management of Erase Unit in other routines in nftl.c and nftlmount.c
  */
 static int find_boot_record(struct NFTLrecord *nftl)
@@ -297,7 +297,7 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
  *
  * Return: 0 when succeed, -1 on error.
  *
- *  ToDo: 1. Is it neceressary to check_free_sector after erasing ??
+ *  ToDo: 1. Is it necessary to check_free_sector after erasing ??
  */
 int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 {
@@ -337,7 +337,7 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 		nb_erases = le32_to_cpu(uci.WearInfo);
 		nb_erases++;
 
-		/* wrap (almost impossible with current flashs) or free block */
+		/* wrap (almost impossible with current flash) or free block */
 		if (nb_erases == 0)
 			nb_erases = 1;
 
@@ -363,10 +363,10 @@ fail:
  *	Mark as 'IGNORE' each incorrect sector. This check is only done if the chain
  *	was being folded when NFTL was interrupted.
  *
- *	The check_free_sectors in this function is neceressary. There is a possible
+ *	The check_free_sectors in this function is necessary. There is a possible
  *	situation that after writing the Data area, the Block Control Information is
  *	not updated according (due to power failure or something) which leaves the block
- *	in an umconsistent state. So we have to check if a block is really FREE in this
+ *	in an inconsistent state. So we have to check if a block is really FREE in this
  *	case. */
 static void check_sectors_in_chain(struct NFTLrecord *nftl, unsigned int first_block)
 {
@@ -428,7 +428,7 @@ static int calc_chain_length(struct NFTLrecord *nftl, unsigned int first_block)
 
 	for (;;) {
 		length++;
-		/* avoid infinite loops, although this is guaranted not to
+		/* avoid infinite loops, although this is guaranteed not to
 		   happen because of the previous checks */
 		if (length >= nftl->nb_blocks) {
 			printk("nftl: length too long %d !\n", length);
@@ -447,11 +447,11 @@ static int calc_chain_length(struct NFTLrecord *nftl, unsigned int first_block)
 /* format_chain: Format an invalid Virtual Unit chain. It frees all the Erase Units in a
  *	Virtual Unit Chain, i.e. all the units are disconnected.
  *
- *	It is not stricly correct to begin from the first block of the chain because
+ *	It is not strictly correct to begin from the first block of the chain because
  *	if we stop the code, we may see again a valid chain if there was a first_block
  *	flag in a block inside it. But is it really a problem ?
  *
- * FixMe: Figure out what the last statesment means. What if power failure when we are
+ * FixMe: Figure out what the last statement means. What if power failure when we are
  *	in the for (;;) loop formatting blocks ??
  */
 static void format_chain(struct NFTLrecord *nftl, unsigned int first_block)
@@ -485,7 +485,7 @@ static void format_chain(struct NFTLrecord *nftl, unsigned int first_block)
  *	totally free (only 0xff).
  *
  * Definition: Free Erase Unit -- A properly erased/formatted Free Erase Unit should have meet the
- *	following critia:
+ *	following criteria:
  *	1. */
 static int check_and_mark_free_block(struct NFTLrecord *nftl, int block)
 {
@@ -502,7 +502,7 @@ static int check_and_mark_free_block(struct NFTLrecord *nftl, int block)
 	erase_mark = le16_to_cpu ((h1.EraseMark | h1.EraseMark1));
 	if (erase_mark != ERASE_MARK) {
 		/* if no erase mark, the block must be totally free. This is
-		   possible in two cases : empty filsystem or interrupted erase (very unlikely) */
+		   possible in two cases : empty filesystem or interrupted erase (very unlikely) */
 		if (check_free_sectors (nftl, block * nftl->EraseSize, nftl->EraseSize, 1) != 0)
 			return -1;
 
@@ -544,7 +544,7 @@ static int check_and_mark_free_block(struct NFTLrecord *nftl, int block)
 /* get_fold_mark: Read fold mark from Unit Control Information #2, we use FOLD_MARK_IN_PROGRESS
  *	to indicate that we are in the progression of a Virtual Unit Chain folding. If the UCI #2
  *	is FOLD_MARK_IN_PROGRESS when mounting the NFTL, the (previous) folding process is interrupted
- *	for some reason. A clean up/check of the VUC is neceressary in this case.
+ *	for some reason. A clean up/check of the VUC is necessary in this case.
  *
  * WARNING: return 0 if read error
  */
@@ -657,7 +657,7 @@ int NFTL_mount(struct NFTLrecord *s)
 						printk("Block %d: incorrect logical block: %d expected: %d\n",
 						       block, logical_block, first_logical_block);
 						/* the chain is incorrect : we must format it,
-						   but we need to read it completly */
+						   but we need to read it completely */
 						do_format_chain = 1;
 					}
 					if (is_first_block) {
@@ -669,7 +669,7 @@ int NFTL_mount(struct NFTLrecord *s)
 							printk("Block %d: incorrectly marked as first block in chain\n",
 							       block);
 							/* the chain is incorrect : we must format it,
-							   but we need to read it completly */
+							   but we need to read it completely */
 							do_format_chain = 1;
 						} else {
 							printk("Block %d: folding in progress - ignoring first block flag\n",
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index a8befde..311a9e3 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -34,7 +34,7 @@ module_param(debug, int, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(debug, "Debug level (0-2)");
 
 
-/* ------------------- sysfs attributtes ---------------------------------- */
+/* ------------------- sysfs attributes ---------------------------------- */
 struct sm_sysfs_attribute {
 	struct device_attribute dev_attr;
 	char *data;
@@ -147,7 +147,7 @@ static int sm_get_lba(uint8_t *lba)
 
 
 /*
- * Read LBA asscociated with block
+ * Read LBA associated with block
  * returns -1, if block is erased
  * returns -2 if error happens
  */
@@ -252,7 +252,7 @@ static int sm_read_sector(struct sm_ftl *ftl,
 		return 0;
 	}
 
-	/* User might not need the oob, but we do for data vertification */
+	/* User might not need the oob, but we do for data verification */
 	if (!oob)
 		oob = &tmp_oob;
 
@@ -276,7 +276,7 @@ again:
 			return ret;
 	}
 
-	/* Unfortunelly, oob read will _always_ succeed,
+	/* Unfortunately, oob read will _always_ succeed,
 		despite card removal..... */
 	ret = mtd->read_oob(mtd, sm_mkoffset(ftl, zone, block, boffset), &ops);
 
@@ -447,14 +447,14 @@ static void sm_mark_block_bad(struct sm_ftl *ftl, int zone, int block)
 
 	/* We aren't checking the return value, because we don't care */
 	/* This also fails on fake xD cards, but I guess these won't expose
-		any bad blocks till fail completly */
+		any bad blocks till fail completely */
 	for (boffset = 0; boffset < ftl->block_size; boffset += SM_SECTOR_SIZE)
 		sm_write_sector(ftl, zone, block, boffset, NULL, &oob);
 }
 
 /*
  * Erase a block within a zone
- * If erase succedes, it updates free block fifo, otherwise marks block as bad
+ * If erase succeeds, it updates free block fifo, otherwise marks block as bad
  */
 static int sm_erase_block(struct sm_ftl *ftl, int zone_num, uint16_t block,
 			  int put_free)
@@ -510,7 +510,7 @@ static void sm_erase_callback(struct erase_info *self)
 	complete(&ftl->erase_completion);
 }
 
-/* Throughtly test that block is valid. */
+/* Thoroughly test that block is valid. */
 static int sm_check_block(struct sm_ftl *ftl, int zone, int block)
 {
 	int boffset;
@@ -526,7 +526,7 @@ static int sm_check_block(struct sm_ftl *ftl, int zone, int block)
 	for (boffset = 0; boffset < ftl->block_size;
 					boffset += SM_SECTOR_SIZE) {
 
-		/* This shoudn't happen anyway */
+		/* This shouldn't happen anyway */
 		if (sm_read_sector(ftl, zone, block, boffset, NULL, &oob))
 			return -2;
 
-- 
1.7.0.4
