Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKyA-0005Xc-MJ
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/22] UBI: amend comments after all the renamings
Date: Fri, 18 May 2012 14:04:00 +0300
Message-Id: <1337339045-8199-18-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch amends commentaries in scan.[ch] to match the new logic. Reminder -
we did the restructuring to prepare the code for adding the fastmap. This patch
also renames a couple of functions - it was too difficult to separate out that
change and I decided that it is not too bad to have it in the same patch with
commentaries changes.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c     |   12 ++---
 drivers/mtd/ubi/io.c        |    3 +-
 drivers/mtd/ubi/scan.c      |  111 +++++++++++++++++++++----------------------
 drivers/mtd/ubi/scan.h      |    2 +-
 drivers/mtd/ubi/ubi-media.h |    4 +-
 drivers/mtd/ubi/vtbl.c      |   22 ++++-----
 6 files changed, 73 insertions(+), 81 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 2a8f26b..7f293b2 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -27,10 +27,6 @@
  * module load parameters or the kernel boot parameters. If MTD devices were
  * specified, UBI does not attach any MTD device, but it is possible to do
  * later using the "UBI control device".
- *
- * At the moment we only attach UBI devices by scanning, which will become a
- * bottleneck when flashes reach certain large size. Then one may improve UBI
- * and add other methods, although it does not seem to be easy to do.
  */
 
 #include <linux/err.h>
@@ -790,11 +786,11 @@ static int io_init(struct ubi_device *ubi)
 	ubi_msg("data offset:                %d", ubi->leb_start);
 
 	/*
-	 * Note, ideally, we have to initialize ubi->bad_peb_count here. But
+	 * Note, ideally, we have to initialize @ubi->bad_peb_count here. But
 	 * unfortunately, MTD does not provide this information. We should loop
 	 * over all physical eraseblocks and invoke mtd->block_is_bad() for
-	 * each physical eraseblock. So, we skip ubi->bad_peb_count
-	 * uninitialized and initialize it after scanning.
+	 * each physical eraseblock. So, we leave @ubi->bad_peb_count
+	 * uninitialized so far.
 	 */
 
 	return 0;
@@ -805,7 +801,7 @@ static int io_init(struct ubi_device *ubi)
  * @ubi: UBI device description object
  * @vol_id: ID of the volume to re-size
  *
- * This function re-sizes the volume marked by the @UBI_VTBL_AUTORESIZE_FLG in
+ * This function re-sizes the volume marked by the %UBI_VTBL_AUTORESIZE_FLG in
  * the volume table to the largest possible size. See comments in ubi-header.h
  * for more description of the flag. Returns zero in case of success and a
  * negative error code in case of failure.
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c372985..a8d5237 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -513,8 +513,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * It is important to first invalidate the EC header, and then the VID
 	 * header. Otherwise a power cut may lead to valid EC header and
 	 * invalid VID header, in which case UBI will treat this PEB as
-	 * corrupted and will try to preserve it, and print scary warnings (see
-	 * the header comment in scan.c for more information).
+	 * corrupted and will try to preserve it, and print scary warnings.
 	 */
 	addr = (loff_t)pnum * ubi->peb_size;
 	err = mtd_write(ubi->mtd, addr, 4, &written, (void *)&data);
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 06a2d70..93257f3 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -19,21 +19,21 @@
  */
 
 /*
- * UBI scanning sub-system.
+ * UBI attaching sub-system.
  *
- * This sub-system is responsible for scanning the flash media, checking UBI
- * headers and providing complete information about the UBI flash image.
+ * This sub-system is responsible for attaching MTD devices and it also
+ * implements flash media scanning.
  *
  * The attaching information is represented by a &struct ubi_attach_info'
- * object. Information about found volumes is represented by
- * &struct ubi_ainf_volume objects which are kept in volume RB-tree with root
- * at the @volumes field. The RB-tree is indexed by the volume ID.
+ * object. Information about volumes is represented by &struct ubi_ainf_volume
+ * objects which are kept in volume RB-tree with root at the @volumes field.
+ * The RB-tree is indexed by the volume ID.
  *
- * Scanned logical eraseblocks are represented by &struct ubi_ainf_peb objects.
- * These objects are kept in per-volume RB-trees with the root at the
- * corresponding &struct ubi_ainf_volume object. To put it differently, we keep
- * an RB-tree of per-volume objects and each of these objects is the root of
- * RB-tree of per-eraseblock objects.
+ * Logical eraseblocks are represented by &struct ubi_ainf_peb objects. These
+ * objects are kept in per-volume RB-trees with the root at the corresponding
+ * &struct ubi_ainf_volume object. To put it differently, we keep an RB-tree of
+ * per-volume objects and each of these objects is the root of RB-tree of
+ * per-LEB objects.
  *
  * Corrupted physical eraseblocks are put to the @corr list, free physical
  * eraseblocks are put to the @free list and the physical eraseblock to be
@@ -51,28 +51,29 @@
  *
  * 1. Corruptions caused by power cuts. These are expected corruptions and UBI
  * tries to handle them gracefully, without printing too many warnings and
- * error messages. The idea is that we do not lose important data in these case
- * - we may lose only the data which was being written to the media just before
- * the power cut happened, and the upper layers (e.g., UBIFS) are supposed to
- * handle such data losses (e.g., by using the FS journal).
+ * error messages. The idea is that we do not lose important data in these
+ * cases - we may lose only the data which were being written to the media just
+ * before the power cut happened, and the upper layers (e.g., UBIFS) are
+ * supposed to handle such data losses (e.g., by using the FS journal).
  *
  * When UBI detects a corruption (CRC-32 mismatch) in a PEB, and it looks like
  * the reason is a power cut, UBI puts this PEB to the @erase list, and all
  * PEBs in the @erase list are scheduled for erasure later.
  *
  * 2. Unexpected corruptions which are not caused by power cuts. During
- * scanning, such PEBs are put to the @corr list and UBI preserves them.
+ * attaching, such PEBs are put to the @corr list and UBI preserves them.
  * Obviously, this lessens the amount of available PEBs, and if at some  point
  * UBI runs out of free PEBs, it switches to R/O mode. UBI also loudly informs
  * about such PEBs every time the MTD device is attached.
  *
  * However, it is difficult to reliably distinguish between these types of
- * corruptions and UBI's strategy is as follows. UBI assumes corruption type 2
- * if the VID header is corrupted and the data area does not contain all 0xFFs,
- * and there were no bit-flips or integrity errors while reading the data area.
- * Otherwise UBI assumes corruption type 1. So the decision criteria are as
- * follows.
- *   o If the data area contains only 0xFFs, there is no data, and it is safe
+ * corruptions and UBI's strategy is as follows (in case of attaching by
+ * scanning). UBI assumes corruption type 2 if the VID header is corrupted and
+ * the data area does not contain all 0xFFs, and there were no bit-flips or
+ * integrity errors (e.g., ECC errors in case of NAND) while reading the data
+ * area.  Otherwise UBI assumes corruption type 1. So the decision criteria
+ * are as follows.
+ *   o If the data area contains only 0xFFs, there are no data, and it is safe
  *     to just erase this PEB - this is corruption type 1.
  *   o If the data area has bit-flips or data integrity errors (ECC errors on
  *     NAND), it is probably a PEB which was being erased when power cut
@@ -102,7 +103,8 @@ static struct ubi_vid_hdr *vidh;
  * @to_head: if not zero, add to the head of the list
  * @list: the list to add to
  *
- * This function adds physical eraseblock @pnum to free, erase, or alien lists.
+ * This function allocates a 'struct ubi_ainf_peb' object for physical
+ * eraseblock @pnum and adds it to the "free", "erase", or "alien" lists.
  * If @to_head is not zero, PEB will be added to the head of the list, which
  * basically means it will be processed first later. E.g., we add corrupted
  * PEBs (corrupted due to power cuts) to the head of the erase list to make
@@ -144,9 +146,10 @@ static int add_to_list(struct ubi_attach_info *ai, int pnum, int ec,
  * @pnum: physical eraseblock number to add
  * @ec: erase counter of the physical eraseblock
  *
- * This function adds corrupted physical eraseblock @pnum to the 'corr' list.
- * The corruption was presumably not caused by a power cut. Returns zero in
- * case of success and a negative error code in case of failure.
+ * This function allocates a 'struct ubi_ainf_peb' object for a corrupted
+ * physical eraseblock @pnum and adds it to the 'corr' list.  The corruption
+ * was presumably not caused by a power cut. Returns zero in case of success
+ * and a negative error code in case of failure.
  */
 static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
 {
@@ -241,8 +244,8 @@ bad:
  * If the volume corresponding to the @vid_hdr logical eraseblock is already
  * present in the attaching information, this function does nothing. Otherwise
  * it adds corresponding volume to the attaching information. Returns a pointer
- * to the scanning volume object in case of success and a negative error code
- * in case of failure.
+ * to the allocated "av" object in case of success and a negative error code in
+ * case of failure.
  */
 static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
 					  int vol_id, int pnum,
@@ -425,7 +428,7 @@ out_free_vidh:
 }
 
 /**
- * ubi_add_to_av - add physical eraseblock to the attaching information.
+ * ubi_add_to_av - add used physical eraseblock to the attaching information.
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: the physical eraseblock number
@@ -692,8 +695,8 @@ out_free:
  * the lists, writes the EC header if it is needed, and removes it from the
  * list.
  *
- * This function returns scanning physical eraseblock information in case of
- * success and an error code in case of failure.
+ * This function returns a pointer to the "aeb" of the found free PEB in case
+ * of success and an error code in case of failure.
  */
 struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 				       struct ubi_attach_info *ai)
@@ -793,16 +796,18 @@ out_unlock:
 }
 
 /**
- * process_eb - read, check UBI headers, and add them to attaching information.
+ * scan_peb - scan and process UBI headers of a PEB.
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: the physical eraseblock number
  *
- * This function returns a zero if the physical eraseblock was successfully
- * handled and a negative error code in case of failure.
+ * This function reads UBI headers of PEB @pnum, checks them, and adds
+ * information about this PEB to the corresponding list or RB-tree in the
+ * "attaching info" structure. Returns zero if the physical eraseblock was
+ * successfully handled and a negative error code in case of failure.
  */
-static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *ai,
-		      int pnum)
+static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
+		    int pnum)
 {
 	long long uninitialized_var(ec);
 	int err, bitflips = 0, vol_id, ec_err = 0;
@@ -814,11 +819,6 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (err < 0)
 		return err;
 	else if (err) {
-		/*
-		 * FIXME: this is actually duty of the I/O sub-system to
-		 * initialize this, but MTD does not provide enough
-		 * information.
-		 */
 		ai->bad_peb_count += 1;
 		return 0;
 	}
@@ -1033,18 +1033,17 @@ adjust_mean_ec:
 }
 
 /**
- * check_what_we_have - check what PEB were found by scanning.
+ * late_analysis - analyze the overall situation with PEB.
  * @ubi: UBI device description object
  * @ai: attaching information
  *
- * This is a helper function which takes a look what PEBs were found by
- * scanning, and decides whether the flash is empty and should be formatted and
- * whether there are too many corrupted PEBs and we should not attach this
- * MTD device. Returns zero if we should proceed with attaching the MTD device,
- * and %-EINVAL if we should not.
+ * This is a helper function which takes a look what PEBs we have after we
+ * gather information about all of them ("ai" is compete). It decides whether
+ * the flash is empty and should be formatted of whether there are too many
+ * corrupted PEBs and we should not attach this MTD device. Returns zero if we
+ * should proceed with attaching the MTD device, and %-EINVAL if we should not.
  */
-static int check_what_we_have(struct ubi_device *ubi,
-			      struct ubi_attach_info *ai)
+static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb;
 	int max_corr, peb_count;
@@ -1112,7 +1111,8 @@ static int check_what_we_have(struct ubi_device *ubi,
  * @ubi: UBI device description object
  *
  * This function does full scanning of an MTD device and returns complete
- * information about it. In case of failure, an error code is returned.
+ * information about it in form of a "struct ubi_attach_info" object. In case
+ * of failure, an error code is returned.
  */
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 {
@@ -1151,7 +1151,7 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = process_eb(ubi, ai, pnum);
+		err = scan_peb(ubi, ai, pnum);
 		if (err < 0)
 			goto out_vidh;
 	}
@@ -1162,7 +1162,7 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	if (ai->ec_count)
 		ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
 
-	err = check_what_we_have(ubi, ai);
+	err = late_analysis(ubi, ai);
 	if (err)
 		goto out_vidh;
 
@@ -1208,12 +1208,11 @@ out_ai:
 }
 
 /**
- * destroy_av - free the scanning volume information
- * @av: scanning volume information
+ * destroy_av - free volume attaching information.
+ * @av: volume attaching information
  * @ai: attaching information
  *
- * This function destroys the volume RB-tree (@av->root) and the scanning
- * volume information.
+ * This function destroys the volume attaching information.
  */
 static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 20bec7c..a794577 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -146,7 +146,7 @@ struct ubi_vid_hdr;
  * ubi_move_aeb_to_list - move a PEB from the volume tree to a list.
  *
  * @av: volume attaching information
- * @aeb: scanning eraseblock information
+ * @aeb: attaching eraseblock information
  * @list: the list to move to
  */
 static inline void ubi_move_aeb_to_list(struct ubi_ainf_volume *av,
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 6fb8ec2..07cd88f 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -149,10 +149,10 @@ enum {
  * The @image_seq field is used to validate a UBI image that has been prepared
  * for a UBI device. The @image_seq value can be any value, but it must be the
  * same on all eraseblocks. UBI will ensure that all new erase counter headers
- * also contain this value, and will check the value when scanning at start-up.
+ * also contain this value, and will check the value when attaching the flash.
  * One way to make use of @image_seq is to increase its value by one every time
  * an image is flashed over an existing image, then, if the flashing does not
- * complete, UBI will detect the error when scanning.
+ * complete, UBI will detect the error when attaching the media.
  */
 struct ubi_ec_hdr {
 	__be32  magic;
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 341c956..437bc19 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -37,16 +37,15 @@
  * LEB 1. This scheme guarantees recoverability from unclean reboots.
  *
  * In this UBI implementation the on-flash volume table does not contain any
- * information about how many data static volumes contain. This information may
- * be found from the scanning data.
+ * information about how much data static volumes contain.
  *
  * But it would still be beneficial to store this information in the volume
  * table. For example, suppose we have a static volume X, and all its physical
  * eraseblocks became bad for some reasons. Suppose we are attaching the
- * corresponding MTD device, the scanning has found no logical eraseblocks
+ * corresponding MTD device, for some reason we find no logical eraseblocks
  * corresponding to the volume X. According to the volume table volume X does
  * exist. So we don't know whether it is just empty or all its physical
- * eraseblocks went bad. So we cannot alarm the user about this corruption.
+ * eraseblocks went bad. So we cannot alarm the user properly.
  *
  * The volume table also stores so-called "update marker", which is used for
  * volume updates. Before updating the volume, the update marker is set, and
@@ -702,16 +701,16 @@ bad:
 }
 
 /**
- * check_scanning_info - check that attaching information.
+ * check_attaching_info - check that attaching information.
  * @ubi: UBI device description object
  * @ai: attaching information
  *
  * Even though we protect on-flash data by CRC checksums, we still don't trust
  * the media. This function ensures that attaching information is consistent to
- * the information read from the volume table. Returns zero if the scanning
+ * the information read from the volume table. Returns zero if the attaching
  * information is OK and %-EINVAL if it is not.
  */
-static int check_scanning_info(const struct ubi_device *ubi,
+static int check_attaching_info(const struct ubi_device *ubi,
 			       struct ubi_attach_info *ai)
 {
 	int err, i;
@@ -719,15 +718,14 @@ static int check_scanning_info(const struct ubi_device *ubi,
 	struct ubi_volume *vol;
 
 	if (ai->vols_found > UBI_INT_VOL_COUNT + ubi->vtbl_slots) {
-		ubi_err("scanning found %d volumes, maximum is %d + %d",
+		ubi_err("found %d volumes while attaching, maximum is %d + %d",
 			ai->vols_found, UBI_INT_VOL_COUNT, ubi->vtbl_slots);
 		return -EINVAL;
 	}
 
 	if (ai->highest_vol_id >= ubi->vtbl_slots + UBI_INT_VOL_COUNT &&
 	    ai->highest_vol_id < UBI_INTERNAL_VOL_START) {
-		ubi_err("too large volume ID %d found by scanning",
-			ai->highest_vol_id);
+		ubi_err("too large volume ID %d found", ai->highest_vol_id);
 		return -EINVAL;
 	}
 
@@ -749,7 +747,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 				continue;
 
 			/*
-			 * During scanning we found a volume which does not
+			 * During attaching we found a volume which does not
 			 * exist according to the information in the volume
 			 * table. This must have happened due to an unclean
 			 * reboot while the volume was being removed. Discard
@@ -839,7 +837,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	 * Make sure that the attaching information is consistent to the
 	 * information stored in the volume table.
 	 */
-	err = check_scanning_info(ubi, ai);
+	err = check_attaching_info(ubi, ai);
 	if (err)
 		goto out_free;
 
-- 
1.7.10
