Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxs-0005Xc-Aq
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:22 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/22] UBI: remove unused function
Date: Fri, 18 May 2012 14:03:52 +0300
Message-Id: <1337339045-8199-10-git-send-email-dedekind1@gmail.com>
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

The 'ubi_scan_find_aeb()' function is unused and thus can be removed.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |   29 -----------------------------
 drivers/mtd/ubi/scan.h |    2 --
 2 files changed, 31 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index c550165..06151fd 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -615,35 +615,6 @@ struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
 }
 
 /**
- * ubi_scan_find_aeb - find LEB in the volume attaching information.
- * @av: a pointer to the volume attaching information
- * @lnum: the requested logical eraseblock
- *
- * This function returns a pointer to the scanning logical eraseblock or %NULL
- * if there are no data about it in the scanning volume information.
- */
-struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *av,
-				       int lnum)
-{
-	struct ubi_ainf_peb *aeb;
-	struct rb_node *p = av->root.rb_node;
-
-	while (p) {
-		aeb = rb_entry(p, struct ubi_ainf_peb, u.rb);
-
-		if (lnum == aeb->lnum)
-			return aeb;
-
-		if (lnum > aeb->lnum)
-			p = p->rb_left;
-		else
-			p = p->rb_right;
-	}
-
-	return NULL;
-}
-
-/**
  * ubi_scan_rm_volume - delete attaching information about a volume.
  * @ai: attaching information
  * @av: the volume attaching information to delete
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 59ed075..ef6e903 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -162,8 +162,6 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		      int bitflips);
 struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
 					 int vol_id);
-struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *av,
-				       int lnum);
 void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *ai);
-- 
1.7.10
