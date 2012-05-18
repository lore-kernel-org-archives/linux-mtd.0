Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy6-0005YM-72
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:35 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/22] UBI: rename ubi_scan_get_free_peb
Date: Fri, 18 May 2012 14:03:56 +0300
Message-Id: <1337339045-8199-14-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_early_get_peb()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |    6 +++---
 drivers/mtd/ubi/scan.h |    4 ++--
 drivers/mtd/ubi/vtbl.c |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index ccf4630..2c5a558 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -682,7 +682,7 @@ out_free:
 }
 
 /**
- * ubi_scan_get_free_peb - get a free physical eraseblock.
+ * ubi_early_get_peb - get a free physical eraseblock.
  * @ubi: UBI device description object
  * @ai: attaching information
  *
@@ -695,8 +695,8 @@ out_free:
  * This function returns scanning physical eraseblock information in case of
  * success and an error code in case of failure.
  */
-struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_attach_info *ai)
+struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
+				       struct ubi_attach_info *ai)
 {
 	int err = 0;
 	struct ubi_ainf_peb *aeb, *tmp_aeb;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 7d7e65f..72ba24a 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -162,8 +162,8 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 				    int vol_id);
 void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
-struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_attach_info *ai);
+struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
+				       struct ubi_attach_info *ai);
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
 void ubi_scan_destroy_ai(struct ubi_attach_info *ai);
 
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index cfe3830..341c956 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -312,7 +312,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		return -ENOMEM;
 
 retry:
-	new_aeb = ubi_scan_get_free_peb(ubi, ai);
+	new_aeb = ubi_early_get_peb(ubi, ai);
 	if (IS_ERR(new_aeb)) {
 		err = PTR_ERR(new_aeb);
 		goto out_free;
-- 
1.7.10
