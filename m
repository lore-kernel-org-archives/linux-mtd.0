Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy8-0005YL-1n
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/22] UBI: rename ubi_scan_destroy_ai
Date: Fri, 18 May 2012 14:03:57 +0300
Message-Id: <1337339045-8199-15-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_destroy_ai()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    4 ++--
 drivers/mtd/ubi/scan.c  |    6 +++---
 drivers/mtd/ubi/scan.h  |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 1ae3cfa..2a8f26b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -608,7 +608,7 @@ static int attach_by_scanning(struct ubi_device *ubi)
 	if (err)
 		goto out_wl;
 
-	ubi_scan_destroy_ai(ai);
+	ubi_destroy_ai(ai);
 	return 0;
 
 out_wl:
@@ -617,7 +617,7 @@ out_vtbl:
 	free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_ai:
-	ubi_scan_destroy_ai(ai);
+	ubi_destroy_ai(ai);
 	return err;
 }
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 2c5a558..daa53a8 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1203,7 +1203,7 @@ out_vidh:
 out_ech:
 	kfree(ech);
 out_ai:
-	ubi_scan_destroy_ai(ai);
+	ubi_destroy_ai(ai);
 	return ERR_PTR(err);
 }
 
@@ -1242,10 +1242,10 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 }
 
 /**
- * ubi_scan_destroy_ai - destroy attaching information.
+ * ubi_destroy_ai - destroy attaching information.
  * @ai: attaching information
  */
-void ubi_scan_destroy_ai(struct ubi_attach_info *ai)
+void ubi_destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *av;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 72ba24a..a406f5b 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -165,6 +165,6 @@ void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 				       struct ubi_attach_info *ai);
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
-void ubi_scan_destroy_ai(struct ubi_attach_info *ai);
+void ubi_destroy_ai(struct ubi_attach_info *ai);
 
 #endif /* !__UBI_SCAN_H__ */
-- 
1.7.10
