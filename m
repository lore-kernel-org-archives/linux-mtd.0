Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKyC-0005YL-Ii
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 20/22] UBI: rename UBI_SCAN_UNKNOWN_EC
Date: Fri, 18 May 2012 14:04:03 +0300
Message-Id: <1337339045-8199-21-git-send-email-dedekind1@gmail.com>
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

Rename the constant to UBI_AINF_UNKNOWN, for the same reason that we are going
to add nother attaching method and re-use the same data structures, so the
"SCAN" in the name becomes incorrect. I've also removed the "_EC" part because
Joel is going to use this constant for other fields in the attaching info data
structures.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |   18 +++++++++---------
 drivers/mtd/ubi/scan.h |    9 ++++++---
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index aecd8cf..3488dbe 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -644,7 +644,7 @@ void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: physical eraseblock number to erase;
- * @ec: erase counter value to write (%UBI_SCAN_UNKNOWN_EC if it is unknown)
+ * @ec: erase counter value to write (%UBI_AINF_UNKNOWN if it is unknown)
  *
  * This function erases physical eraseblock 'pnum', and writes the erase
  * counter header to it. This function should only be used on UBI device
@@ -718,7 +718,7 @@ struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 	 * they'll be handled later.
 	 */
 	list_for_each_entry_safe(aeb, tmp_aeb, &ai->erase, u.list) {
-		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+		if (aeb->ec == UBI_AINF_UNKNOWN)
 			aeb->ec = ai->mean_ec;
 
 		err = early_erase_peb(ubi, ai, aeb->pnum, aeb->ec+1);
@@ -834,11 +834,11 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		break;
 	case UBI_IO_FF:
 		ai->empty_peb_count += 1;
-		return add_to_list(ai, pnum, UBI_SCAN_UNKNOWN_EC, 0,
+		return add_to_list(ai, pnum, UBI_AINF_UNKNOWN, 0,
 				   &ai->erase);
 	case UBI_IO_FF_BITFLIPS:
 		ai->empty_peb_count += 1;
-		return add_to_list(ai, pnum, UBI_SCAN_UNKNOWN_EC, 1,
+		return add_to_list(ai, pnum, UBI_AINF_UNKNOWN, 1,
 				   &ai->erase);
 	case UBI_IO_BAD_HDR_EBADMSG:
 	case UBI_IO_BAD_HDR:
@@ -848,7 +848,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		 * moved and EC be re-created.
 		 */
 		ec_err = err;
-		ec = UBI_SCAN_UNKNOWN_EC;
+		ec = UBI_AINF_UNKNOWN;
 		bitflips = 1;
 		break;
 	default:
@@ -1172,21 +1172,21 @@ static struct ubi_attach_info *scan_all(struct ubi_device *ubi)
 	 */
 	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
 		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
-			if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+			if (aeb->ec == UBI_AINF_UNKNOWN)
 				aeb->ec = ai->mean_ec;
 	}
 
 	list_for_each_entry(aeb, &ai->free, u.list) {
-		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+		if (aeb->ec == UBI_AINF_UNKNOWN)
 			aeb->ec = ai->mean_ec;
 	}
 
 	list_for_each_entry(aeb, &ai->corr, u.list)
-		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+		if (aeb->ec == UBI_AINF_UNKNOWN)
 			aeb->ec = ai->mean_ec;
 
 	list_for_each_entry(aeb, &ai->erase, u.list)
-		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+		if (aeb->ec == UBI_AINF_UNKNOWN)
 			aeb->ec = ai->mean_ec;
 
 	err = self_check_ai(ubi, ai);
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 3e0c4f4..cd1f8cd 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -21,12 +21,15 @@
 #ifndef __UBI_SCAN_H__
 #define __UBI_SCAN_H__
 
-/* The erase counter value for this physical eraseblock is unknown */
-#define UBI_SCAN_UNKNOWN_EC (-1)
+/*
+ * When a field of the attaching information has this value - its real value is
+ * unknown.
+ */
+#define UBI_AINF_UNKNOWN (-1)
 
 /**
  * struct ubi_ainf_peb - attach information about a physical eraseblock.
- * @ec: erase counter (%UBI_SCAN_UNKNOWN_EC if it is unknown)
+ * @ec: erase counter (%UBI_AINF_UNKNOWN if it is unknown)
  * @pnum: physical eraseblock number
  * @lnum: logical eraseblock number
  * @scrub: if this physical eraseblock needs scrubbing
-- 
1.7.10
