Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sel28-00078s-Ac
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 10:42:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/21] UBI: Fastmap: Detect whether a PEB has to be unmapped.
Date: Wed, 13 Jun 2012 12:42:07 +0200
Message-Id: <1339584138-69914-11-git-send-email-richard@nod.at>
In-Reply-To: <1339584138-69914-1-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
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
 drivers/mtd/ubi/fastmap.c |   35 ++++++++++++++++++++++++++++++++++-
 1 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index fb5dae5..b42f81c 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -313,6 +313,34 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 }
 
 /**
+ * unmap_peb - unmap a PEB.
+ * If fastmap detects a free PEB in the pool it has to check whether
+ * this PEB has been unmapped after writing the fastmap.
+ *
+ * @ubi: UBI device object
+ * @pnum: The PEB to be unmapped
+ */
+static void unmap_peb(struct ubi_attach_info *ai, int pnum)
+{
+	struct ubi_ainf_volume *av;
+	struct rb_node *node, *node2;
+	struct ubi_ainf_peb *aeb;
+
+	for (node = rb_first(&ai->volumes); node; node = rb_next(node)) {
+		av = rb_entry(node, struct ubi_ainf_volume, rb);
+
+		for (node2 = rb_first(&av->root); node2; node2 = rb_next(node2)) {
+			aeb = rb_entry(node2, struct ubi_ainf_peb, u.rb);
+			if (aeb->pnum == pnum) {
+				rb_erase(&aeb->u.rb, &av->root);
+				kmem_cache_free(ai->aeb_slab_cache, aeb);
+				return;
+			}
+		}
+	}
+}
+
+/**
  * scan_pool - scans a pool for changed (no longer empty PEBs)
  * @ubi: UBI device object
  * @ai: attach info object
@@ -378,7 +406,12 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err == UBI_IO_FF || err == UBI_IO_FF_BITFLIPS) {
-			add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 1);
+			unmap_peb(ai, pnum);
+			ubi_msg("Adding PEB to free: %i", pnum);
+			if (err == UBI_IO_FF_BITFLIPS)
+				add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 1);
+			else
+				add_aeb(ai, &ai->free, pnum, be64_to_cpu(ech->ec), 0);
 			continue;
 		} else if (err == 0 || err == UBI_IO_BITFLIPS) {
 			dbg_bld("Found non empty PEB:%i in pool", pnum);
-- 
1.7.6.5
