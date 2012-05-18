Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxo-0005Xc-6U
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:19 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/22] UBI: make ubi_scan_erase_peb static and rename
Date: Fri, 18 May 2012 14:03:51 +0300
Message-Id: <1337339045-8199-9-git-send-email-dedekind1@gmail.com>
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

The 'ubi_scan_erase_peb()' is used only in scan.c so can be static. Also
re-name it to 'early_erase_peb()' because we tend to use "ubi_" prefix only for
non-static fuction and also because the new name is better.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |    8 ++++----
 drivers/mtd/ubi/scan.h |    2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 795d5ed..c550165 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -667,7 +667,7 @@ void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 }
 
 /**
- * ubi_scan_erase_peb - erase a physical eraseblock.
+ * early_erase_peb - erase a physical eraseblock.
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: physical eraseblock number to erase;
@@ -679,8 +679,8 @@ void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *ai,
-		       int pnum, int ec)
+static int early_erase_peb(struct ubi_device *ubi,
+			   const struct ubi_attach_info *ai, int pnum, int ec)
 {
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
@@ -748,7 +748,7 @@ struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
 			aeb->ec = ai->mean_ec;
 
-		err = ubi_scan_erase_peb(ubi, ai, aeb->pnum, aeb->ec+1);
+		err = early_erase_peb(ubi, ai, aeb->pnum, aeb->ec+1);
 		if (err)
 			continue;
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 3e19cb6..59ed075 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -167,8 +167,6 @@ struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *av,
 void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *ai);
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *ai,
-		       int pnum, int ec);
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
 void ubi_scan_destroy_ai(struct ubi_attach_info *ai);
 
-- 
1.7.10
