Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy8-0005Xc-3S
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/22] UBI: rename ubi_scan_move_to_list
Date: Fri, 18 May 2012 14:03:58 +0300
Message-Id: <1337339045-8199-16-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_move_aeb_to_list()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/eba.c  |    2 +-
 drivers/mtd/ubi/scan.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 6f7f275..2592d1c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1256,7 +1256,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				 * This may happen in case of an unclean reboot
 				 * during re-size.
 				 */
-				ubi_scan_move_to_list(av, aeb, &ai->erase);
+				ubi_move_aeb_to_list(av, aeb, &ai->erase);
 			vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index a406f5b..aa76b3b 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -143,13 +143,13 @@ struct ubi_device;
 struct ubi_vid_hdr;
 
 /*
- * ubi_scan_move_to_list - move a PEB from the volume tree to a list.
+ * ubi_move_aeb_to_list - move a PEB from the volume tree to a list.
  *
  * @av: volume attaching information
  * @aeb: scanning eraseblock information
  * @list: the list to move to
  */
-static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *av,
+static inline void ubi_move_aeb_to_list(struct ubi_ainf_volume *av,
 					 struct ubi_ainf_peb *aeb,
 					 struct list_head *list)
 {
-- 
1.7.10
