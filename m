Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoCvg-0003qY-KN
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 12:19:06 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/7] UBI: Fastmap: Kerneldoc fixes
Date: Mon,  9 Jul 2012 14:18:41 +0200
Message-Id: <1341836323-43916-6-git-send-email-richard@nod.at>
In-Reply-To: <1341836323-43916-1-git-send-email-richard@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |    3 +++
 drivers/mtd/ubi/ubi.h    |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 85c9e0c..14d2580 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -810,6 +810,8 @@ out_unlock:
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: the physical eraseblock number
+ * @vid: The volume ID of the found volume will be stored in this pointer
+ * @sqnum: The sqnum of the found volume will be stored in this pointer
  *
  * This function reads UBI headers of PEB @pnum, checks them, and adds
  * information about this PEB to the corresponding list or RB-tree in the
@@ -1223,6 +1225,7 @@ static void destroy_ai(struct ubi_attach_info *ai)
  * scan_all - scan entire MTD device.
  * @ubi: UBI device description object
  * @ai: attach info object
+ * @start: start scanning at this PEB
  *
  * This function does full scanning of an MTD device and returns complete
  * information about it in form of a "struct ubi_attach_info" object. In case
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 56e6be0..a25d59a 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -218,7 +218,7 @@ struct ubi_volume_desc;
  * @to_be_tortured: if non-zero tortured this PEB
  * @used_blocks: number of used PEBs
  * @max_pool_size: maximal size of the user pool
- * @max_wl_pool_size: maximal size of the pooly used by the WL sub-system
+ * @max_wl_pool_size: maximal size of the pool used by the WL sub-system
  */
 struct ubi_fastmap_layout {
 	struct ubi_wl_entry *e[UBI_FM_MAX_BLOCKS];
-- 
1.7.6.5
