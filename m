Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKyA-0005YL-UC
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:40 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/22] UBI: rename _init_scan functions
Date: Fri, 18 May 2012 14:04:01 +0300
Message-Id: <1337339045-8199-19-git-send-email-dedekind1@gmail.com>
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

We have a couple of initialization funcntionsn left which have "_scan" suffic -
rename them:

ubi_eba_init_scan() -> ubi_eba_init()
ubi_wl_init_scan() -> ubi_wl_init()

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    4 ++--
 drivers/mtd/ubi/eba.c   |    6 +++---
 drivers/mtd/ubi/ubi.h   |    4 ++--
 drivers/mtd/ubi/wl.c    |    4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7f293b2..ecedd75 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -596,11 +596,11 @@ static int attach_by_scanning(struct ubi_device *ubi)
 	if (err)
 		goto out_ai;
 
-	err = ubi_wl_init_scan(ubi, ai);
+	err = ubi_wl_init(ubi, ai);
 	if (err)
 		goto out_vtbl;
 
-	err = ubi_eba_init_scan(ubi, ai);
+	err = ubi_eba_init(ubi, ai);
 	if (err)
 		goto out_wl;
 
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 2592d1c..5fa726f 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1167,7 +1167,7 @@ out_unlock_leb:
  * print_rsvd_warning - warn about not having enough reserved PEBs.
  * @ubi: UBI device description object
  *
- * This is a helper function for 'ubi_eba_init_scan()' which is called when UBI
+ * This is a helper function for 'ubi_eba_init()' which is called when UBI
  * cannot reserve enough PEBs for bad block handling. This function makes a
  * decision whether we have to print a warning or not. The algorithm is as
  * follows:
@@ -1205,14 +1205,14 @@ static void print_rsvd_warning(struct ubi_device *ubi,
 }
 
 /**
- * ubi_eba_init_scan - initialize the EBA sub-system using attaching information.
+ * ubi_eba_init - initialize the EBA sub-system using attaching information.
  * @ubi: UBI device description object
  * @ai: attaching information
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
+int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int i, j, err, num_volumes;
 	struct ubi_ainf_volume *av;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index faaf729..9563e1b 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -529,14 +529,14 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len);
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr);
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai);
+int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture);
 int ubi_wl_flush(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai);
+int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
 int ubi_thread(void *u);
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 72fbae1..c143e61 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1373,14 +1373,14 @@ static void cancel_pending(struct ubi_device *ubi)
 }
 
 /**
- * ubi_wl_init_scan - initialize the WL sub-system using attaching information.
+ * ubi_wl_init - initialize the WL sub-system using attaching information.
  * @ubi: UBI device description object
  * @ai: attaching information
  *
  * This function returns zero in case of success, and a negative error code in
  * case of failure.
  */
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
+int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int err, i;
 	struct rb_node *rb1, *rb2;
-- 
1.7.10
