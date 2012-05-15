Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SULHc-0001EL-P3
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 17:11:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/7] [RFC] UBI: Add fastmap structs to ubi_device
Date: Tue, 15 May 2012 19:11:08 +0200
Message-Id: <1337101871-31181-5-git-send-email-richard@nod.at>
In-Reply-To: <1337101871-31181-1-git-send-email-richard@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

struct ubi_fastmap describes the currently used checkpoint.
Upon checkpoint recreation all currently used PEBs will be returned
to the wl subsystem.

struct ubi_fm_pool describes the fast pool.
All PEBs within this pool have to be rescanned after reading the fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 50c2af2..6c89971 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -197,6 +197,39 @@ struct ubi_rename_entry {
 struct ubi_volume_desc;
 
 /**
+ * struct ubi_fastmap - in-memory fastmap data structure.
+ * @peb: PEBs used by the current fastamp
+ * @ec: the erase counter of each used PEB
+ * @size: size of the fastmap in bytes
+ * @used_blocks: number of used PEBs
+ */
+struct ubi_fastmap {
+	int peb[UBI_FM_MAX_BLOCKS];
+	unsigned int ec[UBI_FM_MAX_BLOCKS];
+	size_t size;
+	int used_blocks;
+};
+
+/**
+ * struct ubi_fm_pool - in-memory fastmap pool
+ * @pebs: PEBs in this pool
+ * @used: number of used PEBs
+ * @size: total number of PEBs in this pool
+ * @max_size: maximal size of the pool
+ *
+ * A pool gets filled with up to max_size.
+ * If all PEBs within the pool are used a new fastmap will be written
+ * to the flash and the pool gets refilled with empty PEBs.
+ *
+ */
+struct ubi_fm_pool {
+	int pebs[UBI_FM_MAX_POOL_SIZE];
+	int used;
+	int size;
+	int max_size;
+};
+
+/**
  * struct ubi_volume - UBI volume description data structure.
  * @dev: device object to make use of the the Linux device model
  * @cdev: character device object to create character device
@@ -331,6 +364,13 @@ struct ubi_wl_entry;
  * @ltree: the lock tree
  * @alc_mutex: serializes "atomic LEB change" operations
  *
+ * @fm: in-memory data structure of the currently used fastmap
+ * @old_fm: in-memory data structure old fastmap.
+ * 	    (only valid while writing a new one)
+ * @fm_pool: in-memory data structure of the fastmap pool
+ * @attached_by_scanning: this UBI device was attached by the old scanning
+ * 			  methold. All fastmap volumes have to be deleted.
+ *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
  * @free: RB-tree of free physical eraseblocks
@@ -422,6 +462,12 @@ struct ubi_device {
 	struct rb_root ltree;
 	struct mutex alc_mutex;
 
+	/* Fastmap stuff */
+	struct ubi_fastmap *fm;
+	struct ubi_fastmap *old_fm;
+	struct ubi_fm_pool fm_pool;
+	bool attached_by_scanning;
+
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
 	struct rb_root erroneous;
-- 
1.7.6.5
